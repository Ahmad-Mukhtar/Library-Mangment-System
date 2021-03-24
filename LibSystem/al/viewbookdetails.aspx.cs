using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace LibSystem.al
{
    public partial class viewbookdetails : System.Web.UI.Page
    {
        Userbll b = new Userbll();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["User"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            if (!IsPostBack)
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
        }
       
        protected void backbtn(object sender, EventArgs e)
        {
            Response.Redirect("Home");
        }
        protected void addtofav(object sender, EventArgs e)
        {
            if (favbtn.Text == "Add to Favourites")
            {
               
                    string s = Session["User"].ToString();
                    string bid = Request.Cookies["bkid"].Value.ToString();
                    int bookid = Int16.Parse(bid);
                    
                    b.addtoFavourites(s,bookid);
                    favbtn.Text = "Remove From Favourites";
                   
               
               
            }
            else
            {

                string s = Session["User"].ToString();
                string bid = Request.Cookies["bkid"].Value.ToString();
                int bookid = Int16.Parse(bid);
                b.removefromfavourites(s, bookid);
                favbtn.Text = "Add to Favourites";
                
            }
        }
    }
}