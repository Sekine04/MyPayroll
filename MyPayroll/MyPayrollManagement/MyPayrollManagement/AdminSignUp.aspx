<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminSignUp.aspx.cs" Inherits="MyPayrollManagement.AdminSignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up Admin</title>
    <style>
         *{
            box-sizing:border-box;
            margin:0;
        }
        body{
             font-family: 'Poppins', sans-serif;
             background-color:white;
        }
        .signup{
            background-color:#0F0714;
            height:800px;
            width:1150px;
            border-radius:50px;
            margin:70px auto auto auto;
        }
         .signup h1{
            margin:100px auto auto 270px;
            color:#FEFCFF;
            padding:50px;
            font-size:42px;
          
        }
          .textbox{
            width:600px;
            height: 500px;
        }
        .username, .fullname, .email , .password, .cpassword{
            width:500px;
            height:80px;
            border-radius:50px;
            border:none;
            font-size:30px;
        }
        .username{
             margin:auto auto auto 320px;
        }
       
        .fullname{
             margin:20px auto auto 320px;
        }
        .email{
            margin:20px auto auto 320px;
        }
        
        .password{
            margin:20px auto auto 320px;
        }
        .cpassword{
             margin:20px auto auto 320px;
        }
        .error{
            color:red;
            margin:30px auto auto 460px;
             font-size: 20px;

        }
          .checkbox {
            margin:10px auto auto 340px;
            font-size:18px;
            color:white;
           
        }
        .btn-signup{
             background-color:#8B959F;
              width:300px;
              height:66px;
              border-radius:50px;
              color:black;
              font-size:30px;
              font-weight:bold;
              margin:10px auto 20px 420px;
              border: none;
        }
        .btn-signup:hover{
            background-color:#A3B7CA;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="signup">
             <h1>Sign Up</h1>
          
         <div class="textbox">
             <asp:TextBox ID="tb_username" runat="server" placeholder="   Username:" CssClass="username"></asp:TextBox>
            <asp:TextBox ID="tb_fullname" runat="server" placeholder="   Fullname:" CssClass="fullname" ></asp:TextBox>
            <asp:TextBox ID="tb_email" runat="server" placeholder="   Email:" CssClass="email"></asp:TextBox>
            <asp:TextBox  TextMode="password" ID="tb_password" runat="server" placeholder="   Password:" CssClass="password" ></asp:TextBox>
               <asp:TextBox  TextMode="password" ID="tb_cpassword" runat="server" placeholder="   Confirm Password:" CssClass="cpassword" ></asp:TextBox>
        </div> 
            <asp:Label ID="lbl_error" runat="server" Text="Password don`t match!" CssClass="error" Visible="false"></asp:Label>
            <br />
            <div class="checkbox">
           <asp:CheckBox ID="checkbox_employee" runat="server" Text=" I am employee" />
            
            <br /></div>
             <asp:Button ID="btn_signup" runat="server" Text="Sign Up" CssClass="btn-signup" OnClick="btn_signup_Click"  />
           
        </div>
    </form>
</body>
</html>
