using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMSI
{
    public partial class SignUp : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-5UE60EN\SQLEXPRESS;Initial Catalog=ProjectManagementSystem;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        }

        protected void AddUser(object sender, EventArgs e)
        {
            try { 
            string sql1 = " insert into SignUp values ('" + TxtName.Text + "','" + TxtUserName.Text + "','" + TxtEmail.Text + "','" + TxtPass.Text + "','"+DesignationList.SelectedValue+"')";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql1, con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/Index.aspx");
            }
            catch(Exception exception)
            {
                lblerror.Text = "Error Occured and"+exception;
            }

            }
    }
}