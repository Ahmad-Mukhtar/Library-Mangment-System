using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace afterlogin
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        Userbll bll = new Userbll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            else
            {
                if (bll.getimagesinfo() != null)
                {
                    noresults.Visible = false;
                    datlis1.DataSource = bll.getimagesinfo();
                    datlis1.DataBind();

                }
                else
                {
                    noresults.Text = "No Books Found";
                    noresults.Visible = true;
                }

           
            }
        }


        protected void load_issuebooks(object sender, EventArgs e)
        {
            var button = sender as LinkButton;
            var dataListItem = button.Parent as DataListItem;
            var hfield = dataListItem.FindControl("HiddenField1") as HiddenField;
            var hfield1 = dataListItem.FindControl("HiddenField2") as HiddenField;
            var hfield2 = dataListItem.FindControl("bimage") as Image;
            string bookid = hfield.Value;
            string bname = hfield1.Value;
            string bimage = hfield2.ImageUrl;
            HttpCookie Cookie = new HttpCookie("bid");
            HttpCookie Cookie1 = new HttpCookie("bn");
            HttpCookie Cookie2 = new HttpCookie("bl");
            Cookie.Value = bookid;
            Cookie1.Value = bname;
            Cookie2.Value = bimage;
            Cookie.Expires = DateTime.Now.AddHours(1);
            Cookie1.Expires = DateTime.Now.AddHours(1);
            Cookie2.Expires = DateTime.Now.AddHours(1);
            Response.Cookies.Add(Cookie);
            Response.Cookies.Add(Cookie1);
            Response.Cookies.Add(Cookie2);
            Response.Redirect("autoissuing.aspx");


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
            Response.Redirect("viewbookdetails.aspx");

        }

    }
}