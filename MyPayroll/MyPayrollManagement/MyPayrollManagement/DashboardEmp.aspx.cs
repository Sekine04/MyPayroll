using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Npgsql;

namespace MyPayrollManagement
{
    public partial class DashboardEmp : System.Web.UI.Page
    {
        NpgsqlConnection con = new NpgsqlConnection("server = localHost; port = 5432; Database = payroll; user ID = postgres; password = sekine2002");
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            con.Open();
            string query = "select * from issuesalary where empname ='" + tb_search.Text.Trim() + "'   ";
            NpgsqlCommand command = new NpgsqlCommand(query, con);
            NpgsqlDataReader ndr = command.ExecuteReader();
            GridView_dashboard.DataSource = ndr;
            GridView_dashboard.DataBind();


            con.Close();
        }

        protected void icon_logout_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("AdminLogin.aspx");
        }
    }
}