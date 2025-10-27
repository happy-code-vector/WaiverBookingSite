<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.sitebooking.Templates.WFCMSPageTemplateBase" %>
<%@ Register Src="includes/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="includes/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Panel runat="server" ID="pnlHead">
    <!-- Meta Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap 5 CSS from CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/sitebooking/Themes/Bootstrap/css/custom.css">
</asp:Panel>

<div id="top">
    <!-- Header -->
    <uc1:Header runat="server" id="Header1" />
    
    <!-- Main Content -->
    <main class="main-content">
        <!-- Hero Section / Top Content -->
        <section class="hero-section bg-light py-5">
            <div class="container">
                <asp:PlaceHolder runat="server" ID="ph0"></asp:PlaceHolder>
            </div>
        </section>
        
        <!-- Main Content Area -->
        <section class="content-section py-5">
            <div class="container">
                <asp:PlaceHolder runat="server" ID="ph1"></asp:PlaceHolder>
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
    
    <!-- Footer -->
    <uc1:Footer runat="server" id="Footer1" />
</div>

<!-- Bootstrap 5 JS Bundle from CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

<!-- Custom JavaScript -->
<script src="/sitebooking/Themes/Bootstrap/js/custom.js"></script>
