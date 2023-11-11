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
    public partial class Dash_form : System.Web.UI.Page
    {
        SqlConnection cnn = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd2 = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            
            cnn.ConnectionString = ConfigurationManager.ConnectionStrings["EasyERP"].ConnectionString;
            cnn.Open();
            cmd.Connection = cnn;
            cmd2.Connection = cnn;

            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            string selectedItemValue = null;

            if (CmbYear.SelectedIndex >= 0)
            {
                CmbYear.DataBind();
                selectedItemValue = CmbYear.Value.ToString();
                Session["LoginTime"] = selectedItemValue;
            }

            // for cards
            Totalsales_card_func(DateTime.Now.Year.ToString());
            Rtrnsales_card_func(DateTime.Now.Year.ToString());
            totalburchases_card_func(DateTime.Now.Year.ToString());
            rtnburchases_card_func(DateTime.Now.Year.ToString());


            // sales barchart
            sales_BARCHART_func(DateTime.Now.Year.ToString());


            //  burchases bar chart 

            burchases_BARCHART_func(DateTime.Now.Year.ToString());

            //  pie chart for sales branches
            salesbranch_piechart_func();

        }
        protected void CmbYear_TextChanged(object sender, EventArgs e)
        {
            // for cards
            Totalsales_card_func(CmbYear.Value.ToString());
            Rtrnsales_card_func(CmbYear.Value.ToString());
            totalburchases_card_func(CmbYear.Value.ToString());
            rtnburchases_card_func(CmbYear.Value.ToString());
            //for sales_barchart
            sales_BARCHART_func(CmbYear.Value.ToString());
            //for burchases_barchart
            burchases_BARCHART_func(CmbYear.Value.ToString());
            // pie chart for sales branches
            salesbranch_piechart_func();


        }
        //function of total sales_card
        public void Totalsales_card_func(string year)
        {
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@year", year);

            cmd.CommandText = "Dashboard_Cards_salesinv";

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Label1.Text = dr["sales_total"].ToString();
            }


            dr.Close();
        }

        //function of rtrn sales_card
        public void Rtrnsales_card_func(string year)
        {
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@year", year);

            cmd.CommandText = "Dashboard_Cards_salesRtninv";

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Label2.Text = dr["sales_total"].ToString();
            }


            dr.Close();
        }

        //function of total burchases_card
        public void totalburchases_card_func(string year)
        {
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@year", year);

            cmd.CommandText = "Dashboard_Cards_total_Burshases";

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Label3.Text = dr["sales_total"].ToString();
            }


            dr.Close();
        }

        //function of rtn burchases_card
        public void rtnburchases_card_func(string year)
        {
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@year", year);

            cmd.CommandText = "Dashboard_Cards_Total_RtnBurshases";

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Label4.Text = dr["sales_total"].ToString();
            }


            dr.Close();
        }


        //function of sales_barchart
        public void sales_BARCHART_func(string year)
        {
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@year", year);
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
        }
        //function for burchase_barchart
        public void burchases_BARCHART_func(string year)
        {
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@year", year);
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

        }
        //function for  pie chart  sales branches
        public void salesbranch_piechart_func()
        {
            cmd2.CommandText = "Dashboard_salesbranch_piechart";

            string chartdata3 = "";
            string views3 = "";
            string labels3 = "";



            chartdata3 += "<script>";
            SqlDataReader dr4 = cmd2.ExecuteReader();
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