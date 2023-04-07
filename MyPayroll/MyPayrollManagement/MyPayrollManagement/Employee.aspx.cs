using System;
using Npgsql;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyPayrollManagement
{
    public partial class Employee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List(); 
        }
        private void List()
        {
            con.Open();
            string query = "select * from empdb";
            NpgsqlCommand command = new NpgsqlCommand(query, con);
            NpgsqlDataReader ndr = command.ExecuteReader();
            gridview.DataSource = ndr;
            gridview.DataBind();
            con.Close();
        }
        NpgsqlConnection con = new NpgsqlConnection("server = localHost; port = 5432; Database = payroll; user ID = postgres; password = sekine2002");

        protected void btn_save_Click(object sender, EventArgs e)
        {

           
            if (tb_name.Text=="" || tb_base_salary.Text=="" || tb_qual.Text=="" || tb_position.Text=="") 
            {
                Response.Write("Missing info");
            }
            else
            {
                try
                {
                    con.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand("insert into empdb(empname,empdob,joindate,emppos,empqual,empbasesal) values(@EN,@ED,@JD,@EPos,@EQ,@EBS)", con);
                    cmd.Parameters.AddWithValue("@EN", tb_name.Text.Trim());
                    cmd.Parameters.AddWithValue("@ED", tb_dob.Text.Trim());
                    cmd.Parameters.AddWithValue("@EPos", tb_position.Text.Trim());
                    cmd.Parameters.AddWithValue("@JD", tb_cal.Text.Trim());
                    cmd.Parameters.AddWithValue("@EQ", tb_qual.Text.Trim());
                    cmd.Parameters.AddWithValue("@EBS", tb_base_salary.Text.Trim());
                    cmd.ExecuteNonQuery();

                    HttpCookie CookieName = new HttpCookie("name");
                    CookieName.Value = tb_name.Text;
                    CookieName.Expires = DateTime.Now.AddHours(1);
                    Response.Cookies.Add(CookieName);

                    con.Close();
                    List();

                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);

                }
               
            }
        }

        protected void calendar_join_Click(object sender, ImageClickEventArgs e)
        {
            if (calendarjoin.Visible)
            {
                calendarjoin.Visible = false;

            }
            else
            {
                calendarjoin.Visible = true;
            }
            calendarjoin.Attributes.Add("style", "position:absolute");
        }
    
        protected void calendar_dob_Click(object sender, ImageClickEventArgs e)
        {
            if (calendardob.Visible)
            {
                calendardob.Visible = false;

            }
            else
            {
                calendardob.Visible = true;
            }
            calendardob.Attributes.Add("style", "position:absolute");

        }

        protected void calendarjoin_SelectionChanged(object sender, EventArgs e)
        {
            var dt = DateTime.Today;
            var sc = calendarjoin.SelectedDate;
            
            
                tb_cal.Text = calendarjoin.SelectedDate.ToString("dd/MM/yyyy");
                calendarjoin.Visible = false;
                    
        }

        protected void calendardob_SelectionChanged(object sender, EventArgs e)
        {
            var dt = DateTime.Today;
            var sc = calendardob.SelectedDate;
            
                tb_dob.Text = calendardob.SelectedDate.ToString("dd/MM/yyyy");
                calendardob.Visible = false;
            
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            con.Open();
           string query = "delete from empdb where empname = '" + tb_name.Text.Trim() + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void icon_logout_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("AdminLogin.aspx");

        }
    }
}