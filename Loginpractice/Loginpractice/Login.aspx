<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Loginpractice.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">
            <h1>Login</h1>
        </div>
            <div class="login">
               
                <asp:Button ID="btn_login" runat="server" Text="Login" OnClick="btn_login_Click" />
                <br />
                <asp:Button ID="btn_register" runat="server" Text="Register" />

            </div>
    </form>
</body>
</html>
