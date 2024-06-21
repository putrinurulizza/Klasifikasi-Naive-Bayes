<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Klasifikasi extends Model
{
    use HasFactory;

    protected $table = 'klasifikasis';


    public function dataset()
    {
        return $this->belongsTo(Dataset::class, 'id_dataset');
    }
}
