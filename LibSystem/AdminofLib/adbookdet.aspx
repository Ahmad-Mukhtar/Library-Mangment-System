<%@ Page Title="" Language="C#" MasterPageFile="~/AdminofLib/ad.Master" AutoEventWireup="true" CodeBehind="adbookdet.aspx.cs" Inherits="LibSystem.AdminofLib.adbookdet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="C1" runat="server">

    <form runat="server">
        <div class="container-custom">
            <div class="row">
                <div class="col-md-5">
                    <div class="card-custom">
                        <div class="card-body-custom">
                            <div class="row">
                                <div class="col">
                                   <center>
                           <h4>Book Details</h4>
                                           <div>
        <asp:DataList ID="datlis1" runat="server" RepeatColumns="6" CellPadding="2" HorizontalAlign="Center" RepeatDirection="Horizontal">
            <ItemTemplate>
                <table>
    
                    <tr>
                        
             
                        <asp:Image ID="bimage" CssClass="setdetimage" style="margin-right:20px;margin-bottom:-10px;" ImageUrl='<%# Eval("Bookimagelink") %>'  height="250" width="170" runat="server" />
                
                        <p class="bookinfo">Book id: <%#Eval("Bookid")%></p>
                        
             <p class="bookinfo">Book Name: <%#Eval("Bookname")%></p>
            <span class="bookinfo">Author Name: <%#Eval("Authorname")%></span>
         <span class="bookinfo">Publisher Name: <%#Eval("Publishername")%></span>
            <span class="bookinfo">Genre: <%#Eval("Genre")%></span>
                       
         <span class="bookinfo">Current Stock: <%#Eval("CurrentStock")%></span>
         <span class="bookinfo">Actual  Stock: <%#Eval("ActualStock")%></span>
                        
        <p class="bookinfo">Book Description: <%#Eval("BookDescription")%></p>
           
                          
                    </tr>
                </table>



            </ItemTemplate>
        </asp:DataList>
       
       
        </div>



                                       </center>
                      


                                </div>
                            </div>

                          
                            </div>
                                                  

                        </div>
                        <div class="row-custom">
                            <div class="col-6">

                              
                                <asp:Button ID="btn1"  CssClass="btn btn-primary btn-block" Text="Back" onclick="backbtn" runat="server" />
                               
                            </div>
                        </div>
                    </div>
                </div>

            </div>


    </form>

 
</asp:Content>

