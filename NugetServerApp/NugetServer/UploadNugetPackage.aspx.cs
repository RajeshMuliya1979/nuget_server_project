using System;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;


namespace NugetServer
{
    public partial class UploadNugetPackage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsLogin"] == null && !Convert.ToBoolean(Session["IsLogin"]))
                Response.Redirect("Login.aspx", false);
            else
            {
                Response.ClearHeaders();
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                Response.AddHeader("Pragma", "no-cache");
            }
            if (!this.IsPostBack)
                BindPackages();
        }
        private void BindPackages()
        {
            DirectoryInfo rootInfo = new DirectoryInfo(Server.MapPath("~/Packages/"));
            this.PopulateTreeView(rootInfo, null);
        }
        private void PopulateTreeView(DirectoryInfo dirInfo, TreeNode treeNode)
        {
            foreach (DirectoryInfo directory in dirInfo.GetDirectories())
            {
                TreeNode directoryNode = new TreeNode
                {
                    Text = directory.Name,
                    Value = directory.FullName
                };

                if (treeNode == null)
                    trPackageList.Nodes.Add(directoryNode);
                else
                    treeNode.ChildNodes.Add(directoryNode);

                foreach (FileInfo file in directory.GetFiles())
                {
                    TreeNode fileNode = new TreeNode
                    {
                        Text = file.Name,
                        Value = file.FullName,
                        SelectAction = TreeNodeSelectAction.None
                    };
                    directoryNode.ChildNodes.Add(fileNode);
                }
                PopulateTreeView(directory, directoryNode);
            }
        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if ((flpNugetFile.PostedFile != null) && (flpNugetFile.PostedFile.ContentLength > 0))
            {
                string fn = System.IO.Path.GetFileName(flpNugetFile.PostedFile.FileName);
                string SaveLocation = Server.MapPath("Packages") + "\\" + fn;
                try
                {
                    flpNugetFile.PostedFile.SaveAs(SaveLocation);
                    lblMessage.Text = "The file has been uploaded.";
                    Response.Redirect(VirtualPathUtility.ToAbsolute("~/nuget/Packages"), false);
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                }
                finally
                {
                    BindPackages();
                }
            }
            else
            {
                lblMessage.Text = "Please select a file to upload.";
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();
            Response.Redirect("~/Login.aspx");
        }
    }
}