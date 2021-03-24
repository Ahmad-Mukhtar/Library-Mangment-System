using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace LibSystem.AdminofLib
{
    public partial class adbookdet : System.Web.UI.Page
    {
        Userbll b = new Userbll();
        protected void Page_Load(object sender, EventArgs e)
        {
            string bid = Request.Cookies["bkid"].Value.ToString();
            int id = Int16.Parse(bid);
            if (b.getbookdetails(id) == null)
            {
                Response.Write("Error Loading Images");

            }
            else
            {
                datlis1.DataSource = b.getbookdetails(id);
                datlis1.DataBind();
            }
        }

        protected void backbtn(object sender, EventArgs e)
        {
            Response.Redirect("adhomlib.aspx");
        }
    }
}