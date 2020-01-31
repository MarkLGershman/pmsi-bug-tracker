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
    public partial class WebForm4 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-5UE60EN\SQLEXPRESS;Initial Catalog=ProjectManagementSystem;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            string UserName = Session["UserNameDB"].ToString();
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                GvBugss();
                DropDownUsers();
                DdProjects();

            }
        }
        protected void DdProjects()
        {
     
                    string UserName = Session["UserNameDB"].ToString();
                    string sql1 = "select P_Name,P_Key from Projects where AssignBy='" + UserName + "'";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(sql1, con);
                    B_PList.DataSource = cmd.ExecuteReader();
                    B_PList.DataTextField = "P_Name";
                    B_PList.DataValueField = "P_Key";
                    B_PList.DataBind();
            con.Close();
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
            con.Close();
        }

        protected void AddBug(object sender, EventArgs e)
        {

            string username = Session["UserNameDB"].ToString();

            string filename = Path.GetFileName(BugFile.PostedFile.FileName);
            string contentType = BugFile.PostedFile.ContentType;

            using (Stream fs = BugFile.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        string query = "insert into Bugs values ('" + TxtBName.Text + "','" + BugTypeList.SelectedValue + "','" + BugPrioriyList.SelectedValue + "','" + TxtDes.Text + "','" + AssignToList.SelectedValue + "','" + username + "','" + BugStatusList.SelectedValue + "','"+ B_PList .SelectedValue+ "','"+filename+"','"+contentType+"',@FileContent)";
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

        }

        protected void GvBugss()
        {
            string username = Session["UserNameDB"].ToString();

            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select B_Title,B_Type,B_Priority,B_Desc,B_AssignTo,B_P_Key from Bugs where B_AssignBy='" + username + "' ORDER BY B_Priority ASC ";
                    cmd.Connection = con;
                    con.Open();
                    GvBugs.DataSource = cmd.ExecuteReader();
                    GvBugs.DataBind();
                    con.Close();
                }
            }
        }
    }
}