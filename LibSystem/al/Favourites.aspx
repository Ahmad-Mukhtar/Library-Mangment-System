<%@ Page Title="" Language="C#" MasterPageFile="~/al/afterlogin.Master" AutoEventWireup="true" CodeBehind="Favourites.aspx.cs" Inherits="LibSystem.al.Favourites" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="C1" runat="server">

    <form runat="server">
                         <div class="imagecontainer">
        <asp:DataList ID="datlis1" runat="server" RepeatColumns="6" CellPadding="2" HorizontalAlign="Center" RepeatDirection="Horizontal">
            <ItemTemplate>
                <table>

                    <tr>
                        <td>
             <asp:Image ID="bimage" CssClass="setimage" ImageUrl='<%# Eval("Bookimagelink") %>'  height="250" width="170" runat="server" />
            <p class="setlabel "><%#Eval("Bookname")%></p>
            <asp:LinkButton CssClass="setbtn btn btn-sm"  Text="Isuue Book" BorderStyle="Solid" OnClick="load_issuebooks" autopostback="false" runat="server" />
              <br />            
             <asp:Button ID="fvbtn"  CssClass="setbtn btn btn-sm"  Text="Remove From Favourites"  autopostback="false" BorderStyle="Solid" OnClick="addtofav"   runat="server" />

                            <br />
                         
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


       
