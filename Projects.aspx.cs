using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMSI
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-5UE60EN\SQLEXPRESS;Initial Catalog=ProjectManagementSystem;Integrated Security=True");
      
        protected void Page_Load(object sender, EventArgs e)
        {
            string UserName = Session["UserNameDB"].ToString();
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                DropDownUsers();
                GvProjects();

            }
        }

        protected void AddProject(object sender, EventArgs e)
        {

            string username = Session["UserNameDB"].ToString();

            string filename = Path.GetFileName(ProjectFile.PostedFile.FileName);
            string contentType = ProjectFile.PostedFile.ContentType;
           
            using (Stream fs = ProjectFile.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        string query = "insert into Projects values ('"+TxtPName.Text+"','"+TxtPKey.Text+"','"+ProjectTypeList.SelectedValue+"','"+AssignToList.SelectedValue+"','"+TxtDes.Text+"','"+filename+"','"+contentType+"',@FileContent,'"+username+"')";
                        using (SqlCommand cmd = new SqlCommand(query))
                        {
                            cmd.Connection = con;
                            cmd.Parameters.AddWithValue("@FileContent", bytes);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            lblerror.Text = "Fileuploaded";

                        }
                    }
                }
                Server.TransferRequest(Request.Url.AbsolutePath, false);
            }
            ClearSection();
        }
        protected void GvProjects()
        {
            string username = Session["UserNameDB"].ToString();

            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select P_Name,P_Key,P_Cat,P_AssignTo from Projects where AssignBy='"+username+"'";
                    cmd.Connection = con;
                    con.Open();
                    GvProject.DataSource = cmd.ExecuteReader();
                    GvProject.DataBind();
                    con.Close();
                }
            }
        }
        private void ClearSection()
        {
            foreach (Control cntrl in Page.Controls)
            {
                if (cntrl is TextBox)
                {
                    ((TextBox)cntrl).Text = "";

                }
            }
        }
        protected void DropDownUsers()
        {

            string UserName = Session["UserNameDB"].ToString();
            string sql1 = "Select C.UserColl from AddColl AS C, SignUp AS U where C.UserName ='" + UserName + "'   and C.UserColl = U.UserName";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql1, con);
            AssignToList.DataSource = cmd.ExecuteReader();
            AssignToList.DataTextField = "UserColl";
            AssignToList.DataValueField = "UserColl";
            AssignToList.DataBind();
        }
    }
}