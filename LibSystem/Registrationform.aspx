<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrationform.aspx.cs" Inherits="LibSystem.Registrationform" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Bootsrap/Bootstrap-4-4.1.1/css/bootstrap.css" rel="stylesheet" />
      <link href="CSS/Register.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <div class="form">
            <div class="main">
            <div id="section1">
                 <h1>Create Account</h1>
                <div class="img-cont">
                    <img  src="images/icon.jpg" width="60" height="60" />
                    </div>

                <br />


                <div class="name">
                    <label class="firstname">First Name</label>
                    <asp:TextBox ID="txtFName" runat="server" CssClass="input1 col-lg-3"></asp:TextBox>

                    &nbsp&nbsp
                          
                     <label class="lastname">Last Name</label>
                    <asp:TextBox ID="txtlname" runat="server" CssClass="input1 col-xl-3"></asp:TextBox>


                
                </div>
                <br />

                <label class="name">UserName</label>
                <asp:TextBox ID="txtusername" runat="server" CssClass="input1 col-lg-3"></asp:TextBox>

              
                &nbsp&nbsp
            <label class="name">Password</label>
              <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="input1 col-lg-3"></asp:TextBox>
                
                <br />
                <br />
             <label class="name">Email</label> &nbsp  &nbsp  &nbsp  &nbsp   
               <asp:TextBox ID="txtemail" TextMode="Email" runat="server" CssClass="input1 col-lg-3"></asp:TextBox>
             
               <label class="name">Date of Birth</label> 
               <asp:TextBox ID="txtdob" TextMode="Date" runat="server" CssClass="input1"></asp:TextBox>
                <br />
                <br />

                <br />

                 <label class="name">Gender:&nbsp</label>
                <label  style="color:white;">Male</label>
                <asp:RadioButton ID="rdMale" GroupName="Gender" runat="server" />
                <label  style="color:white;">Female</label>
                <asp:RadioButton ID="rdFemale" GroupName="Gender" runat="server" />


            </div>

            <div class="section2">
               

            </div>

            <br />

            <div class="section5">
                <asp:Button ID="btnforreg" Text="Register" OnClick="Regbtn_Click"  runat="server" />
                <br />
                <asp:Label ID="errorlabel" ForeColor="Red" Text="Username already present or a field is empty" runat="server"></asp:Label>
            </div>

            <div>
                <a href="Login.aspx">Already a User.Click Here.. </a>
            </div>

        </div>
            </div>
    </form>
</body>
</html>
