using System;
using Npgsql;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyPayrollManagement
{
    public partial class Attendance : System.Web.UI.Page
    {
        NpgsqlConnection con = new NpgsqlConnection("server = localHost; port = 5432; Database = payroll; user ID = postgres; password = sekine2002");

        protected void Page_Load(object sender, EventArgs e)
        {


            List();
            if (Request.Cookies["name"] != null )
            {
               tb_name.Text = Request.Cookies["name"].Value.ToString();
                
            }
        }

        private void List()
        {
            con.Open();
            string query = "select * from attendance";
            NpgsqlCommand command = new NpgsqlCommand(query, con);
            NpgsqlDataReader ndr = command.ExecuteReader();
            gridview.DataSource = ndr;
            gridview.DataBind();
            con.Close();
        }
        protected void btn_save_Click(object sender, EventArgs e)
        {
            if (tb_present.Text == "" || tb_absent.Text == "" || tb_excused.Text == "")
            {
                Response.Write("Missing info");
            }
            else
            {
                try
                {
                    con.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand("insert into attendance (empname,daypres,dayabs,dayexcused) values(@EN,@DP,@DA,@DE)", con); 
                    cmd.Parameters.AddWithValue("@EN", tb_name.Text.Trim());
                    cmd.Parameters.AddWithValue("@DP", Convert.ToInt32(tb_present.Text.Trim()));
                    cmd.Parameters.AddWithValue("@DA", Convert.ToInt32(tb_absent.Text.Trim()));
                    cmd.Parameters.AddWithValue("@DE", Convert.ToInt32(tb_excused.Text.Trim()));
                    cmd.ExecuteNonQuery();

                   
                    HttpCookie CookiePresent = new HttpCookie("present");
                    CookiePresent.Value = tb_present.Text;
                    CookiePresent.Expires = DateTime.Now.AddHours(1);
                    Response.Cookies.Add(CookiePresent);

                    HttpCookie CookieAbsent = new HttpCookie("absent");
                    CookieAbsent.Value = tb_absent.Text;
                    CookieAbsent.Expires = DateTime.Now.AddHours(1);
                    Response.Cookies.Add(CookieAbsent);

                    HttpCookie CookieExcused = new HttpCookie("excused");
                    CookieExcused.Value = tb_excused.Text;
                    CookieExcused.Expires = DateTime.Now.AddHours(1);
                    Response.Cookies.Add(CookieExcused);

                    con.Close();
                    List();

                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);

                }

            }
        }
        protected void icon_logout_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("AdminLogin.aspx");
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            con.Open();
            string query = "delete from attendance where empname = '"+tb_name.Text.Trim()+"'";
            NpgsqlCommand cmd = new NpgsqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}