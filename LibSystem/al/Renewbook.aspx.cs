using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace LibSystem.al
{
    public partial class Renewbook : System.Web.UI.Page
    {
        Userbll bl = new Userbll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["User"]==null)
            {
                Response.Redirect("../Login.aspx");
            }
        }
        protected void Renewabook(object sender, EventArgs e)
        {
            string username = Session["User"].ToString();
            int bkid = Int16.Parse(TextBox1.Text.ToString());
            if (bl.Renewabook(username, bkid) == 1)
            {
                Response.Redirect("showrenewsuccess.aspx");
            }
            else if (bl.Renewabook(username, bkid) == 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "hwe", "showerror('You have not issued this book');", true);
            }
            else if (bl.Renewabook(username, bkid) == -2)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "hwe", "showerror('Bookid does not exist');", true);
            }

        }

    }
}