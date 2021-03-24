<%@ Page Title="" Language="C#" MasterPageFile="~/AdminofLib/ad.Master" AutoEventWireup="true" CodeBehind="Removebooksadmin.aspx.cs" Inherits="LibSystem.AdminofLib.Removebooksadmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="C1" runat="server">



    <form class="form" id="form" runat="server">
        <div class="container-custom">
            <div class="row">
                <div class="col-md-5">
                    <div class="card-custom">
                        <div class="card-body-custom">
                            <div class="row">
                                <div class="col">

                                    <h4>Remove Book</h4>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <label>Book ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" TextMode="Number" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                            <small>Error Message</small>
                                        </div>

                                    </div>
                                </div>
                                


                               
                            </div>
                            <div class="row">
                                <div class="col-4">
   <asp:Button  ID="button1" CssClass="btn btn-primary btn-block" Text="Remove Book" onclick="ondeleteclick" OnClientClick="return checkvalidation();" runat="server" />

                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <br>
                </div>
            </div>
        </div>
        <script type="text/javascript">

            function checkvalidation() {
                var id = document.getElementById('C1_TextBox1');



                var id_value = id.value;

                //alert(book_id);

                if (id_value == '') {
                    //document.getElementById('input-group').innerHTML = 'Please enter valid id...';
                    // alert('Please input valid id');

                    setErrorFor(id, '*It must contain value');
                    return false;
                }
                else {
                    setSuccessFor(id);
                    return true;
                }

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
            function setbookiderror(message) {

                var input = document.getElementById('C1_TextBox1');
                var formControl = input.parentElement;
                var small = formControl.querySelector('small');
                formControl.className = 'showfailure';
                small.innerText = message;
            }
    </script>
    </form>
    

</asp:Content>
