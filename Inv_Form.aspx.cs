
using DevExpress.Web;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using ZatcaIntegrationSDK;
using ZatcaIntegrationSDK.APIHelper;
using ZatcaIntegrationSDK.BLL;
using ZatcaIntegrationSDK.HelperContracts;

namespace Dahboard_project
{
    public partial class Inv_Form : System.Web.UI.Page
    {
        void buttonvisibility()
        {
            if (CmbType2.SelectedIndex == 0 || CmbType2.SelectedIndex == 1)
            {
                //if (gvunPost.VisibleRowCount != 0)
                BtnUnPost.Enabled = true;
            }
            else { BtnUnPost.Enabled = false; }

        }


        private void ExportGridToExcel()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "Vithal" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);

            gvunPost.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();

        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            //GridViewFeaturesHelper.SetupGlobalGridViewBehavior(gvunPost);
            //BtnUnPost.Enabled = true;


            if (IsPostBack)
            {
                gvunPost.DataBind();
            }

            buttonvisibility();
            gvunPost.DataBind();

        }
        protected void CmbType2_SelectedIndexChanged(object sender, EventArgs e)
        {
            buttonvisibility();
            gvunPost.DataBind();
        }
        protected void gvunPost_HtmlRowCreated(object sender, ASPxGridViewTableRowEventArgs e)
        {

            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#FFE0C0';");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='white';");


        }
        protected void BtnUnPost_Click(object sender, EventArgs e)
        {

            List<object> keyValues = gvunPost.GetSelectedFieldValues("Invid");
            if (keyValues.Count <= 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('لا توجد فواتير مختارة')", true);

                return;
            }
            SqlConnection cnn = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            cnn.ConnectionString = ConfigurationManager.ConnectionStrings["EasyERP"].ConnectionString;
            cmd.Connection = cnn;

            //SqlDataReader dr;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "GetZatcaData";

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Invid", keyValues[0].ToString());
            cmd.Parameters.AddWithValue("@InvType", CmbType2.Value.ToString());

            cnn.Open();
            SqlDataAdapter drr = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            drr.Fill(ds);
            cnn.Close();
            DataTable Dr = ds.Tables[0];

            //dr = cmd.ExecuteReader();
            //if (dr.IsClosed == false)
            //    if (dr.HasRows)
            //    {
            //        dr.Read();
            UBLXML ubl = new UBLXML();
            Invoice inv = new Invoice();
            Result res = new Result();
            inv.ID = keyValues[0].ToString();
            inv.UUID = Guid.NewGuid().ToString();
            inv.IssueDate = Dr.Rows[0]["invdate"].ToString();
            inv.IssueTime = Dr.Rows[0]["invtime"].ToString();
            inv.invoiceTypeCode.id = int.Parse(Dr.Rows[0]["invoiceTypeCodeId"].ToString());
            inv.invoiceTypeCode.Name = Dr.Rows[0]["invoiceTypeCodeName"].ToString();
            inv.DocumentCurrencyCode = Dr.Rows[0]["DocumentCurrencyCode"].ToString();
            inv.TaxCurrencyCode = Dr.Rows[0]["TaxCurrencyCode"].ToString();
            inv.AdditionalDocumentReferencePIH.EmbeddedDocumentBinaryObject = "NWZlY2ViNjZmZmM4NmYzOGQ5NTI3ODZjNmQ2OTZjNzljMmRiYzIzOWRkNGU5MWI0NjcyOWQ3M2EyN2ZiNTdlOQ==";
            inv.AdditionalDocumentReferenceICV.UUID = int.Parse(keyValues[0].ToString());
            inv.delivery.ActualDeliveryDate = Dr.Rows[0]["ActualDeliveryDate"].ToString();
            inv.delivery.LatestDeliveryDate = Dr.Rows[0]["LatestDeliveryDate"].ToString();

            inv.SupplierParty.partyIdentification.ID = Dr.Rows[0]["CompID"].ToString();
            inv.SupplierParty.partyIdentification.schemeID = Dr.Rows[0]["CompschemeID"].ToString();
            inv.SupplierParty.postalAddress.StreetName = Dr.Rows[0]["CompStreetName"].ToString();
            inv.SupplierParty.postalAddress.BuildingNumber = Dr.Rows[0]["CompBuildingNumber"].ToString();
            inv.SupplierParty.postalAddress.CityName = Dr.Rows[0]["CompCityName"].ToString();
            inv.SupplierParty.postalAddress.PostalZone = Dr.Rows[0]["CompPostalZone"].ToString();
            inv.SupplierParty.postalAddress.CitySubdivisionName = Dr.Rows[0]["CompCitySubdivisionName"].ToString();
            inv.SupplierParty.postalAddress.country.IdentificationCode = Dr.Rows[0]["CompIdentificationCode"].ToString();
            inv.SupplierParty.partyLegalEntity.RegistrationName = Dr.Rows[0]["RegistrationName"].ToString();
            inv.SupplierParty.partyTaxScheme.CompanyID = Dr.Rows[0]["CompCompanyID"].ToString();

            inv.CustomerParty.partyIdentification.ID = Dr.Rows[0]["CustID"].ToString();
            inv.CustomerParty.partyIdentification.schemeID = Dr.Rows[0]["CustschemeID"].ToString();
            inv.CustomerParty.postalAddress.StreetName = Dr.Rows[0]["CustStreetName"].ToString();
            inv.CustomerParty.postalAddress.BuildingNumber = Dr.Rows[0]["CustBuildingNumber"].ToString();
            inv.CustomerParty.postalAddress.CityName = Dr.Rows[0]["CustCityName"].ToString();
            inv.CustomerParty.postalAddress.PostalZone = Dr.Rows[0]["CustPostalZone"].ToString();
            inv.CustomerParty.postalAddress.CitySubdivisionName = Dr.Rows[0]["CustCitySubdivisionName"].ToString();
            inv.CustomerParty.postalAddress.country.IdentificationCode = Dr.Rows[0]["CustIdentificationCode"].ToString();
            inv.CustomerParty.partyLegalEntity.RegistrationName = Dr.Rows[0]["RegistrationName"].ToString();
            inv.CustomerParty.partyTaxScheme.CompanyID = Dr.Rows[0]["CustCompanyID"].ToString();

            inv.legalMonetaryTotal.PayableAmount = decimal.Parse(Dr.Rows[0]["PayableAmount"].ToString());
            AllowanceChargeCollection allowanceCharges = new AllowanceChargeCollection();
            AllowanceCharge invlineallowance = new AllowanceCharge();
            invlineallowance.ChargeIndicator = false;
            invlineallowance.MultiplierFactorNumeric = decimal.Parse(Dr.Rows[0]["MultiplierFactorNumeric"].ToString());
            invlineallowance.BaseAmount = decimal.Parse(Dr.Rows[0]["BaseAmount"].ToString());
            invlineallowance.Amount = decimal.Parse(Dr.Rows[0]["Amount"].ToString());
            invlineallowance.AllowanceChargeReason = Dr.Rows[0]["AllowanceChargeReason"].ToString();
            invlineallowance.taxCategory.ID = Dr.Rows[0]["TaxID"].ToString();
            invlineallowance.taxCategory.Percent = decimal.Parse(Dr.Rows[0]["Percent"].ToString());

            foreach (DataRow drow in ds.Tables[1].Rows)
            {
                InvoiceLine invline = new InvoiceLine();
                invline.InvoiceQuantity = decimal.Parse(drow["qty"].ToString());
                invline.item.Name = drow["itmname"].ToString();
                if (decimal.Parse(drow["VAT"].ToString()) == 0)
                {
                    invline.item.classifiedTaxCategory.ID = "Z";
                    invline.taxTotal.TaxSubtotal.taxCategory.ID = "Z";
                    invline.taxTotal.TaxSubtotal.taxCategory.TaxExemptionReasonCode = "VATEX-SA-HEA";
                    invline.taxTotal.TaxSubtotal.taxCategory.TaxExemptionReason = "Private healthcare to citizen";
                }
                else
                {
                    invline.item.classifiedTaxCategory.ID = "S";
                    invline.taxTotal.TaxSubtotal.taxCategory.ID = "S";
                }
                invline.item.classifiedTaxCategory.Percent = decimal.Parse(drow["VAT"].ToString());
                invline.taxTotal.TaxSubtotal.taxCategory.Percent = decimal.Parse(drow["VAT"].ToString());

                invline.price.EncludingVat = false;
                invline.price.PriceAmount = decimal.Parse(drow["price"].ToString());

                if (decimal.Parse(drow["discvalue"].ToString()) > 0)
                {
                    AllowanceCharge allowanceCharge = new AllowanceCharge();
                    allowanceCharge.ChargeIndicator = false;
                    allowanceCharge.AllowanceChargeReason = "discount";
                    allowanceCharge.Amount = decimal.Parse(drow["price"].ToString());
                    allowanceCharge.MultiplierFactorNumeric = 0;
                    allowanceCharge.BaseAmount = 0;
                    invline.allowanceCharges.Add(allowanceCharge);
                }
                inv.InvoiceLines.Add(invline);
            }


            inv.cSIDInfo.CertPem = string.Join("", File.ReadAllLines(Server.MapPath("\\cert\\cert.pem")));
            inv.cSIDInfo.PrivateKey = string.Join("", File.ReadAllLines(Server.MapPath("\\cert\\key.pem")));
            InvoiceTotal CalculateInvoiceTotal = ubl.CalculateInvoiceTotal(inv.InvoiceLines, inv.allowanceCharges);
            //Directory.GetCurrentDirectory() AppContext.BaseDirectory
            try
            {
                res = ubl.GenerateInvoiceXML(inv, Server.MapPath(""));
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString() + "\n\n" + ex.InnerException.ToString());
            }
            if (res.IsValid)
            {
                cmd.CommandText = "ZatcaTax_Ins";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@SType", "1" + CmbType2.Value.ToString());
                cmd.Parameters.AddWithValue("@SId", keyValues[0].ToString());
                cmd.Parameters.AddWithValue("@InvoiceHash", res.InvoiceHash);
                cmd.Parameters.AddWithValue("@SingedXml", res.SingedXML);
                cmd.Parameters.AddWithValue("@EncodedInvoice", res.EncodedInvoice);
                cmd.Parameters.AddWithValue("@UUID", res.UUID);
                cmd.Parameters.AddWithValue("@QrCode", res.QRCode);
                cmd.Parameters.AddWithValue("@PIH", res.PIH);
                cmd.Parameters.AddWithValue("@SXmlFile", res.SingedXMLFileName);

                cnn.Open();
                cmd.ExecuteNonQuery();
                cnn.Close();
            }
            else
            {
                MessageBox.Show(res.ErrorMessage);
                return;
            }

            ApiRequestLogic apireqlogic = new ApiRequestLogic(Mode.developer);
            ComplianceCsrResponse tokenresponse = new ComplianceCsrResponse();
            InvoiceReportingRequest invrequestbody = new InvoiceReportingRequest();
            string csr = @"-----BEGIN CERTIFICATE REQUEST-----
MIIB5DCCAYoCAQAwVTELMAkGA1UEBhMCU0ExFjAUBgNVBAsMDUVuZ2F6YXRCcmFu
Y2gxEDAOBgNVBAoMB0VuZ2F6YXQxHDAaBgNVBAMME1RTVC0zMDAzMDA4Njg2MDAw
MDMwVjAQBgcqhkjOPQIBBgUrgQQACgNCAARYvqwxwBzinhARQZYQnWBoSr8wMmmw
CdfTSleD+rZoh/NeJMF8reXaBFrMCrlPK0hTRXmCyXuc6nFUfjSvZU/goIHVMIHS
BgkqhkiG9w0BCQ4xgcQwgcEwIgYJKwYBBAGCNxQCBBUTE1RTVFpBVENBQ29kZVNp
Z25pbmcwgZoGA1UdEQSBkjCBj6SBjDCBiTE7MDkGA1UEBAwyMS1UU1R8Mi1UU1R8
My1lZDIyZjFkOC1lNmEyLTExMTgtOWI1OC1kOWE4ZjExZTQ0NWYxHzAdBgoJkiaJ
k/IsZAEBDA8zMDAzMDA4Njg2MDAwMDMxDTALBgNVBAwMBDExMDAxDDAKBgNVBBoM
A1RTVDEMMAoGA1UEDwwDVFNUMAoGCCqGSM49BAMCA0gAMEUCIQDRroaukEGwwRXW
RhOudGrd/OGrcUnnn2ftb6Jk4dDGFgIgaV+sXmaZlKbxR7k/lMhnf/2j95XHDkso
hup1ROPc+cc=
-----END CERTIFICATE REQUEST-----
";

            tokenresponse = apireqlogic.GetComplianceCSIDAPI("123456", csr);
            if (string.IsNullOrEmpty(tokenresponse.ErrorMessage))
            {
                invrequestbody.invoice = res.EncodedInvoice;
                invrequestbody.invoiceHash = res.InvoiceHash;
                invrequestbody.uuid = res.UUID;
                InvoiceReportingResponse invoicereportingmodel = apireqlogic.CallComplianceInvoiceAPI(tokenresponse.BinarySecurityToken, tokenresponse.Secret, invrequestbody);
                if (string.IsNullOrEmpty(invoicereportingmodel.ErrorMessage))
                {
                    MessageBox.Show(invoicereportingmodel.ReportingStatus);
                }
                else
                {
                    MessageBox.Show(invoicereportingmodel.ErrorMessage);
                }
            }
            else
            {
                MessageBox.Show(tokenresponse.ErrorMessage);
            }
        }

        protected void grid_FilterControlColumnsCreated(object source, FilterControlColumnsCreatedEventArgs e)
        {
            //foreach (string col in columnsToRemove)
            //    e.Columns.Remove(col);
        }

        protected void RButtonList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvunPost.DataBind();
        }
    }
}