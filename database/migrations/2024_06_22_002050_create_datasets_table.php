<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('datasets', function (Blueprint $table) {
            $table->id();
            $table->string('nama');
            $table->enum('pkh', ['PKH', 'Non-PKH']);
            $table->tinyInteger('jml_tanggungan');
            $table->enum('kepala_rt', ['Laki-Laki', 'Perempuan']);
            $table->enum('kondisi_rumah', ['Batu Permanen', 'Bambu Anyam', 'Papan']);
            $table->integer('jml_penghasilan');
            $table->enum('status_rumah', ['Milik Sendiri', 'Sewa']);
            $table->string('label');
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
        Schema::dropIfExists('datasets');
    }
};
