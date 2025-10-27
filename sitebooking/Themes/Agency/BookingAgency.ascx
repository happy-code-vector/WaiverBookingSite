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

	<!-- Custom Theme Styles -->
	<link rel="stylesheet" href="/sitebooking/Themes/Agency/css/agency.css">
    
    <script src="/sitebooking/vendor/choices.js/public/assets/scripts/choices.min.js"></script>
</asp:Panel>

                  
<uc1:Header runat="server" id="Header1" />

<!-- Page content -->
<main class="content-wrapper">
  <asp:PlaceHolder runat="server" ID="ph1"></asp:PlaceHolder>
  
  <section class="container pt-3 pt-sm-4 pt-lg-5 mt-lg-2 mt-xl-4 mt-xxl-5" id="mission" style="scroll-margin-top: 60px">
    <asp:PlaceHolder runat="server" ID="ph0"></asp:PlaceHolder>
  </section>

  <% if (ph2.Controls.Count>0 || ph3.Controls.Count>0){ %>
    <div class="container py-5 mb-2 mb-sm-3 mb-md-4 mb-lg-5 mt-lg-3 mt-xl-4">
      <section class="row row-cols-1 row-cols-md-2 g-0 overflow-hidden rounded-5">
        <div class="col bg-body-tertiary py-5 px-4 px-xl-5">
          <asp:PlaceHolder runat="server" ID="ph2"></asp:PlaceHolder>
        </div>
        <div class="col position-relative"> 
          <asp:PlaceHolder runat="server" ID="ph3"></asp:PlaceHolder>
        </div>
      </section>
    </div>
  <% } %>

  <section class="container pt-5 pb-5 mt-md-4 mt-xl-5 mb-xxl-3">
    <asp:PlaceHolder runat="server" ID="ph4"></asp:PlaceHolder>
  </section>
</main>
          
<uc1:Footer runat="server" id="Fotoer1" />

<!-- Bootstrap + Theme scripts -->
<script src="/sitebooking/Themes/Agency/js/theme.min.js"></script>
