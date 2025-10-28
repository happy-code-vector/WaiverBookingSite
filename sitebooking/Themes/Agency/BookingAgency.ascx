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
	<link rel="preload" href="/sitebooking/Themes/Agency/fonts/inter-variable-latin.woff2" as="font" type="font/woff2" crossorigin>

	<!-- Font icons -->
	<link rel="preload" href="/sitebooking/Themes/Agency/icons/cartzilla-icons.woff2" as="font" type="font/woff2" crossorigin>
	<link rel="stylesheet" href="/sitebooking/Themes/Agency/icons/cartzilla-icons.min.css">

	<!-- Bootstrap + Theme styles -->
	<link rel="preload" href="/sitebooking/Themes/Agency/css/theme.min.css" as="style">
  <link rel="preload" href="/sitebooking/Themes/Agency/css/theme.rtl.min.css" as="style">
	<link rel="stylesheet" href="/sitebooking/Themes/Agency/css/theme.min.css" id="themestyles">
	<link rel="stylesheet" href="/sitebooking/vendor/choices.js/public/assets/styles/choices.min.css">

	<!-- Custom Agency Theme Styles -->
	<link rel="stylesheet" href="/sitebooking/Themes/Agency/css/agency.css">
    
    <script src="/sitebooking/vendor/choices.js/public/assets/scripts/choices.min.js"></script>
</asp:Panel>

<uc1:Header runat="server" id="Header1" />

<!-- Page content -->
<main class="content-wrapper">
    
    <!-- Hero Section (Full Width) - Add AgencyHero widget here -->
    <asp:PlaceHolder runat="server" ID="ph0"></asp:PlaceHolder>
    
    <!-- Services Section -->
    <section class="container py-5 my-4" id="services">
        <!-- Add AgencySectionHeader widget here -->
        <asp:PlaceHolder runat="server" ID="ph1"></asp:PlaceHolder>
        
        <!-- Services Grid - Add 3x AgencyServiceItem widgets here -->
        <div class="row text-center">
            <asp:PlaceHolder runat="server" ID="ph2"></asp:PlaceHolder>
        </div>
    </section>

    <!-- Portfolio Section -->
    <section class="portfolio-section py-5" id="portfolio">
        <div class="container">
            <!-- Add AgencySectionHeader widget here -->
            <asp:PlaceHolder runat="server" ID="ph3"></asp:PlaceHolder>
            
            <!-- Portfolio Items Grid - Add 6x AgencyPortfolioItem widgets here -->
            <div class="row">
                <asp:PlaceHolder runat="server" ID="ph4"></asp:PlaceHolder>
            </div>
        </div>
    </section>

    <!-- Team Section -->
    <section class="team-section py-5" id="team">
        <div class="container">
            <!-- Add AgencySectionHeader widget here -->
            <asp:PlaceHolder runat="server" ID="ph5"></asp:PlaceHolder>
            
            <!-- Team Members Grid - Add 3x AgencyTeamMember widgets here -->
            <div class="row">
                <asp:PlaceHolder runat="server" ID="ph6"></asp:PlaceHolder>
            </div>
        </div>
    </section>

    <!-- Contact/About Section (Optional) -->
    <% if (ph7.Controls.Count > 0) { %>
    <section class="container py-5 my-4" id="contact">
        <asp:PlaceHolder runat="server" ID="ph7"></asp:PlaceHolder>
    </section>
    <% } %>

</main>
          
<uc1:Footer runat="server" id="Footer1" />

<!-- Bootstrap + Theme scripts -->
<script src="/sitebooking/Themes/Agency/js/theme.min.js"></script>
