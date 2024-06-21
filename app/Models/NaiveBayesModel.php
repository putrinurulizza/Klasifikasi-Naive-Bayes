<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Dataset;

class NaiveBayesModel extends Model
{
    public function classify($datasetId)
    {
        // Ambil data dari dataset berdasarkan ID
        $dataset = Dataset::findOrFail($datasetId);

        // Hitung probabilitas kelas layak (1) dan tidak layak (0)
        $prob_layak = $this->calculateProbability(1, $dataset);
        $prob_tidak_layak = $this->calculateProbability(0, $dataset);

        // Klasifikasi berdasarkan probabilitas tertinggi
        if ($prob_layak > $prob_tidak_layak) {
            return 'Layak';
        } else {
            return 'Tidak Layak';
        }
    }

    private function calculateProbability($label, $dataset)
    {
        // Hitung probabilitas prior P(Y=label)
        $total_data = Dataset::count(); // Menghitung jumlah total data
        $count_label = Dataset::where('label', $label)->count(); // Menghitung jumlah data berlabel $label
        $prior = $count_label / $total_data;

        // Hitung probabilitas conditional P(Xi=x|Y=label) untuk masing-masing fitur
        $features = [
            'pkh' => $dataset->pkh,
            'jml_tanggungan' => $dataset->jml_tanggungan,
            'kepala_rt' => $dataset->kepala_rt,
            'kondisi_rumah' => $dataset->kondisi_rumah,
            'jml_penghasilan' => $dataset->jml_penghasilan,
        ];

        foreach ($features as $key => $value) {
            $count_feature_label = Dataset::where('label', $label)->where($key, $value)->count(); // Menghitung jumlah data dengan fitur $key bernilai $value dan berlabel $label
            $conditional_prob[$key] = $count_feature_label / $count_label;
        }

        // Hitung total probabilitas P(Y=label) * P(X1=x1|Y=label) * P(X2=x2|Y=label) * ...
        $total_prob = $prior;
        foreach ($conditional_prob as $value) {
            $total_prob *= $value;
        }

        return $total_prob;
    }
}
