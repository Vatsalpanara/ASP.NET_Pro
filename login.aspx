<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="fineflix.login" %>

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
                    <h3>Sign In</h3>
                    <span>to continue to fineflix</span>
                </div>
                <form id="form1" runat="server">
                <asp:Label ID="islogin" runat="server" Text=" please enter valid username and password" ForeColor="Red"></asp:Label>
                    <asp:TextBox ID="username" class="i" placeholder="Username" runat="server" ></asp:TextBox>
                     
                    <asp:TextBox ID="Password" class="i" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                                   
                    <asp:Button ID="submit" runat="server" class="button" Text="SUBMIT" OnClick="submit_Click" />
       
                <a href="Signup.aspx" class="signInMessage">Need an account? Sign up here!</a>
            </form>
                    
            </div>
 </div> 
        

    
</body>
</html>
