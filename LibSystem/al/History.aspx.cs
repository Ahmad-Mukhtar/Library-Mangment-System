using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace afterlogin
{
    public partial class History : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Userbll bl = new Userbll();
            if (Session["User"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            else
            {
                string username = Session["User"].ToString();
                if (bl.gethistorybooks(username) != null)
                {
                    datalis1.DataSource = bl.gethistorybooks(username);
                    datalis1.DataBind();
                }
                                
            }

        }
    }
}