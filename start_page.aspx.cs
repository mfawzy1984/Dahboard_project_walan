using Dahboard_project.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Dahboard_project
{
    public partial class start_page : System.Web.UI.Page
    {
        SqlConnection cnn = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            cnn.ConnectionString = ConfigurationManager.ConnectionStrings["EasyERP"].ConnectionString;
            cnn.Open();
            cmd.Connection = cnn;

            cmd.CommandType = System.Data.CommandType.StoredProcedure;
         
            // for cards
            cmd.CommandText = "Dashboard_Cards_salesinv";
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Label1.Text = dr["sales_total"].ToString();
            }


            dr.Close();
            //first barchart
            cmd.CommandText = "Dashboard_sales_BARCHART";

            string chartdata2 = "";
            string views = "";
            string labels = "";

            chartdata2 += "<script>";
            SqlDataReader dr2 = cmd.ExecuteReader();
            while (dr2.Read())
            {
                views += dr2["sales_total"] + ",";
                labels += "\"" + dr2["sales_invdate"] + "\",";



            }
            views = views.Substring(0, views.Length - 1);
            labels = labels.Substring(0, labels.Length - 1);

            chartdata2 += "chartlabels2=[" + labels + "];chartdata2=[" + views + "]";
            chartdata2 += "</script>";
            ltchartdata2.Text = chartdata2;
            dr2.Close();
            ///second bar chart
            cmd.CommandText = "Dashboard_purchase_BARCHART";

            string chartdata1 = "";
            string views2 = "";
            string labels2 = "";

            chartdata1 += "<script>";
            SqlDataReader dr3 = cmd.ExecuteReader();
            while (dr3.Read())
            {
                views2 += dr3["purchase_total"] + ",";
                labels2 += "\"" + dr3["purchas_invdate"] + "\",";



            }
            views2 = views2.Substring(0, views2.Length - 1);
            labels2 = labels2.Substring(0, labels2.Length - 1);

            chartdata1 += "chartlabels1=[" + labels2 + "];chartdata1=[" + views2 + "]";
            chartdata1 += "</script>";
            ltchartdata.Text = chartdata1;

            dr3.Close();
            // first pie chart for sales branches

            cmd.CommandText = "Dashboard_salesbranch_piechart";

            string chartdata3 = "";
            string views3 = "";
            string labels3 = "";
            
        
           
            chartdata3 += "<script>";
            SqlDataReader dr4 = cmd.ExecuteReader();
            while (dr4.Read())
            {
                views3 += dr4["total"] + ",";
                labels3 += "\"" + dr4["branchname"] + "\",";
              


            }

            views3 = views3.Substring(0, views3.Length - 1);
            labels3 = labels3.Substring(0, labels3.Length - 1);

            chartdata3 += "chartlabels3=[" + labels3 + "];chartdata3=[" + views3 + "]";
            chartdata3 += "</script>";
            ltchartdata3.Text = chartdata3;

            dr4.Close();

        }
    }
}