<?php
use App\Models\User;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->bigInteger("user_id")->unsigned();
            $table->integer("quantity");
            $table->decimal("total", 8, 2);
            $table->enum('status', ['payé', 'non payé', 'annuler', 'livré'])->default('non payé');
            $table->timestamps();
            $table->foreignIdFor(User::class,"created_by")->nullable();
            $table->foreignIdFor(User::class,"updated_by")->nullable();
            $table->foreign("user_id")->references("id")->on("users")->onDelete("cascade");

        });
    }
       

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
