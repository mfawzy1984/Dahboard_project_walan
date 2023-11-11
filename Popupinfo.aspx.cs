using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Dahboard_project
{
    public partial class Popupinfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sessionyear = Request.QueryString["Year"];
            String sessiontype =  Request.QueryString["Type"];
            ObjectID.Value = sessionyear;
            ObjectID2.Value = sessiontype;
            gvunPost.DataBind();
            //SalesDS2.SelectParameters.Add("year", sessionyear);
            //SalesDS2.SelectParameters.Add("type", sessiontype);

            if (IsPostBack)
            {

                gvunPost.DataBind();
            }
            if (sessiontype == "1")
            {
                Page.Title = " فواتير  المبيعات";
                
            }
           else if (sessiontype == "2")
            {
                Page.Title = " فواتير  مرتجع المبيعات";

            }
            else if (sessiontype == "3")
            {
                Page.Title = " فواتير  المشتريات";

            }
            else if (sessiontype == "4")
            {
                Page.Title = " فواتير مرتجع المشتريات";

            }

        }
        protected void gvunPost_HtmlRowCreated(object sender, ASPxGridViewTableRowEventArgs e)
        {

            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#FFE0C0';");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#908DAA';");


        }
        protected void grid_FilterControlColumnsCreated(object source, FilterControlColumnsCreatedEventArgs e)
        {
            //foreach (string col in columnsToRemove)
            //    e.Columns.Remove(col);
        }
    }
}