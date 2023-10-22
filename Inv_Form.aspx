<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inv_Form.aspx.cs" Inherits="Dahboard_project.Inv_Form" %>

<%@ Register Assembly="DevExpress.Web.v20.2, Version=20.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body  >
 
    <form  runat="server">
       
            <table id="TABLE2" align="center" dir="rtl">
                <tbody>
                    <tr>
                        <td align="center" colspan="3">
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" AutoPostBack="True" Font-Bold="True" ForeColor="Red" ID="RButtonList3" __designer:wfdid="w1">
                                <asp:ListItem Selected="True" Value="0">فواتير الضريبه المبسطه</asp:ListItem>
                                <asp:ListItem Value="1">الفواتير الضريبيه</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>حاله الفواتير</td>
                        <td colspan="2">
                            <dx:aspxcombobox runat="server" selectedindex="0" valuetype="System.String" textfield="CompItmName" valuefield="CompId" imagefolder="App_Themes/Office2003 Blue/{0}/" width="323px" autopostback="True" csspostfix="Office2003_Blue" cssfilepath="App_Themes/Office2003 Blue/{0}/styles.css" clientinstancename="CmbCase" id="CmbType2" __designer:wfdid="w2" onselectedindexchanged="CmbType2_SelectedIndexChanged">
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
                        <td   colspan="3">
                            
  

                            <dx:ASPxGridView runat="server" clientinstancename="gvunPost" cssfilepath="App_Themes/Office2003 Blue/{0}/styles.css" csspostfix="Office2003_Blue" keyfieldname="Invid" autogeneratecolumns="False" datasourceid="SalesDS2" width="100%" id="gvunPost" __designer:wfdid="w3" onhtmlrowcreated="gvunPost_HtmlRowCreated" EnableTheming="True" Theme="Office2003Blue" >






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

                              


                                <settingspager pagesize="20" alwaysshowpager="True" ellipsismode="OutsideNumeric">
                                    <firstpagebutton visible="True"></firstpagebutton>

                                    <lastpagebutton visible="True"></lastpagebutton>

                                    <summary position="Right" text="صفحة {0} من {1} "></summary>
                                </settingspager>

                                <settings showtitlepanel="True" showfilterrow="True" showfooter="True"></settings>

                                <settingsbehavior confirmdelete="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True"></settingsbehavior>

                                <settingscookies enabled="True"></settingscookies>






<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>






                                <settingsloadingpanel text="لحظة من فضلك.." imageposition="Right"></settingsloadingpanel>

                                 <settingstext title="" grouppanel="اسحب الأعمدة المراد التصنيف بها هنا" groupcontinuedonnextpage="(يستكمل في الصفحة التالية)" emptydatarow="لا يوجد بيانات"></settingstext>

                                <Columns >
                                    <dx:GridViewCommandColumn  ShowSelectCheckbox="True" VisibleIndex="0" >
                                    </dx:GridViewCommandColumn>

                                    <dx:gridviewdatatextcolumn fieldname="InvNo" caption="رقم الفاتوره" visibleindex="1">
                                        <settings showfilterrowmenu="True" autofiltercondition="Contains"></settings>

                                        <headerstyle horizontalalign="Center"></headerstyle>

                                        <cellstyle horizontalalign="Right"></cellstyle>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox1" runat="server" text="رقم الفاتوره" checked="True"></dx:aspxcheckbox>
                                        </headertemplate>
                                    </dx:gridviewdatatextcolumn>


                                   
                                    <dx:gridviewdatadatecolumn fieldname="invdate" caption="التاريخ" visibleindex="2">
                                        <propertiesdateedit displayformatstring="dd/MM/yyyy"></propertiesdateedit>

                                        <settings showfilterrowmenu="True"></settings>

                                        <headerstyle horizontalalign="Center"></headerstyle>

                                        <cellstyle horizontalalign="Right"></cellstyle>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox2" runat="server" text="التاريخ" checked="True"></dx:aspxcheckbox>
                                        </headertemplate>
                                    </dx:gridviewdatadatecolumn>

                                    <dx:gridviewdatatextcolumn fieldname="invtime" caption="الوقت" visibleindex="3">
                                        
                                    

                                        <settings showfilterrowmenu="True"></settings>

                                        <headerstyle horizontalalign="Center"></headerstyle>

                                        <cellstyle horizontalalign="Right"></cellstyle>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox3" runat="server" text="الوقت" checked="True"></dx:aspxcheckbox>
                                        </headertemplate>
                                    </dx:gridviewdatatextcolumn>


                                    <dx:GridViewDataComboBoxColumn  FieldName="invtype" Caption="نوع الفاتورة" VisibleIndex="4" Visible="true" Width="70">  
                    <PropertiesComboBox DataSourceID="dsItemType" TextField="invtype" ValueField="invtype" DropDownStyle="DropDownList">  
                    </PropertiesComboBox>  
                                         <cellstyle horizontalalign="Right"></cellstyle>
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

                                    

                                   

                                    <dx:gridviewdatatextcolumn fieldname="custname" caption="العميل" visibleindex="5">
                                        <settings showfilterrowmenu="True" autofiltercondition="Contains"></settings>

                                        <headerstyle horizontalalign="Center"></headerstyle>

                                        <cellstyle horizontalalign="Right"></cellstyle>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox5" runat="server" text="العميل" checked="True"></dx:aspxcheckbox>
                                        </headertemplate>
                                    </dx:gridviewdatatextcolumn>
                                    <dx:gridviewdatatextcolumn fieldname="fax" caption="الرقم الضريبي للعميل" visibleindex="6">
                                        <settings showfilterrowmenu="True" autofiltercondition="Contains"></settings>

                                        <headerstyle horizontalalign="Center"></headerstyle>

                                        <cellstyle horizontalalign="Right"></cellstyle>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox6" runat="server" text="الرقم الضريبي للعميل" checked="True"></dx:aspxcheckbox>
                                        </headertemplate>
                                    </dx:gridviewdatatextcolumn>
                                    <dx:gridviewdatatextcolumn fieldname="CompItmName" caption=" حاله الربط" visibleindex="7">
                                       

                                        <settings showfilterrowmenu="True" autofiltercondition="Equals"></settings>

                                        <headerstyle horizontalalign="Center"></headerstyle>

                                        <cellstyle horizontalalign="Right"></cellstyle>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox7" runat="server" text="حاله الربط" checked="True"></dx:aspxcheckbox>
                                        </headertemplate>
                                    </dx:gridviewdatatextcolumn>

                                   

                                    <dx:gridviewdatatextcolumn fieldname="TaxAdd" caption="مبلغ شامل الضريبه" visibleindex="8">
                                        

                                        <settings showfilterrowmenu="True" autofiltercondition="Equals"></settings>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox8" runat="server" text="مبلغ شامل الضريبه" checked="True"></dx:aspxcheckbox>
                                        </headertemplate>
                                         <cellstyle horizontalalign="Right"></cellstyle>
                                    </dx:gridviewdatatextcolumn>
                                    <dx:gridviewdatatextcolumn fieldname="FinalValue" caption="مبلغ الضريبه" visibleindex="9">
                                        

                                        <settings showfilterrowmenu="True" autofiltercondition="Equals"></settings>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox9" runat="server" text="مبلغ الضريبه" checked="True"></dx:aspxcheckbox>
                                        </headertemplate>
                                         <cellstyle horizontalalign="Right"></cellstyle>
                                    </dx:gridviewdatatextcolumn>

                                     <dx:gridviewdatatextcolumn fieldname="notes" caption="ملاحظات" visibleindex="10">
                                        

                                        <settings showfilterrowmenu="True" autofiltercondition="Equals"></settings>
                                        <headertemplate>
                                            <dx:aspxcheckbox id="ASPxCheckBox10" runat="server" text="ملاحظات" checked="True"></dx:aspxcheckbox>
                                        </headertemplate>
                                          <cellstyle horizontalalign="Right"></cellstyle>
                                    </dx:gridviewdatatextcolumn>

             

                                    <dx:gridviewdatatextcolumn caption=" " visibleindex="12"></dx:gridviewdatatextcolumn>



                                </Columns>



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
                        <td colspan="3">
                            <table style="width: 100%" align="center">
                                <tbody>
                                    <tr align="center">
                                       
                                        <td style="height: 43px" align="center">
                                            <dx:aspxbutton runat="server" text="ارسال" enabled="False" csspostfix="Office2003_Blue" cssfilepath="App_Themes/Office2003 Blue/{0}/styles.css" width="158px" font-bold="True" forecolor="#0000C0" id="BtnUnPost" __designer:wfdid="w5" ></dx:aspxbutton>
                                        </td>
                                       
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
            <asp:SqlDataSource runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:EasyERP %>" OldValuesParameterFormatString="original_{0}" SelectCommand="GetSalesToZatca" SelectCommandType="StoredProcedure" ID="SalesDS2" __designer:wfdid="w7">
              
                <SelectParameters>
                    <asp:ControlParameter ControlID="RButtonList3" PropertyName="SelectedValue" Name="InvType" Type="Int16"></asp:ControlParameter>
                    <asp:ControlParameter ControlID="CmbType2" PropertyName="Value" Name="VatStatus" Type="Int16"></asp:ControlParameter>
                   
                </SelectParameters>
            </asp:SqlDataSource>

        <asp:SqlDataSource ID="dsItemType" runat="server" ConnectionString="<%$ ConnectionStrings:EasyERP %>"  
            SelectCommand="select distinct  invtype=case invtype when 0 then 'مسددة بالكامل' when 1 then N'مسددة جزئيا' else 'اجل' end
from Sales_Inv">  
        </asp:SqlDataSource>  
       
     </form> 
</body>
</html>
