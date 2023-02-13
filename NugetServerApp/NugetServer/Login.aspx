<%@ Page Language="C#" Title="Login Page" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NugetServer.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <link href="css/login-page.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <div id="login" class="container">
            <center>
                <h3>Login to Nuget Server</h3>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"> </asp:Label>
            </center>
            <label><b>Username</b></label>
            <asp:RequiredFieldValidator ID="reqtxtUsername" runat="server" Style="float: right" ControlToValidate="txtUsername" ErrorMessage="Please enter User Name" ValidationGroup="Login" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox runat="server" ID="txtUsername" placeholder="Enter Username"></asp:TextBox>

            <label><b>Password</b></label><asp:RequiredFieldValidator ID="reqtxtPassword" Style="float: right" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter Password"
                ValidationGroup="Login" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" placeholder="Enter Password"></asp:TextBox>

            <asp:Button runat="server" ID="btnLogin" CssClass="lgnbtn" Text="Login" ValidationGroup="Login" OnClick="btnLogin_Click" />
        </div>
    </form>
</body>
</html>
