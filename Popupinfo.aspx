<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Popupinfo.aspx.cs" Inherits="Dahboard_project.Popupinfo" %>

<%@ Register assembly="DevExpress.Web.v20.2, Version=20.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>



<html>
<head runat="server">
    <title>  </title>
      <link  rel="icon" href="Images/invoice_4306889.png"  type="image/x-icon" />
      <script type="text/javascript">
          function OnToolbarItemClick(s, e) {
              if (IsCustomExportToolbarCommand(e.item.name)) {
                  e.processOnServer = true;
                  e.usePostBack = true;
              }
          }
          function IsCustomExportToolbarCommand(command) {
              return command == "CustomExportToXLS" || command == "CustomExportToXLSX";
          }
      </script>
</head>
<body>
 
    <form  runat="server">
      
      <div class="content-wrapper">

        <asp:ScriptManager ID="scriptmanager1" runat="server">  
</asp:ScriptManager>  
<div>  
<asp:UpdatePanel ID="updatepnl" runat="server">  
<ContentTemplate>
        <div>
            <table id="TABLE2" align="center" dir="rtl">
                <tbody>
                 

                    <tr>
                        <td ></td>
                    </tr>
                    <tr>
                      
                        <td  runat="server" align="center"  >

                            <dx:ASPxGridView align="center" Width="95%"  runat="server" clientinstancename="gvunPost" cssfilepath="App_Themes/Office2003 Blue/{0}/styles.css"   csspostfix="Office2003_Blue" keyfieldname="id" autogeneratecolumns="False" datasourceid="SalesDS2"  id="gvunPost" __designer:wfdid="w3" onhtmlrowcreated="gvunPost_HtmlRowCreated"  OnFilterControlColumnsCreated="grid_FilterControlColumnsCreated" EnableRowsCache="False" EnableTheming="True" Theme="Office2003Silver" style="margin-top: 10px;" >



                                <ClientSideEvents rowclick="function(s, e) {
	  gvunPost.UnselectRows(selectedRowIndex);
                selectedRowIndex = e.visibleIndex;
}"
                                    endcallback="function(s, e) {
	gvunPost.SelectRowOnPage(selectedRowIndex);
}" />

                              


                                <settings showtitlepanel="True" showfilterrow="True" showfooter="True" ShowGroupPanel="True" ShowGroupFooter="VisibleAlways"></settings>






<SettingsPopup>
    <filtercontrol autoupdateposition="False">
        <settingsadaptivity switchatwindowinnerwidth="768" />
    </filtercontrol>
</SettingsPopup>






        <ClientSideEvents ToolbarItemClick="OnToolbarItemClick" />

                              


                                <settingspager pagesize="20" alwaysshowpager="True" ellipsismode="OutsideNumeric">
                                    <firstpagebutton visible="True"></firstpagebutton>

                                    <lastpagebutton visible="True"></lastpagebutton>

                                    <summary text="صفحة {0} من {1} "></summary>
                                </settingspager>




<Settings ShowFilterBar="Visible" />






                                <settingsbehavior confirmdelete="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True"></settingsbehavior>

                                <settingscookies enabled="True"></settingscookies>






 <SettingsPopup>
            <FilterControl AutoUpdatePosition="False">
                <SettingsAdaptivity SwitchAtWindowInnerWidth="768" />
            </FilterControl>
            <FilterControl>
                <SettingsAdaptivity Mode="OnWindowInnerWidth" SwitchAtWindowInnerWidth="768" />
            </FilterControl>
        </SettingsPopup>






                                <SettingsSearchPanel  Visible="True" />






 <SettingsFilterControl ViewMode="VisualAndText" AllowHierarchicalColumns="true" ShowAllDataSourceColumns="true" MaxHierarchyDepth="1" />


 <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="DataAware" FileName="data" />






                                <settingsloadingpanel text="لحظة من فضلك.." imageposition="Right" Delay="50"></settingsloadingpanel>

                                 <settingstext title="  " grouppanel="اسحب الأعمدة المراد التصنيف بها هنا" groupcontinuedonnextpage="(يستكمل في الصفحة التالية)" emptydatarow="لا يوجد بيانات"></settingstext>

                                <Columns >
                                    <dx:GridViewCommandColumn  ShowSelectCheckbox="True" VisibleIndex="0" ShowClearFilterButton="True" >
                                    </dx:GridViewCommandColumn>

                                    <dx:gridviewdatatextcolumn fieldname="No" caption="رقم الفاتوره" visibleindex="1">
                                        <settings showfilterrowmenu="True" autofiltercondition="Contains"></settings>

                                        <headerstyle horizontalalign="Center"></headerstyle>

                                        <cellstyle horizontalalign="Right"></cellstyle>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox1" runat="server" text="رقم الفاتوره" checked="True"></dx:aspxcheckbox>
                                        </headertemplate>
                                    </dx:gridviewdatatextcolumn>


                                   
                                    <dx:gridviewdatatextcolumn PropertiesTextEdit-DisplayFormatString="dd/MM/yyyy" fieldname="dat" caption="التاريخ" visibleindex="2">
                                        

                                     
                                        

                                        <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy">
                                        </PropertiesTextEdit>
                                        

                                     
                                        

                                        <settings showfilterrowmenu="True"></settings>

                                        <headerstyle horizontalalign="Center"></headerstyle>

                                        <cellstyle horizontalalign="Right"></cellstyle>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox2" runat="server" text="التاريخ" checked="True"></dx:aspxcheckbox>
                                        </headertemplate>
                                    </dx:gridviewdatatextcolumn>

                                 

                                    <dx:gridviewdatatextcolumn fieldname="branchname" caption="الفرع" visibleindex="3">
                                        <settings showfilterrowmenu="True" autofiltercondition="Contains"></settings>

                                        <headerstyle horizontalalign="Center"></headerstyle>

                                        <cellstyle horizontalalign="Right"></cellstyle>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox3" runat="server" text="الفرع" checked="True"></dx:aspxcheckbox>
                                        </headertemplate>
                                    </dx:gridviewdatatextcolumn>
                                    <dx:gridviewdatatextcolumn fieldname="netvalue" caption="الاجمالي غير شامل الضريبه  " visibleindex="4">
                                        <settings showfilterrowmenu="True" autofiltercondition="Contains"></settings>

                                        <headerstyle horizontalalign="Center"></headerstyle>

                                        <cellstyle horizontalalign="Right"></cellstyle>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox4" runat="server" text="الاجمالي غير شامل الضريبه  " checked="True"></dx:aspxcheckbox>
                                        </headertemplate>
                                    </dx:gridviewdatatextcolumn>
                                    <dx:gridviewdatatextcolumn fieldname="TaxAdd" caption=" الضريبه " visibleindex="5">
                                       

                                        <settings showfilterrowmenu="True" autofiltercondition="Equals"></settings>

                                        <headerstyle horizontalalign="Center"></headerstyle>

                                        <cellstyle horizontalalign="Right"></cellstyle>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox5" runat="server" text="الضريبه " checked="True"></dx:aspxcheckbox>
                                        </headertemplate>
                                    </dx:gridviewdatatextcolumn>

                                   

                                    <dx:gridviewdatatextcolumn fieldname="finalvalue" caption="الاجمالي شامل الضريبه" visibleindex="6">
                                        

                                        <settings showfilterrowmenu="True" autofiltercondition="Equals"></settings>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox6" runat="server" text="الاجمالي شامل الضريبه" checked="True"></dx:aspxcheckbox>
                                        </headertemplate>
                                         <cellstyle horizontalalign="Right"></cellstyle>
                                    </dx:gridviewdatatextcolumn>
                                 

                                   

             

                                    <dx:gridviewdatatextcolumn caption=" " visibleindex="8"></dx:gridviewdatatextcolumn>



                                </Columns>


<Toolbars >
            <dx:GridViewToolbar ItemAlign="Center">
                <SettingsAdaptivity Enabled="true" EnableCollapseRootItemsToIcons="true" />
                <Items>
                    <dx:GridViewToolbarItem Command="ExportToPdf"  Text=""  Image-IconID="diagramicons_exporttopdf_svg_32x32"    >
                        <Image IconID="diagramicons_exporttopdf_svg_32x32">
                        </Image>
                    </dx:GridViewToolbarItem>
                    <dx:GridViewToolbarItem Command="ExportToXls" Text=""  Image-IconID="export_exporttoxls_svg_32x32" >
                    
                        <Image IconID="export_exporttoxls_svg_32x32">
                        </Image>
                    </dx:GridViewToolbarItem>
                    
                    <dx:GridViewToolbarItem Command="ExportToDocx" Text=""  Image-IconID="export_exporttodocx_svg_32x32" >
                   
                        <Image IconID="export_exporttodocx_svg_32x32">
                        </Image>
                    </dx:GridViewToolbarItem>
                   
                </Items>
            </dx:GridViewToolbar>
        </Toolbars>

<%--<TotalSummary>
    <dx:ASPxSummaryItem SummaryType="Count" FieldName="No" DisplayFormat="عدد الفواتير= 0"></dx:ASPxSummaryItem>
</TotalSummary>--%>

 <TotalSummary>
            <dx:ASPxSummaryItem FieldName="No" SummaryType="Count"  DisplayFormat="عدد الفواتير= 0" />
            <dx:ASPxSummaryItem FieldName="netvalue" SummaryType="Sum" DisplayFormat="   0" />
            <dx:ASPxSummaryItem FieldName="TaxAdd" SummaryType="Sum" DisplayFormat="   0" />
            <dx:ASPxSummaryItem FieldName="finalvalue" SummaryType="Sum" DisplayFormat="   0" />
        </TotalSummary>
        <GroupSummary>
            <dx:ASPxSummaryItem FieldName="netvalue" ShowInGroupFooterColumn="netvalue" SummaryType="Sum" DisplayFormat=" 0" />
            <dx:ASPxSummaryItem FieldName="TaxAdd" ShowInGroupFooterColumn="TaxAdd" SummaryType="Sum" DisplayFormat="   0" />
            <dx:ASPxSummaryItem FieldName="finalvalue" ShowInGroupFooterColumn="finalvalue" SummaryType="Sum" DisplayFormat="   0" />
        </GroupSummary>





<Styles CssPostfix="Office2003_Blue" CssFilePath="App_Themes/Office2003 Blue/{0}/styles.css">

    <grouprow horizontalalign="Right">
                                        <backgroundimage imageurl="~/App_Themes/Office2003 Blue/Web/nbBack.gif"></backgroundimage>
                                    </grouprow>

                                    <selectedrow>
                                        <backgroundimage imageurl="~/App_Themes/Office2003 Blue/Web/nbBack.gif"></backgroundimage>
                                    </selectedrow>

                                    <footer font-bold="True" forecolor="Blue"></footer>

                                    <GroupFooter Font-Bold="True" Font-Names="Arial Black">
    </GroupFooter>

                                    <loadingpanel imagespacing="10px"></loadingpanel>

                                    <titlepanel font-bold="True" font-size="12px"></titlepanel>


</Styles>


                            </dx:ASPxGridView>





                            
                        </td>
                    </tr>
                 
                </tbody>
            </table>
            
            <asp:SqlDataSource runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:EasyERP %>" OldValuesParameterFormatString="original_{0}" SelectCommand="Dashboard_Cards_rpt" SelectCommandType="StoredProcedure" ID="SalesDS2" __designer:wfdid="w7">
                 <SelectParameters> 
                <asp:ControlParameter ControlID="ObjectID" Name="year" PropertyName="Value" Type="String" />
                     <asp:ControlParameter ControlID="ObjectID2" Name="type" PropertyName="Value" Type="String" />
</SelectParameters>
              
            </asp:SqlDataSource>
                   <asp:HiddenField ID="ObjectID" runat="server" />
        <asp:HiddenField ID="ObjectID2" runat="server" />
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" FileName="Data" GridViewID="gvunPost">
        </dx:ASPxGridViewExporter>
     
     </div>
            </ContentTemplate>  
</asp:UpdatePanel>  
</div> 
  </div>        
</form>
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
</body>
</html>

