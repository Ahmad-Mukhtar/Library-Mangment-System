<%@ Page Title="" Language="C#" MasterPageFile="~/al/afterlogin.Master" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="afterlogin.History" %>

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
                           <h4>History</h4>
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
   <asp:DataList ID="datalis1" runat="server" RepeatColumns="6" CellPadding="2" HorizontalAlign="Center" RepeatDirection="Horizontal">

            <ItemTemplate>
                <center>
                    <table>

                    <tr>
                        <td>
                          
             <asp:Image ID="bimage" CssClass="setimage" style="margin-right:70px;" ImageUrl='<%# Eval("Bookimagelink") %>'  height="250" width="170" runat="server" />
            <p class="setlabel "><%#Eval("Bookname")%></p>
         
                        </td>
                    </tr>
                </table>
                 </center>

                  

            </ItemTemplate>
        </asp:DataList>
        </div>

                        </div>


                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

