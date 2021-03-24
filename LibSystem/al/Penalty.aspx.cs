using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace LibSystem.al
{
    public partial class Penalty : System.Web.UI.Page
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
                string uname = Session["User"].ToString();
               int val=bl.getpenaltyprice(uname);
                if(val>0)
                {
                    penalty.CssClass = "alert alert-danger";
                    penalty.Text = "Please Pay the Following Dues : "+val.ToString();
                }

            }
        }
    }
}