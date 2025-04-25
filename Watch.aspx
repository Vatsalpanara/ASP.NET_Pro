<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Watch.aspx.cs" Inherits="fineflix.Watch" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
        <title>Welcome to fineflix</title>
        <link rel="stylesheet" type="text/css" href="assets/style/style.css"/>

        <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/06a651c8da.js" crossorigin="anonymous"></script>
        <script src="assets/js/JavaScript.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="watchContainer">

    <div class="videoControls watchNav">
        <asp:LinkButton ID="LinkButton1" OnClientClick="goBack()" runat="server"><i class="fas fa-arrow-left"></i></asp:LinkButton>
        <h1 id="name2" runat="server"></h1>
    </div>


    <div class="videoControls upNext" style="display:none;">

        <button onclick="restartVideo();"><i class="fas fa-redo"></i></button>

        <div class="upNextContainer">
            <h2>Up next:</h2>
            <h3><?php echo $upNextVideo->getTitle(); ?></h3>
            <h3><?php echo $upNextVideo->getSeasonAndEpisode(); ?></h3>

            <button class="playNext" onclick="watchVideo(<?php echo $upNextVideo->getId(); ?>)">
                <i class="fas fa-play"></i> Play
            </button>
        </div>
    
    </div>

    <video controls autoplay id="video" runat="server" >
<%--        <source src='<?php echo $video->getFilePath(); ?>' type="video/mp4">--%>
    </video>
</div>

        </div>
    </form>
</body>
</html>
