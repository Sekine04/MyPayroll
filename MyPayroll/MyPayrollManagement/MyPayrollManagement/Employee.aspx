<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="MyPayrollManagement.Employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employees</title>
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
            font-family: 'Poppins', sans-serif;
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
       
        .main .textbox{
            width:200px;
            height:30px;
            font-size:20px;
        }
        .main select{
            width:150px;
            height:25px;
            font-size:20px;

        } 
        
        .main .dob{
            margin-right:160px;
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
              margin:25px 20px auto 300px;
              
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
              margin:25px auto auto auto;
              
          }
          .btn-delete:hover{
              background-color:#658FB6;
              color:white;
          }
         .gridview{
            margin-bottom:0px;
            width:100%;
            height:545px;
            background-color:cyan;
        }
         .date-icon{
             width:45px;
             height:45px;
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
                <li><a href="Home.aspx">Home</a></li>
                <li><a href="Employee.aspx"class="active">Employees</a></li>
                <li><a href="Attendance.aspx">Attendance</a></li>
                <li><a href="IssueSalary.aspx">Issue Salary</a></li>
            </ul>        
             <asp:ImageButton ID="icon_logout" runat="server" src="logout.png" CssClass="logout" OnClick="icon_logout_Click" />

        </div>
        <div class="main">
           <div class="name">
             <asp:Label ID="lbl_name" runat="server" Text="Name" CssClass="label"></asp:Label>
            <asp:TextBox ID="tb_name" runat="server" CssClass="textbox"></asp:TextBox>
        </div>
       
            <div class="joindate">
            <asp:Label ID="lbl_joindate" runat="server" Text="Join Date" CssClass="label"></asp:Label>
              <asp:ImageButton ID="calendar_join" runat="server" src="calendar.png" CssClass="date-icon" OnClick="calendar_join_Click" />
            <asp:Calendar ID="calendarjoin" runat="server" CssClass="calendarjoin" Visible="false" OnSelectionChanged="calendarjoin_SelectionChanged"></asp:Calendar>
            <asp:TextBox ID="tb_cal" runat="server" CssClass="textbox"></asp:TextBox>
        </div>
            <div class="base-salary">
            <asp:Label ID="lbl_base_salary" runat="server" Text="Base Salary" CssClass="label"></asp:Label>
            <asp:TextBox ID="tb_base_salary" runat="server" CssClass="textbox"></asp:TextBox>
      </div>
            
              <div class="qualification">
           <asp:Label ID="lbl_qual" runat="server" Text="Qualification" CssClass="label"></asp:Label>
                  <asp:TextBox ID="tb_qual" runat="server" CssClass="textbox"></asp:TextBox>

      </div>
              <div class="position">
            <asp:Label ID="lbl_position" runat="server" Text="Position" CssClass="label"></asp:Label>
                  <asp:TextBox ID="tb_position" runat="server" CssClass="textbox"></asp:TextBox>
        
      </div>
              <div class="dob">
           <asp:Label ID="lbl_dob" runat="server" Text="DOB" CssClass="label"></asp:Label>
                  <asp:ImageButton ID="calendar_dob" runat="server" src="calendar.png" CssClass="date-icon" OnClick="calendar_dob_Click" />
          <asp:Calendar ID="calendardob" runat="server" CssClass="calendardob" Visible="false" OnSelectionChanged="calendardob_SelectionChanged"></asp:Calendar>
                   <asp:TextBox ID="tb_dob" runat="server" CssClass="textbox"></asp:TextBox>

      </div>
 <br />
            <asp:Button ID="btn_save" runat="server" Text="Save" CssClass="btn-save" OnClick="btn_save_Click" />
              <asp:Button ID="btn_delete" runat="server" Text="Delete" CssClass="btn-delete" OnClick="btn_delete_Click" />
             <asp:Label ID="lbl_error" runat="server" Text="" CssClass="label"></asp:Label>
           
        </div>

        <div class="gridview">
            <asp:GridView ID="gridview" runat="server" CssClass="gridview-css"></asp:GridView>
        </div>
    </form>
</body>
</html>
