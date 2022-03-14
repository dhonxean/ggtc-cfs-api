<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateImagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('images', function (Blueprint $table) {
            $table->id();
            $table->integer('parent_id')->unsigned()->nullable();
            $table->string('model')->nullable();
            $table->string('category')->nullable();
            $table->string('title')->nullable();
            $table->string('alt')->nullable();
            $table->string('path');
            $table->string('path_resized');
            $table->string('file_name')->nullable();
            $table->enum('file_mode',['dark','light'])->nullable();
            $table->integer('sequence')->nullable();
            $table->tinyInteger('from_import')->default(0);
            $table->longText('caption')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('images');
    }
}
