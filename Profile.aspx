<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="fineflix.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome to Fineflix</title>
    <link rel="stylesheet" type="text/css" href="assets/style/Profile.css" />
     <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/06a651c8da.js" crossorigin="anonymous"></script>
        <script src="assets/js/script.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="topBar">

                <div class="logoContainer">
                    <a href="index.php">
                        <img src="assets/images/logo.png" alt="Logo"/>
                    </a>
                </div>

                <ul class="navLinks">
                    <li><a href="index.aspx">Home</a></li>
                    <li><a href="shows.aspx">TV Shows</a></li>
                    <li><a href="movies.aspx">Movies</a></li>
                </ul>

                <div class="rightItems">
                    <a href="search.php">
                        <i class="fas fa-search"></i>
                    </a>

                    <a href="profile.aspx" >
                        <i class="fas fa-user"></i>
                    </a>
                    <asp:LinkButton ID="logout" runat="server" OnClick="logout_Click"><i class="fas fa-sign-out-alt"></i></asp:LinkButton>
                                     

                    
                </div>

            </div>
            <div class='wrapper'>

                <div class="settingsContainer column">

                    <div class="formSection">
                        <h2>User details</h2>

                        <asp:TextBox ID="fnm" class="abc" runat="server" Placeholder="FirstName"></asp:TextBox>
                        <asp:TextBox ID="lnm" class="abc" runat="server" Placeholder="LastName"></asp:TextBox>
                        <asp:TextBox ID="eml" class="abc" runat="server" Placeholder="Email"></asp:TextBox>
                        <asp:Button ID="update" runat="server" class="mn" Text="Save" OnClick="update_Click" />

                    </div>

                    <div class="formSection">

                        <h2>Update password</h2>

                        <asp:TextBox ID="oldPassword" class="abc" runat="server" Placeholder="Old password"></asp:TextBox>
                        <asp:TextBox ID="newPassword" class="abc" runat="server" Placeholder="New password"></asp:TextBox>
                        <asp:TextBox ID="newPassword2" class="abc" runat="server" Placeholder="Confirm new password"></asp:TextBox>
                         <asp:Button ID="updatepass" class="mn" runat="server" Text="Save" OnClick="updatepass_Click" />

                    </div>
                     <asp:Label ID="Label1" runat="server" Text="Enter Valid old password" EnableViewState="False" ForeColor="Red"></asp:Label>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                   

                     <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage=" Password is not same" ControlToCompare="newPassword" ControlToValidate="newPassword2" Display="None"></asp:CompareValidator>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
