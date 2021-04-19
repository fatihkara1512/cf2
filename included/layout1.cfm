<!DOCTYPE html>


<html lang="tr">
    <head>
    <cfprocessingdirective pageEncoding="utf-8">
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Çiftlik</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
                <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="index.cfm">Ali Baba  </a>
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
        
          <cfif Session.Durum == "True">
<cfinclude template="login/butoncikis.cfm"> 
<cfelse>    
<cfinclude template="login/butongiris.cfm"> 
</cfif>

        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Genel</div>
                            <a class="nav-link" href="index.cfm">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Çiftlik
                            </a>
                              <cfif Session.Durum == "True">
                            <cfinclude template="sol-bolum.cfm"> 
                                </cfif>
                          
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                © 2021
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
