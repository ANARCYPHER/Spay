<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCurrencySellsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('currency_sells', function (Blueprint $table) {
            $table->id();
            $table->string('user_id');
            $table->string('send_currency_id');
            $table->string('receive_currency_id');
            $table->decimal('send_amount')->default(0.00000000);
            $table->decimal('receive_amount')->default(0.00000000);
            $table->decimal('rate')->default(0.00000000);
            $table->Text('sender_info')->nullable();
            $table->Text('receiver_info')->nullable();
            $table->string('exchange_uuid')->nullable();
            $table->string('uuid')->nullable();
            $table->boolean('status')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('currency_sells');
    }
}
