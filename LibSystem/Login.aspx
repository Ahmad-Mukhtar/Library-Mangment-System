<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LibSystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <link href="CSS/login.css" rel="stylesheet" />
    <title></title>
</head>
<body>
 <div class="login-page">
  <div class="form">
    <form id="loginfrm"  class="login-form" runat="server">
        <h1 style="color:white">Login</h1>
        <img src="images/icon.jpg" width="60" height="60" /> 
        <br />
        <br />
       <asp:TextBox ID="txtusrname" placeholder="Username"  runat="server"></asp:TextBox>
         <asp:TextBox ID="txtpass" TextMode="Password" placeholder="Password"  runat="server"></asp:TextBox>
        <asp:Button BackColor="DodgerBlue" CssClass="lgnbtn" Font-Bold ID="btnforlogin" Text="Login" OnClick="LOGINbtn_Click"  runat="server"/>
        <asp:Label ID="errorlabel" ForeColor="Red" Text="Username already present or a field is empty" runat="server"></asp:Label>
      <p class="message" >Not registered? <a style="color:dodgerblue;" href="Registrationform.aspx">Create an account</a></p>

        <p class="message"> <a style="color:dodgerblue;" href="Homepage.aspx">Back to HomePage</a></p>
    </form>
  </div>
</div>
</body>
</html>
