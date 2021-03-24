using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace LibSystem.AdminofLib
{
    public partial class adsearch : System.Web.UI.Page
    {
        Userbll bll = new Userbll();
        protected void Page_Load(object sender, EventArgs e)
        {

            string searchval = Request.Cookies["scookie"].Value.ToString();
            if (bll.searchbooks(searchval) != null)
            {
                noresults.Visible = false;
                datlis1.DataSource = bll.searchbooks(searchval);
                datlis1.DataBind();
            }
            else
            {
                noresults.Visible = true;
                datlis1.DataSource = bll.searchbooks(searchval);
                datlis1.DataBind();
            }
        }




        protected void load_bookdetails(object sender, EventArgs e)
        {
            var button = sender as LinkButton;
            var dataListItem = button.Parent as DataListItem;
            var hfield = dataListItem.FindControl("HiddenField1") as HiddenField;
            HttpCookie Cookiee = new HttpCookie("bkid");
            string bookid = hfield.Value;
            Cookiee.Value = bookid;
            Cookiee.Expires = DateTime.Now.AddHours(1);
            Response.Cookies.Add(Cookiee);
            Response.Redirect("adbookdet.aspx");

        }
    }
}