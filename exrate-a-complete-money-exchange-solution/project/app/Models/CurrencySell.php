<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CurrencySell extends Model
{
    use HasFactory;

    protected $casts = [
        'sender_info' =>'object',
        'receiver_info' =>'object'
    ];

    public function sendCurrency()
    {
        return $this->belongsTo(Currency::class,'send_currency_id');
    }

    public function receiveCurrency()
    {
        return $this->belongsTo(Currency::class,'receive_currency_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

}
