using System;
using Npgsql;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyPayrollManagement
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
                Response.Redirect("Employee.aspx");

        }
        NpgsqlConnection con = new NpgsqlConnection("server = localHost; port = 5432; Database = payroll; user ID = postgres; password = sekine2002");
        

        protected void btn_login_Click(object sender, EventArgs e)
        {
            string email = tb_email.Text.Trim();
            string password = tb_password.Text.Trim();

            try
            {
                if (checkbox_employee.Checked)
                {
                    con.Open();
                    string query = "select * from employees where email = @email AND password = @password;";
                    NpgsqlCommand command = new NpgsqlCommand(query, con);
                    command.Parameters.AddWithValue("@email", email);
                    command.Parameters.AddWithValue("@password", password);
                    int id = Convert.ToInt32(command.ExecuteScalar());
                    if (id > 0)
                    {
                        Session["user"] = email;
                        Response.Redirect("DashboardEmp.aspx");
                        con.Close();
                    }
                    else
                    {
                        lbl_error.Text = "Login or Password is wrong!";
                        lbl_error.Visible = true;
                        con.Close();
                    }
                }
                else
                {
                    con.Open();
                    string query = "select * from admin where email = @email AND password = @password;";
                    NpgsqlCommand command = new NpgsqlCommand(query, con);
                    command.Parameters.AddWithValue("@email", email);
                    command.Parameters.AddWithValue("@password", password);
                    int id = Convert.ToInt32(command.ExecuteScalar());
                    if (id > 0)
                    {
                        Session["user"] = email;
                        Response.Redirect("Employee.aspx");
                        con.Close();
                    }
                    else
                    {
                        lbl_error.Text = "Login or Password is wrong!";
                        lbl_error.Visible = true;
                        con.Close();
                    }
                }
                
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
            
            
        }
    }
}