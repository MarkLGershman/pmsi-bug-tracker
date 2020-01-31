using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMSI
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-5UE60EN\SQLEXPRESS;Initial Catalog=ProjectManagementSystem;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            string usercoll = Session["UserNameDB"].ToString();
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None; 
            if (!IsPostBack)
            {
                string sql1 = "Select U.Name, U.Email, U.Designation, C.UserColl from AddColl AS C, SignUp AS U where C.UserName ='"+usercoll+"'   and C.UserColl = U.UserName";
                SqlCommand cmd = new SqlCommand(sql1, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                GvColl.DataSource = ds;
                GvColl.DataBind();

            }
        }

        


        protected void AddColl(object sender, EventArgs e)
        {
            
            string usercoll = Session["UserNameDB"].ToString();
            try
            {
                string sql1 = " insert into AddColl values ('"+usercoll+"','" + TxtCollName.Text + "')";
                con.Open();
                SqlCommand cmd = new SqlCommand(sql1, con);
                cmd.ExecuteNonQuery();
                con.Close();
                lblerror.Text = "User Inserted";
            }
            catch (Exception exception)
            {
                lblerror.Text = "Error Occured and" + exception;
            }

            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
    }
}