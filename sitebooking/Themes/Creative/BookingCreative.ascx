<%@ Control Language="C#" AutoEventWireup="true"  Inherits="WaiverFile.sitebooking.Templates.WFCMSPageTemplateBase" %>

<!-- Masthead -->
<header class="masthead">
    <div class="container px-4 px-lg-5 h-100">
        <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
            <div class="col-lg-8 align-self-end">
                <h1 class="text-white font-weight-bold">
                    <asp:PlaceHolder runat="server" ID="ph0"></asp:PlaceHolder>
                </h1>
                <hr class="divider divider-light" />
            </div>
            <div class="col-lg-8 align-self-baseline">
                <p class="text-white-75 mb-5">
                    <asp:PlaceHolder runat="server" ID="ph1"></asp:PlaceHolder>
                </p>
            </div>
        </div>
    </div>
</header>

<!-- About Section -->
<section class="page-section bg-primary" id="about">
    <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-lg-8 text-center">
                <asp:PlaceHolder runat="server" ID="ph2"></asp:PlaceHolder>
            </div>
        </div>
    </div>
</section>

<!-- Services Section -->
<section class="page-section" id="services">
    <div class="container px-4 px-lg-5">
        <h2 class="text-center mt-0">At Your Service</h2>
        <hr class="divider" />
        <div class="row gx-4 gx-lg-5">
            <asp:PlaceHolder runat="server" ID="ph3"></asp:PlaceHolder>
        </div>
    </div>
</section>

<!-- Portfolio Section -->
<section id="portfolio">
    <div class="container-fluid p-0">
        <div class="row g-0">
            <asp:PlaceHolder runat="server" ID="ph4"></asp:PlaceHolder>
        </div>
    </div>
</section>

<!-- Call to Action -->
<section class="cta">
    <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-lg-8 text-center">
                <asp:PlaceHolder runat="server" ID="ph5"></asp:PlaceHolder>
            </div>
        </div>
    </div>
</section>

<!-- Contact Section -->
<section class="page-section" id="contact">
    <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-lg-8 col-xl-6 text-center">
                <asp:PlaceHolder runat="server" ID="ph6"></asp:PlaceHolder>
            </div>
        </div>
    </div>
</section>
