using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMSI
{
    public partial class Index : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-5UE60EN\SQLEXPRESS;Initial Catalog=ProjectManagementSystem;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        }

        protected void UserLogin(object sender, EventArgs e)
        {
            string sql = " Select * from SignUp where UserName='"+TxtUserName.Text+"'and Password='"+TxtPass.Text+"'  ";

            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                Session ["UserNameDB"] = TxtUserName.Text;
                Response.Redirect("~/Dashboard.aspx");
            }
            else
            {
                lblerror.Text = "UserID Or Password is Incorrect";
            }
            //reader.Read();


            /*  if (reader.HasRows)
              {

                  if (TxtUserName.Text == reader[0].ToString() && TxtPass.Text == reader[1].ToString())
                  {
                      Response.Redirect("~/Dashboard.aspx");
                  }
                  else
                  {
                      lblerror.Text = "UserID Or Password is Incorrect";
                  }

              }*/
            con.Close();


        }
    }
}