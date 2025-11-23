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
	<link rel="preload" href="/sitebooking/Themes/NewAge/fonts/inter-variable-latin.woff2" as="font" type="font/woff2" crossorigin>

	<!-- Font icons -->
	<link rel="preload" href="/sitebooking/Themes/NewAge/icons/cartzilla-icons.woff2" as="font" type="font/woff2" crossorigin>
	<link rel="stylesheet" href="/sitebooking/Themes/NewAge/icons/cartzilla-icons.min.css">

	<!-- Bootstrap + Theme styles -->
	<link rel="preload" href="/sitebooking/Themes/NewAge/css/theme.min.css" as="style">
  <link rel="preload" href="/sitebooking/Themes/NewAge/css/theme.rtl.min.css" as="style">
	<link rel="stylesheet" href="/sitebooking/Themes/NewAge/css/theme.min.css" id="themestyles">
	<link rel="stylesheet" href="/sitebooking/vendor/choices.js/public/assets/styles/choices.min.css">

	<!-- Custom NewAge Theme Styles -->
	<link rel="stylesheet" href="/sitebooking/Themes/NewAge/css/newage.css">
    
    <script src="/sitebooking/vendor/choices.js/public/assets/scripts/choices.min.js"></script>
</asp:Panel>

<uc1:Header runat="server" id="Header1" />


<!-- Page content -->
<main class="main-content">

    <!-- Hero Section / Top Content -->
    <asp:PlaceHolder runat="server" ID="ph1"></asp:PlaceHolder>
    
    <!-- Main Content Area -->
    <section class="hero-section bg-light py-5">
        <div class="container">
            <asp:PlaceHolder runat="server" ID="ph0"></asp:PlaceHolder>
        </div>
    </section>
    
    <!-- Two Column Section (Conditional) -->
    <% if (ph2.Controls.Count > 0 || ph3.Controls.Count > 0) { %>
    <section class="two-column-section py-5 bg-light">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-6">
                    <asp:PlaceHolder runat="server" ID="ph2"></asp:PlaceHolder>
                </div>
                <div class="col-lg-6">
                    <asp:PlaceHolder runat="server" ID="ph3"></asp:PlaceHolder>
                </div>
            </div>
        </div>
    </section>
    <% } %>

    <!-- Bottom Section -->
    <% if (ph4.Controls.Count > 0) { %>
    <section class="bottom-section py-5">
        <div class="container">
            <asp:PlaceHolder runat="server" ID="ph4"></asp:PlaceHolder>
        </div>
    </section>
    <% } %>
    
</main>
          
<uc1:Footer runat="server" id="Footer1" />

<!-- Bootstrap + Theme scripts -->
<script src="/sitebooking/Themes/NewAge/js/theme.js"></script>
