<%-- 
    Document   : simpan
    Created on : Apr 12, 2023, 2:27:14 PM
    Author     : User
--%>

<%@page import="java.time.Month"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jdbc.Koneksi" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.format.TextStyle"%>
<%@page import="java.time.Month"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Kelompok 3 Uts Java Web Programming</title>
         <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
    </body>
    <%
       Koneksi konek = new Koneksi();
       Connection conn = konek.BukaKoneksi();
       Statement st = conn.createStatement();
                
       String nama = request.getParameter("txtnama");   
       String tmptlahir = request.getParameter("tempatLahir");  
       String tanggal = request.getParameter("tanggal");
       String bulan = request.getParameter("bulan");
       String tahun = request.getParameter("tahun");
       
       int tanggalInt = Integer.parseInt(tanggal);
     
        // Cek bulan Februari, jika tahun kabisat set maksimal tanggal ke 29, jika tidak set ke 28
        int maxTanggal = tanggalInt;
        int bulanInt = Integer.parseInt(bulan);
        if (bulanInt == 2) {
            int tahunInt = Integer.parseInt(tahun);
            if ((tahunInt % 4 == 0 && tahunInt % 100 != 0) || tahunInt % 400 == 0) {
                if(tanggalInt >29){
                maxTanggal = 29;
                tanggalInt = maxTanggal;
        }
            } else {
             if(tanggalInt >28){
                maxTanggal = 28;
                tanggalInt = maxTanggal;
                }
            }
             // Cek bulan April, Juni, September, dan November, set maksimal tanggal ke 30
        }if (bulanInt == 4 || bulanInt == 6 || bulanInt == 9 || bulanInt == 11) {
        if(tanggalInt >30){
            maxTanggal = 30;
            tanggalInt = maxTanggal;
        }
        }
       String tanggalLahir = tahun + "-" + bulan + "-" + tanggalInt;
       String gender = request.getParameter("gender");
       String alamat = request.getParameter("alamat");
       String NomorHportu = request.getParameter("NomorHportu");
       String namaibu = request.getParameter("namaibu");
       String namaayah = request.getParameter("namaayah");
       String dapat = request.getParameter("cmdsimpan");
       
       
      
       
         if(dapat.toString().equals("simpan"))
            {
             if (!tanggalLahir.isEmpty() &&  !gender.isEmpty() && !alamat.isEmpty() && !NomorHportu.isEmpty() && !namaibu.isEmpty() && !namaayah.isEmpty()) {
                
             try
            {
     
               String sql = "INSERT INTO data_siswa(nm_siswa,tempat_lahir,tgl_lahir,jns_kelamin,alamat,no_hp_ortu, nm_ibu_kandung, nm_ayah_kandung)" + "values ('"+nama+"', '"+tmptlahir+"','"+tanggalLahir+"','"+gender+"','"+alamat+"' ,'"+NomorHportu+"' ,'"+namaibu+"' ,'"+namaayah+"')";
               st.executeUpdate(sql);
               out.print("<script>alert('Berhasil Simpan')</script>");
               out.print("<script>document.location='data_siswa.jsp'</script>");
               
            }
            catch(Exception e)
            {
                    out.print(e);
                     out.print("<script>alert('Nama Sudah Pernah Disimpan!')</script>");
                 out.print("<script>document.location='data_siswa.jsp'</script>");
                     
               }
            
            
            }
            else{
                  out.print("<script>alert('Data Harus Diisi Semua !')</script>");
                 out.print("<script>document.location='data_siswa.jsp'</script>");
        }
            }
           else  if(dapat.toString().equals("Cari"))
            {
                try{

                    String sql="select * from data_siswa where nm_siswa='"+nama+"'";
                    ResultSet res=st.executeQuery(sql);
                    if(res.next())
                    {
                     String tanggalString  = res.getString("tgl_lahir");
                     LocalDate Tanggal = LocalDate.parse(tanggalString);
                     
                      int TAhun = Tanggal.getYear();
                      int BUlan = Tanggal.getMonthValue();
                      int TAnggal = Tanggal.getDayOfMonth();
                         
                      String jenisKelamin = res.getString("jns_kelamin");  
                  

        %>
         <form  action='simpan_siswa.jsp' method='post' >
    <section class="pt-3 pb-5 pe-5 ps-5 bg-light text-dark">
      
        <div class="row align-items-center pt-3 ">
            <label for="namaSiswa" class="form-label">Nama Siswa</label>
            <div class="col col-md-4">
                <input type="text" name="txtnama" id="namaSiswa" class="form-control" placeholder="masukan nama siswa" autocomplete="off" onkeypress="return hurufSaja(event)" value="<%=res.getString(1)%>" readonly="">
            </div>
            <div class="col-auto">
                <input type="submit" value="Cari" name="cmdsimpan" class="btn btn-primary ps-4 pe-4">
            </div>
        </div>
        
        <div class="pt-4">
            <div class="row">
                <div class="col col-auto">
                    <label  for="tempatLahir" class="form-label ">Tempat Lahir</label>
                    <input type="text" name="tempatLahir" id="tempatLahir" class="form-control " placeholder="masukan tempat lahir" autocomplete="off" onkeypress="return hurufSaja(event)" value="<%=res.getString(2)%>">
                </div>
                <div class="col col-auto">
                    <label  for="tanggal" class="form-label">Tanggal</label>
                    
                   
        <select id="tanggal" class="form-select" name="tanggal">
            <% 
            // Generate dropdown hari
            for (int hari = 1; hari <= 31; hari++) {
                String selected = (hari == TAnggal) ? "selected" : "";
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
            for (int Bulan = 1; Bulan <= 12; Bulan++) {
                String selected = (Bulan == BUlan) ? "selected" : "";
                out.println("<option value='" + Bulan + "' " + selected + ">" + daftarBulan[Bulan - 1] + "</option>");
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
             for (int Tahun = tahunSekarang; Tahun >= 1950; Tahun--) {
                String selected = (Tahun == TAhun) ? "selected" : "";
                out.println("<option value='" + Tahun + "' " + selected + ">" + Tahun + "</option>");
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
                    <%
                        if (jenisKelamin.equals("Prempuan")) {
                        %>
                         <input class="form-check-input" type="radio" name="gender" id="inlineRadio1" value="Prempuan" checked>
                    <label class="form-check-label " for="inlineRadio1">Perempuan</label>
                </div>
                          <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="Laki-laki" >
                    <label class="form-check-label" for="inlineRadio2" >Laki-Laki</label>
                </div>
                         <%
                        
                        }else{
                            %>
                            <input class="form-check-input" type="radio" name="gender" id="inlineRadio1" value="Prempuan" checked>
                    <label class="form-check-label " for="inlineRadio1">Perempuan</label>
                </div>
                             <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="Laki-laki" checked>
                    <label class="form-check-label" for="inlineRadio2" >Laki-Laki</label>
                </div>
                             <%
                        }
                    %>
                   
               
            </div>
        </div>
        
        <div class="pt-4">
            <div class="row">
                <div class="col col-md-4">
                    <label class="form-label">Alamat Tinggal</label>
                    <textarea class="form-control" placeholder="masukan alamat tinggal" name= "alamat" id="floatingTextarea" onkeypress="return hurufSaja(event)"><%=res.getString(5)%></textarea>
                </div>
            </div>
        </div>
        
        <div class="row align-items-center pt-3 ">
            <label for="noHportu" class="form-label">No Hp Orang Tua</label>
            <div class="col col-md-2">
                <input type="text" name="NomorHportu" id="noHportu" class="form-control" placeholder="masukan no hp aktif" autocomplete="off" onkeypress="return angkaSaja(event)" value="<%=res.getString(6)%>">
            </div>
        </div>
        
        <div class="row align-items-center pt-3 ">
            <label for="nmIbu" class="form-label">Nama Ibu Kandung</label>
            <div class="col col-md-3">
                <input type="text" name="namaibu" id="nmIbu" class="form-control" placeholder="masukan nama ibu kandung" autocomplete="off" onkeypress="return hurufSaja(event)" value="<%=res.getString(7)%>">
            </div>
        </div>
        
        <div class="row align-items-center pt-3 ">
            <label for="nmAyah" class="form-label">Nama Ayah Kandung</label>
            <div class="col col-md-3">
                <input type="text" name="namaayah" id="nmAyah" class="form-control" placeholder="masukan nama ayah kandung" autocomplete="off" onkeypress="return hurufSaja(event)" value="<%=res.getString(8)%>">
            </div>
        </div>
        
        <div class="col">
            <button type="submit" disabled value="simpan" name="cmdsimpan" class="btn btn-primary me-4 mt-4 " style="width: 80px;">Simpan</button>
            <button type="submit" value="ubah" name="cmdsimpan" class="btn btn-primary me-4 mt-4 " style="width: 80px;">Ubah</button>
            <button type="submit" value="hapus" name="cmdsimpan" class="btn btn-danger me-4 mt-4 " onclick="return confirm('Yakin Hapus?')" style="width: 80px;">Hapus</button>
            <button type="reset"  class="btn btn-secondary me-4 mt-4 " onclick="history.back(-1)" style="width: 80px;">Batal</button>
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
        
        
        
        <%
           
                 }else{
                 out.print("<script>alert('Data Tidak DItemukan')</script>");
                 out.print("<script>document.location='data_siswa.jsp'</script>");
                }
                } catch(Exception e){
                    out.print(e);
                }
               }
                
                else if(dapat.toString().equals("hapus"))
            {
            try
            {
     
                String sql = "delete from data_siswa where nm_siswa='"+nama+"'";
                st.executeUpdate(sql);
                conn.close();
                out.print("<script>alert('Data Berhasil Dihapus')</script>");
                 out.print("<script>document.location='data_siswa.jsp'</script>");
            }
            catch(Exception e)
            {
                    out.print(e);
               }
            }
            
             else if(dapat.toString().equals("ubah"))
            {
            try
            {
     
                String sql1 = "UPDATE data_siswa SET tempat_lahir='"+tmptlahir+"', tgl_lahir='"+tanggalLahir+"', jns_kelamin='"+gender+"', alamat='"+alamat+"', no_hp_ortu='"+NomorHportu+"' , nm_ibu_kandung='"+namaibu+"' , nm_ayah_kandung='"+namaayah+"'" + "WHERE nm_siswa='"+nama+"' ";
                st.executeUpdate(sql1);
                conn.close();
                out.print("<script>alert('Data Berhasil Diubah')</script>");
                 out.print("<script>document.location='data_siswa.jsp'</script>");
            }
            catch(Exception e)
            {
                    out.print(e);
               }

            }

            %>
</html>
