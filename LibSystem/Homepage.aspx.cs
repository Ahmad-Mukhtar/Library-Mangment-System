using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;


namespace LibSystem
{
    public partial class Homepge : System.Web.UI.Page
    {
        Userbll bll = new Userbll();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (bll.getimagesinfo() == null)
            {
                noresults.Text = "No Books Found";
                noresults.Visible = true;
            }
            else
            {
                noresults.Visible = false;
                datlis1.DataSource = bll.getimagesinfo();
                datlis1.DataBind();
            }
        }

        protected void load_login(object sender, EventArgs e)
        {
           
                Response.Redirect("Login.aspx");
        }

        protected void searchbooks(object sender, EventArgs e)
        {

            if (txtSearchMaster.Text == String.Empty)
            {
                Page_Load(sender,e);

            }
            else
            {
                if (bll.searchbooks(txtSearchMaster.Text) != null)
                {
                    datlis1.DataSource = bll.searchbooks(txtSearchMaster.Text);
                    datlis1.DataBind();
                }
                else
                {
                    noresults.Visible = true;
                    
                    datlis1.DataSource = bll.searchbooks(txtSearchMaster.Text);
                    datlis1.DataBind();
                }
            }
        }



    }
}