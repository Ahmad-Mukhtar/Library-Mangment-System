using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace LibSystem.AdminofLib
{
    public partial class Removebooksadmin : System.Web.UI.Page
    {
        Userbll bl = new Userbll();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ondeleteclick(object sender, EventArgs e)
        {
            int bookid = Int16.Parse(TextBox1.Text.ToString());
            if (bl.deletebooksadmin(bookid) == true)
            {
                Response.Redirect("succesremove.aspx");

            }
            else
            {
             Page.ClientScript.RegisterStartupScript(this.GetType(), "hwe", "setbookiderror('Bookid not Found');", true);

            }

        }
    }
}