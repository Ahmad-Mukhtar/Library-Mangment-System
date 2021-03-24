<%@ Page Title="" Language="C#" MasterPageFile="~/al/afterlogin.Master" AutoEventWireup="true" CodeBehind="Editprofile.aspx.cs" Inherits="LibSystem.al.Editprofile" %>
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
                                    <label>First Name</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control"  ID="TextBox1" runat="server" placeholder="First Name"></asp:TextBox>
                                            <small>error message</small>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Last Name</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Last Name"></asp:TextBox>
                                            <small>Error Message</small>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Password</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" TextMode="Password" ID="TextBox3" runat="server" placeholder="Password"></asp:TextBox>
                                            <small>Error Message</small>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Email</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox4" TextMode="Email" runat="server" placeholder="Email"></asp:TextBox>
                                            <small>Error Message</small>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Date of Birth</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Date of Birth" TextMode="Date"></asp:TextBox>
                                            <small>Error Message</small>
                                        </div>
                                    </div>
                                </div>


                              
                            </div>
                        </div>
                        <div class="row-custom">
                            <div class="col-6">


   <asp:Button style="margin-left:50px;" id="button1" class="btn btn-primary btn-block" Text="Update Profile" onclick="onmemupdate" OnClientClick="return checkvalidation();" runat="server" />

                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <script type="text/javascript">

            function checkvalidation() {
                var Firstname = document.getElementById('C1_TextBox1');
                var lastname = document.getElementById('C1_TextBox2');
                var password = document.getElementById('C1_TextBox3');
                var email = document.getElementById('C1_TextBox4');
                var dob = document.getElementById('C1_TextBox5');
                var flag = true;


                var first_Name = Firstname.value;
                var last_name = lastname.value;
                var pass = password.value;
                var e_mail = email.value;
                var d_o_b = dob.value;


                //alert(book_id);

                if (first_Name == "") {
                    //document.getElementById('input-group').innerHTML = 'Please enter valid id...';
                    // alert('Please input valid id');

                    setErrorFor(Firstname, '*It must contain value');
                    flag = false;
                }
                else {
                    setSuccessFor(Firstname);
                }
                if (last_name == '') {
                    setErrorFor(lastname, '*It must contain value');
                    flag = false;
                }
                else {
                    setSuccessFor(lastname);
                }
                if (pass == '') {
                    setErrorFor(password, '*It must contain value');
                    flag = false;
                }
                else {
                    setSuccessFor(password);
                }
                if (e_mail == '') {
                    setErrorFor(email, '*It must contain value');
                    flag = false;
                }
                else {
                    setSuccessFor(email);
                }
                if (d_o_b == '') {
                    setErrorFor(dob, '*It must contain value');
                    flag = false;
                }
                else {
                    setSuccessFor(dob);
                }
                return flag;
            }

            function setErrorFor(input, message) {
                var formControl = input.parentElement;
                var small = formControl.querySelector('small');
                formControl.className = 'input-group error';
                small.innerText = message;
            }

            function setSuccessFor(input) {
                const formControl = input.parentElement;
                var small = formControl.querySelector('small');
                small.innerText = '';
            }

            function showerror(message) {

                var input = document.getElementById('C1_TextBox3');
                var formControl = input.parentElement;
                var small = formControl.querySelector('small');
                formControl.className = 'input-group error';
                small.innerText = message;

            }
    </script>
    </form>

    
</asp:Content>
