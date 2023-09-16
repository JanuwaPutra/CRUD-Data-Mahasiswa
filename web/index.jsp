<%-- 
    Document   : index
    Created on : Apr 11, 2023, 7:18:57 PM
    Author     : hoirs
--%>

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
              <a class="nav-link" href="master/data_siswa.jsp">Data Siswa</a>
            </li>
        </ul>
        <ul class="navbar-nav ms-auto ">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="index.jsp">Profil</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="#">Log Out</a>
            </li>
          </ul>
      </div>
    </div>
    </nav>
    <%--Akhir Navbar--%>
    
    <section class="px-5 pt-5 bg-light text-dark">
        <div style="min-height: 500px;">
            <h3 class="text-center">Profil ini berisi nama-nama anggrota kelompok 3</h3>
            <div class="table-responsive mx-auto pt-2" style="width: 33%;">
                <table class="table table-hover table-borderless">
                    <thead>
                        <tr>
                            <th scope="col" class="text-center">No.</th>
                            <th scope="col">Nim</th>
                            <th scope="col">Nama</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="text-center">1.</td>
                            <td>2011500390</td>
                            <td>Januwa Putra Wiastopo</td>
                        </tr>
                        <tr>
                            <td class="text-center">2.</td>
                            <td>2011500432</td>
                            <td>Syahbani Hoir</td>
                        </tr>
                        <tr>
                            <td class="text-center">3.</td>
                            <td>2011500580</td>
                            <td>Muhammad Zharif Firdyansyah</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
    
    <div class="card-footer text-muted">
        <p class="text-center">Copyright &copy;2023</p>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  </body>
</html>
