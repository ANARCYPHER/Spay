<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Artisan;

Route::get('/clear', function () {
    $output = new \Symfony\Component\Console\Output\BufferedOutput();
    Artisan::call('optimize:clear', array(), $output);
    return $output->fetch();
})->name('/clear');



Route::get('/user', 'Auth\LoginController@showLoginForm')->name('login');


Route::post('/loginModal', 'Auth\LoginController@loginModal')->name('loginModal');

Route::get('queue-work', function () {
    return Illuminate\Support\Facades\Artisan::call('queue:work', ['--stop-when-empty' => true]);
})->name('queue.work');


Route::get('/cron', function () {
    Artisan::call('cron:run');
})->name('cron');

//Update Rate
Route::post('crypto-rate', 'FrontendController@cryptoRate')->name('cryptoRate');
Route::post('fiat-rate', 'FrontendController@fiatRate')->name('fiatRate');





Route::group(['prefix' => 'admin', 'as' => 'admin.'], function () {
    Route::get('/', 'Admin\LoginController@showLoginForm')->name('login');
    Route::post('/', 'Admin\LoginController@login')->name('login');
    Route::post('/logout', 'Admin\LoginController@logout')->name('logout');

    //Referral
    Route::get('/referral-commission', 'Admin\BasicController@referralCommission')->name('referral-commission');
    Route::post('/referral-commission', 'Admin\BasicController@referralCommissionStore')->name('referral-commission.store');


    Route::get('/password/reset', 'Admin\Auth\ForgotPasswordController@showLinkRequestForm')->name('password.request');
    Route::post('/password/email', 'Admin\Auth\ForgotPasswordController@sendResetLinkEmail')->name('password.email');
    Route::get('/password/reset/{token}', 'Admin\Auth\ResetPasswordController@showResetForm')->name('password.reset');
    Route::post('/password/reset', 'Admin\Auth\ResetPasswordController@reset')->name('password.update');


    Route::get('/403', 'Admin\DashboardController@forbidden')->name('403');

    Route::group(['middleware' => ['auth:admin']], function () {
        Route::get('/dashboard', 'Admin\DashboardController@dashboard')->name('dashboard');

        //Crypto Currencies
        Route::get('crypto/list', 'Admin\CurrencyController@listCrypto')->name('listCrypto');
        Route::get('crypto/create', 'Admin\CurrencyController@createCrypto')->name('createCrypto');
        Route::post('crypto/store', 'Admin\CurrencyController@storeCrypto')->name('storeCrypto');
        Route::get('crypto/edit/{id}', 'Admin\CurrencyController@editCrypto')->name('editCrypto');
        Route::post('crypto/update/{id}', 'Admin\CurrencyController@updateCrypto')->name('updateCrypto');
        Route::delete('crypto/delete/{id}', 'Admin\CurrencyController@deleteCrypto')->name('deleteCrypto');

        Route::post('crypto-active', 'Admin\CurrencyController@activeMultiple')->name('crypto-active');
        Route::post('crypto-deactive', 'Admin\CurrencyController@deActiveMultiple')->name('crypto-deactive');

        //Exchange Order
        Route::get('exchange/order-list/all/{user_id?}', 'Admin\CurrencyController@orderList')->name('exchange.orderList');
        Route::get('exchange/order-list/pending', 'Admin\CurrencyController@orderList')->name('exchange.orderPendingList');
        Route::get('exchange/order-list/complete', 'Admin\CurrencyController@orderList')->name('exchange.orderCompleteList');
        Route::get('exchange/order-list/reject', 'Admin\CurrencyController@orderList')->name('exchange.orderRejectList');
        Route::get('exchange/order-list/search', 'Admin\CurrencyController@search')->name('exchange.orderLis.search');
        Route::get('exchange/order-list/{id}/details', 'Admin\CurrencyController@orderListDetails')->name('exchange.orderListDetails');
        Route::post('exchange/order-complete/{id}', 'Admin\CurrencyController@orderComplete')->name('exchange.orderComplete');
        Route::post('exchange/order-reject/{id}', 'Admin\CurrencyController@orderReject')->name('exchange.orderReject');

        Route::post('exchange/order/complete', 'Admin\CurrencyController@completeMultiple')->name('order.complete');
        Route::post('exchange/order/reject', 'Admin\CurrencyController@rejectMultiple')->name('order.reject');

        Route::post('ajax-exchange/charge', 'FrontendController@exchangeCharge')->name('ajax.exchangeCharge');
        Route::post('exchange/charge-submit', 'Admin\CurrencyController@exchangeCharge')->name('exchangeCharge.submit');

        //Fiat Currencies
        Route::get('fiat/list', 'Admin\CurrencyController@listFiat')->name('listFiat');
        Route::get('fiat/create', 'Admin\CurrencyController@createFiat')->name('createFiat');
        Route::post('fiat/store', 'Admin\CurrencyController@storeFiat')->name('storeFiat');
        Route::get('fiat/edit/{id}', 'Admin\CurrencyController@editFiat')->name('editFiat');
        Route::post('fiat/update/{id}', 'Admin\CurrencyController@updateFiat')->name('updateFiat');
        Route::delete('fiat/delete/{id}', 'Admin\CurrencyController@deleteFiat')->name('deleteFiat');

        Route::post('fiat/control/Action', 'Admin\CurrencyController@fiatControlAction')->name('fiatControl.action');
        Route::post('crypto/control/Action', 'Admin\CurrencyController@cryptoControlAction')->name('cryptoControl.action');

        Route::post('fiat-active', 'Admin\CurrencyController@activeMultipleFiat')->name('fiat-active');
        Route::post('fiat-deactive', 'Admin\CurrencyController@deActiveMultipleFiat')->name('fiat-deactive');


        //Testimonial
        Route::get('testimonial/{user_id?}', 'Admin\CurrencyController@testimonial')->name('testimonial');
        Route::post('testimonial/approve', 'Admin\CurrencyController@activeMultipleTestimonial')->name('testimonial-approve');
        Route::post('testimonial/pending', 'Admin\CurrencyController@pendingMultipleTestimonial')->name('testimonial-pending');

        Route::get('/profile', 'Admin\DashboardController@profile')->name('profile');
        Route::put('/profile', 'Admin\DashboardController@profileUpdate')->name('profileUpdate');
        Route::get('/password', 'Admin\DashboardController@password')->name('password');
        Route::put('/password', 'Admin\DashboardController@passwordUpdate')->name('passwordUpdate');


        /* ====== Transaction Log =====*/
        Route::get('/transaction', 'Admin\LogController@transaction')->name('transaction');
        Route::get('/transaction/search', 'Admin\LogController@transactionSearch')->name('transaction.search');

        /* ====== Plugin =====*/
        Route::get('/plugin-config', 'Admin\BasicController@pluginConfig')->name('plugin.config');
        Route::match(['get', 'post'], 'tawk-config', 'Admin\BasicController@tawkConfig')->name('tawk.control');
        Route::match(['get', 'post'], 'fb-messenger-config', 'Admin\BasicController@fbMessengerConfig')->name('fb.messenger.control');
        Route::match(['get', 'post'], 'google-recaptcha', 'Admin\BasicController@googleRecaptchaConfig')->name('google.recaptcha.control');
        Route::match(['get', 'post'], 'google-analytics', 'Admin\BasicController@googleAnalyticsConfig')->name('google.analytics.control');

        /*====Manage Users ====*/
        Route::get('/users', 'Admin\UsersController@index')->name('users');
        Route::get('/users/search', 'Admin\UsersController@search')->name('users.search');
        Route::post('/users-active', 'Admin\UsersController@activeMultiple')->name('user-multiple-active');
        Route::post('/users-inactive', 'Admin\UsersController@inactiveMultiple')->name('user-multiple-inactive');
        Route::get('/user/edit/{id}', 'Admin\UsersController@userEdit')->name('user-edit');
        Route::post('/user/update/{id}', 'Admin\UsersController@userUpdate')->name('user-update');
        Route::post('/user/password/{id}', 'Admin\UsersController@passwordUpdate')->name('userPasswordUpdate');
        Route::post('/user/balance-update/{id}', 'Admin\UsersController@userBalanceUpdate')->name('user-balance-update');
        Route::post('/user/login', 'Admin\UsersController@userLogin')->name('userLogin');
        Route::get('/user/send-email/{id}', 'Admin\UsersController@sendEmail')->name('send-email');
        Route::post('/user/send-email/{id}', 'Admin\UsersController@sendMailUser')->name('user.email-send');
        Route::get('/user/transaction/{id}', 'Admin\UsersController@transaction')->name('user.transaction');
        Route::get('/user/payoutLog/{id}', 'Admin\UsersController@payoutLog')->name('user.withdrawal');
        Route::get('/user/referralMember/{id}', 'Admin\UsersController@referralMember')->name('user.referralMember');



        Route::get('/email-send', 'Admin\UsersController@emailToUsers')->name('email-send');
        Route::post('/email-send', 'Admin\UsersController@sendEmailToUsers')->name('email-send.store');



        /*==========Payout Settings============*/
        Route::get('/payout-method', 'Admin\PayoutGatewayController@index')->name('payout-method');
        Route::get('/payout-method/create', 'Admin\PayoutGatewayController@create')->name('payout-method.create');
        Route::post('/payout-method/create', 'Admin\PayoutGatewayController@store')->name('payout-method.store');
        Route::get('/payout-method/{id}', 'Admin\PayoutGatewayController@edit')->name('payout-method.edit');
        Route::put('/payout-method/{id}', 'Admin\PayoutGatewayController@update')->name('payout-method.update');

        Route::get('/payout-log', 'Admin\PayoutRecordController@index')->name('payout-log');
        Route::get('/payout-log/search', 'Admin\PayoutRecordController@search')->name('payout-log.search');
        Route::get('/payout-request', 'Admin\PayoutRecordController@request')->name('payout-request');
        Route::put('/payout-action/{id}', 'Admin\PayoutRecordController@action')->name('payout-action');


        /* ===== Support Ticket ====*/
        Route::get('tickets/{status?}', 'Admin\TicketController@tickets')->name('ticket');
        Route::get('tickets/view/{id}', 'Admin\TicketController@ticketReply')->name('ticket.view');
        Route::put('ticket/reply/{id}', 'Admin\TicketController@ticketReplySend')->name('ticket.reply');
        Route::get('ticket/download/{ticket}', 'Admin\TicketController@ticketDownload')->name('ticket.download');
        Route::post('ticket/delete', 'Admin\TicketController@ticketDelete')->name('ticket.delete');

        /* ===== Subscriber =====*/
        Route::get('subscriber', 'Admin\SubscriberController@index')->name('subscriber.index');
        Route::post('subscriber/remove', 'Admin\SubscriberController@remove')->name('subscriber.remove');
        Route::get('subscriber/send-email', 'Admin\SubscriberController@sendEmailForm')->name('subscriber.sendEmail');
        Route::post('subscriber/send-email', 'Admin\SubscriberController@sendEmail')->name('subscriber.mail');


        /* ===== website controls =====*/
        Route::any('/basic-controls', 'Admin\BasicController@index')->name('basic-controls');
        Route::post('/basic-controls', 'Admin\BasicController@updateConfigure')->name('basic-controls.update');

        Route::any('/email-controls', 'Admin\EmailTemplateController@emailControl')->name('email-controls');
        Route::post('/email-controls', 'Admin\EmailTemplateController@emailConfigure')->name('email-controls.update');
        Route::post('/email-controls/action', 'Admin\EmailTemplateController@emailControlAction')->name('email-controls.action');
        Route::post('/email/test', 'Admin\EmailTemplateController@testEmail')->name('testEmail');

        Route::get('/email-template', 'Admin\EmailTemplateController@show')->name('email-template.show');
        Route::get('/email-template/edit/{id}', 'Admin\EmailTemplateController@edit')->name('email-template.edit');
        Route::post('/email-template/update/{id}', 'Admin\EmailTemplateController@update')->name('email-template.update');

        /*========Sms control ========*/
        Route::match(['get', 'post'], '/sms-controls', 'Admin\SmsTemplateController@smsConfig')->name('sms.config');
        Route::post('/sms-controls/action', 'Admin\SmsTemplateController@smsControlAction')->name('sms-controls.action');
        Route::get('/sms-template', 'Admin\SmsTemplateController@show')->name('sms-template');
        Route::get('/sms-template/edit/{id}', 'Admin\SmsTemplateController@edit')->name('sms-template.edit');
        Route::post('/sms-template/update/{id}', 'Admin\SmsTemplateController@update')->name('sms-template.update');

        Route::get('/notify-config', 'Admin\NotifyController@notifyConfig')->name('notify-config');
        Route::post('/notify-config', 'Admin\NotifyController@notifyConfigUpdate')->name('notify-config.update');
        Route::get('/notify-template', 'Admin\NotifyController@show')->name('notify-template.show');
        Route::get('/notify-template/edit/{id}', 'Admin\NotifyController@edit')->name('notify-template.edit');
        Route::post('/notify-template/update/{id}', 'Admin\NotifyController@update')->name('notify-template.update');


        /* ===== ADMIN Language SETTINGS ===== */
        Route::get('language', 'Admin\LanguageController@index')->name('language.index');
        Route::get('language/create', 'Admin\LanguageController@create')->name('language.create');
        Route::post('language/create', 'Admin\LanguageController@store')->name('language.store');
        Route::get('language/{language}', 'Admin\LanguageController@edit')->name('language.edit');
        Route::put('language/{language}', 'Admin\LanguageController@update')->name('language.update');
        Route::delete('language/{language}', 'Admin\LanguageController@delete')->name('language.delete');
        Route::get('/language/keyword/{id}', 'Admin\LanguageController@keywordEdit')->name('language.keywordEdit');
        Route::put('/language/keyword/{id}', 'Admin\LanguageController@keywordUpdate')->name('language.keywordUpdate');
        Route::post('/language/importJson', 'Admin\LanguageController@importJson')->name('language.importJson');
        Route::post('store-key/{id}', 'Admin\LanguageController@storeKey')->name('language.storeKey');
        Route::put('update-key/{id}', 'Admin\LanguageController@updateKey')->name('language.updateKey');
        Route::delete('delete-key/{id}', 'Admin\LanguageController@deleteKey')->name('language.deleteKey');


        Route::get('/logo-seo', 'Admin\BasicController@logoSeo')->name('logo-seo');
        Route::put('/logoUpdate', 'Admin\BasicController@logoUpdate')->name('logoUpdate');
        Route::put('/seoUpdate', 'Admin\BasicController@seoUpdate')->name('seoUpdate');


        /* ===== ADMIN TEMPLATE SETTINGS ===== */
        Route::get('template/{section}', 'Admin\TemplateController@show')->name('template.show');
        Route::put('template/{section}/{language}', 'Admin\TemplateController@update')->name('template.update');
        Route::get('contents/{content}', 'Admin\ContentController@index')->name('content.index');
        Route::get('content-create/{content}', 'Admin\ContentController@create')->name('content.create');
        Route::put('content-create/{content}/{language?}', 'Admin\ContentController@store')->name('content.store');
        Route::get('content-show/{content}/{name?}', 'Admin\ContentController@show')->name('content.show');
        Route::put('content-update/{content}/{language?}', 'Admin\ContentController@update')->name('content.update');
        Route::delete('contents/{id}', 'Admin\ContentController@contentDelete')->name('content.delete');


        Route::get('push-notification-show', 'SiteNotificationController@showByAdmin')->name('push.notification.show');
        Route::get('push.notification.readAll', 'SiteNotificationController@readAllByAdmin')->name('push.notification.readAll');
        Route::get('push-notification-readAt/{id}', 'SiteNotificationController@readAt')->name('push.notification.readAt');
        Route::match(['get', 'post'], 'pusher-config', 'SiteNotificationController@pusherConfig')->name('pusher.config');
    });


});



Route::middleware('Maintenance')->group(function () {

    Auth::routes(['verify' => true]);

    Route::group(['middleware' => ['guest']], function () {
        Route::get('register/{sponsor?}', 'Auth\RegisterController@sponsor')->name('register.sponsor');
    });

    Route::group(['middleware' => ['auth'], 'prefix' => 'user', 'as' => 'user.'], function () {
        Route::get('/check', 'User\VerificationController@check')->name('check');
        Route::get('/resend_code', 'User\VerificationController@resendCode')->name('resendCode');
        Route::post('/mail-verify', 'User\VerificationController@mailVerify')->name('mailVerify');
        Route::post('/sms-verify', 'User\VerificationController@smsVerify')->name('smsVerify');
        Route::post('twoFA-Verify', 'User\VerificationController@twoFAverify')->name('twoFA-Verify');
        Route::middleware('userCheck')->group(function () {

            Route::get('/dashboard', 'User\HomeController@index')->name('home');

            //Sell Currencies
            Route::post('sell-currency', 'User\CurrencyController@sellCurrencyRequest')->name('sellCurrency.request');
            Route::get('exchange/step1/{uuid}', 'User\CurrencyController@sellCurrencyStep1')->name('sellCurrency.step1');
            Route::post('exchange/step1/{uuid}', 'User\CurrencyController@sellCurrencyStep1Submit')->name('sellCurrency.step1Submit');
            Route::get('exchange/step2/{uuid}', 'User\CurrencyController@sellCurrencyStep2')->name('sellCurrency.step2');
            Route::post('exchange/step2/{uuid}', 'User\CurrencyController@sellCurrencyStep2Submit')->name('sellCurrency.step2Submit');
            Route::get('exchange/step3/{uuid}', 'User\CurrencyController@sellCurrencyStep3')->name('sellCurrency.step3');
            Route::post('exchange/step3/{uuid}', 'User\CurrencyController@sellCurrencyStep3Submit')->name('sellCurrency.step3Submit');


            //Exchange
            Route::get('my-exchanges', 'User\CurrencyController@exchange')->name('exchange');

            //Testimonial
            Route::get('testimonial', 'User\CurrencyController@testimonial')->name('testimonial');
            Route::post('testimonial', 'User\CurrencyController@testimonialStore')->name('testimonialStore');



            //transaction
            Route::get('/transaction', 'User\HomeController@transaction')->name('transaction');
            Route::get('/transaction/search', 'User\HomeController@transactionSearch')->name('transaction.search');

            // TWO-FACTOR SECURITY
            Route::get('/twostep-security', 'User\HomeController@twoStepSecurity')->name('twostep.security');
            Route::post('twoStep-enable', 'User\HomeController@twoStepEnable')->name('twoStepEnable');
            Route::post('twoStep-disable', 'User\HomeController@twoStepDisable')->name('twoStepDisable');


            Route::get('push-notification-show', 'SiteNotificationController@show')->name('push.notification.show');
            Route::get('push.notification.readAll', 'SiteNotificationController@readAll')->name('push.notification.readAll');
            Route::get('push-notification-readAt/{id}', 'SiteNotificationController@readAt')->name('push.notification.readAt');


            Route::get('/payout', 'User\HomeController@payoutMoney')->name('payout.money');
            Route::post('/payout', 'User\HomeController@payoutMoneyRequest')->name('payout.moneyRequest');
            Route::get('/payout/preview', 'User\HomeController@payoutPreview')->name('payout.preview');
            Route::post('/payout/preview', 'User\HomeController@payoutRequestSubmit')->name('payout.submit');


            Route::get('payout-history', 'User\HomeController@payoutHistory')->name('payout.history');
            Route::get('payout-history/search', 'User\HomeController@payoutHistorySearch')->name('payout.history.search');


            Route::get('/profile', 'User\HomeController@profile')->name('profile');
            Route::post('/updateProfile', 'User\HomeController@updateProfile')->name('updateProfile');
            Route::put('/updateInformation', 'User\HomeController@updateInformation')->name('updateInformation');
            Route::post('/updatePassword', 'User\HomeController@updatePassword')->name('updatePassword');


            Route::group(['prefix' => 'ticket', 'as' => 'ticket.'], function () {
                Route::get('/', 'User\SupportController@index')->name('list');
                Route::get('/create', 'User\SupportController@create')->name('create');
                Route::post('/create', 'User\SupportController@store')->name('store');
                Route::get('/view/{ticket}', 'User\SupportController@ticketView')->name('view');
                Route::put('/reply/{ticket}', 'User\SupportController@reply')->name('reply');
                Route::get('/download/{ticket}', 'User\SupportController@download')->name('download');
            });

            Route::get('/referral', 'User\HomeController@referral')->name('referral');
            Route::get('/referral-bonus', 'User\HomeController@referralBonus')->name('referral.bonus');
            Route::get('/referral-bonus-search', 'User\HomeController@referralBonusSearch')->name('referral.bonus.search');
        });
    });


    Route::match(['get', 'post'], 'success', 'PaymentController@success')->name('success');
    Route::match(['get', 'post'], 'failed', 'PaymentController@failed')->name('failed');
    Route::match(['get', 'post'], 'payment/{code}/{trx?}/{type?}', 'PaymentController@gatewayIpn')->name('ipn');


    Route::get('/language/{code?}', 'FrontendController@language')->name('language');


    Route::get('/blog-details/{slug}/{id}', 'FrontendController@blogDetails')->name('blogDetails');
    Route::get('/blog', 'FrontendController@blog')->name('blog');

    Route::get('/', 'FrontendController@index')->name('home');
    Route::get('/about', 'FrontendController@about')->name('about');
    Route::get('/faq', 'FrontendController@faq')->name('faq');


    Route::get('/contact', 'FrontendController@contact')->name('contact');
    Route::post('/contact', 'FrontendController@contactSend')->name('contact.send');

    Route::post('/subscribe', 'FrontendController@subscribe')->name('subscribe');


    Route::get('/about', 'FrontendController@about')->name('about');
    Route::get('/exchange-rate', 'FrontendController@exchangeRate')->name('exchange.rate');
    Route::get('/latest-exchange', 'FrontendController@latestExchange')->name('latest.exchange');
    Route::get('/faq', 'FrontendController@faq')->name('faq');
    Route::get('/blog', 'FrontendController@blog')->name('blog');
    Route::get('/blog/details/{slug}/{id}', 'FrontendController@blogDetails')->name('blogDetails');
    Route::get('/contact', 'FrontendController@contact')->name('contact');


    Route::get('/{getLink}/{content_id}', 'FrontendController@getLink')->name('getLink');
});
