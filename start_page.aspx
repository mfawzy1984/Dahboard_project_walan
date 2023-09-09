<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="start_page.aspx.cs" Inherits="Dahboard_project.start_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title> Dashboard</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback"/>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css"/>
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"/>
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css"/>
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css"/>
  <!-- JQVMap -->
  <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css"/>
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css"/>
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css"/>
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css"/>
  <!-- summernote -->
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback"/>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css"/>
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css"/>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
    <form id="form1" runat="server">
       
        <div class="wrapper">

  <!-- Preloader -->
<%--  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60"/>
  </div>--%>

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
    
      <li class="nav-item d-none d-sm-inline-block">
        <a href="index3.html" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Navbar Search -->
    

    
       
        
    
     
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
      
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
  

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
    

      <!-- SidebarSearch Form -->
   

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item menu-open">
            <a href="start_page.aspx" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                 Welcome to EeasyERP 
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
               <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="./index.html" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>orders</p>
                </a>
              </li>
                   </ul>
          
          </li>
          
  
          
          
       
          
           
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>



          

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard v1</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                
                 <asp:Label ID="Label1" runat="server" Width="50px" ></asp:Label>

                <p>اجمالي المبيعات</p>
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
              <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
              <div class="inner">
                <asp:Label ID="Label2" runat="server" Width="50px" > 100</asp:Label>

                <p>اجمالي مرتجع المبيعات</p>
              </div>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
              <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
              <div class="inner">
               <asp:Label ID="Label3" runat="server" Width="50px" > 200</asp:Label>

                <p>اجمالي المشتريات </p>
              </div>
              <div class="icon">
                <i class="ion ion-person-add"></i>
              </div>
              <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
              <div class="inner">
                <asp:Label ID="Label4" runat="server" Width="50px" > 300</asp:Label>

                <p>اجمالي مرتجع المشتريات </p>
              </div>
              <div class="icon">
                <i class="ion ion-pie-graph"></i>
              </div>
              <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
         
      </div>
     
          
      
          
<div style="max-width:20000px; float:left" >
           
     
         <canvas id="pieChart"  style="max-width: 500px;float:right;"></canvas>  
       <canvas id="myChart2" style="max-width: 600px;" ></canvas>
 

    </div> 

    <div style="max-width:20000px; float:left">
            
      
       <canvas id="myChart" style="max-width: 600px;float:left;" ></canvas>
         <canvas id="pieChart2"  style="max-width: 500px;"></canvas> 
        </div>
     
 



 
        <div style="width:700px; float:right";>    
 <h5 style="text-align:center; color:cadetblue";> الحركات الغير مرحله</h5>
<table id="dt-bordered" class="table table-bordered" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th></th>
      <th class="th-sm">Position
      </th>
      <th class="th-sm">Office
      </th>
      <th class="th-sm">Age
      </th>
      <th class="th-sm">Start date
      </th>
      <th class="th-sm">Salary
      </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td></td>
      <td>System Architect</td>
      <td>Edinburgh</td>
      <td>61</td>
      <td>2011/04/25</td>
      <td>$320,800</td>
    </tr>

  </tbody>
  
</table>        
     </div>   

      <div style="width:500px;";>    
 <h5 style="text-align:center; color:cadetblue";> قائمه المستخدم</h5>
<table id="dt-bordered2" class="table table-bordered" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th></th>
      <th class="th-sm">Position
      </th>
      <th class="th-sm">Office
      </th>
      <th class="th-sm">Age
      </th>
      <th class="th-sm">Start date
      </th>
      <th class="th-sm">Salary
      </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td></td>
      <td>System Architect</td>
      <td>Edinburgh</td>
      <td>61</td>
      <td>2011/04/25</td>
      <td>$320,800</td>
    </tr>

  </tbody>
  
</table>        
     </div>

      <div style="width:500px;";>    
 <h5 style="text-align:center; color:cadetblue";>  اسم المستخدم</h5>
<table id="dt-bordered3" class="table table-bordered" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th></th>
      <th class="th-sm">Position
      </th>
      <th class="th-sm">Office
      </th>
      <th class="th-sm">Age
      </th>
      <th class="th-sm">Start date
      </th>
      <th class="th-sm">Salary
      </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td></td>
      <td>System Architect</td>
      <td>Edinburgh</td>
      <td>61</td>
      <td>2011/04/25</td>
      <td>$320,800</td>
    </tr>

  </tbody>
  
</table>        
     </div>

 </div>
    </section>
   



<%-- <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">Bar Chart</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <div class="chart">
                  <canvas id="barChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                </div>
              </div>
              <!-- /.card-body -->
            </div>--%>





 

<!-- ./wrapper -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->

<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard.js"></script>

<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="../../plugins/chart.js/Chart.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
<!-- Page specific script -->

        <asp:Literal runat="server" ID="ltchartdata"></asp:Literal>
        <asp:Literal runat="server" ID="ltchartdata2"></asp:Literal>
        <asp:Literal runat="server" ID="ltchartdata3"></asp:Literal>
         
    </form>

    <%--<script>
        //var chartlabels1;
        //var chartlabels2;
      
        //var chartdata1;
        //var chartdata2;

        var areaChartData = {
            
            labels: ["jan","feb","mar","apr","may","jun","jol","aug","sep","oct","nov","dec"],
          
            datasets: [
                {
                    label: 'Burshases',
                    
                    backgroundColor: 'rgba(60,141,188,0.9)',
                    borderColor: 'rgba(60,141,188,0.8)',
                    pointRadius: false,
                    pointColor: '#3b8bba',
                    pointStrokeColor: 'rgba(60,141,188,1)',
                    pointHighlightFill: '#fff',
                    pointHighlightStroke: 'rgba(60,141,188,1)',
                    data:[20,30,40,60,70,80,19,200,13,12,13,15]
                },
                {
                    label: 'sales',
                    backgroundColor: 'rgba(210, 214, 222, 1)',
                    borderColor: 'rgba(210, 214, 222, 1)',
                    pointRadius: false,
                    pointColor: 'rgba(210, 214, 222, 1)',
                    pointStrokeColor: '#c1c7d1',
                    pointHighlightFill: '#fff',
                    pointHighlightStroke: 'rgba(220,220,220,1)',
                    data: [20, 30, 40, 60, 70, 80, 19, 200, 13, 12, 13, 15]
                },
            ]
        }

        //- BAR CHART -
        //-------------
        var barChartCanvas = $('#barChart').get(0).getContext('2d')
        var barChartData = $.extend(true, {}, areaChartData)
        var temp0 = areaChartData.datasets[0]
        var temp1 = areaChartData.datasets[1]
       barChartData.datasets[0] = temp1
        
        barChartData.datasets[1] = temp0

        var barChartOptions = {
            responsive: true,
            maintainAspectRatio: false,
            datasetFill: false
        }

        new Chart(barChartCanvas, {
            type: 'bar',
            data: barChartData,
            options: barChartOptions
        })


    </script>--%>
    <script>
        var chartlabels1;
         var chartdata1;

        var ctx = document.getElementById("myChart").getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: chartlabels1,
                datasets: [{
                    label: ' المشتريات  الشهريه ',
                    data: chartdata1,
                    backgroundColor: ["#0074D9", "#FF4136", "#2ECC40", "#0074D9", "#FF4136", "#2ECC40", "#0074D9", "#FF4136", "#2ECC40", "#0074D9", "#FF4136", "#2ECC40"],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });


    </script>

    <script>
        var chartlabels2;
        var chartdata2;

        var ctx = document.getElementById("myChart2").getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
           
            data: {
                labels: chartlabels2,
                datasets: [{
                    label: ' المبيعات  الشهريه ',
                    data: chartdata2,
                   
                    backgroundColor: ["#0074D9", "#FF4136", "#2ECC40", "#0074D9", "#FF4136", "#2ECC40","#0074D9", "#FF4136", "#2ECC40", "#0074D9", "#FF4136", "#2ECC40"],
                    
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });


    </script>
    <script>
      
        //pie
        var chartlabels3;
        var chartdata3;
        
        var ctxP = document.getElementById("pieChart").getContext('2d');
        var myPieChart = new Chart(ctxP, {
            type: 'pie',
           
            data: {
                
                labels: chartlabels3,
              
                datasets: [{
                    
                    data: chartdata3,
                    backgroundColor: ["#0074D9", "#FF4136", "#2ECC40", "#FF851B", "#7FDBFF", "#B10DC9", "#FFDC00", "#001f3f", "#39CCCC", "#01FF70", "#85144b", "#F012BE", "#3D9970", "#111111", "#AAAAAA"]
                
                 
                    
                   
                }]
            },
            options: {
              
                responsive: true,
                title: {
                    display: true,
                    text: " مبيعات الفروع"
                }
            }
        });


    </script>
       <script>

           //pie
           var ctxP = document.getElementById("pieChart2").getContext('2d');
           var myPieChart = new Chart(ctxP, {
               type: 'pie',
               data: {
                   labels: ["Red", "Green", "Yellow"],
                   datasets: [{
                       data: [300, 50, 100],
                       backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C"],
                       hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870"],

                   }]
               },
               options: {
                   responsive: true,
                      title: {
                       display: true,
                       text: "المصاريف الشهريه"
                   }
               }
           });


    </script>
    <script>
        $(document).ready(function () {
            $('#dt-bordered').dataTable({

                columnDefs: [{
                    orderable: false,
                    className: 'select-checkbox',
                    targets: 0
                }],
                select: {
                    style: 'multi',
                    selector: 'td:first-child'
                }
            });
        });
   
    </script>
       <script>
           $(document).ready(function () {
               $('#dt-bordered2').dataTable({

                   columnDefs: [{
                       orderable: false,
                       className: 'select-checkbox',
                       targets: 0
                   }],
                   select: {
                       style: 'multi',
                       selector: 'td:first-child'
                   }
               });
           });

    </script>
        <script>
            $(document).ready(function () {
                $('#dt-bordered3').dataTable({

                    columnDefs: [{
                        orderable: false,
                        className: 'select-checkbox',
                        targets: 0
                    }],
                    select: {
                        style: 'multi',
                        selector: 'td:first-child'
                    }
                });
            });

    </script>
</body>
</html>
