<%@ Page Language="C#" MasterPageFile="Site1.Master"  AutoEventWireup="true" CodeBehind="Dash_form.aspx.cs" Inherits="Dahboard_project.Dash_form" %>

<%@ Register Assembly="DevExpress.Web.v20.2, Version=20.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v20.2, Version=20.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
     
    <!DOCTYPE html>

<html>
<head>
  <title>EasyERP | Dashboard</title>
      <link  rel="icon" href="Images/icons/logo.ico" type="image/x-icon" />
 



</head>



    <form runat="server">
  


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" runat="server">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-4">
               
              <h5 class="m-0">  السنه الماليه</h5>
              <dx:BootstrapComboBox ClientInstanceName="CmbYear"  id="CmbYear" runat="server" textfield="years" valuefield="years" datasourceid="SqlYear" selectedindex="0" valuetype="System.String" ontextchanged="CmbYear_TextChanged" autopostback="true" ></dx:BootstrapComboBox>
              </div>
             <div class="col-sm-4">
               
              <h5 class="m-0" > الفروع</h5>
              <dx:BootstrapComboBox ClientInstanceName="Cmbbranch"  id="Cmbbranch" runat="server" textfield="branchname" valuefield="branchid" datasourceid="Sqlbranches" selectedindex="0" valuetype="System.String" ontextchanged="Cmbbranch_TextChanged" autopostback="true" ></dx:BootstrapComboBox>
              </div>
       
        </div>

           <div class="row mb-2">
         
       
        </div>

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
              <a href="#" class="small-box-footer"> More Info <asp:ImageButton ID="ImageButton1" onclientclick="Popupinfo(1);return false;" runat="server"  Width="30px" Height="30px"  ImageUrl="~/images/ser2.png "
                            ToolTip="more info  "    /></a>
                
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
              <a href="#" class="small-box-footer">
                   More Info
                     <asp:ImageButton ID="ImageButton2" onclientclick="Popupinfo(2);return false;" runat="server" Width="30px" Height="30px" ImageUrl="~/images/ser2.png "
                            ToolTip="more info  " />
                 
              </a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
              <div class="inner">
                 <asp:Label ID="Label3" runat="server" Width="50px" > </asp:Label>

                <p>اجمالي المشتريات </p>
              </div>
              <div class="icon">
                <i class="ion ion-person-add"></i>
              </div>
                
              <a href="#" class="small-box-footer">
                   More Info
                  <asp:ImageButton ID="BtnSearchItem" onclientclick="Popupinfo(3);return false;" runat="server" Width="30px" Height="30px" ImageUrl="~/images/ser2.png "
                            ToolTip="more info  " />
                 
                </a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
              <div class="inner">
                 <asp:Label ID="Label4" runat="server" Width="50px" ></asp:Label>

                <p>اجمالي مرتجع المشتريات </p>
              </div>
              <div class="icon">
                <i class="ion ion-pie-graph"></i>
              </div>
              <a href="#" class="small-box-footer">  
                   More Info
                  <asp:ImageButton ID="ImageButton3" onclientclick="Popupinfo(4);return false;" runat="server"  Width="30px" Height="30px"  ImageUrl="~/images/ser2.png "
                            ToolTip="more info" />  </a>
            </div>
          </div>
          <!-- ./col -->
        </div>
        <!-- /.row -->
        <!-- Main row -->
        <div class="row">
          <!-- Left col -->
          <section class="col-lg-7 connectedSortable">
            <!-- Custom tabs (Charts with tabs)-->
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                 
                     <i class="fas fa-th mr-1"></i>
                  المبيعات الشهريه
                </h3>
               
              </div><!-- /.card-header -->
              <div class="card-body">
                  <!-- barchar1-->
                <div class="tab-content p-0">
                  <!-- Morris chart - Sales -->
                  <div class="chart tab-pane active" id="revenue-chart"
                       style="position: relative; height: 100;">
                       <canvas id="myChart2" height="90" style="height: 90px;" ></canvas>
                      <!--<canvas id="revenue-chart-canvas" height="300" style="height: 300px;"></canvas>-->
                   </div>
                  <div class="chart tab-pane" id="sales-chart" style="position: relative; height: 300px;">
                    <!--<canvas id="sales-chart-canvas" height="300" style="height: 300px;"></canvas>-->

                  </div>
                </div>
              </div><!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- DIRECT CHAT -->
            <div class="card direct-chat direct-chat-primary">
              <div class="card-header">
                
                <h3 class="card-title">
                        <i class="fas fa-th mr-1"></i>
                    المشتريات الشهريه</h3>

              
              </div>

    
            
 <div class="card-body">
                  <!-- barchar1-->
                <div class="tab-content p-0">
                  <!-- Morris chart - Sales -->
                  <div class="chart tab-pane active" id="revenue-chart"
                       style="position: relative; height: 100;">
                      <canvas id="myChart" height="90" style="height: 90px;" ></canvas>
                     <!-- <canvas id="revenue-chart-canvas" height="300" style="height: 300px;"></canvas>-->
                   </div>
                  <div class="chart tab-pane" id="sales-chart" style="position: relative; height: 300px;">
                  <!--  <canvas id="sales-chart-canvas" height="300" style="height: 300px;"></canvas>-->
                  </div>
                </div>
              </div><!-- /.card-body -->
            </div>
            <!--/.direct-chat -->

            <!-- TO DO List -->
            
            <!-- /.card -->
          </section>
          <!-- /.Left col -->
          <!-- right col (We are only adding the ID to make the widgets sortable)-->
          <section class="col-lg-5 connectedSortable">

            <!-- Map card -->
            <div style="background-color:ghostwhite; border-block-style:solid;">
              <div class="card-header border-0">
                <h3 class="card-title">
                    <i class="fas fa-chart-pie mr-1"></i>
                مبيعات الفروع
                </h3>
             
            
                <!-- /.card-tools -->
              </div>
             <!--body-->
              <div class="card-footer bg-transparent">
                  <canvas id="pieChart"></canvas>  
              </div>
            </div>
            <!-- /.card -->

            <!-- solid sales graph -->
            <div style="background-color:ghostwhite;">
              <div class="card-header border-0">
                <h3 class="card-title">
                 <i class="fas fa-chart-pie mr-1"></i>
                 المصاريف الشهريه
                </h3>

                
              </div>
                <!--body-->
              <div class="card-body">
              </div>
              <!-- /.card-body -->
              <div style="background-color:ghostwhite;">
                 <canvas id="pieChart2"></canvas> 
                <!-- /.row -->
              </div>
              <!-- /.card-footer -->
            </div>
            <!-- /.card -->

            <!-- Calendar -->
            


            <!-- /.card -->
          </section>
          <!-- right col -->
           
             <section class="col-lg-7 connectedSortable">
            <!-- Custom tabs (Charts with tabs)-->
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                 
                     <i class="fas fa-th mr-1"></i>
                  (الاكثر مبيعا (كميه
                </h3>
               
              </div><!-- /.card-header -->
              <div class="card-body">
                  <!-- barchar1-->
                <div class="tab-content p-0">
               </div>
                <!--firstgrid-->

                 <dx:ASPxGridView Width="100%"  ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" Theme="iOS">
    <Columns>

        <dx:GridViewDataTextColumn FieldName="itmcode" VisibleIndex="3" Caption="كود الصنف ">
         <%--   <HeaderStyle BackColor="Yellow" ForeColor="SteelBlue" />--%>
        </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="itmname" VisibleIndex="1" Caption=" اسم الصنف">
          <%--  <HeaderStyle BackColor="Yellow" ForeColor="SteelBlue" />--%>
        </dx:GridViewDataTextColumn>
           <dx:GridViewDataTextColumn FieldName="qty" VisibleIndex="0" Caption="الكميه ">
          <%--  <HeaderStyle BackColor="Yellow" ForeColor="SteelBlue" />--%>
        </dx:GridViewDataTextColumn>
       
    </Columns>
</dx:ASPxGridView>
                  

                  </div>
                </div>
                 </section>

           

            

              <section class="col-lg-5 connectedSortable">
            <!-- Custom tabs (Charts with tabs)-->
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                 
                     <i class="fas fa-th mr-1"></i>
                  (الاكثر مبيعا (قيمه
                </h3>
               
              </div><!-- /.card-header -->
              <div class="card-body">
                  <!-- barchar1-->
                <div class="tab-content p-0">
               </div>
                <!-- second grid-->

                    <dx:ASPxGridView Width="100%"  ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" Theme="iOS">
    <Columns>

        <dx:GridViewDataTextColumn FieldName="itmcode" VisibleIndex="3" Caption="كود الصنف ">
            <%--<HeaderStyle BackColor="Yellow" ForeColor="SteelBlue" />--%>
        </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="itmname" VisibleIndex="1" Caption=" اسم الصنف">
            <%--<HeaderStyle BackColor="Yellow" ForeColor="SteelBlue" />--%>
        </dx:GridViewDataTextColumn>
           <dx:GridViewDataTextColumn FieldName="netvalue" VisibleIndex="0" Caption="القيمه ">
            <%--<HeaderStyle BackColor="Yellow" ForeColor="SteelBlue" />--%>
        </dx:GridViewDataTextColumn>
       
    </Columns>
</dx:ASPxGridView>
            





                  </div>
                </div>
                 </section>

                  <section class="col-lg-7 connectedSortable">
            <!-- Custom tabs (Charts with tabs)-->
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                 
                     <i class="fas fa-th mr-1"></i>
                  (الاصناف غير مباعه  (كميه
                </h3>
               
              </div><!-- /.card-header -->
              <div class="card-body">
                  <!-- barchar1-->
                <div class="tab-content p-0">
               </div>
                 <!-- third grid-->
                  
                    <dx:ASPxGridView Width="100%"  ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" Theme="iOS">
    <Columns>

        <dx:GridViewDataTextColumn FieldName="itmcode" VisibleIndex="3" Caption="كود الصنف ">
            <%--<HeaderStyle BackColor="Yellow" ForeColor="SteelBlue" />--%>
        </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="itmname" VisibleIndex="1" Caption=" اسم الصنف">
            <%--<HeaderStyle BackColor="Yellow" ForeColor="SteelBlue" />--%>
        </dx:GridViewDataTextColumn>
           <dx:GridViewDataTextColumn FieldName="nowqty" VisibleIndex="0" Caption="رصيد ">
            <%--<HeaderStyle BackColor="Yellow" ForeColor="SteelBlue" />--%>
        </dx:GridViewDataTextColumn>
       
    </Columns>
</dx:ASPxGridView>
               




                  </div>
                </div>
                 </section>

                  <section class="col-lg-5 connectedSortable">
            <!-- Custom tabs (Charts with tabs)-->
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                 
                     <i class="fas fa-th mr-1"></i>
                  (الاقل مبيعا  (كميه
                </h3>
               
              </div><!-- /.card-header -->
              <div class="card-body">
                  <!-- barchar1-->
                <div class="tab-content p-0">
               </div>
                 <!--fourthgrid-->

                     <dx:ASPxGridView Width="100%"  ID="ASPxGridView4" runat="server" AutoGenerateColumns="False" Theme="iOS">
    <Columns>

        <dx:GridViewDataTextColumn FieldName="itmcode" VisibleIndex="3" Caption="كود الصنف ">
            <%--<HeaderStyle BackColor="Yellow" ForeColor="SteelBlue" />--%>
        </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="itmname" VisibleIndex="1" Caption=" اسم الصنف">
            <%--<HeaderStyle BackColor="Yellow" ForeColor="SteelBlue" />--%>
        </dx:GridViewDataTextColumn>
           <dx:GridViewDataTextColumn FieldName="qty" VisibleIndex="0" Caption="الكميه ">
            <%--<HeaderStyle BackColor="Yellow" ForeColor="SteelBlue" />--%>
        </dx:GridViewDataTextColumn>
       
    </Columns>
</dx:ASPxGridView>
              

                  

                  </div>
                </div>
                 </section>

        </div>
        <!-- /.row (main row) -->





          
      </div><!-- /.container-fluid -->



    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
  <asp:Literal runat="server" ID="ltchartdata"></asp:Literal>
        <asp:Literal runat="server" ID="ltchartdata2"></asp:Literal>
        <asp:Literal runat="server" ID="ltchartdata3"></asp:Literal>
         <asp:SqlDataSource id="SqlYear" runat="server"   SelectCommand="select distinct  year(vchrdate) as years&#13;&#10; from gl_vouchers&#13;&#10;order by  year(vchrdate)  desc" ConnectionString="<%$ ConnectionStrings:EasyERP %>">
    </asp:SqlDataSource>
       
 <asp:SqlDataSource runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:EasyERP %>" OldValuesParameterFormatString="original_{0}" SelectCommand="Dashboard_Branches" SelectCommandType="StoredProcedure" ID="Sqlbranches" __designer:wfdid="w7">  
            </asp:SqlDataSource>

<!-- jQuery -->
<script src="../plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="../plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="../plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="../plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="../plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="../plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="../plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="../plugins/moment/moment.min.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="../plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="../plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../dist/js/demo.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="../dist/js/pages/dashboard.js"></script>
       
    
  

      <script type="text/javascript">


          function Popupinfo(t) {

              var y;
              var m;
              try {
                  y = '<%=Session["LoginTime"]%>'
                 
                  m = '<%=Session["loginbranch"]%>'
                 
              }
              catch (NullReferenceException) {
                  y = "NULL";
                  m = "NULL";
              }

            
              
              var year = y;
              var type = t;
              var Branchid = m;

              var rc = window.open('../Popupinfo.aspx?Type=' + t + '&Year=' + year + '&Branchid=' + Branchid + '', '', 'width=800,height=600,scrollbars=yes');

          }
          function updatefields(x, y, z, w, s) {





          }





      </script>
   
      
   
    </html>
    
     <script type="text/javascript">

        


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

    

           </form>
</asp:Content>
