<%@ Page Title="" Language="C#" MasterPageFile="~/AdminofLib/ad.Master" AutoEventWireup="true" CodeBehind="addsuccess.aspx.cs" Inherits="LibSystem.AdminofLib.addsuccess" %>
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
                           <h4 class="alert alert-success">Book Added Successfully</h4>
                        </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <hr>
                        </div>
                    </div>
     <asp:Button ID="bkbtn"   CssClass="btn btn-primary btn-block" Text="Back" onclick="goback" runat="server" />
                  
                </div>
            </div>
        </div>
    </form>
</asp:Content>
