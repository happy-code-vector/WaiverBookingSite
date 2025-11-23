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

<uc1:Header runat="server" id="HeaderNewAge" />

<!-- Page content -->
<main class="content-wrapper">
    
    <!-- Hero Section (Full Width Gradient) - Add NewAgeHero widget here -->
    <asp:PlaceHolder runat="server" ID="phNewAgeHero"></asp:PlaceHolder>
    
    <!-- Features Section -->
    <section class="container newage-section features-section" id="newage-features">
        <!-- Add NewAgeSectionHeader + 3x NewAgeFeatureItem widgets here -->
        <asp:PlaceHolder runat="server" ID="phNewAgeFeatures1"></asp:PlaceHolder>
        <div class="row">
            <asp:PlaceHolder runat="server" ID="phNewAgeFeatures2"></asp:PlaceHolder>
        </div>
    </section>

    <!-- Showcase Section (Device Mockup) -->
    <section class="newage-section bg-light" id="newage-showcase">
        <div class="container">
            <!-- Add NewAgeShowcase widget here -->
            <asp:PlaceHolder runat="server" ID="phNewAgeShowcase"></asp:PlaceHolder>
        </div>
    </section>

    <!-- Download/CTA Section (Gradient Background) -->
    <section class="download-section newage-section text-center text-white" id="newage-download">
        <div class="container">
            <!-- Add NewAgeDownload widget here -->
            <asp:PlaceHolder runat="server" ID="phNewAgeDownload"></asp:PlaceHolder>
        </div>
    </section>

    <!-- Additional Content Section (Optional) -->
    <% if (phNewAgeContent.Controls.Count > 0) { %>
    <section class="container newage-section" id="newage-content">
        <asp:PlaceHolder runat="server" ID="phNewAgeContent"></asp:PlaceHolder>
    </section>
    <% } %>

</main>
          
<uc1:Footer runat="server" id="FooterNewAge" />

<!-- Bootstrap + Theme scripts -->
<script src="/sitebooking/Themes/NewAge/js/theme.js"></script>
