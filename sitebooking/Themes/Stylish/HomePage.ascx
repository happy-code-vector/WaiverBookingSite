<%@ Control Language="C#" AutoEventWireup="true"  Inherits="WaiverFile.sitebooking.Templates.WFCMSPageTemplateBase" %>
<%@ Register Src="~/sitebooking/Controls/NavbarBooking.ascx" TagPrefix="uc1" TagName="NavbarBooking" %>
<%@ Register Src="includes/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="includes/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Panel runat="server" ID="pnlHead">
	<!-- Viewport -->
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, viewport-fit=cover">
    
	<!-- SEO Meta Tags -->
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="WaiverFile">

	<!-- Preloaded local web font (Inter) -->
	<link rel="preload" href="/sitebooking/Themes/Stylish/fonts/inter-variable-latin.woff2" as="font" type="font/woff2" crossorigin>

	<!-- Font icons -->
	<link rel="preload" href="/sitebooking/Themes/Stylish/icons/cartzilla-icons.woff2" as="font" type="font/woff2" crossorigin>
	<link rel="stylesheet" href="/sitebooking/Themes/Stylish/icons/cartzilla-icons.min.css">

	<!-- Bootstrap + Theme styles -->
	<link rel="preload" href="/sitebooking/Themes/Stylish/css/theme.min.css" as="style">
	<link rel="preload" href="/sitebooking/Themes/Stylish/css/theme.rtl.min.css" as="style">
	<link rel="stylesheet" href="/sitebooking/Themes/Stylish/css/theme.min.css" id="themestyles">
	<link rel="stylesheet" href="/sitebooking/vendor/choices.js/public/assets/styles/choices.min.css">

	<!-- Custom Stylish Theme Styles -->
	<link rel="stylesheet" href="/sitebooking/Themes/Stylish/css/stylish.css">
    
    <script src="/sitebooking/vendor/choices.js/public/assets/scripts/choices.min.js"></script>
</asp:Panel>

<uc1:Header runat="server" id="Header1" />

<!-- Masthead/Hero Section -->
<header class="masthead-stylish" id="page-top-stylish">
    <div class="container px-4 px-lg-5 d-flex h-100 align-items-center justify-content-center">
        <div class="text-center">
            <asp:PlaceHolder runat="server" ID="ph0"></asp:PlaceHolder>
        </div>
    </div>
</header>

<!-- Services Section -->
<section class="content-section-stylish bg-light" id="services-stylish">
    <div class="container px-4 px-lg-5">
        <asp:PlaceHolder runat="server" ID="ph1"></asp:PlaceHolder>
        <div class="row gx-4 gx-lg-5">
            <asp:PlaceHolder runat="server" ID="ph2"></asp:PlaceHolder>
        </div>
    </div>
</section>

<!-- Callout Section -->
<section class="callout-stylish" id="callout-stylish">
    <div class="container px-4 px-lg-5">
        <asp:PlaceHolder runat="server" ID="ph3"></asp:PlaceHolder>
    </div>
</section>

<!-- Portfolio Section -->
<section class="content-section-stylish" id="portfolio-stylish">
    <div class="container px-4 px-lg-5">
        <asp:PlaceHolder runat="server" ID="ph4"></asp:PlaceHolder>
        <div class="row gx-0">
            <asp:PlaceHolder runat="server" ID="ph5"></asp:PlaceHolder>
        </div>
    </div>
</section>

<!-- About/Timeline Section -->
<% if (ph6.Controls.Count > 0) { %>
<section class="content-section-stylish bg-light" id="about-stylish">
    <div class="container px-4 px-lg-5">
        <asp:PlaceHolder runat="server" ID="ph6"></asp:PlaceHolder>
        <ul class="row timeline">
            <asp:PlaceHolder runat="server" ID="ph7"></asp:PlaceHolder>
        </ul>
    </div>
</section>
<% } %>

<!-- Contact Section -->
<% if (ph8.Controls.Count > 0) { %>
<section class="content-section-stylish" id="contact-stylish">
    <div class="container px-4 px-lg-5">
        <asp:PlaceHolder runat="server" ID="ph8"></asp:PlaceHolder>
    </div>
</section>
<% } %>

<uc1:Footer runat="server" id="Footer1" />

<!-- Bootstrap + Theme scripts -->
<script src="/sitebooking/Themes/Stylish/js/theme.js"></script>

