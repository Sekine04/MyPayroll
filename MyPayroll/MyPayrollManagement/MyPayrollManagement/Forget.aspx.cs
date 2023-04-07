using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyPayrollManagement
{
    public partial class Forget : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        readonly NpgsqlConnection con = new NpgsqlConnection("server = localHost; port = 5432; Database = payroll; user ID = postgres; password = sekine2002");
        Random r = new Random();
        private int RecoveryCode()
        {
            return r.Next(10000, 99999);
        }
        string email = "";
        private bool SendEmail()
        {
            try
            {
                string to = Tb_email.Text.Trim(); 
                email = to;
                string from = "ruhiddadash@gmail.com"; 
                string pass = "elcin637"; 

                int code = RecoveryCode();

                MailMessage mm = new MailMessage(); 
                mm.To.Add(new MailAddress(to));  
                mm.From = new MailAddress(from, "Payroll Company"); 
                mm.Subject = "Reset your password";   
                mm.IsBodyHtml = true;                     
                mm.Body = "Your reset code: <b>" + code + "</b>";  

                NetworkCredential nc = new NetworkCredential();     
                nc.UserName = from;
                nc.Password = pass;

                SmtpClient sc = new SmtpClient();    
                sc.Host = "smtp.gmail.com";
                sc.EnableSsl = true;
                sc.Port = 587;      
                sc.UseDefaultCredentials = false;
                sc.Credentials = nc;    
                sc.DeliveryMethod = SmtpDeliveryMethod.Network;  
                sc.Send(mm);   

                WriteCodeToDatabes(code);  

                return true;

            }
            catch
            {
                return false;
            }
        }


        private void WriteCodeToDatabes(int code)
        {
            try
            {

                NpgsqlCommand command = new NpgsqlCommand("insert into reset (email,code) values (@email,@code)", con);
                command.Parameters.AddWithValue("@email", email);
                command.Parameters.AddWithValue("@code", code);
                command.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception e)
            {
                Response.Write(e.Message);
            }

        }

        protected void Btn_send_Click(object sender, EventArgs e)
        {
            if (checkbox.Checked)
            {
                if (Tb_email.Text != "") 
                {

                    con.Open();
                    NpgsqlCommand checkCommand = new NpgsqlCommand("select count(*) from admin where email = @email", con);
                    checkCommand.Parameters.AddWithValue("@email", Tb_email.Text.Trim());
                    int userExist = Convert.ToInt32(checkCommand.ExecuteScalar());
                    if (userExist == 1)
                    {
                        if (SendEmail())
                        {
                          
                            lbl_status.Text = "Mail is sent your email";


                            con.Close();
                        }
                        else
                        {
                            
                            lbl_status.Text = "Recovery mail dosnt send";
                            con.Close();
                        }

                    }
                    else
                    {
                      
                        lbl_status.Text = "This email doesnt exist out site!";
                        con.Close();
                    }

                }
                else
                {
                   
                    lbl_status.Text = "Write your email!";

                }
            }
            else
            {
                if (Tb_email.Text != "")
                {

                    con.Open();
                    NpgsqlCommand checkCommand = new NpgsqlCommand("select count(*) from employees where email = @email", con);
                    checkCommand.Parameters.AddWithValue("@email", Tb_email.Text.Trim());
                    int userExist = Convert.ToInt32(checkCommand.ExecuteScalar());
                    if (userExist == 1)
                    {
                        if (SendEmail())
                        {
                           
                            lbl_status.Text = "Mail is sent your email";


                            con.Close();
                        }
                        else
                        {
                            
                            lbl_status.Text = "Recovery mail dosnt send";
                            con.Close();
                        }

                    }
                    else
                    {
                        
                        lbl_status.Text = "This email doesnt exist out site!";
                        con.Close();
                    }

                }
                else
                {
                   
                    lbl_status.Text = "Write your email!";

                }
            }

        }

        protected void Btn_sumbit_Click(object sender, EventArgs e)
        {
            string code = Tb_code.Text.Trim();
            string mail = Tb_email.Text.Trim();
            con.Open();
            try
            {
                NpgsqlCommand checkCommand = new NpgsqlCommand("select count(*) from reset where email = '" + mail + "' and code = '" + code + "'", con);
                var res = checkCommand.ExecuteScalar();
                int count = Convert.ToInt32(res);
                if (count > 0)
                {
                   
                    //Response.Write("Your recovery code is correct");
                    lbl_status.Text = "Your recovery code is correct";
                    con.Close();
                }
                else
                {
                  //  Response.Write("Your recovery code is wrong !");
                    lbl_status.Text = "Your recovery code is wrong !";
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);

            }
        }

        protected void Btn_reset_Click(object sender, EventArgs e)
        {
            if (checkbox.Checked)
            {
                string password = Tb_new.Text;
            con.Open();
            NpgsqlCommand command = new NpgsqlCommand("update admin set password = @pass where email = @email", con);
            command.Parameters.AddWithValue("@pass", password);
            command.Parameters.AddWithValue("@email", Tb_email.Text.Trim());
            command.ExecuteNonQuery();
            Response.Write("Password succesfully changed");
            Response.Redirect("AdminLogin.aspx");
               
            }
            else
            {
                string password = Tb_new.Text;
                con.Open();
                NpgsqlCommand command = new NpgsqlCommand("update employees set password = @pass where email = @email", con);
                command.Parameters.AddWithValue("@pass", password);
                command.Parameters.AddWithValue("@email", Tb_email.Text.Trim());
                command.ExecuteNonQuery();
                Response.Write("Password succesfully changed");
                Response.Redirect("AdminLogin.aspx");
            }
        }
    }
}