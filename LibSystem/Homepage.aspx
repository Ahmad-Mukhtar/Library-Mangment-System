<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="LibSystem.Homepge" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
   
   <div  class="box">         
         <asp:TextBox CssClass="inputtextbox"  ID="txtSearchMaster" TextMode="Search" placeholder="Search Books"  runat="server"></asp:TextBox>
         <asp:Button ID="btnSearch" CssClass="serchbtn" OnClick="searchbooks" runat="server" Text="Search" />
     </div>

    <div id="nores" style="padding-top:100px; margin-left:650px;">
    <asp:Label ID="noresults" CssClass="alert alert-danger" runat="server" Text="No Results Found" Font-Bold="true" Font-Size="X-Large"></asp:Label>
    </div>



    <div class="imagecontainer">
        <asp:DataList ID="datlis1" runat="server" RepeatColumns="6" CellPadding="2" HorizontalAlign="Center" RepeatDirection="Horizontal">
            <ItemTemplate>
                <table>

                    <tr>
                        <td>
             <img class="setimage" src="<%# Eval("Bookimagelink") %>"  height="250" width="170" />
            <p class="setlabel" ><%#Eval("Bookname")%></p>
            <asp:LinkButton CssClass="setbtn btn btn-sm"  Text="Isuue Book" BorderStyle="Solid" OnClick="load_login" runat="server" />
                        </td>
                    </tr>
                </table>



            </ItemTemplate>
        </asp:DataList>
       
       
        </div>

</asp:Content>
