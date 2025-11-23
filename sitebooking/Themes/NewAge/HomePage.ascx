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
<main class="content-wrapper">
    
    <!-- Hero Section with Gradient Background -->
    <section class="newage-hero text-center" id="home">
        <div class="container">
            <asp:PlaceHolder runat="server" ID="ph0"></asp:PlaceHolder>
        </div>
    </section>
    
    <!-- Features Section -->
    <section class="features-section newage-section" id="features">
        <div class="container">
            <div class="section-heading">
                <asp:PlaceHolder runat="server" ID="ph1"></asp:PlaceHolder>
            </div>
            <div class="row g-4">
                <asp:PlaceHolder runat="server" ID="ph2"></asp:PlaceHolder>
            </div>
        </div>
    </section>

    <!-- Device Showcase Section (Alternating Layout) -->
    <section class="newage-section" id="showcase">
        <div class="container">
            <div class="row g-5 align-items-center">
                <div class="col-lg-6 order-lg-2">
                    <div class="device-mockup">
                        <asp:PlaceHolder runat="server" ID="ph3"></asp:PlaceHolder>
                    </div>
                </div>
                <div class="col-lg-6 order-lg-1">
                    <div class="showcase-text">
                        <asp:PlaceHolder runat="server" ID="ph4"></asp:PlaceHolder>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Second Showcase Section (Reversed Layout) -->
    <% if (ph5.Controls.Count > 0 || ph6.Controls.Count > 0) { %>
    <section class="newage-section bg-light" id="showcase-2">
        <div class="container">
            <div class="row g-5 align-items-center">
                <div class="col-lg-6">
                    <div class="device-mockup">
                        <asp:PlaceHolder runat="server" ID="ph5"></asp:PlaceHolder>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="showcase-text">
                        <asp:PlaceHolder runat="server" ID="ph6"></asp:PlaceHolder>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <% } %>

    <!-- Testimonials / Additional Content Section -->
    <% if (ph7.Controls.Count > 0) { %>
    <section class="newage-section" id="testimonials">
        <div class="container">
            <div class="section-heading">
                <asp:PlaceHolder runat="server" ID="ph7"></asp:PlaceHolder>
            </div>
            <div class="row g-4">
                <asp:PlaceHolder runat="server" ID="ph8"></asp:PlaceHolder>
            </div>
        </div>
    </section>
    <% } %>

    <!-- Download / CTA Section with Gradient -->
    <% if (ph9.Controls.Count > 0) { %>
    <section class="download-section newage-section text-center" id="download">
        <div class="container">
            <asp:PlaceHolder runat="server" ID="ph9"></asp:PlaceHolder>
        </div>
    </section>
    <% } %>

</main>
          
<uc1:Footer runat="server" id="Footer1" />

<!-- Bootstrap + Theme scripts -->
<script src="/sitebooking/Themes/NewAge/js/theme.js"></script>
