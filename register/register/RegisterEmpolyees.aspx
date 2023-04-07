<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="register.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        *{
            box-sizing:border-box;
        }
        body{ 
            background-color:#AAC9E6;
            font-family: 'Poppins', sans-serif;
        }
        .container{
            margin:85px auto auto auto;
            height:833px;
            width:1274px;
            background-color:white;
            border-radius:50px;
            justify-content:center
            
        }
       .container-box{
              height:833px;
            width:760px;
            background-color:#0078E7;
            border-top-left-radius:50px;
            border-bottom-left-radius:50px;
            float:left;
        }
          .container-box2{
              height:833px;
            width:514px;
            background-color:white;
            border-start-end-radius:50px;
            border-bottom-right-radius:50px;
            float:right;
        }
          .container-box2 h3{
              font-size:42px;
              margin:180px auto auto 60px;
          }
          .container-box2 p{
              font-size:28px;
            font-weight:bold;
             margin:15px auto auto 60px;
             color:#646464;

          }
          .btn-signup{
              background-color:#0078E7;
              width:340px;
              height:80px;
              border-radius:50px;
              color:white;
              font-size:40px;
              font-weight:bold;
              margin:105px auto auto 60px;
              border: none;
              
          }
          .btn-signup:hover{
              background-color:#499DEA;
          }
          .btn-login{
              background-color:#0078E7;
              width:340px;
              height:80px;
              border-radius:50px;
              color:white;
              font-size:40px;
              font-weight:bold;
              margin:55px auto auto 60px;
              border: none;
              
          }
          .btn-login:hover{
              background-color:#499DEA;
          }
          .container-box h3{
              font-size:42px;
              margin:180px auto auto 60px;
              color:white;
          }
          .container-box p{
              font-size:24px;
            font-weight:bold;
             margin:10px auto auto 70px;
             color:#C4C4C4;
          }
          .btn-goback{
            background-color:white;
              width:250px;
              height:56px;
              border-radius:50px;
              color:black;
              font-size:30px;
              font-weight:bold;
              margin:100px auto auto 60px;
              border: none;
        }
           .btn-goback:hover {
                 background-color:#AAC9E6;
            }
    </style>
    <title>Empolyee Panel</title>
</head>
<body>
      <form id="form1" runat="server">
        <div class="container">
            <div class="container-box">
                <h3>MyPayroll advantages</h3>
                <p>Our financial products and services include<br /><br />
                  -Easy payroll processing<br /><br />
                  -Workers’ compensation administration<br /><br />
                  -Online management reports<br /> <br />
                  -Assistance with maintaining tax compliance  <br /><br />and
                    managing your business <br /><br />
                  -And much more!</p>
                
                   <asp:Button ID="btn_goback" runat="server" Text="Go back" CssClass="btn-goback"  /> <%--icon qalib--%>
            </div>

            <div class="container-box2">
                <h3>Hello again!</h3>
                <p>Welcome Empolyee!</p>
              
                <asp:Button ID="btn_signup" runat="server" Text="Sign Up" CssClass="btn-signup" />
                <asp:Button ID="btn_login" runat="server" Text="Login" CssClass="btn-login"/>
                
            </div>
   </div></form>
    </body>
</html>
