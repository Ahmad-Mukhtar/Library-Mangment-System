<%@ Page Title="" Language="C#" MasterPageFile="~/al/afterlogin.Master" AutoEventWireup="true" CodeBehind="ViewIssued.aspx.cs" Inherits="LibSystem.al.ViewIssued" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="C1" runat="server">

    <form runat="server">
        <div class="col-md-7">
            <div class="card-custom">
                <div class="card-body-issue">
                    <div class="row">
                        <div class="col">
                            <center>
                           <h4>Issued Books</h4>
                        </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <hr>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div style="margin-left:80px;">
   <asp:ListView ID="listvie1" runat="server" RepeatColumns="6" CellPadding="2" HorizontalAlign="Center" RepeatDirection="Horizontal">

            <ItemTemplate>
                <center>
                    <table>

                    <tr>
                        <td>
                          
             <asp:Image ID="bimage" CssClass="setimage" ImageUrl='<%# Eval("Bookimagelink") %>'  height="250" width="170" runat="server" />
            <p class="setlabel "><%#Eval("Bookname")%></p>
            <p style="background-color:#343a40; color:white;">Due Date: <%#Eval("duedate")%> </p>
             <asp:LinkButton CssClass="setbtn btn btn-sm" style="background-color:#343a40; color:white;margin-right:20px;"  Text="Return Book" BorderStyle="Solid" OnClick="Retbkbtn" autopostback="false" runat="server" />
            <asp:HiddenField ID="HiddenField1" Value='<%#Eval("Bookid")%>' runat="server" />
            <asp:HiddenField ID="HiddenField2" Value='<%#Eval("Bookname")%>' runat="server" />
                      
                        </td>
                    </tr>
                </table>
                 </center>

                  

            </ItemTemplate>
        </asp:ListView>
        </div>

                        </div>


                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
