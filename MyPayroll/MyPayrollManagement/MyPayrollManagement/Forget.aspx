<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forget.aspx.cs" Inherits="MyPayrollManagement.Forget" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>
    <style>
         *{
            box-sizing:border-box;
            margin:0;
        }
        body{
             font-family: 'Poppins', sans-serif;
             background-color:white;
        }
        .main{
            background-color:#92C7F8;
            height:500px;
            width:1150px;
            border-radius:50px;
            margin:85px auto auto auto;
        }
         .main h2{
            margin:50px auto auto 240px;
            color:#0F0714;
            padding:30px;
            font-size:42px;
         
                    
        }
         .email, .code, .new{
             margin:50px auto auto 250px;
         }
        .tb-email, .tb-code, .tb-new{
             width:330px;
            height:50px;
            border-radius:50px;
            border:none;
            font-size:18px;
        }
       

        .bt-send, .bt-submit, .bt-reset{
            background-color:#0F0714;
              width:230px;
              height:50px;
              border-radius:50px;
              color:white;
              font-size:18px;
              font-weight:bold;
              margin:auto auto auto 20px;
              border: none;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">
            <h2>Forgot Password</h2>
            <div class="email">
            <asp:TextBox ID="Tb_email" runat="server" placeholder=" Email:" CssClass="tb-email"></asp:TextBox>
            <asp:Button ID="Btn_send" runat="server" Text="Send" OnClick="Btn_send_Click" CssClass="bt-send" /></div>
            <div class="code">
            <asp:TextBox ID="Tb_code" runat="server" placeholder=" Code:" CssClass="tb-code"></asp:TextBox>
            <asp:Button ID="Btn_sumbit" runat="server" Text="Submit" OnClick="Btn_sumbit_Click" CssClass="bt-submit"/></div>
            <div class="new">
            <asp:TextBox ID="Tb_new" TextMode="Password" runat="server" placeholder=" New Password:"  CssClass="tb-new" ></asp:TextBox>
            <asp:Button ID="Btn_reset" runat="server" Text="Reset" OnClick="Btn_reset_Click"  CssClass="bt-reset"/></div>
            <asp:Label ID="lbl_status" runat="server" Text="" ></asp:Label>
            <asp:CheckBox ID="checkbox" runat="server" Text="Admin" />

        </div>
    </form>
</body>
</html>
