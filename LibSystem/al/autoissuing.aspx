<%@ Page Title="" Language="C#" MasterPageFile="~/al/afterlogin.Master" AutoEventWireup="true" CodeBehind="autoissuing.aspx.cs" Inherits="LibSystem.al.autoissuing" %>
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
                           <h4>Book Issuing</h4>
                        </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <center>
                           <asp:Image ID="bimg" CssClass="setimage" ImageUrl="#" Height="250" Width="170" runat="server" />
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
                                    <label>Book ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Book ID"></asp:TextBox>
                                            <small>error message</small>
                                        </div>
                                    </div>
                                </div>

                            </div>
     
                        </div>
                        <div class="row-custom">
                            <div class="col-6">
   <asp:Button style="margin-left:50px;" id="button1" class="btn btn-primary btn-block" Text="Issue Book" onclick="issuebook" OnClientClick="return checkvalidation();" runat="server" />

                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
            <script type="text/javascript">

                function checkvalidation() {
                    var book_id = document.getElementById('C1_TextBox1');

                    var flag = true;

                    var book_id_value = parseInt(book_id.value);


                    //alert(book_id);

                    if (book_id_value <= 0 || book_id.value == '') {
                        //document.getElementById('input-group').innerHTML = 'Please enter valid id...';
                        // alert('Please input valid id');

                        setErrorFor(book_id, '*It must contain value');
                        flag = false;
                    }
                    else {
                        setSuccessFor(book_id);
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

                    var input = document.getElementById('C1_TextBox1');
                    var formControl = input.parentElement;
                    var small = formControl.querySelector('small');
                    formControl.className = 'input-group error';
                    small.innerText = message;

                }
    </script>

    </form>

    
    </asp:Content>
