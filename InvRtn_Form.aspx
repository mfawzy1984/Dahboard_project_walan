﻿<%@ Page Language="C#" MasterPageFile="~/Site1.Master"  AutoEventWireup="true" CodeBehind="InvRtn_Form.aspx.cs" Inherits="Dahboard_project.InvRtn_Form" %>

<%@ Register Assembly="DevExpress.Web.v20.2, Version=20.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <!DOCTYPE html>

<html>
<head>
    <title> ربط مرتجع المبيعات</title>
      <link  rel="icon" href="Images/invoice_4306889.png"  type="image/x-icon" />
      <script type="text/javascript">
        function OnToolbarItemClick(s, e) {
            if(IsCustomExportToolbarCommand(e.item.name)) {
                e.processOnServer=true;
                e.usePostBack=true;
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
                        <td align="center" colspan="2">
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" AutoPostBack="True" Font-Bold="True" ForeColor="Black" ID="RButtonList3" __designer:wfdid="w1" OnSelectedIndexChanged="RButtonList3_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Value="0">حركات دائنه مبسطه</asp:ListItem>
                                <asp:ListItem Value="1">حركات دائنه ضريبيه</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>

                       <td style="font-weight:500;" >حاله المرتجع : </td>
                        <td dir="rtl" rowspan="1" >
                            <dx:aspxcombobox runat="server"  selectedindex="0" valuetype="System.String" textfield="CompItmName" valuefield="CompId" imagefolder="App_Themes/Office2003 Blue/{0}/" width="323px" autopostback="True" csspostfix="Office2003_Blue" cssfilepath="App_Themes/Office2003 Blue/{0}/styles.css" clientinstancename="CmbCase" id="CmbType2" __designer:wfdid="w2" onselectedindexchanged="CmbType2_SelectedIndexChanged">
                                <clientsideevents textchanged="function(s, e) {
	gvunPost.PerformCallback(s.GetValue());
}">
                                </clientsideevents>
                                <items>
                                    <dx:ListEditItem Text="لم ترسل" Value="0"></dx:ListEditItem>
                                    <dx:listedititem text="ارسلت بخطأ" value="1"></dx:listedititem>
                                    <dx:listedititem text="تم ارسلها" value="2"></dx:listedititem>
                                </items>

                                <itemstyle horizontalalign="Right"></itemstyle>

                                <buttonstyle width="13px"></buttonstyle>
                            </dx:aspxcombobox>
                        </td>
                    </tr>
                    <tr>

<%--                        <td colspan="2">
   <asp:ImageButton
        id="WordButton" autopostback="True" runat="server"  onclick="WordButton_Click"
        ToolTip="حفظ البيانات في ملف وورد" ImageUrl="~/Images/Word.jpg">
    </asp:ImageButton>
         <asp:ImageButton
        id="ExcelButton" runat="server" onclick="ExcelButton_Click"
        ToolTip="حفظ البيانات في ملف اكسيل" ImageUrl="~/Images/Excel.gif">
    </asp:ImageButton>

        
                            </td>--%>
                    </tr>
                    <tr>
                        <td ></td>
                    </tr>
                    <tr>
                      
                        <td  runat="server" align="center" colspan="2"  >

                            <dx:ASPxGridView align="center" Width="90%"  runat="server" clientinstancename="gvunPost" cssfilepath="App_Themes/Office2003 Blue/{0}/styles.css"   csspostfix="Office2003_Blue" keyfieldname="RtnInvid" autogeneratecolumns="False" datasourceid="SalesDS2"  id="gvunPost" __designer:wfdid="w3" onhtmlrowcreated="gvunPost_HtmlRowCreated"  OnFilterControlColumnsCreated="grid_FilterControlColumnsCreated" EnableRowsCache="false" EnableTheming="True" Theme="Office2003Blue" style="margin-top: 10px;" >





                                <%--<images imagefolder="App_Themes/Office2003 Blue/{0}/">
                                    <collapsedbutton height="12px" width="11px" url="App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png"></collapsedbutton>

                                    <expandedbutton height="12px" width="11px" url="App_Themes/Office2003 Blue/GridView/gvExpandedButton.png"></expandedbutton>

                                    <detailcollapsedbutton height="12px" width="11px" url="App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png"></detailcollapsedbutton>

                                    <detailexpandedbutton height="12px" width="11px" url="App_Themes/Office2003 Blue/GridView/gvExpandedButton.png"></detailexpandedbutton>
                                </images>--%>






                                <ClientSideEvents rowclick="function(s, e) {
	  gvunPost.UnselectRows(selectedRowIndex);
                selectedRowIndex = e.visibleIndex;
}"
                                    endcallback="function(s, e) {
	gvunPost.SelectRowOnPage(selectedRowIndex);
}" />

                              


                                <settings showtitlepanel="True" showfilterrow="True" showfooter="True" ShowGroupPanel="True"></settings>






<SettingsPopup>
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

                                 <settingstext title="   مرتجع المبيعات" grouppanel="اسحب الأعمدة المراد التصنيف بها هنا" groupcontinuedonnextpage="(يستكمل في الصفحة التالية)" emptydatarow="لا يوجد بيانات"></settingstext>

                                <Columns >
                                    <dx:GridViewCommandColumn  ShowSelectCheckbox="True" VisibleIndex="0" ShowClearFilterButton="True" >
                                    </dx:GridViewCommandColumn>

                                    <dx:gridviewdatatextcolumn fieldname="RtnInvNo" caption="رقم المرتجع" visibleindex="1">
                                        <settings showfilterrowmenu="True" autofiltercondition="Contains"></settings>

                                        <headerstyle horizontalalign="Center"></headerstyle>

                                        <cellstyle horizontalalign="Right"></cellstyle>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox1" runat="server" text="رقم المرتجع" checked="True"></dx:aspxcheckbox>
                                        </headertemplate>
                                    </dx:gridviewdatatextcolumn>

                                    <dx:gridviewdatatextcolumn fieldname="InvNo" caption="رقم الفاتوره" visibleindex="2">
                                        

                                        <settings showfilterrowmenu="True" autofiltercondition="Equals"></settings>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox2" runat="server" text="رقم الفاتوره" checked="True"></dx:aspxcheckbox>
                                        </headertemplate>
                                          <cellstyle horizontalalign="Right"></cellstyle>
                                    </dx:gridviewdatatextcolumn>
                                   
                                    <dx:gridviewdatatextcolumn PropertiesTextEdit-DisplayFormatString="dd/MM/yyyy" fieldname="RtnInvdate" caption="التاريخ" visibleindex="3">
                                        

                                        <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy">
                                        </PropertiesTextEdit>
                                        

                                        <settings showfilterrowmenu="True"></settings>

                                        <headerstyle horizontalalign="Center"></headerstyle>

                                        <cellstyle horizontalalign="Right"></cellstyle>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox3" runat="server" text="التاريخ" checked="True"></dx:aspxcheckbox>
                                        </headertemplate>
                                    </dx:gridviewdatatextcolumn>

                                    <dx:gridviewdatatextcolumn fieldname="invtime" caption="الوقت" visibleindex="4">
                                        
                                    

                                        <settings showfilterrowmenu="True"></settings>

                                        <headerstyle horizontalalign="Center"></headerstyle>

                                        <cellstyle horizontalalign="Right"></cellstyle>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox4" runat="server" text="الوقت" checked="True"></dx:aspxcheckbox>
                                        </headertemplate>
                                    </dx:gridviewdatatextcolumn>



                                    <dx:GridViewDataComboBoxColumn  FieldName="RtnInvtype" Caption="نوع المرتجع" VisibleIndex="5" Visible="true" >  
                    <PropertiesComboBox DataSourceID="dsItemType" TextField="invtype" ValueField="invtype" DropDownStyle="DropDownList">  
                    </PropertiesComboBox>  

                                         <settings showfilterrowmenu="True"></settings>

                                        <headerstyle horizontalalign="Center"></headerstyle>

                                        <cellstyle horizontalalign="Right"></cellstyle>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox5" runat="server" text="نوع المرتجع" checked="True"></dx:aspxcheckbox>
                                        </headertemplate>

                </dx:GridViewDataComboBoxColumn>



<%--                               <dx:GridViewDataComboBoxColumn FieldName="invtype" Caption="نوع الفاتورة" VisibleIndex="4">
<PropertiesComboBox ValueType="System.String"><Items>
<dx:ListEditItem Text=" " Value=""></dx:ListEditItem>
<dx:ListEditItem Text="مسددة بالكامل" Value="0"></dx:ListEditItem>
<dx:ListEditItem Text="مسددة جزئيا" Value="1"></dx:ListEditItem>
    <dx:ListEditItem Text="اجل" Value="2"></dx:ListEditItem>
</Items>

<ItemStyle HorizontalAlign="Right"></ItemStyle>
</PropertiesComboBox>

<Settings AutoFilterCondition="Contains"></Settings>

<CellStyle HorizontalAlign="Right"></CellStyle>

</dx:GridViewDataComboBoxColumn>--%>

                                    

                                   

                                    <dx:gridviewdatatextcolumn fieldname="custname" caption="العميل" visibleindex="6">
                                        <settings showfilterrowmenu="True" autofiltercondition="Contains"></settings>

                                        <headerstyle horizontalalign="Center"></headerstyle>

                                        <cellstyle horizontalalign="Right"></cellstyle>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox6" runat="server" text="العميل" checked="True"></dx:aspxcheckbox>
                                        </headertemplate>
                                    </dx:gridviewdatatextcolumn>
                                    <dx:gridviewdatatextcolumn fieldname="fax" caption="الرقم الضريبي " visibleindex="7">
                                        <settings showfilterrowmenu="True" autofiltercondition="Contains"></settings>

                                        <headerstyle horizontalalign="Center"></headerstyle>

                                        <cellstyle horizontalalign="Right"></cellstyle>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox7" runat="server" text="الرقم الضريبي " checked="True"></dx:aspxcheckbox>
                                        </headertemplate>
                                    </dx:gridviewdatatextcolumn>
                                    <dx:gridviewdatatextcolumn fieldname="CompItmName" caption=" حاله الربط" visibleindex="8">
                                       

                                        <settings showfilterrowmenu="True" autofiltercondition="Equals"></settings>

                                        <headerstyle horizontalalign="Center"></headerstyle>

                                        <cellstyle horizontalalign="Right"></cellstyle>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox8" runat="server" text="حاله الربط" checked="True"></dx:aspxcheckbox>
                                        </headertemplate>
                                    </dx:gridviewdatatextcolumn>

                                   

                                    <dx:gridviewdatatextcolumn fieldname="TaxAdd" caption="مبلغ شامل الضريبه" visibleindex="9">
                                        

                                        <settings showfilterrowmenu="True" autofiltercondition="Equals"></settings>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox9" runat="server" text="مبلغ شامل الضريبه" checked="True"></dx:aspxcheckbox>
                                        </headertemplate>
                                         <cellstyle horizontalalign="Right"></cellstyle>
                                    </dx:gridviewdatatextcolumn>
                                    <dx:gridviewdatatextcolumn fieldname="FinalValue" caption="مبلغ الضريبه" visibleindex="10">
                                        

                                        <settings showfilterrowmenu="True" autofiltercondition="Equals"></settings>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox10" runat="server" text="مبلغ الضريبه" checked="True"></dx:aspxcheckbox>
                                        </headertemplate>
                                         <cellstyle horizontalalign="Right"></cellstyle>
                                    </dx:gridviewdatatextcolumn>

                                     <dx:gridviewdatatextcolumn fieldname="notes" caption="ملاحظات" visibleindex="11">
                                        

                                        <settings showfilterrowmenu="True" autofiltercondition="Equals"></settings>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox11" runat="server" text="ملاحظات" checked="True"></dx:aspxcheckbox>
                                        </headertemplate>
                                          <cellstyle horizontalalign="Right"></cellstyle>
                                    </dx:gridviewdatatextcolumn>

              

                                    <dx:gridviewdatatextcolumn caption=" " visibleindex="13"></dx:gridviewdatatextcolumn>



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

<TotalSummary>
    <dx:ASPxSummaryItem SummaryType="Count" FieldName="InvNo" DisplayFormat="عدد الفواتير= 0"></dx:ASPxSummaryItem>
</TotalSummary>





<Styles CssPostfix="Office2003_Blue" CssFilePath="App_Themes/Office2003 Blue/{0}/styles.css">

    <grouprow horizontalalign="Right">
                                        <backgroundimage imageurl="~/App_Themes/Office2003 Blue/Web/nbBack.gif"></backgroundimage>
                                    </grouprow>

                                    <selectedrow>
                                        <backgroundimage imageurl="~/App_Themes/Office2003 Blue/Web/nbBack.gif"></backgroundimage>
                                    </selectedrow>

                                    <footer font-bold="True" forecolor="Blue"></footer>

                                    <loadingpanel imagespacing="10px"></loadingpanel>

                                    <titlepanel font-bold="True" font-size="12px"></titlepanel>


</Styles>


                            </dx:ASPxGridView>





                            
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table style="width: 100%" align="center">
                                <tbody>
                                    <tr align="center">
                                       
                                        <td style="height: 43px" align="center">
                                            <dx:aspxbutton runat="server" Enabled="true" text=" ارسال الزكاه والدخل"  csspostfix="Office2003_Blue" cssfilepath="App_Themes/Office2003 Blue/{0}/styles.css" width="500px" font-bold="True" forecolor="#0000C0" id="BtnUnPost" AutoPostBack="true" OnClick="BtnUnPost_Click" __designer:wfdid="w5" ></dx:aspxbutton>
                                        </td>
                                       
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
            
            <asp:SqlDataSource runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:EasyERP %>" OldValuesParameterFormatString="original_{0}" SelectCommand="GetRtnSalesToZatca" SelectCommandType="StoredProcedure" ID="SalesDS2" __designer:wfdid="w7">
              
                <SelectParameters>
                    <asp:ControlParameter ControlID="RButtonList3" PropertyName="SelectedValue" Name="InvType" Type="Int16"></asp:ControlParameter>
                    <asp:ControlParameter ControlID="CmbType2" PropertyName="Value" Name="VatStatus" Type="Int16"></asp:ControlParameter>
                   
                </SelectParameters>
            </asp:SqlDataSource>

        <asp:SqlDataSource ID="dsItemType" runat="server" ConnectionString="<%$ ConnectionStrings:EasyERP %>"  
            SelectCommand="select distinct  invtype=case invtype when 0 then 'مسددة بالكامل' when 1 then N'مسددة جزئيا' else 'اجل' end
from Sales_Inv">  
        </asp:SqlDataSource>  
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
</asp:Content>