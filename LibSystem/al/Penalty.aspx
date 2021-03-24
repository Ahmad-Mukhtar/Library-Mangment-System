<%@ Page Title="" Language="C#" MasterPageFile="~/al/afterlogin.Master" AutoEventWireup="true" CodeBehind="Penalty.aspx.cs" Inherits="LibSystem.al.Penalty" %>
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
                           <asp:Label CssClass="alert alert-success" ID="penalty" Text="No Penalty to Pay" runat="server"></asp:Label>
                        </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <hr>
                        </div>
                    </div>                  
                </div>
            </div>
        </div>
    </form>
</asp:Content>