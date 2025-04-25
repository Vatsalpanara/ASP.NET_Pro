<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="fineflix.WebForm2" %>

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
                    <h3>Upload video</h3>
                    <span>to continue to fineflix</span>
                </div>
            <form id="form1" runat="server">
                <asp:TextBox ID="name" class="i" runat="server" placeholder="name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="None" runat="server" ErrorMessage="Enter name of video" ControlToValidate="name"></asp:RequiredFieldValidator>
               
                <asp:FileUpload ID="thumbnail" class="i" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="None" runat="server" ErrorMessage="Enter thumbnail" ControlToValidate="thumbnail"></asp:RequiredFieldValidator>
                
                <asp:FileUpload ID="previewvideo" class="i" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="None" runat="server" ErrorMessage="upload preview" ControlToValidate="previewvideo"></asp:RequiredFieldValidator>
                
                <asp:DropDownList ID="cetegoryid" runat="server">
                    <asp:ListItem Enabled="False" Value="--select--"></asp:ListItem>
                    <asp:ListItem Value="1"></asp:ListItem>
                    <asp:ListItem Value="2"></asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem Value="6"></asp:ListItem>
                    <asp:ListItem Value="7"></asp:ListItem>
                    <asp:ListItem Value="8"></asp:ListItem>
                    <asp:ListItem Value="9"></asp:ListItem>
                    <asp:ListItem Value="10"></asp:ListItem>
                    <asp:ListItem Value="11"></asp:ListItem>
                    <asp:ListItem Value="12"></asp:ListItem>
                    <asp:ListItem Value="13"></asp:ListItem>
                    <asp:ListItem Value="14"></asp:ListItem>
                    <asp:ListItem Value="15"></asp:ListItem>
                    <asp:ListItem Value="16"></asp:ListItem>
                    <asp:ListItem Value="17"></asp:ListItem>
                    <asp:ListItem Value="18"></asp:ListItem>
                    <asp:ListItem Value="19"></asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="enter cetegory id" ControlToValidate="cetegoryid"></asp:RequiredFieldValidator>
               
                <asp:Button ID="submitButton" class="button" runat="server" Text="upload" OnClick="submitButton_Click" />

                <asp:ValidationSummary Class="errorMessage" ID="ValidationSummary1" Display="None" runat="server" DisplayMode="List" />

                <a href="login.aspx" class="signInMessage">Already have an account? Sign in here!</a>
 
            </form>
            </div>
                
        </div>
        
   
                  
</body>
</html>
