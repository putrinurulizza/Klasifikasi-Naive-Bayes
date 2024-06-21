<?php

namespace App\Http\Controllers;

use App\Models\Dataset;
use Illuminate\Http\Request;
use Illuminate\Database\QueryException;

class DatasetController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view(
            'dashboard.dataset.index',
            [
                'title' => 'Tabel Dataset',
                'datasets' => Dataset::all(),
            ]
        );
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
        try {
            $validatedData = $request->validate([
                'nama' => 'required',
                'pkh' => 'required|in:PKH,Non-PKH',
                'jml_tanggungan' => 'required|integer',
                'kepala_rt' => 'required|in:Laki-Laki,Perempuan',
                'kondisi_rumah' => 'required|in:Batu Permanen,Bambu Anyam,Papan',
                'jml_penghasilan' => 'required|integer',
                'status_rumah' => 'required|in:Milik Sendiri,Sewa',
                'label' => 'required|in:Layak,Tidak Layak',
            ]);

            Dataset::create($validatedData);

            return redirect()->route('dataset.index')->with('success', 'Data baru berhasil ditambahkan!');
        } catch (\Illuminate\Validation\ValidationException $exception) {
            return redirect()->route('dataset.index')->with('failed', $exception->getMessage());
        }
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
    public function update(Request $request, Dataset $dataset)
    {
        try {
            $rules = [
                'nama' => 'required',
                'pkh' => 'required|in:PKH,Non-PKH',
                'jml_tanggungan' => 'required|integer',
                'kepala_rt' => 'required|in:Laki-Laki,Perempuan',
                'kondisi_rumah' => 'required|in:Batu Permanen,Bambu Anyam,Papan',
                'jml_penghasilan' => 'required|integer',
                'status_rumah' => 'required|in:Milik Sendiri,Sewa',
                'label' => 'required|integer',
            ];

            $validatedData = $this->validate($request, $rules);

            Dataset::where('id', $dataset->id)->update($validatedData);

            return redirect()->route('dataset.index')->with('success', "Dataset $dataset->nama berhasil diperbarui!");
        } catch (\Illuminate\Validation\ValidationException $exception) {
            return redirect()->route('dataset.index')->with('failed', 'Data gagal diperbarui! ' . $exception->getMessage());
        }
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Dataset $dataset)
    {
        try {
            $dataset->destroy($dataset->id);
        } catch (\Illuminate\Database\QueryException $e) {
            if ($e->getCode() == 23000) {
                //SQLSTATE[23000]: Integrity constraint violation
                return redirect()->route('dataset.index')->with('failed', "Dataset $dataset->nama tidak dapat dihapus, karena sedang digunakan pada tabel lain!");
            }
        }
        return redirect()->route('dataset.index')->with('success', "Dataset {$dataset->nama} berhasil dihapus!");
    }
}
