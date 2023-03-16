<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SlideShow.ascx.cs" Inherits="WebSiteBanDienThoaiDiDong.UserControl.SlideShow" %>
<link href="../Styles/SileShow.css" rel="stylesheet" type="text/css" />
<script src="../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="../Scripts/jquery.cycle.all.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#slide").cycle({
            fx: 'fade',
            speed: 1000,
            timeout: 3000,
            pager: '#slide-nav'
        });
    });
 </script>
 <div id="wrapper">
     <div id="slide">
      <img src="../slideshow/h1.jpg" alt="Picture 1" />
        <img src="../slideshow/h2.jpg" alt="Picture 2" />
        <img src="../slideshow/h3.jpg" alt="Picture 3" />
        <img src="../slideshow/h4.jpg" alt="Picture 4" />
        <img src="../slideshow/h5.jpg" alt="Picture 5" />
        <img src="../slideshow/h6.jpg" alt="Picture 6" />
     </div>
     <div id="slide-nav"></div>
 </div>