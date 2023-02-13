using System;
using System.Web.UI;

namespace NugetServer
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                txtUsername.Focus();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string defaultUserName = System.Configuration.ConfigurationManager.AppSettings["UserName"].ToString();
                string defaultPassword = System.Configuration.ConfigurationManager.AppSettings["Password"].ToString();

                if (txtUsername.Text.Trim() == defaultUserName && txtPassword.Text.Trim() == defaultPassword)
                {
                    Session["IsLogin"] = true;
                    Response.Redirect("UploadNugetPackage.aspx", false);
                }
                else
                {
                    lblMessage.Text = "Invalid login detail Please try again!";
                }
            }
            catch (Exception)
            {
                lblMessage.Text = "Please check configuration for application!";
            }
        }
    }
}