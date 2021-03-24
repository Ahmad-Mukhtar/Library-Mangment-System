using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace LibSystem.al
{
    public partial class Favourites : System.Web.UI.Page
    {
        Userbll bl = new Userbll();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["User"] == null)
            {
                Response.Redirect("../Login.aspx");
            }

            if (!IsPostBack)
            {

                string s = Session["User"].ToString();
                datlis1.DataSource = bl.getfav(s);
                datlis1.DataBind();
             
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
        protected void addtofav(object sender, EventArgs e)
        {

            var button = sender as Button;
            var dataListItem = button.Parent as DataListItem;
            var fvbtn = dataListItem.FindControl("fvbtn") as Button;
            if ( fvbtn.Text=="Add to Favourites")
            {
               
                    string s = Session["User"].ToString();
                    string bid = Request.Cookies["bkid"].Value.ToString();
                    int bookid = Int16.Parse(bid);
                    bl.addtoFavourites(s, bookid);
                
                fvbtn.Text = "Remove From Favourites";
                
            }
            else
            {

                string s = Session["User"].ToString();
                string bid = Request.Cookies["bkid"].Value.ToString();
                int bookid = Int16.Parse(bid);
                bl.removefromfavourites(s, bookid);
               
                fvbtn.Text = "Add to Favourites";
            }
        }

    }
}