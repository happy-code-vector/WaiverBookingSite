<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFSubControl" %>

            
    <!-- Page footer -->
    <footer class="footer bg-dark pb-4" data-bs-theme="dark">
      <div class="container pb-md-3">
          
      <asp:PlaceHolder runat="server" ID="ph0"></asp:PlaceHolder>

        <!-- Subscription + Links -->
        <div class="py-5">
          <div class="row py-sm-1 py-md-2 py-lg-3">

            <!-- Subscription + Social buttons -->
            <div class="col-lg-5 mb-4 mb-sm-5 mb-lg-0">
            <asp:PlaceHolder runat="server" ID="ph1"></asp:PlaceHolder>
            </div>

            <!-- Columns with links that are turned into accordion on screens < 500px wide (sm breakpoint) -->
            <div class="col-lg-7">
              <div class="accordion ps-lg-4" id="footerLinks">
                <div class="row">
                  <div class="accordion-item col-sm-4 border-0">
                   <asp:PlaceHolder runat="server" ID="ph2"></asp:PlaceHolder>
                    <hr class="d-sm-none my-0">
                  </div>
                  <div class="accordion-item col-sm-4 border-0">
                   <asp:PlaceHolder runat="server" ID="ph3"></asp:PlaceHolder>
                   
                  </div>
                  <div class="accordion-item col-sm-4 border-0">
                  <asp:PlaceHolder runat="server" ID="ph4"></asp:PlaceHolder>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Copyright -->
        <p class="fs-xs text-body text-center text-lg-start mb-0">
          &copy; All rights reserved. Made with <i class="ci-heart-filled align-middle"></i> on <span class="animate-underline"><a class="animate-target text-white text-decoration-none" href="https://waiverbooking.com/" target="_blank">WaiverBooking</a></span>
        </p>
      </div>
    </footer>


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
