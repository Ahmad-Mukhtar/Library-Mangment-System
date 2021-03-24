using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using BLL;

namespace LibSystem
{
    public partial class Registrationform : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            errorlabel.Visible = false;
        }
        public string s = "Data Source=DESKTOP-5IC09IJ;Initial Catalog=libdemo;Integrated Security=True";

        protected void Regbtn_Click(object sender, EventArgs e)
        {
            
            
            if(txtFName.Text!=string.Empty&&txtlname.Text!=string.Empty&&txtPassword.Text!=string.Empty&&txtusername.Text!=string.Empty&&txtemail.Text!=string.Empty&&txtdob.Text!=string.Empty)
            {
                Userbll bll = new Userbll();
                string gender=null;
                if (rdMale.Checked == true)
                {
                    gender = "Male";
                }
                else if (rdFemale.Checked == true)
                {
                    gender = "Female";
                }
               bool check=bll.isvalidsignup(txtFName.Text, txtlname.Text, txtusername.Text, txtPassword.Text, txtdob.Text, txtemail.Text, gender);

                if (check == true)
                {
                    Response.Redirect("WebForm1.aspx");
                }
                else
                {
                    errorlabel.Text = "Username already Exists";
                    errorlabel.Visible = true;
                }
                 
            }
            else
            {
                errorlabel.Text = "No field can be left empty";
                errorlabel.Visible = true;
               
            }
            

        }
    }
}