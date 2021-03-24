using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace LibSystem.al
{
    public partial class Editprofile : System.Web.UI.Page
    {
        Userbll bl = new Userbll();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["User"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
        }

        protected void onmemupdate(object sender, EventArgs e)
        {
            string username = Session["User"].ToString();
            string pass = TextBox3.Text.ToString();
            string dob = TextBox5.Text.ToString();
            string email = TextBox4.Text.ToString();
            string fname = TextBox1.Text.ToString();
            string lname = TextBox2.Text.ToString();

            if(bl.updatememprofile(username, pass, dob, email, fname, lname)==true)
            {
                Response.Redirect("showupsuccess.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "hwe", "showerror('Password must be greater than 3 characters');", true);

            }
        }

    }
}