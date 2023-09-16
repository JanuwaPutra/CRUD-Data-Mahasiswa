<%-- 
    Document   : data_siswa
    Created on : Apr 11, 2023, 8:11:03 PM
    Author     : hoirs
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Kelompok 3 Uts Java Web Programming</title>
  </head>
  <body>    
    <%--Navbar--%>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4">
    <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ">
            <li class="nav-item" >
              <a class="nav-link active" href="data_siswa.jsp">Data Siswa</a>
            </li>
        </ul>
        <ul class="navbar-nav ms-auto ">
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="../index.jsp">Profil</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="#">Log Out</a>
            </li>
          </ul>
      </div>
    </div>
    </nav>
    <%--Akhir Navbar--%>
    
    
      <form  action='simpan_siswa.jsp' method='post' >
    <section class="pt-3 pb-5 pe-5 ps-5 bg-light text-dark">
      
        <div class="row align-items-center pt-3 ">
            <label for="namaSiswa" class="form-label">Nama Siswa</label>
            <div class="col col-md-4">
                <input type="text" name="txtnama" id="namaSiswa" class="form-control" placeholder="masukan nama siswa" autocomplete="off" onkeypress="return hurufSaja(event)" required>
            </div>
            <div class="col-auto">
                <input type="submit" value="Cari" name="cmdsimpan" class="btn btn-primary ps-4 pe-4">
            </div>
        </div>
        
        <div class="pt-4">
            <div class="row">
                <div class="col col-auto">
                    <label  for="tempatLahir" class="form-label ">Tempat Lahir</label>
                    <input type="text" name="tempatLahir" id="tempatLahir" class="form-control " placeholder="masukan tempat lahir" autocomplete="off" onkeypress="return hurufSaja(event)" >
                </div>
                
                <div class="col col-auto ">
                    <label  for="tanggal" class="form-label">Tanggal</label>                
                    <select id="tanggal" class="form-select" name="tanggal">
                        <% 
                        // Generate dropdown hari
                        
                        for (int hari = 1; hari <= 31; hari++) {
                            String selected = (hari == 1) ? "selected" : "";
                            out.println("<option value='" + hari + "' " + selected + ">" + hari + "</option>");
                        }
                        %>
                    </select>
                </div>
        
                <div class="col col-auto">
                    <label  for="bulan" class="form-label ">Bulan</label>
                    <select name="bulan" id="bulan" class="form-select" >
                    <% 
                        // Generate dropdown bulan
                      
                        String[] daftarBulan = {
                            "Januari", "Februari", "Maret", "April", "Mei", "Juni",
                            "Juli", "Agustus", "September", "Oktober", "November", "Desember"
                        };
                        for (int bulan = 1; bulan <= 12; bulan++) {
                            String selected = (bulan == 1) ? "selected" : "";
                            out.println("<option value='" + bulan + "' " + selected + ">" + daftarBulan[bulan - 1] + "</option>");
                        }
                        %>
                    </select>          
                 </div>
        
                <div class="col col-auto">
                    <label  for="tahun" class="form-label ">Tahun</label>      
                     <select name="tahun" id="tahun" class="form-select">
                        <% 
                        // Generate dropdown tahun
                        int tahunSekarang = Calendar.getInstance().get(Calendar.YEAR);
                        for (int tahun = tahunSekarang; tahun >= 1950; tahun--) {
                            String selected = (tahun == 1990) ? "selected" : "";
                            out.println("<option value='" + tahun + "' " + selected + ">" + tahun + "</option>");
                        }
                        %>
                    </select>
                     
                </div>
            </div>
        </div>
        
        <div class="pt-4">
            <label class="form-label">Jenis Kelamin</label>
            <div class="col col-auto fs-5">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="inlineRadio1" value="Prempuan">
                    <label class="form-check-label " for="inlineRadio1">Perempuan</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="Laki-laki">
                    <label class="form-check-label" for="inlineRadio2" >Laki-Laki</label>
                </div>
            </div>
        </div>
        
        <div class="pt-4">
            <div class="row">
                <div class="col col-md-4">
                    <label class="form-label">Alamat Tinggal</label>
                    <textarea class="form-control" placeholder="masukan alamat tinggal" name= "alamat" id="floatingTextarea" onkeypress="return hurufSaja(event)" ></textarea>
                </div>
            </div>
        </div>
        
        <div class="row align-items-center pt-3 ">
            <label for="noHportu" class="form-label">No Hp Orang Tua</label>
            <div class="col col-md-2">
                <input type="text" name="NomorHportu" id="noHportu" class="form-control" placeholder="masukan no hp aktif" autocomplete="off" onkeypress="return angkaSaja(event)" >
            </div>
        </div>
        
        <div class="row align-items-center pt-3 ">
            <label for="nmIbu" class="form-label">Nama Ibu Kandung</label>
            <div class="col col-md-3">
                <input type="text" name="namaibu" id="nmIbu" class="form-control" placeholder="masukan nama ibu kandung" autocomplete="off" onkeypress="return hurufSaja(event)" >
            </div>
        </div>
        
        <div class="row align-items-center pt-3 ">
            <label for="nmAyah" class="form-label">Nama Ayah Kandung</label>
            <div class="col col-md-3">
                <input type="text" name="namaayah" id="nmAyah" class="form-control" placeholder="masukan nama ayah kandung" autocomplete="off" onkeypress="return hurufSaja(event)" >
            </div>
        </div>
        
        <div class="col">
            <button type="submit" value="simpan" name="cmdsimpan" class="btn btn-primary me-4 mt-4 " style="width: 80px;">Simpan</button>
            <button type="submit" value="ubah" name="cmdsimpan" class="btn btn-primary me-4 mt-4 " style="width: 80px;">Ubah</button>
            <button type="submit" value="hapus" name="cmdsimpan" class="btn btn-danger me-4 mt-4 "onclick="return confirm('Yakin Hapus?')" style="width: 80px;">Hapus</button>
            <button type="reset" class="btn btn-secondary me-4 mt-4 " style="width: 80px;">Batal</button>
        </div>
      
    </section>
        </form>
    
    <div class="card-footer text-muted">
        <p class="text-center">Copyright &copy;2023</p>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
    <script>
         function angkaSaja(evt)
                {
                    var charCode = (evt.which) ? evt.which: event.keyCode;
                    if(charCode>31 && (charCode<48 || charCode>57)){
                        return false;
                        return true;
                    }
                }
                
                function hurufSaja(evt) 
                {
                     var charCode = (evt.which) ? evt.which : event.keyCode;
                     var regex = /^[a-zA-Z\s]+$/; 
                     var char = String.fromCharCode(charCode);
                     if (!regex.test(char)) {
                            return false; 
                        } 
                    return true; 
}
                   
  
        </script>
  </body>
</html>
