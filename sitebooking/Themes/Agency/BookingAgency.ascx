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



        <div>

             <!-- Search offcanvas -->
 <div class="offcanvas offcanvas-top" id="searchBox" data-bs-backdrop="static" tabindex="-1">
   <div class="offcanvas-header border-bottom p-0 py-lg-1">
     <div class="container d-flex align-items-center">
         <asp:TextBox runat="server" ID="txtSearch" TextMode="Search" CssClass="form-control form-control-lg fs-lg border-0 rounded-0 py-3 ps-0" placeholder="Search the products" data-autofocus="offcanvas"></asp:TextBox>

       <button type="reset" class="btn-close fs-lg" data-bs-dismiss="offcanvas" aria-label="Close"></button>
     </div>
   </div>
   <div class="offcanvas-body px-0">
     <div class="container text-center">
       <svg class="text-body-tertiary opacity-60 mb-4" xmlns="http://www.w3.org/2000/svg" width="60" viewBox="0 0 512 512" fill="currentColor"><path d="M340.115,361.412l-16.98-16.98c-34.237,29.36-78.733,47.098-127.371,47.098C87.647,391.529,0,303.883,0,195.765S87.647,0,195.765,0s195.765,87.647,195.765,195.765c0,48.638-17.738,93.134-47.097,127.371l16.98,16.98l11.94-11.94c5.881-5.881,15.415-5.881,21.296,0l112.941,112.941c5.881,5.881,5.881,15.416,0,21.296l-45.176,45.176c-5.881,5.881-15.415,5.881-21.296,0L328.176,394.648c-5.881-5.881-5.881-15.416,0-21.296L340.115,361.412z M195.765,361.412c91.484,0,165.647-74.163,165.647-165.647S287.249,30.118,195.765,30.118S30.118,104.28,30.118,195.765S104.28,361.412,195.765,361.412z M360.12,384l91.645,91.645l23.88-23.88L384,360.12L360.12,384z M233.034,233.033c5.881-5.881,15.415-5.881,21.296,0c5.881,5.881,5.881,15.416,0,21.296c-32.345,32.345-84.786,32.345-117.131,0c-5.881-5.881-5.881-15.415,0-21.296c5.881-5.881,15.416-5.881,21.296,0C179.079,253.616,212.45,253.616,233.034,233.033zM135.529,180.706c-12.475,0-22.588-10.113-22.588-22.588c0-12.475,10.113-22.588,22.588-22.588c12.475,0,22.588,10.113,22.588,22.588C158.118,170.593,148.005,180.706,135.529,180.706z M256,180.706c-12.475,0-22.588-10.113-22.588-22.588c0-12.475,10.113-22.588,22.588-22.588s22.588,10.113,22.588,22.588C278.588,170.593,268.475,180.706,256,180.706z"/></svg>
       <h6 class="mb-2">Your search results will appear here</h6>
       <p class="fs-sm mb-0">Start typing in the search field above to see instant search results.</p>
     </div>
   </div>
 </div>

            
    <!-- Shopping cart offcanvas -->
    <div class="offcanvas offcanvas-end pb-sm-2 px-sm-2" id="shoppingCart" tabindex="-1" aria-labelledby="shoppingCartLabel" style="width: 500px">

      <!-- Header -->
      <div class="offcanvas-header flex-column align-items-start py-3 pt-lg-4">
        <div class="d-flex align-items-center justify-content-between w-100">
          <h4 class="offcanvas-title" id="shoppingCartLabel">Cart (3)</h4>
          <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
      </div>

      <!-- Items -->
      <div class="offcanvas-body d-flex flex-column gap-4 pt-2">

        <!-- Item -->
        <div class="d-flex align-items-center">
          <a class="flex-sm-shrink-0" href="shop-product-marketplace.html" style="width: 142px">
            <div class="ratio bg-body-tertiary rounded overflow-hidden" style="--cz-aspect-ratio: calc(110 / 142 * 100%)">
              <img src="assets/img/home/marketplace/cart/01.jpg" alt="Thumbnail">
            </div>
          </a>
          <div class="w-100 min-w-0 ps-3">
            <h5 class="d-flex animate-underline mb-2">
              <a class="d-block fs-sm fw-medium text-truncate animate-target" href="shop-product-marketplace.html">Multi device mockup PSD</a>
            </h5>
            <div class="h6 pb-1 mb-2">$27</div>
            <div class="d-flex align-items-center justify-content-between gap-1">
              <div class="w-100" style="max-width: 185px">
                <select class="form-select form-select-sm rounded-pill" data-select='{
                  "classNames": {
                    "containerInner": ["form-select", "form-select-sm", "rounded-pill"]
                  },
                  "removeItemButton": false
                }' aria-label="Small pill select">
                  <option value="standard">Standard license</option>
                  <option value="extended">Extended license</option>
                </select>
              </div>
              <button type="button" class="btn btn-icon btn-sm flex-shrink-0 fs-sm" data-bs-toggle="tooltip" data-bs-custom-class="tooltip-sm" data-bs-title="Remove" aria-label="Remove from cart">
                <i class="ci-trash fs-base"></i>
              </button>
            </div>
          </div>
        </div>

        <!-- Item -->
        <div class="d-flex align-items-center">
          <a class="flex-sm-shrink-0" href="shop-product-marketplace.html" style="width: 142px">
            <div class="ratio bg-body-tertiary rounded overflow-hidden" style="--cz-aspect-ratio: calc(110 / 142 * 100%)">
              <img src="assets/img/home/marketplace/cart/02.jpg" alt="Thumbnail">
            </div>
          </a>
          <div class="w-100 min-w-0 ps-3">
            <h5 class="d-flex animate-underline mb-2">
              <a class="d-block fs-sm fw-medium text-truncate animate-target" href="shop-product-marketplace.html">Isometric device mockups</a>
            </h5>
            <div class="h6 pb-1 mb-2">$12</div>
            <div class="d-flex align-items-center justify-content-between gap-2">
              <div class="w-100" style="max-width: 185px">
                <select class="form-select form-select-sm rounded-pill" data-select='{
                  "classNames": {
                    "containerInner": ["form-select", "form-select-sm", "rounded-pill"]
                  },
                  "removeItemButton": false
                }' aria-label="Small pill select">
                  <option value="standard">Standard license</option>
                  <option value="extended">Extended license</option>
                </select>
              </div>
              <button type="button" class="btn btn-icon btn-sm flex-shrink-0 fs-sm" data-bs-toggle="tooltip" data-bs-custom-class="tooltip-sm" data-bs-title="Remove" aria-label="Remove from cart">
                <i class="ci-trash fs-base"></i>
              </button>
            </div>
          </div>
        </div>

        <!-- Item -->
        <div class="d-flex align-items-center">
          <a class="flex-sm-shrink-0" href="shop-product-marketplace.html" style="width: 142px">
            <div class="ratio bg-body-tertiary rounded overflow-hidden" style="--cz-aspect-ratio: calc(110 / 142 * 100%)">
              <img src="assets/img/home/marketplace/cart/03.jpg" alt="Thumbnail">
            </div>
          </a>
          <div class="w-100 min-w-0 ps-3">
            <h5 class="d-flex animate-underline mb-2">
              <a class="d-block fs-sm fw-medium text-truncate animate-target" href="shop-product-marketplace.html">Modern poster with abstract shapes</a>
            </h5>
            <div class="h6 pb-1 mb-2">$8</div>
            <div class="d-flex align-items-center justify-content-between gap-2">
              <div class="w-100" style="max-width: 185px">
                <select class="form-select form-select-sm rounded-pill" data-select='{
                  "classNames": {
                    "containerInner": ["form-select", "form-select-sm", "rounded-pill"]
                  },
                  "removeItemButton": false
                }' aria-label="Small pill select">
                  <option value="standard">Standard license</option>
                  <option value="extended">Extended license</option>
                </select>
              </div>
              <button type="button" class="btn btn-icon btn-sm flex-shrink-0 fs-sm" data-bs-toggle="tooltip" data-bs-custom-class="tooltip-sm" data-bs-title="Remove" aria-label="Remove from cart">
                <i class="ci-trash fs-base"></i>
              </button>
            </div>
          </div>
        </div>
      </div>

      <!-- Footer -->
      <div class="offcanvas-header flex-column align-items-start">
        <div class="d-flex align-items-center justify-content-between w-100 mb-3 mb-md-4">
          <span class="text-light-emphasis">Subtotal:</span>
          <span class="h6 mb-0">$47</span>
        </div>
        <a class="btn btn-lg btn-dark w-100 rounded-pill" href="checkout-marketplace.html">Checkout</a>
      </div>
    </div>

                  
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

          <!-- Contact form -->
          <div class="col bg-body-tertiary py-5 px-4 px-xl-5">
           <asp:PlaceHolder runat="server" ID="ph2"></asp:PlaceHolder>
          </div>

          <!-- Image -->
          <div class="col position-relative"> 
           <asp:PlaceHolder runat="server" ID="ph3"></asp:PlaceHolder>
          </div>
        </section>
       </div>
        <%} %>



        <section class="container pt-5 pb-5 mt-md-4 mt-xl-5 mb-xxl-3">

             <asp:PlaceHolder runat="server" ID="ph4"></asp:PlaceHolder>

     
       
      </section>


        </main>


            
  <uc1:Footer runat="server" id="Fotoer1" />


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
