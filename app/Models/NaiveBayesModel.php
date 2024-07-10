<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class NaiveBayesModel extends Model
{
    public function classify($datasetId)
    {

        // Ambil data dari dataset berdasarkan ID
        $dataset = Dataset::findOrFail($datasetId);
        // Hitung probabilitas kelas layak (1) dan tidak layak (0)
        $prob_layak = $this->calculateProbability('Berprestasi Akademik', $dataset);
        $prob_tidak_layak = $this->calculateProbability('Berprestasi Non-Akademik', $dataset);


        // Klasifikasi berdasarkan probabilitas tertinggi
        if ($prob_layak > $prob_tidak_layak) {
            return 'Berprestasi Akademik';
        } else {
            return 'Berprestasi Non-Akademik';
        }
    }

    private function calculateProbability($label, $dataset)
    {
        // Hitung probabilitas prior P(Y=label)
        $total_data = Dataset::count(); // Menghitung jumlah total data
        $count_label = Dataset::where('label', $label)->count(); // Menghitung jumlah data berlabel $label
        // dd($count_label);
        if ($count_label == 0) {
            return 0; // Menghindari division by zero, bisa di-handle sesuai kebutuhan
        }

        $prior = $count_label / $total_data;

        // Hitung probabilitas conditional P(Xi=x|Y=label) untuk masing-masing fitur
        $conditional_prob = [];

        $features = [
            'ipk' => $dataset->ipk,
            'ekstrakurikuler' => $dataset->ekstrakurikuler,
            'kepemimpinan' => $dataset->kepemimpinan,
            'sertifikat' => $dataset->sertifikat,
        ];

        foreach ($features as $key => $value) {
            $count_feature_label = Dataset::where('label', $label)->where($key, $value)->count(); // Menghitung jumlah data dengan fitur $key bernilai $value dan berlabel $label

            if ($count_label != 0) {
                $conditional_prob[$key] = $count_feature_label / $count_label;
            } else {
                $conditional_prob[$key] = 0; // Atau tindakan lain sesuai kebutuhan
            }
        }

        // Hitung total probabilitas P(Y=label) * P(X1=x1|Y=label) * P(X2=x2|Y=label) * ...
        $total_prob = $prior;

        foreach ($conditional_prob as $value) {
            $total_prob *= $value;
        }

        return $total_prob;
    }
}
