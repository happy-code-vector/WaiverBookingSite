<%@ Control Language="C#" AutoEventWireup="true"  Inherits="WaiverFile.sitebooking.Templates.WFCMSPageTemplateBase" %>
<%@ Register Src="~/sitebooking/Controls/NavbarBooking.ascx" TagPrefix="uc1" TagName="NavbarBooking" %>
<%@ Register Src="includes/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="includes/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Panel runat="server" ID="pnlHead">
    <!-- Viewport -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- SEO Meta Tags -->
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="WaiverFile">

    <!-- Font Awesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" type="text/css">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Grayscale Theme Styles -->
    <link rel="stylesheet" href="/sitebooking/Themes/Grayscale/css/grayscale.css">
    
    <!-- Choices.js for enhanced selects -->
    <link rel="stylesheet" href="/sitebooking/vendor/choices.js/public/assets/styles/choices.min.css">
    
    <script src="/sitebooking/vendor/choices.js/public/assets/scripts/choices.min.js"></script>
</asp:Panel>

<uc1:Header runat="server" id="Header1" />

<!-- Masthead -->
<header class="masthead">
    <div class="container px-4 px-lg-5 d-flex h-100 align-items-center justify-content-center">
        <div class="d-flex justify-content-center">
            <div class="text-center text-white">
                <asp:PlaceHolder runat="server" ID="ph0"></asp:PlaceHolder>
            </div>
        </div>
    </div>
</header>

<!-- Main Content Section -->
<section class="content-section bg-black" id="content">
    <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-lg-10">
                <asp:PlaceHolder runat="server" ID="ph1"></asp:PlaceHolder>
            </div>
        </div>
    </div>
</section>

<!-- Additional Content Sections -->
<% if (ph2.Controls.Count > 0) { %>
<section class="content-section" id="section2">
    <div class="container px-4 px-lg-5">
        <asp:PlaceHolder runat="server" ID="ph2"></asp:PlaceHolder>
    </div>
</section>
<% } %>

<% if (ph3.Controls.Count > 0) { %>
<section class="content-section bg-black" id="section3">
    <div class="container px-4 px-lg-5">
        <asp:PlaceHolder runat="server" ID="ph3"></asp:PlaceHolder>
    </div>
</section>
<% } %>

<% if (ph4.Controls.Count > 0) { %>
<section class="content-section" id="section4">
    <div class="container px-4 px-lg-5">
        <asp:PlaceHolder runat="server" ID="ph4"></asp:PlaceHolder>
    </div>
</section>
<% } %>

<uc1:Footer runat="server" id="Footer1" />

<!-- Bootstrap core JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- jQuery Easing -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

<!-- Grayscale Theme JavaScript -->
<script src="/sitebooking/Themes/Grayscale/js/grayscale.js"></script>
