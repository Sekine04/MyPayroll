<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssueSalary.aspx.cs" Inherits="MyPayrollManagement.IssueSalary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Issue Salary</title>
    <style>
        * {
            box-sizing:border-box;
            margin:0;
        }
        body{
            font-family: 'Poppins', sans-serif;
        }
        .navbar{
            display:flex;
            justify-content:space-between;
            align-items:center;
            width:100%;
            height:70px;
            background-color:#130F26;
            font-size:28px;
        }
        .navbar ul{
            list-style:none;
            color:white;
            line-height:1.5px;
            margin-left:170px;
        }
        .navbar ul li{
            display:inline-block;
            margin-left:100px;
        }
        .navbar ul li a{
            color:white;
            text-decoration:none;
            text-align:center;
            transition:all 0.3s ease 0s;
        }
        .navbar ul li .active{
            color:coral;
        }
     
        .navbar a:hover{
            color:#A8FF1B;
        }
        .main{
            width:100%;
            height:350px;
            display:flex;
            flex-wrap:wrap;

        }
        .main > div{
            width: 200px;
            margin: 10px;
  margin-left:20px;
  line-height: 1.5rem;
  font-size: 25px;
        }
        .main .label{
            margin-bottom:5px;
        }
        .main .textbox{
            width:200px;
            height:30px;
            font-size:20px;
        }
        .main select{
            width:120px;
            height:25px;
            font-size:20px;
        } 
        .main .result{
            margin-right:100px;
        }
       
        .btn-save{
              background-color:#AAC9E6;
              width:150px;
              height:50px;
              border-radius:50px;
              color:black;
              font-size:25px;
              font-weight:bold;
              border: none;
              margin:25px auto  auto 200px;
              
          }
          .btn-save:hover{
              background-color:#658FB6;
              color:white;
          }
           .btn-delete{
              background-color:#AAC9E6;
              width:150px;
              height:50px;
              border-radius:50px;
              color:black;
              font-size:25px;
              font-weight:bold;
              border: none;
              margin:25px 40px auto 30px;
              
          }
          .btn-delete:hover{
              background-color:#658FB6;
              color:white;
          }
         
          .btn-compute{
              background-color:#AAC9E6;
              width:150px;
              height:50px;
              border-radius:50px;
              color:black;
              font-size:25px;
              font-weight:bold;
              border: none;
              margin:25px auto auto auto;
              
          }
          .btn-compute:hover{
              background-color:#658FB6;
              color:white;
          }
           .icon{
             width:45px;
             height:45px;
         }
        .gridview{
            margin-bottom:0px;
            width:100%;
            height:545px;
            background-color:cyan;
        }
         .logout{
              width:40px;
              height:40px;
              margin-left:100px;
              margin-right:20px;
              margin-top:5px;
              background-color:white;
          }
         .gridview-css{
             width:800px;
         }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <ul>
                <li><a href="Home.aspx" >Home</a></li>
                <li><a href="Employee.aspx">Employees</a></li>
                <li><a href="Attendance.aspx">Attendance</a></li>
                <li><a href="IssueSalary.aspx" class="active">Issue Salary</a></li>
            </ul>   
             <asp:ImageButton ID="icon_logout" runat="server" src="logout.png" CssClass="logout" OnClick="icon_logout_Click" />

        </div>
        <div class="main">
    
        <div class="name">
            <asp:Label ID="lbl_name" runat="server" Text="Name" CssClass="label"></asp:Label>
            <asp:TextBox ID="tb_name" runat="server" CssClass="textbox"></asp:TextBox>

        </div>
        <div class="base-salary">
            <asp:Label ID="lbl_base_salary" runat="server" Text="Base Salary" CssClass="label"></asp:Label>
            <asp:TextBox ID="tb_base_salary" runat="server" CssClass="textbox"></asp:TextBox>
      </div>
        <div class="bonus">
            <asp:Label ID="lbl_bonus" runat="server" Text="Bonus" CssClass="label"></asp:Label>
            <br />
            <asp:TextBox ID="tb_bonus" runat="server" CssClass="textbox"></asp:TextBox>
        </div>
     
            <div class="absence">
                <asp:Label ID="lbl_absence" runat="server" Text="Absence" CssClass="label"></asp:Label>
                <asp:TextBox ID="tb_absence" runat="server" CssClass="textbox"></asp:TextBox>
            </div>
            
            <div class="balance">
                <asp:Label ID="lbl_balance" runat="server" Text="Balance" CssClass="label"></asp:Label>
                <asp:TextBox ID="tb_balance" runat="server" CssClass="textbox"></asp:TextBox>            <%--result--%>
            </div>
           
             <div class="persence"> 
                <asp:Label ID="lbl_persence" runat="server" Text="Persence" CssClass="label"></asp:Label>
                <asp:TextBox ID="tb_persence" runat="server" CssClass="textbox"></asp:TextBox>
            </div>
             <div class="excused">
                <asp:Label ID="lbl_excused" runat="server" Text="Excused" CssClass="label"></asp:Label>
                <asp:TextBox ID="tb_exsuced" runat="server" CssClass="textbox"></asp:TextBox>
            </div>  
             
              <asp:Button ID="btn_save" runat="server" Text="Save" CssClass="btn-save" OnClick="btn_save_Click" />
            
              <asp:Button ID="btn_delete" runat="server" Text="Delete" CssClass="btn-delete" OnClick="btn_delete_Click"  />
              
              <asp:Button ID="btn_compute" runat="server" Text="Compute" CssClass="btn-compute" OnClick="btn_compute_Click"/> <%--hesabliyir--%>
</div>
        <div class="gridview">
            <asp:GridView ID="gridview" runat="server" CssClass="gridview-css"></asp:GridView>
        </div>
    </form>
</body>
</html>
