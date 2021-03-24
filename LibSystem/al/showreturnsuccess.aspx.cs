using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibSystem.al
{
    public partial class showreturnsuccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void gobackbtnret(object sender, EventArgs e)
        {
            Response.Redirect("ReturnBook.aspx");
        }

    }
}