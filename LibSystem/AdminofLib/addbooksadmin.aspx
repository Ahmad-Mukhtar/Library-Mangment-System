<%@ Page Title="" Language="C#" MasterPageFile="~/AdminofLib/ad.Master" AutoEventWireup="true" CodeBehind="addbooksadmin.aspx.cs" Inherits="LibSystem.AdminofLib.addbooksadmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="C1" runat="server">



    <form class="form" id="form" runat="server">
        <div class="container-custom">
            <div class="row">
                <div class="col-md-5">
                    <div class="card-custom">
                        <div class="card-body-custom">
                            <div class="row">
                                <div class="col">

                                    <h4>Add Book</h4>

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
                                <div class="col-md-8">
                                    <label>Book Name</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Name"></asp:TextBox>
                                            <small>Error Message</small>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Author Name</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Author Name"></asp:TextBox>
                                            <small>Error Message</small>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Publisher Name</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Publisher Name"></asp:TextBox>
                                            <small>Error Message</small>
                                        </div>
                                    </div>
                                </div>
                                  <div class="col-md-4">
                                    <label>Current Stock</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" TextMode="Number" ID="TextBox5" runat="server" placeholder="Current stock"></asp:TextBox>
                                            <small>Error Message</small>
                                        </div>
                                    </div>
                                </div>

                                  <div class="col-md-4">
                                    <label>Actual Stock</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control" TextMode="Number" ID="TextBox6" runat="server" placeholder="Actual Stock"></asp:TextBox>
                                            <small>Error Message</small>
                                        </div>
                                    </div>
                                </div>

                                 <div class="col-md-4">
                                    <label>Genre</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control"  ID="TextBox7" runat="server" placeholder="Genre"></asp:TextBox>
                                            <small>Error Message</small>
                                        </div>
                                    </div>
                                </div>
                                 <div class="col-md-9">
                                    <label>Book description</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox CssClass="form-control"  ID="TextBox8" runat="server" placeholder="Description"></asp:TextBox>
                                            <small>Error Message</small>
                                        </div>
                                    </div>
                                </div>

                                  <div class="col-md-9">
                                    <label>Upload Book Image</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:FileUpload CssClass="form-control" ID="imageuploader1" runat="server" placeholder="Upload"></asp:FileUpload>
                                         
                                        </div>
                                    </div>
                                </div>
                                




                            </div>
                            <div class="row">
                                <div class="col-4">
       <asp:Button  ID="button1" CssClass="btn btn-primary btn-block" Text="Add Book" onclick="onaddbtnclick" OnClientClick="return checkvalidation();" runat="server" />

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
                  var book_name = document.getElementById('C1_TextBox2');
                  var author_name = document.getElementById('C1_TextBox3');
                  var pub_detl = document.getElementById('C1_TextBox4');
                  var curr_stock = document.getElementById('C1_TextBox5');
                  var act_stock = document.getElementById('C1_TextBox6');
                  var gen = document.getElementById('C1_TextBox7');
                  var bookdesc = document.getElementById('C1_TextBox8');






                  var id_value = parseInt(id.value);
                  var book_name_value = book_name.value;
                  var auth_name_value = author_name.value;
                  var pub_detl_value = pub_detl.value;
                  var cur_val = curr_stock.value;
                  var Act_Val = act_stock.value;
                  var genre = gen.value;
                  var bookdescription = bookdesc.value;

                  var flag = true;
                  //alert(book_id);

                  if (id.value == '') {
                      //document.getElementById('input-group').innerHTML = 'Please enter valid id...';
                      // alert('Please input valid id');
                      setErrorFor(id, '*It must contain value');
                      flag = false;
                  }
                  else {
                      setSuccessFor(id);
                  }
                  if (book_name_value == '') {
                      setErrorFor(book_name, '*It must contain value');
                      flag = false;
                  }
                  else {
                      setSuccessFor(book_name);
                  }
                  if (auth_name_value == '') {
                      setErrorFor(author_name, '*It must contain value');
                      flag = false;
                  }
                  else {
                      setSuccessFor(author_name);
                  }
                  if (pub_detl_value == '') {
                      setErrorFor(pub_detl, '*It must contain value');
                      flag = false;
                  }
                  else {
                      setSuccessFor(pub_detl);
                  }
                  if (cur_val == '') {
                      setErrorFor(curr_stock, '*It must contain value');
                      flag = false;

                  }
                  else {
                      setSuccessFor(curr_stock);
                     
                  }
                  if (Act_Val == '') {
                      setErrorFor(act_stock, '*It must contain value');
                      flag = false;

                  }
                  else {
                      setSuccessFor(act_stock);
                  }
                  if (genre == '') {
                      setErrorFor(gen, '*It must contain value');
                      flag = false;
                  }
                  else {
                      setSuccessFor(gen);
                  }
                  if (bookdescription == '') {
                      setErrorFor(bookdesc, '*It must contain value');
                      flag = false;
                  }
                  else {
                      setSuccessFor(bookdesc);
                     
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
              function setbookiderror(message)
              {
                  var input = document.getElementById('C1_TextBox1');
                  var formControl = input.parentElement;
                  var small = formControl.querySelector('small');
                  formControl.className = 'showfailure';
                  small.innerText = message;
              }
    </script>
    </form>
  

</asp:Content>

