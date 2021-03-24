using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibSystem.AdminofLib
{
    public partial class success_Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void gobackbtnup(object sender, EventArgs e)
        {
            Response.Redirect("updatebookadmin1.aspx");
        }
    }
}