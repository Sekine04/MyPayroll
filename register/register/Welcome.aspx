<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="register.Welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        *{
            box-sizing:border-box;
        }
         body{ 
            background-color:white;
            font-family: 'Poppins', sans-serif;
        }
        .flex-container {
            height:180px;
         display: flex;
         flex-direction: row;
         justify-content:space-between;
         }  
        .title{
            margin:10px auto auto 150px;
        }
        .title h1{
            font-weight:normal;
            font-size:40px;
            color:#646464;
        }
        .title .img-btn{
            height:40px;
            width:40px;
        }
        .image .img-header{
            width:280px;
            height:180px;
            float:left;
        }
        .main{
            text-align:center;
        }
        .main h1{
            font-size:66px;
            font-weight:lighter;
            color:#646464; 
        }
        .line{
            width:1610px;
            height:1px;
            background-color:#646464;
            margin-top:3px;
            margin-left:150px;
            
        }
        .main .login{
            font-size:70px;
            font-weight:lighter;
            color:#646464; 
            margin-top:8px;
        }
        .btn-admin{
            background-color:#0078E7;
              width:420px;
              height:98px;
              border-radius:50px;
              color:white;
              font-size:38px;
              font-weight:bold;
              border: none;
              margin-top:10px;
        }
        .btn-admin:hover{
            background-color:#499DEA;
        }
        .btn-employees{
            background-color:#0078E7;
              width:420px;
              height:98px;
              border-radius:50px;
              color:white;
              font-size:38px;
              font-weight:bold;
              border: none;
              margin-top:57px;
        }
        .btn-employees:hover{
            background-color:#499DEA;
        }
        .img-footer{
            width:300px;
            height:200px;
        }
    </style>
    <title>Welcome to MyPayroll</title>
</head>
<body>
    <form id="form1" runat="server">

        <div class="flex-container">
  
    <div class="title"><h1><asp:ImageButton ID="img_btn" runat="server" src="salary.png" CssClass="img-btn"/>MyPayroll</h1></div>
    <div class="image"><asp:Image ID="Image1" runat="server"  src="header_1.jpeg" CssClass="img-header"/></div>
  
       </div>
        <div class="main">
            <h1>Welcome to MyPayroll</h1>  
            <div class="line"></div>
            <h1 class="login">LOGIN</h1>
            <asp:Button ID="btn_admin" runat="server" Text="ADMINISTRATOR" CssClass="btn-admin" />
            <br />
            <asp:Button ID="btn_employees" runat="server" Text="EMPLOYEES"  CssClass="btn-employees"/>

        </div>
        <div class="img-footer">
             <asp:Image ID="Image2" runat="server"  src="footer_1.jpeg" CssClass="img-footer"/>

        </div>
      
    </form>
</body>
</html>
