using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Dahboard_project
{
    public partial class Inv_Form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
                gvunPost.DataBind();
            }

        }
        protected void CmbType2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //buttonvisibility2();
            gvunPost.DataBind();
        }
        protected void gvunPost_HtmlRowCreated(object sender, ASPxGridViewTableRowEventArgs e)
        {

            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#FFE0C0';");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='white';");


        }
    }
}