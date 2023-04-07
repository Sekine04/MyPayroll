using System;
using Npgsql;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyPayrollManagement
{
    public partial class IssueSalary : System.Web.UI.Page
    {
        NpgsqlConnection con = new NpgsqlConnection("server = localHost; port = 5432; Database = payroll; user ID = postgres; password = sekine2002");
        protected void Page_Load(object sender, EventArgs e)
        {

            List();
            if (Request.Cookies["present"] != null || Request.Cookies["absent"] != null || Request.Cookies["excused"] != null )
            {
               tb_persence.Text= Request.Cookies["present"].Value.ToString();
               tb_absence.Text= Request.Cookies["absent"].Value.ToString();
                tb_exsuced.Text= Request.Cookies["excused"].Value.ToString();
               tb_name.Text= Request.Cookies["name"].Value.ToString();

            }
        }
        private void List()
        {
            con.Open();
            string query = "select * from issuesalary";
            NpgsqlCommand command = new NpgsqlCommand(query, con);
            NpgsqlDataReader ndr = command.ExecuteReader();
            gridview.DataSource = ndr;
            gridview.DataBind();
            con.Close();
        }

       
        protected void icon_logout_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("AdminLogin.aspx");

        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
        

            if (tb_name.Text == "" || tb_base_salary.Text == "" || tb_absence.Text == "" || tb_bonus.Text == "" || tb_exsuced.Text=="" || tb_persence.Text=="" )
            {
                Response.Write("Missing info");
            }

            else
            {
                try
                {
                    con.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand("insert into issuesalary (empname,empbasesal,empbonus,daypres,empbalance,dayabsence,dayexcused) values(@EN,@EBS,@EB,@DP,@EBal,@DA,@DE)", con);

                    cmd.Parameters.AddWithValue("@EB", Convert.ToInt32(tb_bonus.Text.Trim()));
                    cmd.Parameters.AddWithValue("@EN", tb_name.Text.Trim());
                    cmd.Parameters.AddWithValue("@DP", Convert.ToInt32(tb_persence.Text.Trim()));
                    cmd.Parameters.AddWithValue("@DA", Convert.ToInt32(tb_absence.Text.Trim()));
                    cmd.Parameters.AddWithValue("@DE", Convert.ToInt32(tb_exsuced.Text.Trim()));
                    cmd.Parameters.AddWithValue("@EBal", Convert.ToInt32(tb_balance.Text.Trim()));
                    cmd.Parameters.AddWithValue("@EBS", Convert.ToInt32(tb_base_salary.Text.Trim()));
                    cmd.ExecuteNonQuery();
                    con.Close();
                    List();

                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);

                }

            }

        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            con.Open();
            string query = "delete from issuesalary where empname = '" + tb_name.Text.Trim() + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }


        protected void btn_compute_Click(object sender, EventArgs e)
        {
            
            int basesal = Convert.ToInt32(tb_base_salary.Text);
            int bonus = Convert.ToInt32(tb_bonus.Text);
            int absence = Convert.ToInt32(tb_absence.Text);
            int excused = Convert.ToInt32(tb_exsuced.Text);
            int result = basesal - (absence * 20 + excused * 5) + bonus;
            tb_balance.Text = result.ToString();
        }
    }
}