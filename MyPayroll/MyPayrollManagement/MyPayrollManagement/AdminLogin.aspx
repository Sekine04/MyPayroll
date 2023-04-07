<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="MyPayrollManagement.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Admin</title>
    <style>
        *{
            box-sizing:border-box;
            margin:0;
        }
        body{
             font-family: 'Poppins', sans-serif;
             background-color:white;
        }
        .login{
            background-color:#92C7F8;
            height:800px;
            width:1150px;
            border-radius:50px;
            margin:85px auto auto auto;
         

        }
        .login h1{
            margin:100px auto auto 240px;
            color:#0F0714;
            padding:100px;
            font-size:42px;
         
                    
        }
        .textbox{
            width:600px;
            height: 230px;
        }
        .email , .password{
            width:500px;
            height:80px;
            border-radius:50px;
            border:none;
            font-size:30px;
        }
        .email{
             margin:auto auto auto 320px;
        }
        .password{
            margin:50px auto auto 320px;
        }
        .checkbox {
            margin:10px auto 20px 340px;
            font-size:18px;
           
        }

        .error{
            color:red;
            margin:30px auto auto 430px;
             font-size: 20px;

        }
        .btn-login{
             background-color:#0F0714;
              width:310px;
              height:66px;
              border-radius:50px;
              color:white;
              font-size:30px;
              font-weight:bold;
              margin:20px auto 20px 420px;
              border: none;
        }
        .btn-login:hover{
            background-color:#2B113A;
        }
        .forgot{
            text-decoration:none;
            text-align:center;
            font-size:18px;
            margin:20px auto auto 500px;
        }
        .signup{
            text-decoration:none;
            text-align:center;
            font-size:18px;
            margin:20px auto auto 540px;
        }


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login">
            <h1>Log in to your account</h1>
          
           <div class="textbox"><asp:TextBox ID="tb_email" runat="server" placeholder="   Email:" CssClass="email"></asp:TextBox>
            <asp:TextBox  TextMode="password" ID="tb_password" runat="server" placeholder="   Password:" CssClass="password" ></asp:TextBox></div> 
           
            <div class="checkbox">
           <asp:CheckBox ID="checkbox_employee" runat="server"  Text="I am employee" />
           
            <br /></div>
            <asp:Label ID="lbl_error" runat="server" Text="Email or password is incorrect!" CssClass="error" Visible="false"></asp:Label>
             <br />
             <asp:Button ID="btn_login" runat="server" Text="Login" CssClass="btn-login" OnClick="btn_login_Click"  />
             <br />
             <a href="Forgot.aspx" class="forgot">Forgot Password!</a>
            <a href="AdminSignUp.aspx" class="signup">Sign Up</a>
             
        </div>
    </form>
    
</body>
</html>
