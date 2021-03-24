using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace LibSystem
{

    public partial class Login : System.Web.UI.Page
    {
   
        protected void Page_Load(object sender, EventArgs e)
        {
            errorlabel.Visible = false;
            Session.Clear();
        }
  
        protected void LOGINbtn_Click(object sender, EventArgs e)
        {
            if (txtusrname.Text != string.Empty && txtpass.Text != string.Empty)
            {
                Userbll bll = new Userbll();
                int flag = bll.isvalidsignin(txtusrname.Text, txtpass.Text);
                if (flag == 1)
                {
                    Session["User"] = txtusrname.Text;
                    string uname = Session["User"].ToString();
                    bll.calculatepenaltyprice(uname);
                    Response.Redirect("al/Home.aspx");
                }
                else if (flag == 0)
                {
                    errorlabel.Text = "Invalid Username or Password";
                    errorlabel.Visible = true;
                }

            }
            else
            {
                errorlabel.Text = "No Field can be Empty ";
                errorlabel.Visible = true;
            }

               

        }

    }
}