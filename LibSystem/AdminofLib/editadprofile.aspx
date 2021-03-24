<%@ Page Title="" Language="C#" MasterPageFile="~/AdminofLib/ad.Master" AutoEventWireup="true" CodeBehind="editadprofile.aspx.cs" Inherits="LibSystem.AdminofLib.editadprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="C1" runat="server">

    <form runat="server">
        <div class="container-custom">
            <div class="row">
                <div class="col-md-5">
                    <div class="card-custom">
                        <div class="card-body-custom">
                            <div class="row">
                                <div class="col">
                                    <center>
                           <h4>Edit Profile</h4>
                        </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <center>
                           <img width="100px" src="imgs/profimj.jfif" />
                        </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>
                          
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Password</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" TextMode="Password" ID="TextBox3" runat="server" placeholder="New Password"></asp:TextBox>
                                            <small id="smid">Error Message</small>
                                        </div>
                                    </div>
                                </div>


                            </div>  
                        </div>
                        <div class="row-custom">
                            <div class="col-6">


                                <asp:Button style="margin-left:50px;" id="button1" class="btn btn-primary btn-block" Text="Update Profile" onclick="onupdateclick" OnClientClick="return checkvalidation();" runat="server" />

                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
            <script type="text/javascript">

                function checkvalidation() {

                    var password = document.getElementById('C1_TextBox3');




                    var pass = password.value;


                    //alert(book_id);


                    if (pass == '') {
                        setErrorFor(password, '*It must contain value');
                        return false;
                    }
                    else {


                        return true;
                    }

                }

                function setErrorFor(input, message) {
                    var formControl = input.parentElement;
                    var small = formControl.querySelector('small');
                    formControl.className = 'showfailure';
                    small.innerText = message;
                }

                function setSuccessFor(message, flag) {
                   
                    var input = document.getElementById('C1_TextBox3');
                    var formControl = input.parentElement;
                    var small = formControl.querySelector('small');
                    if (flag == 1) {
                        formControl.className = 'showsuccess';
                    }
                    else if (flag == 2) {
                        formControl.className = 'showfailure';
                    }
                    
                    small.innerText = message;
                  
                }
    </script>

    </form>


</asp:Content>
