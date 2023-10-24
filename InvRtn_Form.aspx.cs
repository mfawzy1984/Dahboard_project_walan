
using DevExpress.Web;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Dahboard_project
{
    public partial class InvRtn_Form : System.Web.UI.Page
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
        }

        

        //protected void WordButton_Click(object sender, ImageClickEventArgs e)
        //{
        //    ASPxGridViewExporter1.WriteDocxToResponse();

        //}
        //protected void ExcelButton_Click(object sender, ImageClickEventArgs e)
        //{

        //    ExportGridToExcel();
        //    // ASPxGridViewExporter1.WriteXlsToResponse();

        //}
        protected void grid_FilterControlColumnsCreated(object source, FilterControlColumnsCreatedEventArgs e)
        {
            //foreach (string col in columnsToRemove)
            //    e.Columns.Remove(col);
        }



    }
}