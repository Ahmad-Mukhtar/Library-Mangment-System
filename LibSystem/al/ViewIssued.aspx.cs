using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace LibSystem.al
{
    public partial class ViewIssued : System.Web.UI.Page
    {
        Userbll bl = new Userbll();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["User"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            string uname= Session["User"].ToString();

            if (bl.getissuedbooks(uname) == null)
            {
               
                //no books found
            }
            else
            {
                listvie1.DataSource = bl.getissuedbooks(uname);
                listvie1.DataBind();
            }


        }
        protected void Retbkbtn(object sender, EventArgs e)
        {

            Response.Redirect("ReturnBook.aspx");

        }

    }
}