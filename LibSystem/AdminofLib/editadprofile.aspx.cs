using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Windows.Forms;
using BLL;

namespace LibSystem.AdminofLib
{
    public partial class editadprofile : System.Web.UI.Page
    {
        Userbll bl = new Userbll();
      
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    
        protected void onupdateclick(object sender, EventArgs e)
        {

            string newpass = TextBox3.Text.ToString();
            string uname = Session["Admin"].ToString();
            if (bl.updateadprofile(uname, newpass) == true)
            {
              Page.ClientScript.RegisterStartupScript(this.GetType(), "hwe", "setSuccessFor('Profile Updated Successfully',1);", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "hwe", "setSuccessFor('Password must be more than 3 Characters',2);", true);

            }



        }


    }
}