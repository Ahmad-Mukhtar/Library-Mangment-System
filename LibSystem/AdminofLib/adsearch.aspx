﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminofLib/ad.Master" AutoEventWireup="true" CodeBehind="adsearch.aspx.cs" Inherits="LibSystem.AdminofLib.adsearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="C1" runat="server">

     <form class="form" id="form" runat="server">
    <div id="nores" style="padding-top:100px; padding-left:400px;">
    <asp:Label ID="noresults" runat="server" Text="No Results Found" ForeColor="White" Font-Bold="true" Font-Size="XX-Large"></asp:Label>
   
        </div>

    <div class="imagecontainer" style="padding-top:50px;">
        <asp:DataList ID="datlis1" runat="server" RepeatColumns="6" CellPadding="2" HorizontalAlign="Center" RepeatDirection="Horizontal">
            <ItemTemplate>
                <table>

                    <tr>
                        <td>
             <asp:Image ID="bimage" CssClass="setimage" ImageUrl='<%# Eval("Bookimagelink") %>'  height="250" width="170" runat="server" />
            <p class="setlabel "><%#Eval("Bookname")%></p>
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


