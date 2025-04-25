<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="fineflix.index" %>



<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Welcome to fineflix</title>
    <link rel="stylesheet" type="text/css" href="assets/style/Style1.css" />

    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/06a651c8da.js" crossorigin="anonymous"></script>
    <script src="assets/js/JavaScript.js"></script>
</head>


<body>
    <form id="form1" runat="server">
        <div>
            <div class='wrapper'>

                <div class="topBar">

                    <div class="logoContainer">
                        <a href="index.php">
                            <img src="assets/images/logo.png" alt="Logo" />
                        </a>
                    </div>

                    <ul class="navLinks">
                        <li><a href="index.aspx">Home</a></li>
                        <li><a href="shows.aspx">TV Shows</a></li>
                        <li><a href="movies.aspx">Movies</a></li>
                        <li>
                            <asp:LinkButton ID="admin" runat="server" OnClick="admin_Click">admin</asp:LinkButton></li>
                    </ul>

                    <div class="rightItems">
                        <a href="search.php">
                            <i class="fas fa-search"></i>
                        </a>

                        <a href="profile.aspx">
                            <i class="fas fa-user"></i>
                        </a>

                        <asp:LinkButton ID="logout" runat="server" OnClick="logout_Click" OnClientClick="return true"><i class="fas fa-sign-out-alt"></i></asp:LinkButton>

                    </div>

                </div>

                <div class='previewContainer'>

                    <asp:Image ID="Image1" class='previewImage' runat="server" hidden/>

                    <video autoplay muted class='previewVideo' onended='previewEnded()' runat="server" id="video">
                    </video>
                    <div class='previewOverlay'>

                        <div class='mainDetails'>
                            <h3 runat="server" id="name2"></h3>
                            <div class='buttons'>

                                <asp:LinkButton ID="watch_button" class='b' runat="server" OnClick="watch_button_Click"><i class='fas fa-play'></i>Play</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton1" OnClientClick="return volumeToggle(this);" CssClass="b" runat="server"><i class='fas fa-volume-mute'></i></asp:LinkButton>
                                <%--<button onclick='volumeToggle(this)' id="play" runat="server" class='b'><i class='fas fa-volume-mute'></i></button>--%>
                            </div>

                        </div>

                    </div>

                </div>
                <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound">
                    <ItemTemplate>
                        <div class='category'>
                            <!-- Corrected href attribute by moving the Label control outside the opening tag -->
                            <asp:Label ID="Label2" runat="server" Visible="false" Text='<%#Eval("Id") %>'></asp:Label>
                            <a href='category.aspx?id=<%# Eval("Id") %>'>
                                <h3 style="padding: 0 50px;">
                                    <asp:Label Style="color: #e5e5e5;" ID="Label1" runat="server" Text='<%#Eval("name") %>'></asp:Label></h3>
                            </a>

                            <div class='previewCategories' style="display: flex;">
                                <asp:Repeater ID="Repeater1" runat="server">
                                    <ItemTemplate>
                                        <div class='entities'>
                                            <!-- Corrected href attribute by using proper string formatting -->
                                            <a href='Watch.aspx?id=<%# Eval("preview") %>&name=<%# Eval("name") %>'>
                                                <div class='previewContainer small'>
                                                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("thumbnail") %>' />
                                                </div>
                                            </a>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>


            </div>

        </div>
    </form>
</body>
</html>
