<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Dataset extends Model
{
    use HasFactory;

    protected $table = 'datasets';

    // Specify the fillable fields
    protected $fillable = [
        'nama',
        'ipk',
        'ekstrakurikuler',
        'kepemimpinan',
        'sertifikat',
        'label',
    ];

    public function klasifikasi()
    {
        return $this->hasMany(Klasifikasi::class, 'id_dataset');
    }
}
