<%@ Page Title="" Language="C#" MasterPageFile="~/al/afterlogin.Master" AutoEventWireup="true" CodeBehind="showreturnsuccess.aspx.cs" Inherits="LibSystem.al.showreturnsuccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="C1" runat="server">

    <form runat="server">
        <div class="col-md-7">
            <div class="card-custom">
                <div class="card-body-issue" style="margin-left:50px;">
                    <div class="row">
                        <div class="col">
                            <center>
                           <h4 class="alert alert-success">Book Returned Successfully</h4>
                        </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <hr>
                        </div>
                    </div>
     <asp:Button ID="bkbtn"   CssClass="btn btn-primary btn-block" Text="Back" onclick="gobackbtnret" runat="server" />
                  
                </div>
            </div>
        </div>
    </form>
</asp:Content>