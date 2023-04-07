using System;
using Npgsql;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyPayrollManagement
{
    public partial class AdminSignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        NpgsqlConnection con = new NpgsqlConnection("server = localHost; port = 5432; Database = payroll; user ID = postgres; password = sekine2002");

        protected void btn_signup_Click(object sender, EventArgs e)
        {
            
            try
            {
                string username = tb_username.Text.Trim();
                string fullname = tb_fullname.Text.Trim();
                string email = tb_email.Text.Trim();
                string password = tb_password.Text.Trim();
                string cpassword = tb_cpassword.Text.Trim();
                if (username != "" && password != "" && cpassword != "" && email != "")
                {
                    if (password == cpassword)
                    {
                        if (checkbox_employee.Checked)
                        {
                            con.Open();
                            NpgsqlCommand checkCommand = new NpgsqlCommand("select count(*) from employees where username = @username", con);
                            checkCommand.Parameters.AddWithValue("@username", username);
                            int userExist = Convert.ToInt32(checkCommand.ExecuteScalar()); 
                            if (userExist == 0)
                            {

                                NpgsqlCommand command = new NpgsqlCommand("insert into employees (username,fullname, password, email) values (@username, @fullname, @password, @email) ", con);
                                command.Parameters.AddWithValue("@username", username);
                                command.Parameters.AddWithValue("@fullname", fullname);
                                command.Parameters.AddWithValue("@password", password);
                                command.Parameters.AddWithValue("@email", email);
                                command.ExecuteNonQuery();
                                con.Close();
                                Response.Redirect("AdminLogin.aspx");
                            }
                            else { 
                                lbl_error.Text = "Username already exist!";
                                con.Close();
                            }
                        }

                        else
                        {
                            con.Open();
                            NpgsqlCommand checkCommand = new NpgsqlCommand("select count(*) from admin where username = @username", con);
                            checkCommand.Parameters.AddWithValue("@username", username);
                            int userExist = Convert.ToInt32(checkCommand.ExecuteScalar());
                            if (userExist == 0)
                            {

                                NpgsqlCommand command = new NpgsqlCommand("insert into admin (fullname,username,password,email) values (@fullname,@username,@password,@email)", con);
                                command.Parameters.AddWithValue("@username", username);
                                command.Parameters.AddWithValue("@fullname", fullname);
                                command.Parameters.AddWithValue("@password", password);
                                command.Parameters.AddWithValue("@email", email);
                                command.ExecuteNonQuery();
                                con.Close();
                                Response.Redirect("AdminLogin.aspx");

                            }
                            else
                            {
                                lbl_error.Text = "Username already exist!";
                                lbl_error.Visible = true;
                                con.Close();
                            }
                        }
                    }
               

                else
                    lbl_error.Visible = true;

                 }
                else if (username == "" || password == "" || cpassword == "")
                {

                    lbl_error.Text = "Use valid data!";
                    lbl_error.Visible = true;
                }
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
            
        }
               
            

                    
        }
    }
