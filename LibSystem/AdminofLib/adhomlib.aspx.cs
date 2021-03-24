using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace LibSystem.AdminofLib
{
    public partial class adhomlib : System.Web.UI.Page
    {
        Userbll bll = new Userbll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null)
            {
                Response.Redirect("../Adminlogin.aspx");
            }
            else
            {
                if (bll.getimagesinfo() == null)
                {
                    Response.Write("Error Loading Images");
                    noresults.Visible = false;

                }
                else
                {
                    noresults.Visible = false;



                    datlis1.DataSource = bll.getimagesinfo();
                    datlis1.DataBind();
                }
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