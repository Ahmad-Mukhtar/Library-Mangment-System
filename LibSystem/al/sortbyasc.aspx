<%@ Page Title="" Language="C#" MasterPageFile="~/al/afterlogin.Master" AutoEventWireup="true" CodeBehind="sortbyasc.aspx.cs" Inherits="LibSystem.al.sortbyasc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="C1" runat="server">

     <form class="form" id="form" runat="server">
    
    <div class="imagecontainer">
        <asp:ListView ID="listview1" runat="server" RepeatColumns="6" CellPadding="2" HorizontalAlign="Center" RepeatDirection="Horizontal">
            
            <ItemTemplate>
                  <center>
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
                       </center>



            </ItemTemplate>
        </asp:ListView>
       
       
        </div>
         </form>
</asp:Content>