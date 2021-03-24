using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibSystem
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void Loadregisterpage(object sender, EventArgs e)
        {
            Response.Redirect("Registrationform.aspx");
        }
        protected void Loadadminloginpage(object sender, EventArgs e)
        {
            Response.Redirect("Adminlogin.aspx");
        }
    }
}