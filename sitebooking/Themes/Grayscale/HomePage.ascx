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

    <!-- Preloaded local web font (Inter) -->
    <link rel="preload" href="/sitebooking/Themes/Grayscale/fonts/inter-variable-latin.woff2" as="font" type="font/woff2" crossorigin>

    <!-- Font icons (Cartzilla) -->
    <link rel="preload" href="/sitebooking/Themes/Grayscale/icons/cartzilla-icons.woff2" as="font" type="font/woff2" crossorigin>
    <link rel="stylesheet" href="/sitebooking/Themes/Grayscale/icons/cartzilla-icons.min.css">

    <!-- Bootstrap + Theme styles -->
    <link rel="preload" href="/sitebooking/Themes/Grayscale/css/theme.min.css" as="style">
    <link rel="preload" href="/sitebooking/Themes/Grayscale/css/theme.rtl.min.css" as="style">
    <link rel="stylesheet" href="/sitebooking/Themes/Grayscale/css/theme.min.css" id="themestyles">
    
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
            <div class="text-center">
                <asp:PlaceHolder runat="server" ID="ph0"></asp:PlaceHolder>
            </div>
        </div>
    </div>
</header>

<!-- About Section -->
<section class="about-section text-center" id="about">
    <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-lg-8">
                <asp:PlaceHolder runat="server" ID="ph1"></asp:PlaceHolder>
            </div>
        </div>
    </div>
</section>

<!-- Projects Section -->
<section class="projects-section bg-light" id="projects">
    <div class="container px-4 px-lg-5">
        <!-- Featured Project Row -->
        <div class="row gx-0 mb-4 mb-lg-5 align-items-center">
            <asp:PlaceHolder runat="server" ID="ph2"></asp:PlaceHolder>
        </div>
        
        <!-- Project Rows -->
        <asp:PlaceHolder runat="server" ID="ph3"></asp:PlaceHolder>
    </div>
</section>

<!-- Signup Section -->
<section class="signup-section" id="signup">
    <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5">
            <div class="col-md-10 col-lg-8 mx-auto text-center">
                <asp:PlaceHolder runat="server" ID="ph4"></asp:PlaceHolder>
            </div>
        </div>
    </div>
</section>

<!-- Contact Section -->
<section class="contact-section bg-black" id="contact">
    <div class="container px-4 px-lg-5">
        <asp:PlaceHolder runat="server" ID="ph5"></asp:PlaceHolder>
        
        <div class="social d-flex justify-content-center">
            <asp:PlaceHolder runat="server" ID="ph6"></asp:PlaceHolder>
        </div>
    </div>
</section>

<uc1:Footer runat="server" id="Footer1" />

<!-- Bootstrap + Theme scripts -->
<script src="/sitebooking/Themes/Grayscale/js/theme.js"></script>
<script src="/sitebooking/Themes/Grayscale/js/grayscale.js"></script>