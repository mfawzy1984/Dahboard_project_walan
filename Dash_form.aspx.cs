﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
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
        SqlCommand cmd3 = new SqlCommand();
        SqlCommand cmd4 = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            cnn.ConnectionString = ConfigurationManager.ConnectionStrings["EasyERP"].ConnectionString;
           
            cnn.Open();
            
            cmd.Connection = cnn;
            cmd2.Connection = cnn;
            cmd3.Connection = cnn;
            cmd4.Connection = cnn;

            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd3.CommandType = System.Data.CommandType.StoredProcedure;
            cmd4.CommandType = System.Data.CommandType.StoredProcedure;
            string selectedItemValue = null;

            if (CmbYear.SelectedIndex >= 0)
            {
                CmbYear.DataBind();
                selectedItemValue = CmbYear.Value.ToString();
                Session["LoginTime"] = selectedItemValue;
            }
            string selectedItemValue2 = null;
            if (Cmbbranch.SelectedIndex >= 0)
            {
                Cmbbranch.DataBind();
                selectedItemValue2 = Cmbbranch.Value.ToString();
                Session["loginbranch"] = selectedItemValue2;
                get_ItmMaxQty(selectedItemValue2, selectedItemValue);
                get_ItmMaxVal(selectedItemValue2, selectedItemValue);
                get_ItmNoSls(selectedItemValue2, selectedItemValue);
                get_ItmMinQty(selectedItemValue2, selectedItemValue);
            }


            // for cards
            Totalsales_card_func(CmbYear.Value.ToString(), Cmbbranch.Value.ToString());
            Rtrnsales_card_func(CmbYear.Value.ToString(), Cmbbranch.Value.ToString());
            totalburchases_card_func(CmbYear.Value.ToString(), Cmbbranch.Value.ToString());
            rtnburchases_card_func(CmbYear.Value.ToString(), Cmbbranch.Value.ToString());


            // sales barchart
            sales_BARCHART_func(CmbYear.Value.ToString(), Cmbbranch.Value.ToString());


            //  burchases bar chart 

            burchases_BARCHART_func(CmbYear.Value.ToString(), Cmbbranch.Value.ToString());

            //  pie chart for sales branches
            mothlypurchases_piechartfunc(CmbYear.Value.ToString(), Cmbbranch.Value.ToString());

            salesbranch_piechart_func();

           






        }

        protected void CmbYear_TextChanged(object sender, EventArgs e)
        {
            // for cards
            Totalsales_card_func(CmbYear.Value.ToString(),Cmbbranch.Value.ToString());
            Rtrnsales_card_func(CmbYear.Value.ToString(), Cmbbranch.Value.ToString());
            totalburchases_card_func(CmbYear.Value.ToString(), Cmbbranch.Value.ToString());
            rtnburchases_card_func(CmbYear.Value.ToString(), Cmbbranch.Value.ToString());
            //for sales_barchart
            sales_BARCHART_func(CmbYear.Value.ToString(), Cmbbranch.Value.ToString());
            //for burchases_barchart
            burchases_BARCHART_func(CmbYear.Value.ToString(), Cmbbranch.Value.ToString());
            // pie chart for sales branches
            mothlypurchases_piechartfunc(CmbYear.Value.ToString(), Cmbbranch.Value.ToString());
            salesbranch_piechart_func();
          

            get_ItmMaxQty(Cmbbranch.Value.ToString(), CmbYear.Value.ToString());
            get_ItmMaxVal(Cmbbranch.Value.ToString(), CmbYear.Value.ToString());
            get_ItmNoSls(Cmbbranch.Value.ToString(), CmbYear.Value.ToString());
            get_ItmMinQty(Cmbbranch.Value.ToString(), CmbYear.Value.ToString());

        }

        protected void Cmbbranch_TextChanged(object sender, EventArgs e)
        {

            get_ItmMaxQty(Cmbbranch.Value.ToString(), CmbYear.Value.ToString());
            get_ItmMaxVal(Cmbbranch.Value.ToString(), CmbYear.Value.ToString());
            get_ItmNoSls(Cmbbranch.Value.ToString(), CmbYear.Value.ToString());
            get_ItmMinQty(Cmbbranch.Value.ToString(), CmbYear.Value.ToString());

            Totalsales_card_func(CmbYear.Value.ToString(), Cmbbranch.Value.ToString());
            Rtrnsales_card_func(CmbYear.Value.ToString(), Cmbbranch.Value.ToString());
            totalburchases_card_func(CmbYear.Value.ToString(), Cmbbranch.Value.ToString());
            rtnburchases_card_func(CmbYear.Value.ToString(), Cmbbranch.Value.ToString());

            sales_BARCHART_func(CmbYear.Value.ToString(), Cmbbranch.Value.ToString());
            burchases_BARCHART_func(CmbYear.Value.ToString(), Cmbbranch.Value.ToString());


        }

        //function of total sales_card
        public void Totalsales_card_func(string year,String branch)
        {
          
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@year", year);
            cmd.Parameters.AddWithValue("@branchid", branch);

            cmd.CommandText = "Dashboard_Cards_salesinv";

            SqlDataReader dr = cmd.ExecuteReader();
            
            while (dr.Read())
            {
                Label1.Text = dr["sales_total"].ToString();
            }


            dr.Close();
        }

        //function of rtrn sales_card
        public void Rtrnsales_card_func(string year,string branch)
        {
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@year", year);
            cmd.Parameters.AddWithValue("@branchid", branch);

            cmd.CommandText = "Dashboard_Cards_salesRtninv";

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Label2.Text = dr["sales_total"].ToString();
            }


            dr.Close();
        }

        //function of total burchases_card
        public void totalburchases_card_func(string year,string branch)
        {
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@year", year);
            cmd.Parameters.AddWithValue("@branchid", branch);

            cmd.CommandText = "Dashboard_Cards_total_Burshases";

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Label3.Text = dr["sales_total"].ToString();
            }


            dr.Close();
        }

        //function of rtn burchases_card
        public void rtnburchases_card_func(string year,string branch)
        {
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@year", year);
            cmd.Parameters.AddWithValue("@branchid", branch);

            cmd.CommandText = "Dashboard_Cards_Total_RtnBurshases";

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Label4.Text = dr["sales_total"].ToString();
            }


            dr.Close();
        }


        //function of sales_barchart
        public void sales_BARCHART_func(string year,string branch)
        {
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@year", year);
            cmd.Parameters.AddWithValue("@branchid", branch);
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
            try
            {
                views = views.Substring(0, views.Length - 1);
                labels = labels.Substring(0, labels.Length - 1);

                chartdata2 += "chartlabels2=[" + labels + "];chartdata2=[" + views + "]";
                chartdata2 += "</script>";
                ltchartdata2.Text = chartdata2;
                dr2.Close();
            }

            catch (Exception ex)
            {
               // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('المبيعات الشهريه لا يوجد بها بيانات')", true);
                dr2.Close();
            }
        }
        //function for burchase_barchart
        public void burchases_BARCHART_func(string year,string branch)
        {
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@year", year);
            cmd.Parameters.AddWithValue("@branchid", branch);
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
            try
            {
                views2 = views2.Substring(0, views2.Length - 1);
                labels2 = labels2.Substring(0, labels2.Length - 1);

                chartdata1 += "chartlabels1=[" + labels2 + "];chartdata1=[" + views2 + "]";
                chartdata1 += "</script>";
                ltchartdata.Text = chartdata1;

                dr3.Close();
            }
            catch(Exception ex)
            {
               // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('المشتريات الشهريه لا يوجد بها بيانات')", true);
                dr3.Close();
            }

        }
        //function for  pie chart  sales branches
     


        //function for second pie chart
       public void mothlypurchases_piechartfunc(string year, string branch)
        {

            cmd4.CommandText = "Dashboard_ap_cashhdr";

            cmd4.Parameters.Clear();
            cmd4.Parameters.AddWithValue("@year", year);
            cmd4.Parameters.AddWithValue("@branchid", branch);


            string chartdata4 = "";
            string views4 = "";
            string labels4 = "";



            chartdata4 += "<script>";
            SqlDataReader dr5 = cmd4.ExecuteReader();
            while (dr5.Read())
            {
                views4 += dr5["sales_total"] + ",";
                labels4 += "\"" + dr5["sales_invdate"] + "\",";



            }

            try
            {
                views4 = views4.Substring(0, views4.Length - 1);
                labels4 = labels4.Substring(0, labels4.Length - 1);

                chartdata4 += "chartlabels4=[" + labels4 + "];chartdata4=[" + views4 + "]";
                chartdata4 += "</script>";
                ltchartdata4.Text = chartdata4;

                dr5.Close();
            }
            catch(Exception ex)
            {
                dr5.Close();
            }

        }

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



        // function for firstgrid get_ItmMaxQty


        public void get_ItmMaxQty(string branchid,string year)
        {
            cmd3.Parameters.Clear();
            cmd3.Parameters.AddWithValue("@branchid", branchid);
            cmd3.Parameters.AddWithValue("@year", year);
            cmd3.CommandText = "Dashboard_ItmMaxQty";

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd3);
            da.Fill(dt);
            ASPxGridView1.DataSource = dt;
            ASPxGridView1.DataBind();
         
        }
        //function for secondgrid get_ItmMaxVal
        public void get_ItmMaxVal(string branchid,string year)
        {
            cmd3.Parameters.Clear();
            cmd3.Parameters.AddWithValue("@branchid", branchid);
            cmd3.Parameters.AddWithValue("@year", year);
            cmd3.CommandText = "Dashboard_ItmMaxVal";

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd3);
            da.Fill(dt);
            ASPxGridView2.DataSource = dt;
            ASPxGridView2.DataBind();

        }
        //function for thirdgrid get_ItmNoSls
        public void get_ItmNoSls(string branchid,string year)
        {
            cmd3.Parameters.Clear();
            cmd3.Parameters.AddWithValue("@branchid", branchid);
            cmd3.Parameters.AddWithValue("@year", year);
            cmd3.CommandText = "Dashboard_ItmNoSls";

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd3);
            da.Fill(dt);
            ASPxGridView3.DataSource = dt;
            ASPxGridView3.DataBind();

        }

        //function for fourthgrid get_ItmMinQty
        public void get_ItmMinQty(string branchid,string year)
        {
            cmd3.Parameters.Clear();
            cmd3.Parameters.AddWithValue("@branchid", branchid);
            cmd3.Parameters.AddWithValue("@year", year);
            cmd3.CommandText = "Dashboard_ItmMinQty";

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd3);
            da.Fill(dt);
            ASPxGridView4.DataSource = dt;
            ASPxGridView4.DataBind();

        }

    }
}