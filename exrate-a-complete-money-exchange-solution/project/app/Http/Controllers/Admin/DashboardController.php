<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Traits\Upload;
use App\Models\Currency;
use App\Models\CurrencySell;
use App\Models\Fund;
use App\Models\Gateway;
use App\Models\PayoutLog;
use App\Models\Ticket;
use App\Models\User;
use App\Rules\FileTypeValidate;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Stevebauman\Purify\Facades\Purify;

class DashboardController extends Controller
{
    use Upload;

    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            $this->user = Auth::guard('admin')->user();
            return $next($request);
        });
    }

    public function forbidden()
    {
        return view('admin.errors.403');
    }


    public function dashboard()
    {
        $data['currencySell'] = collect(CurrencySell::where('process_step', 3)
            ->selectRaw('COUNT(CASE WHEN status = 0 THEN id END) AS pending')
            ->selectRaw('COUNT(CASE WHEN status = 1 THEN id END) AS complete')
            ->selectRaw('COUNT(CASE WHEN status = 2 THEN id END) AS cancel')
            ->selectRaw('COUNT(id) AS totalExchange')
            ->get()->toArray())->collapse();
        $data['userRecord'] = collect(User::selectRaw('COUNT(id) AS totalUser')
            ->selectRaw('count(CASE WHEN status = 1  THEN id END) AS activeUser')
            ->selectRaw('SUM(balance) AS totalUserBalance')
            ->selectRaw('COUNT((CASE WHEN created_at >= CURDATE()  THEN id END)) AS todayJoin')
            ->get()->makeHidden(['fullname', 'mobile'])->toArray())->collapse();


        $data['tickets'] = collect(Ticket::selectRaw('count(id) AS total')
            ->selectRaw('count(CASE WHEN status = 3  THEN status END) AS closed')
            ->selectRaw('count(CASE WHEN status = 2  THEN status END) AS replied')
            ->selectRaw('count(CASE WHEN status = 1  THEN status END) AS answered')
            ->selectRaw('count(CASE WHEN status = 0  THEN status END) AS pending')
            ->get()->toArray())->collapse();

        /*
         * Pie Chart Data
         */


        $tickets = $data['tickets']['total']??0 ;
        $pieLog = collect();
        Ticket::get()->groupBy('status')->map(function ($items, $key) use ($tickets, $pieLog) {
            $newKey = 'Unknown';
            if ($key == 0) {
                $newKey = 'Opened';
            }
            if ($key == 1) {
                $newKey = 'Answered';
            }
            if ($key == 2) {
                $newKey = 'Replied';
            }
            if ($key == 3) {
                $newKey = 'Closed';
            }
            $pieLog->push(['level' => $newKey, 'value' => round((0 < $tickets) ? (count($items) / $tickets * 100) : 0, 2)]);
            return $items;
        });



        $dailyExchange = $this->dayList();
        CurrencySell::select(
            DB::raw('COUNT(id) as totalExchange'),
            DB::raw('DATE_FORMAT(created_at,"Day %d") as date')
        )
            ->groupBy(DB::raw("DATE(created_at)"))
            ->get()->map(function ($item) use ($dailyExchange) {
                $dailyExchange->put($item['date'], (int)$item['totalExchange']);
            });
        $statistics['dailyExchange'] = $dailyExchange;


        $dailyPayout = $this->dayList();
        PayoutLog::whereMonth('created_at', Carbon::now()->month)
            ->select(
                DB::raw('sum(amount) as totalAmount'),
                DB::raw('DATE_FORMAT(created_at,"Day %d") as date')
            )
            ->where('status', 2)
            ->groupBy(DB::raw("DATE(created_at)"))
            ->get()->map(function ($item) use ($dailyPayout) {
                $dailyPayout->put($item['date'], round($item['totalAmount'], 2));
            });
        $statistics['payout'] = $dailyPayout;
        $statistics['schedule'] = $this->dayList();

        $data['payout'] = collect(PayoutLog::selectRaw('COUNT(CASE WHEN status = 1  THEN id END) AS pending')
            ->selectRaw('SUM((CASE WHEN status = 2 AND created_at >= CURDATE()  THEN amount END)) AS todayPayoutAmount')
            ->selectRaw('SUM((CASE WHEN status = 2 AND created_at >=  DATE_SUB(CURRENT_DATE() , INTERVAL DAYOFMONTH(CURRENT_DATE)-1 DAY) THEN amount END)) AS monthlyPayoutAmount')
            ->selectRaw('SUM((CASE WHEN status = 2 AND created_at >=  DATE_SUB(CURRENT_DATE() , INTERVAL DAYOFMONTH(CURRENT_DATE)-1 DAY) THEN charge END)) AS monthlyPayoutCharge')
            ->get()->toArray())->collapse();


        $data['latestUser'] = User::latest()->limit(5)->get();

        return view('admin.dashboard', $data, compact('statistics', 'pieLog'));
    }

    public function dayList()
    {
        $totalDays = cal_days_in_month(CAL_GREGORIAN, date('m'), date('Y'));
        $daysByMonth = [];
        for ($i = 1; $i <= $totalDays; $i++) {
            array_push($daysByMonth, ['Day ' . sprintf("%02d", $i) => 0]);
        }

        return collect($daysByMonth)->collapse();
    }

    public function profile()
    {
        $admin = $this->user;
        return view('admin.profile', compact('admin'));
    }


    public function profileUpdate(Request $request)
    {
        $req = Purify::clean($request->except('_token', '_method'));
        $rules = [
            'name' => 'sometimes|required',
            'username' => 'sometimes|required|unique:admins,username,' . $this->user->id,
            'email' => 'sometimes|required|email|unique:admins,email,' . $this->user->id,
            'phone' => 'sometimes|required',
            'address' => 'sometimes|required',
            'image' => ['nullable', 'image', new FileTypeValidate(['jpeg', 'jpg', 'png'])]
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }
        $user = $this->user;
        if ($request->hasFile('image')) {
            try {
                $old = $user->image ?: null;
                $user->image = $this->uploadImage($request->image, config('location.admin.path'), config('location.admin.size'), $old);
            } catch (\Exception $exp) {
                return back()->with('error', 'Image could not be uploaded.');
            }
        }
        $user->name = $req['name'];
        $user->username = $req['username'];
        $user->email = $req['email'];
        $user->phone = $req['phone'];
        $user->address = $req['address'];
        $user->save();

        return back()->with('success', 'Updated Successfully.');
    }


    public function password()
    {
        return view('admin.password');
    }

    public function passwordUpdate(Request $request)
    {
        $req = Purify::clean($request->all());

        $request->validate([
            'current_password' => 'required',
            'password' => 'required|min:5|confirmed',
        ]);

        $request = (object)$req;
        $user = $this->user;
        if (!Hash::check($request->current_password, $user->password)) {
            return back()->with('error', "Password didn't match");
        }
        $user->update([
            'password' => bcrypt($request->password)
        ]);
        return back()->with('success', 'Password has been Changed');
    }
}
