<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardEmp.aspx.cs" Inherits="MyPayrollManagement.DashboardEmp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard Employees</title>
    <style>
         *{
            box-sizing:border-box;
            margin:0;
        }
        body{
             font-family: 'Poppins', sans-serif;
             background-color:white;
             background-color:aqua;
        }
        .search{
            width:1000px;
            height:200px;
            margin: 50px auto auto auto;

        }
        .tb-search{
            width:300px;
            height:55px;
             border-radius:50px;
            border:none;
            font-size:18px;

        }
        .btn-search{
             background-color:#0F0714;
              width:150px;
              height:50px;
              border-radius:50px;
              color:white;
              font-size:15px;
              font-weight:bold;
              margin:30px auto auto 30px;
              border: none;
        }
        .logout{
              width:30px;
              height:30px;
              margin-left:150px;
              margin-right:50px;
              margin-top:20px;
              background-color:aqua;
          }

        
        .gridview{

            width:1000px;
            margin:20px auto auto auto;
            
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <div class="search">
        <asp:TextBox ID="tb_search" runat="server" CssClass="tb-search"></asp:TextBox>
        <asp:Button ID="btn_search" runat="server" Text="Search" CssClass="btn-search" OnClick="btn_search_Click" />
             <asp:ImageButton ID="icon_logout" runat="server" src="logout.png" CssClass="logout" OnClick="icon_logout_Click" />
         </div>
        
             <asp:GridView ID="GridView_dashboard" runat="server" CssClass="gridview"></asp:GridView>
        
        
    </form>
</body>
</html>
