<%@ Control Language="C#" AutoEventWireup="true"  Inherits="WaiverFile.sitebooking.Templates.WFCMSPageTemplateBase" %>
<%@ Register Src="~/sitebooking/Controls/NavbarBooking.ascx" TagPrefix="uc1" TagName="NavbarBooking" %>
<%@ Register Src="includes/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="includes/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Panel runat="server" ID="pnlHeadBooking">
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
	<link rel="stylesheet" href="/sitebooking/Themes/NewAge/css/theme.min.css" id="themestylesBooking">
	<link rel="stylesheet" href="/sitebooking/vendor/choices.js/public/assets/styles/choices.min.css">

	<!-- Custom NewAge Theme Styles -->
	<link rel="stylesheet" href="/sitebooking/Themes/NewAge/css/newage.css">
    
    <script src="/sitebooking/vendor/choices.js/public/assets/scripts/choices.min.js"></script>
</asp:Panel>

<uc1:Header runat="server" id="HeaderBookingNewAge" />

<!-- Page content -->
<main class="content-wrapper">
    
    <!-- Hero Section (Full Width Gradient) -->
    <section class="newage-hero text-center text-white py-5">
        <div class="container">
            <asp:PlaceHolder runat="server" ID="phBookingHero"></asp:PlaceHolder>
        </div>
    </section>
    
    <!-- Main Content Area -->
    <section class="container newage-section" id="booking-content">
        <div class="row">
            <div class="col-lg-8 mx-auto">
                <asp:PlaceHolder runat="server" ID="phBookingMain"></asp:PlaceHolder>
            </div>
        </div>
    </section>

</main>
          
<uc1:Footer runat="server" id="FooterBookingNewAge" />

<!-- Bootstrap + Theme scripts -->
<script src="/sitebooking/Themes/NewAge/js/theme.js"></script>
