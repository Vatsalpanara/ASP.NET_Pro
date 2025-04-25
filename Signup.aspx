<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="fineflix.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Welcome to Fineflix</title>
        <link rel="stylesheet" type="text/css" href="assets/style/style.css" />
</head>
<body>
   
        <div class="signInContainer">

            <div class="column">
                
                <div class="header">
                    <img src="assets/images/logo.png" title="Logo" alt="Site logo" />
                    <h3>Sign Up</h3>
                    <span>to continue to fineflix</span>
                </div>
            <form id="form1" runat="server">
                <asp:TextBox ID="Firstname" class="i" runat="server" placeholder="First name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="None" runat="server" ErrorMessage="First name is missing" ControlToValidate="Firstname"></asp:RequiredFieldValidator>
                
                <asp:TextBox ID="Lastname" class="i" runat="server" Placeholder="Last Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="None" runat="server" ErrorMessage="Last name is missing" ControlToValidate="Lastname"></asp:RequiredFieldValidator>
                
                <asp:TextBox ID="username" class="i" runat="server" placeholder="Username"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="None" runat="server" ErrorMessage="username is missing " ControlToValidate="username"></asp:RequiredFieldValidator>
                
                <asp:TextBox ID="email" runat="server" class="i" placeholder="Email"></asp:TextBox>
                <asp:TextBox ID="email2" runat="server" class="i" placeholder="Confirm email"></asp:TextBox>

                <asp:TextBox ID="password" runat="server" class="i" Display="None" placeholder="Password" TextMode="Password"></asp:TextBox>
                <asp:TextBox ID="password2" runat="server" class="i" Display="None" placeholder="Confirm password" TextMode="Password"></asp:TextBox>

                <asp:Button ID="submitButton" class="button" runat="server" Text="SUBMIT" OnClick="submitButton_Click" />

                <asp:ValidationSummary Class="errorMessage" ID="ValidationSummary1" Display="None" runat="server" DisplayMode="List" />

                <a href="login.aspx" class="signInMessage">Already have an account? Sign in here!</a>
 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is not velid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="email"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="None" runat="server" ErrorMessage="Email is missing " ControlToValidate="email"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Passwords don't match" ControlToCompare="password" ControlToValidate="password2"></asp:CompareValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" Display="None" ErrorMessage="email and conform email is not same " ControlToCompare="email" ControlToValidate="email2"></asp:CompareValidator>

        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Password is missing" ControlToValidate="password" Display="None"></asp:RequiredFieldValidator>

            </form>
            </div>
                
        </div>
        
   
                  
</body>
</html>
