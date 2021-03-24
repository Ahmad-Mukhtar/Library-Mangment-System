using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class clsdal
    {
        private static readonly string constr = System.Configuration.ConfigurationManager.ConnectionStrings["sqlCon1"].ConnectionString;


        public int isvalidlogin(string name, string password)
        {
            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;
            int flag = 0;
            try
            {
                cmd = new SqlCommand("signin", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@usrname", name);
                cmd.Parameters.AddWithValue("@passw", password);
                cmd.Parameters.AddWithValue("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                flag = Convert.ToInt32(cmd.Parameters["@flag"].Value);
                if (flag == 1)
                {
                    sqlcon.Close();
                    return flag;
                }
                else
                {
                    sqlcon.Close();
                    return 0;
                }


            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
                return -1;
            }

        }//

        public bool insertdata(string fname, string lname, string username, string pass, string dob, string email, string gender)
        {
            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;

            string q = "select count(1) from Member where Member.username='" + username + "'";
            cmd = new SqlCommand(q, sqlcon);
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            if (count == 1)
            {
                return false;
            }
            else
            {
                try
                {
                    cmd = new SqlCommand("signup", sqlcon);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@mempass", pass);
                    cmd.Parameters.AddWithValue("@memdob", dob);
                    cmd.Parameters.AddWithValue("@mememail", email);
                    cmd.Parameters.AddWithValue("@memfname", fname);
                    cmd.Parameters.AddWithValue("@memlname", lname);
                    cmd.Parameters.AddWithValue("@memusername", username);
                    if (gender == null)
                    {
                        cmd.Parameters.AddWithValue("@memgender", DBNull.Value);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@memgender", gender);
                    }
                    cmd.ExecuteNonQuery();
                    return true;
                }
                catch (SqlException sqexc)
                {
                    Console.WriteLine("sql error" + sqexc.Message.ToString());
                    System.Diagnostics.Debug.WriteLine("sql error" + sqexc.Message.ToString());
                    return false;
                }
            }
        }//
        public DataTable getboooksinfo()
        {
            SqlConnection sqlcon = new SqlConnection(constr);


            try
            {
                sqlcon.Open();
                SqlCommand cmd;
                cmd = sqlcon.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from displaybooks";
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                sqlcon.Close();
                return dt;
            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
                return null;
            }

        }//
        public DataTable Searchbooks(string bookname)
        {

            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("select * from dbo.searchbooks(@bookname)", sqlcon);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@bookname", bookname);
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                if (dt.Rows.Count == 0)
                {
                    sqlcon.Close();
                    return null;
                }
                sqlcon.Close();
                return dt;
            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
                return null;
            }



        }//
        public int isvalidadminlogin(string name, string password)
        {
            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;
            int flag = 0;
            try
            {
                cmd = new SqlCommand("adminsignin", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@usrname", name);
                cmd.Parameters.AddWithValue("@passw", password);
                cmd.Parameters.AddWithValue("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                flag = Convert.ToInt32(cmd.Parameters["@flag"].Value);
                if (flag == 1)
                {
                    sqlcon.Close();
                    return flag;
                }
                else
                {
                    sqlcon.Close();
                    return 0;
                }


            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();

                return -1;
            }

        }//

        public DataTable getbookdetails(int bookid)
        {

            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("select * from dbo.getbookdetail(@bookid)", sqlcon);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@bookid", bookid);
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                if (dt.Rows.Count == 0)
                {
                    sqlcon.Close();
                    return null;
                }
                sqlcon.Close();
                return dt;
            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
                return null;
            }



        }//
        public DataTable getbookbygenre(string genre)
        {

            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("select * from dbo.booksbygenre(@bookgenre)", sqlcon);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@bookgenre", genre);
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                if (dt.Rows.Count == 0)
                {
                    sqlcon.Close();
                    return null;
                }
                sqlcon.Close();
                return dt;
            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
                return null;
            }



        }//

        public DataTable sortbyasc()
        {
            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;

            try
            {
                cmd = sqlcon.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from sortbyasc order by Bookname asc";
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                sqlcon.Close();
                return dt;
            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
                return null;
            }


        }//

        public DataTable sortbydsc()
        {
            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;

            try
            {
                cmd = sqlcon.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from sortbyasc order by Bookname desc";
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                sqlcon.Close();
                return dt;
            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
                return null;
            }


        }//

        public void addtoFavourites(string username, int bookid)
        {
            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("addtofav", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@usrname", username);
                cmd.Parameters.AddWithValue("@bid", bookid);
                cmd.ExecuteNonQuery();


                sqlcon.Close();
            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
            }

        }//



        public void removefromfav(string username, int bookid)
        {
            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("remfromfav", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@usrname", username);
                cmd.Parameters.AddWithValue("@bid", bookid);
                cmd.ExecuteNonQuery();


                sqlcon.Close();
            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
            }

        }//

        public int getuserid(string username)
        {
            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;

            try
            {

                cmd = new SqlCommand("select dbo.getmemid(@username)", sqlcon);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@username", username);
                int id = (Int32)cmd.ExecuteScalar();
                sqlcon.Close();
                return id;
            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
                return 0;
            }

        }//

        public DataTable getfav(string username)
        {
            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;

            try
            {
                int userid = getuserid(username);
                cmd = new SqlCommand("select * from dbo.getfavouritesfunc(@userid)", sqlcon);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@userid", userid);
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                if (dt.Rows.Count == 0)
                {
                    sqlcon.Close();
                    return null;
                }
                sqlcon.Close();
                return dt;
            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
                return null;
            }


        }//

        public bool updateadprofile(string username, string pass)
        {
            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("adminupdate", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@pass", pass);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.ExecuteNonQuery();
                sqlcon.Close();
                return true;

            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                System.Diagnostics.Debug.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
                return false;
            }


        }//

        public bool addbooksadmin(int bookid,string genre, string bookname,string bookdesc, string Authorname, string publishername, int currentstock, int actualstock, string imglink)
        {

            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("addbookspro", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@bookid", bookid);
                cmd.Parameters.AddWithValue("@genre",genre );
                cmd.Parameters.AddWithValue("@bookname", bookname);
                cmd.Parameters.AddWithValue("@bookdescription",bookdesc );
                cmd.Parameters.AddWithValue("@curstock", currentstock);
                cmd.Parameters.AddWithValue("@actual", actualstock);
                cmd.Parameters.AddWithValue("@bookurl",imglink);
                cmd.Parameters.AddWithValue("@authorname", Authorname);
                cmd.Parameters.AddWithValue("@publishername", publishername);
                cmd.ExecuteNonQuery();
                sqlcon.Close();
                return true;

            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                System.Diagnostics.Debug.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
                return false;
            }
        }//


        public bool deletebooksadmin(int bookid)
        {

            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("deletebookadmin", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@bid", bookid);
                cmd.ExecuteNonQuery();
                sqlcon.Close();
                return true;

            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                System.Diagnostics.Debug.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
                return false;
            }
        }//

        public string getimagelink(int bookid)
        {

            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;

            try
            {
                if (checkifbookexist(bookid) == true)
                {
                    cmd = new SqlCommand("select dbo.getimagelink(@bkid)", sqlcon);
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@bkid", bookid);
                    string id = (string)cmd.ExecuteScalar();
                    sqlcon.Close();
                    return id;
                }
                else
                    return "#";
            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
                string retval = "#";
                return retval;
            }

        }//
        public bool Updatebookadmin(int bookid, string genre, string bookname, string bookdesc, string Authorname, string publishername, int currentstock, int actualstock, string imglink)
        {
            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;
            try
            {
                if(imglink=="#")
                {
                    imglink=getimagelink(bookid);
                }

                cmd = new SqlCommand("upbookspro", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@bookid", bookid);
                cmd.Parameters.AddWithValue("@genre", genre);
                cmd.Parameters.AddWithValue("@bookname", bookname);
                cmd.Parameters.AddWithValue("@bookdescription", bookdesc);
                cmd.Parameters.AddWithValue("@curstock", currentstock);
                cmd.Parameters.AddWithValue("@actual", actualstock);
                cmd.Parameters.AddWithValue("@bookurl", imglink);
                cmd.Parameters.AddWithValue("@authorname", Authorname);
                cmd.Parameters.AddWithValue("@publishername", publishername);
                cmd.ExecuteNonQuery();
                sqlcon.Close();
                return true;

            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                System.Diagnostics.Debug.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
                return false;
            }
        }

        public bool updatememprofile(string username, string pass,string dob,string email,string fname,string lname)
        {
            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("memprofupdate", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@mempass", pass);
                cmd.Parameters.AddWithValue("@memdob", dob);
                cmd.Parameters.AddWithValue("@mememail", email);
                cmd.Parameters.AddWithValue("@memfname", fname);
                cmd.Parameters.AddWithValue("@memlname", lname);
                cmd.Parameters.AddWithValue("@memusername", username);
                cmd.ExecuteNonQuery();
                sqlcon.Close();
                return true;

            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                System.Diagnostics.Debug.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
                return false;
            }


        }//

        public bool checkifbookexist(int bookid)//
        {
            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;
            int flag = 0;
            try
            {
                cmd = new SqlCommand("checkifbookidexists", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@bkid",bookid);
                cmd.Parameters.AddWithValue("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                flag = Convert.ToInt32(cmd.Parameters["@flag"].Value);
                if (flag == 1)
                {
                    sqlcon.Close();
                    return true;
                }
                else
                {
                    sqlcon.Close();
                    return false;
                }


            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();

                return false;
            }
        }

        public int getcurrentstock(int bookid)//
        {
            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;

            try
            {

                cmd = new SqlCommand("select dbo.getcurrentstock(@bkid)", sqlcon);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@bkid", bookid);
                int id = (Int32)cmd.ExecuteScalar();
                sqlcon.Close();
                return id;
            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
                return 0;
            }
        }
        public int issueabook(string username,int bookid)//
        {
            if(getcurrentstock(bookid)<=0)
            {
                return -3;
            }
            if(!checkifbookexist(bookid))
            {
                return -2;
            }

           
            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;
            int userid = getuserid(username);
            try
            {
                cmd = new SqlCommand("issueabook", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@bid", bookid);
                cmd.Parameters.AddWithValue("@memberid", userid);
                cmd.ExecuteNonQuery();
                sqlcon.Close();
                return 1;

            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                System.Diagnostics.Debug.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
                return -1;
            }

        }

        public DataTable getissuedbooks(string username)//
        {
            int userid = getuserid(username);

            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("select * from dbo.issuedbooks(@userid)", sqlcon);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@userid", userid);
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                if (dt.Rows.Count==0)
                {
                    sqlcon.Close();
                    return null;
                }
                sqlcon.Close();
                return dt;
            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
                return null;
            }


        }


        public int Returnbook(string username, int bookid)//
        {
            if (!checkifbookexist(bookid))
            {
                return -2;
            }

         
            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;
            int userid = getuserid(username);
            try
            {
                cmd = new SqlCommand("Returnbook", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@bid", bookid);
                cmd.Parameters.AddWithValue("@memberid", userid);
                cmd.ExecuteNonQuery();
                sqlcon.Close();
                return 1;

            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                System.Diagnostics.Debug.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
                return 0;
            }

        }

        public int Renewabook(string username, int bookid)//
        {
            if (!checkifbookexist(bookid))
            {
                return -2;
            }


            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;
            int userid = getuserid(username);
            try
            {
                cmd = new SqlCommand("Renewabook", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@bid", bookid);
                cmd.Parameters.AddWithValue("@memberid", userid);
                cmd.ExecuteNonQuery();
                sqlcon.Close();
                return 1;

            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                System.Diagnostics.Debug.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
                return 0;
            }
        }

        public DataTable gethistorybooks(string username)//
        {
            int userid = getuserid(username);

            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("select * from dbo.gethistorybooks(@userid)", sqlcon);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@userid", userid);
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                if (dt.Rows.Count == 0)
                {
                    sqlcon.Close();
                    return null;
                }
                sqlcon.Close();
                return dt;
            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
                return null;
            }

        }

        public bool updateprices(int val,int memid)
        {
            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("updateprice", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@price", val);
                cmd.Parameters.AddWithValue("@memberid", memid);
                cmd.ExecuteNonQuery();
                sqlcon.Close();
                return true;

            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                System.Diagnostics.Debug.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
                return false;
            }
        }//

        public bool insertprices(int val, int memid)
        {
            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("insertprice", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@price", val);
                cmd.Parameters.AddWithValue("@memberid", memid);
                cmd.ExecuteNonQuery();
                sqlcon.Close();
                return true;

            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                System.Diagnostics.Debug.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
                return false;
            }
        }//


        public int calculatepenaltyprice(string username)
        {
            int userid = getuserid(username);
            int price = 0;

            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("select * from dbo.getpenaltytable(@userid)", sqlcon);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@userid", userid);
               SqlDataReader reader= cmd.ExecuteReader();
                if(reader==null)
                {
                    return price;
                }
                List<string> val=new List<string>();
               while(reader.Read())
                {
                    val.Add(reader["prices"].ToString());
                }

                foreach (string item in val)
                {
                    int p=Int32.Parse(item);
                    if (p > 10)
                    {
                        p = p - 10;
                        p = p * 10;
                        price = price + p;
                    }
                }
                if(price>0)
                {
                    if(checkifmemexistinpenlaty(userid)==false)
                    {
                        insertprices(price, userid);
                    }
                    else
                    {
                        updateprices(price, userid);
                    }
                }
                sqlcon.Close();
                return price;
            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
                return price;
            }

        }//

        public bool checkifmemexistinpenlaty(int username)
        {
            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;
            int flag = 0;
            try
            {
                cmd = new SqlCommand("checkifmemexist", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@memid", username);
                cmd.Parameters.AddWithValue("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                flag = Convert.ToInt32(cmd.Parameters["@flag"].Value);
                if (flag == 1)
                {
                    sqlcon.Close();
                    return true;
                }
                else
                {
                    sqlcon.Close();
                    return false;
                }


            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();

                return false;
            }
        }//

        public int getpenaltyprice(string username)
        {
            int userid = getuserid(username);
            int price = 0;
            if(checkifmemexistinpenlaty(userid)==false)
            {
                return price;
            }

            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("select * from dbo.getpenaltypice(@userid)", sqlcon);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@userid", userid);
                cmd.ExecuteNonQuery();
                price=(Int32)cmd.ExecuteScalar();
                sqlcon.Close();
                return price;
            }
            catch (SqlException sqexc)
            {
                Console.WriteLine("sql error" + sqexc.Message.ToString());
                sqlcon.Close();
                return price;
            }

        }//




    }
}