<%@ Control Language="C#" AutoEventWireup="true"  Inherits="WaiverFile.sitebooking.Templates.WFCMSPageTemplateBase" %>
<%@ Register Src="includes/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="includes/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>

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
	<link rel="stylesheet" href="/sitebooking/Themes/Agency/css/theme.min.css" id="themestyles">
	<link rel="stylesheet" href="/sitebooking/vendor/choices.js/public/assets/styles/choices.min.css">

	<!-- Custom Theme Styles -->
	<link rel="stylesheet" href="/sitebooking/Themes/Agency/css/agency.css">
    
    <script src="/sitebooking/vendor/choices.js/public/assets/scripts/choices.min.js"></script>
</asp:Panel>

<div>
    
    <!-- Header/Navigation -->
    <uc1:Header runat="server" id="Header1" />

    <!-- Page content -->
    <main class="content-wrapper">
        
        <!-- Main Content Area -->
        <section class="container pt-5 pb-5 mt-md-4 mt-xl-5">
            <asp:PlaceHolder runat="server" ID="ph0"></asp:PlaceHolder>
        </section>

        <!-- Two Column Section (Optional) -->
        <% if (ph1.Controls.Count > 0 || ph2.Controls.Count > 0) { %>
        <section class="container pb-5 mb-md-4">
            <div class="row g-4">
                <div class="col-lg-6">
                    <asp:PlaceHolder runat="server" ID="ph1"></asp:PlaceHolder>
                </div>
                <div class="col-lg-6">
                    <asp:PlaceHolder runat="server" ID="ph2"></asp:PlaceHolder>
                </div>
            </div>
        </section>
        <% } %>

        <!-- Full Width Section (Optional) -->
        <% if (ph3.Controls.Count > 0) { %>
        <section class="container pb-5 mb-md-4">
            <asp:PlaceHolder runat="server" ID="ph3"></asp:PlaceHolder>
        </section>
        <% } %>

    </main>

    <!-- Footer -->
    <uc1:Footer runat="server" id="Footer1" />

    <!-- Back to top button -->
    <div class="floating-buttons position-fixed top-50 end-0 z-sticky me-3 me-xl-4 pb-4">
        <a class="btn-scroll-top btn btn-sm bg-body border-0 rounded-pill shadow animate-slide-end" href="#top">
            Top
            <i class="ci-arrow-right fs-base ms-1 me-n1 animate-target"></i>
            <span class="position-absolute top-0 start-0 w-100 h-100 border rounded-pill z-0"></span>
            <svg class="position-absolute top-0 start-0 w-100 h-100 z-1" viewBox="0 0 62 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                <rect x=".75" y=".75" width="60.5" height="30.5" rx="15.25" stroke="currentColor" stroke-width="1.5" stroke-miterlimit="10"/>
            </svg>
        </a>
    </div>

</div>

<!-- Bootstrap + Theme scripts -->
<script src="/sitebooking/Themes/Agency/js/theme.min.js"></script>
