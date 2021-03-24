using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace LibSystem.al
{
   
    public partial class autoissuing : System.Web.UI.Page
    {
        Userbll bl = new Userbll();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["User"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            if (!IsPostBack)
            {
                if (Request.Cookies["bid"] != null)
                {
                    string bid = Request.Cookies["bid"].Value.ToString();
                    string bname = Request.Cookies["bn"].Value.ToString();
                    string bookurl = Request.Cookies["bl"].Value.ToString();
                    TextBox1.Text = bid;
                    bimg.ImageUrl = bookurl;
                }
            }

        }
        protected void issuebook(object sender, EventArgs e)
        {
            string username = Session["User"].ToString();
            int bkid = Int16.Parse(TextBox1.Text.ToString());
            if (bl.issueabook(username, bkid) == 1)
            {
                Response.Redirect("showissuesuccess.aspx");
            }
            else if (bl.issueabook(username, bkid) == 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "hwe", "showerror('You cannot issue more than 3 Books at the same time');", true);
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