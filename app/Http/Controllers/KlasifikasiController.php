<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Klasifikasi;
use App\Models\NaiveBayesModel;
use App\Models\Dataset;

class KlasifikasiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $klasifikasis = Klasifikasi::with('dataset')->get(); // Ambil semua klasifikasi beserta data dataset terkait
        return view('dashboard.klasifikasi.index', compact('klasifikasis'));
    }

    public function klasifikasiProcess()
    {
        // Hapus semua data klasifikasi yang sudah ada sebelumnya
        Klasifikasi::truncate();

        $datasets = Dataset::all(); // Ambil semua data dari tabel datasets
        $naiveBayes = new NaiveBayesModel();

        foreach ($datasets as $dataset) {
            $klasifikasi = $naiveBayes->classify($dataset->id);

            // Simpan hasil klasifikasi ke dalam tabel klasifikasis
            $klasifikasiModel = new Klasifikasi();
            $klasifikasiModel->id_dataset = $dataset->id;
            $klasifikasiModel->hasil_klasifikasi = $klasifikasi;
            $klasifikasiModel->save();
        }

        return redirect()->route('klasifikasi.index')->with('success', 'Data berhasil diklasifikasi.');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
