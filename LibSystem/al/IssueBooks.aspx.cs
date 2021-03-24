using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace afterlogin
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        Userbll bl = new Userbll();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["User"] == null)
            {
                Response.Redirect("../Login.aspx");
            }

        }
        protected void issuebook(object sender, EventArgs e)
        {
            string username = Session["User"].ToString();
            int bkid = Int16.Parse(TextBox1.Text.ToString());
            if(bl.issueabook(username,bkid)==1)
            {
                Response.Redirect("showissuesuccess.aspx");
            }
           
            else if (bl.issueabook(username, bkid) == -1)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "hwe", "showerror('You had already issued this Book');", true);
            }
            else if (bl.issueabook(username, bkid) == -2)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "hwe", "showerror('Bookid does not exist');", true);
            }

            else if (bl.issueabook(username, bkid) == -3)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "hwe", "showerror('Sorry,This Book is out of Stock');", true);
            }

        }

    }
}