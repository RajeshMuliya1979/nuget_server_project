<%@ Page Language="C#" Title="Nuget Package Upload" AutoEventWireup="true" CodeBehind="UploadNugetPackage.aspx.cs" Inherits="NugetServer.UploadNugetPackage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Upload File</title>
    <link href="css/login-page.css" rel="stylesheet" />
    <style type="text/css">
        form {
            width: 70%;
        }

        .smallbtn {
            background-color: #4CAF50;
            color: white;
            padding: 8px 10px;
            margin: 7px 0px 0px 1px;
            border: none;
            cursor: pointer;
            width: 23%;
        }

        .logout {
            float: right;
            margin-top: -5%;
            margin-right: -2%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="login" class="container">
            <center>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"> </asp:Label>
            </center>
            <label><b>Select Nuget File(.nupkg)</b></label>
            <div class="logout">
                <asp:LinkButton ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" Font-Bold="true"></asp:LinkButton>
            </div>
            <asp:FileUpload ID="flpNugetFile" runat="server" />
            <asp:RequiredFieldValidator ID="reqflpNugetFile" runat="server" Display="Dynamic"
                ErrorMessage="Please select file" ControlToValidate="flpNugetFile" ValidationGroup="UploadFile" ForeColor="Red">
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regflpNugetFile" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.nupkg)$" ForeColor="Red" Display="Dynamic"
                ControlToValidate="flpNugetFile" runat="server" ErrorMessage="Please select a valid file." ValidationGroup="UploadFile" />
            <asp:Button runat="server" ID="btnUpload" CssClass="smallbtn" Text="Upload" OnClick="btnUpload_Click" ValidationGroup="UploadFile" />
        </div>

        <div class="container">
            <h3>Package Details
                <div style="float: right;">
                    Click <a href="<%= VirtualPathUtility.ToAbsolute("~/Default.aspx") %>">here</a> to view nuget server detail.
                </div>
            </h3>
            <hr />
            <asp:TreeView ID="trPackageList" runat="server" ImageSet="XPFileExplorer" NodeIndent="15" ExpandDepth="0">
                <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                    NodeSpacing="0px" VerticalPadding="2px"></NodeStyle>
                <ParentNodeStyle Font-Bold="False" />
                <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                    VerticalPadding="0px" />
            </asp:TreeView>
        </div>
    </form>
</body>
</html>
