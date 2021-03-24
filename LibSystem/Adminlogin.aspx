<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminlogin.aspx.cs" Inherits="LibSystem.Adminlogin" %>

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
       <asp:TextBox ID="txtusrname" placeholder="Adminname"  runat="server"></asp:TextBox>
         <asp:TextBox ID="txtpass" TextMode="Password" placeholder="Password"  runat="server"></asp:TextBox>
        <asp:Button BackColor="DodgerBlue" CssClass="lgnbtn" Font-Bold ID="btnforadlogin" Text="Login" OnClick="adLOGINbtn_Click"  runat="server"/>
        <asp:Label ID="errorlabel" ForeColor="Red" Text="Username already present or a field is empty" runat="server"></asp:Label>
        <p class="message"> <a style="color:dodgerblue;" href="Homepage.aspx">Back to HomePage</a></p>
     
    </form>
  </div>
</div>
</body>
</html>
