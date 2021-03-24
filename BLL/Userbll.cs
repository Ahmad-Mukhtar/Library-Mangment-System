using System.Data;
using DAL;


namespace BLL
{
    public class Userbll
    {
        clsdal mydal=new clsdal();
        public int isvalidsignin(string nam,string pass)
        {
            return mydal.isvalidlogin(nam, pass);
        }
        public bool isvalidsignup(string fname, string lname, string username, string pass, string dob, string email, string gender)
        {
            return mydal.insertdata(fname, lname, username, pass, dob, email, gender);
        }

        public DataTable getimagesinfo()
        {
            return mydal.getboooksinfo();
        }
        public DataTable searchbooks(string name)
        {
            return mydal.Searchbooks(name);
        }
        public int isvalidadmnlogin(string name ,string pass)
        {
            return mydal.isvalidadminlogin(name, pass);
        }

        public DataTable getbookdetails(int id)
        {
            return mydal.getbookdetails(id);
        }


        public DataTable getbookbygenre(string genre)
        {
            return mydal.getbookbygenre(genre);
        }
        public DataTable sortbyasc()
        {
            return mydal.sortbyasc();
        }

        public DataTable sortbydsc()
        {
            return mydal.sortbydsc();
        }
        public void addtoFavourites(string username,int bookid)
        {
             mydal.addtoFavourites(username,bookid);
        }

        public void removefromfavourites(string username, int bookid)
        {
             mydal.removefromfav(username, bookid);
        }

        public DataTable getfav(string username)
        {
            return mydal.getfav(username);
        }


        public bool updateadprofile(string username,string pass)
        {
            return mydal.updateadprofile(username,pass);
        }
        public bool addbooksadmin(int bookid, string genre, string bookname, string bookdesc, string Authorname, string publishername, int currentstock, int actualstock, string imglink)
        {
            return mydal.addbooksadmin(bookid, genre, bookname, bookdesc, Authorname, publishername, currentstock, actualstock, imglink);
        }

        public bool deletebooksadmin(int bookid)
        {
            return mydal.deletebooksadmin(bookid);
               
        }

        public bool Updatebookadmin(int bookid, string genre, string bookname, string bookdesc, string Authorname, string publishername, int currentstock, int actualstock, string imglink)
        {
            return mydal.Updatebookadmin(bookid, genre, bookname, bookdesc, Authorname, publishername, currentstock, actualstock, imglink);
        }

        public bool updatememprofile(string username, string pass, string dob, string email, string fname, string lname)
        {
            return mydal.updatememprofile(username, pass, dob, email, fname, lname);
        }

        public int issueabook(string username, int bookid)
        {
            return mydal.issueabook(username, bookid);
        }

        public DataTable getissuedbooks(string username)
        {
            return mydal.getissuedbooks(username);
        }

        public int ReturnBook(string username, int bookid)
        {
            return mydal.Returnbook(username, bookid);
        }
        public int Renewabook(string username, int bookid)
        {
            return mydal.Renewabook(username, bookid);
        }
        public DataTable gethistorybooks(string username)
        {
            return mydal.gethistorybooks(username);
        }
        public int calculatepenaltyprice(string username)
        {
            return mydal.calculatepenaltyprice(username);
        }
        public int getpenaltyprice(string username)
        {
            return mydal.getpenaltyprice(username);
        }


    }
}
