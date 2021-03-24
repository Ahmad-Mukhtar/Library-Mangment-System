<%@ Page Title="" Language="C#" MasterPageFile="~/al/afterlogin.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="afterlogin.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="C1" runat="server">

     <form class="form" id="form" runat="server">
          
          <div id="nores"  style="margin-left:420px;">
    <asp:Label ID="noresults" CssClass="alert alert-danger" runat="server" Text="No Results Found" Font-Bold="true" Font-Size="Larger"></asp:Label>
        </div>

    <div class="imagecontainer">
        <asp:DataList ID="datlis1" runat="server" RepeatColumns="6" CellPadding="2" HorizontalAlign="Center" RepeatDirection="Horizontal">
            <ItemTemplate>
                <table>

                    <tr>
                        <td>
             <asp:Image ID="bimage" CssClass="setimage" ImageUrl='<%# Eval("Bookimagelink") %>'  height="250" width="170" runat="server" />
            <p class="setlabel "><%#Eval("Bookname")%></p>
            <asp:LinkButton CssClass="setbtn btn btn-sm"  Text="Isuue Book" BorderStyle="Solid" OnClick="load_issuebooks" autopostback="false" runat="server" />
             <asp:LinkButton CssClass="setbtn btn btn-sm"  Text="View Details" BorderStyle="Solid" OnClick="load_bookdetails" autopostback="false" runat="server" />
                            <asp:HiddenField ID="HiddenField1" Value='<%#Eval("Bookid")%>' runat="server" />
            <asp:HiddenField ID="HiddenField2" Value='<%#Eval("Bookname")%>' runat="server" />
                            </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>    
        </div>
         </form>
</asp:Content>
