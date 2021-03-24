using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using BLL;

namespace LibSystem.AdminofLib
{
    public partial class addbooksadmin : System.Web.UI.Page
    {
        Userbll bl = new Userbll();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void onaddbtnclick(object sender, EventArgs e)
        {

            string imgfile="No Image Found";

            if (imageuploader1.PostedFile!=null&&imageuploader1.HasFile)
            {
                 imgfile = Path.GetFileName(imageuploader1.PostedFile.FileName);
                 string fullpath= Path.Combine(Server.MapPath("..")+"/Images/" + imgfile);
                imageuploader1.SaveAs(fullpath);
                

            }
            string imagefilepath = "/images/" + imgfile;
            int bookid = Int16.Parse(TextBox1.Text.ToString());
            string genre = TextBox7.Text.ToString();
            string bookname = TextBox2.Text.ToString();
            string bookdesc = TextBox8.Text.ToString();
            string Authorname = TextBox3.Text.ToString();
            string publishername = TextBox4.Text.ToString();
            int currentstock = Int16.Parse(TextBox5.Text.ToString());
            int actualstock= Int16.Parse(TextBox6.Text.ToString());

            if (bl.addbooksadmin(bookid, genre, bookname, bookdesc, Authorname, publishername, currentstock, actualstock,imagefilepath)==true)
            {
                Response.Redirect("addsuccess.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "hwe", "setbookiderror('Bookid already exist');", true);
            }

        }
    }
}