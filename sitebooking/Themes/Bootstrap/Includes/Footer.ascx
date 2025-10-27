<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFSubControl" %>

<!-- Footer -->
<footer class="footer bg-dark text-white py-5 mt-5">
    <div class="container">
        <!-- Top Placeholder -->
        <asp:PlaceHolder runat="server" ID="ph0"></asp:PlaceHolder>
        
        <!-- Main Footer Content -->
        <div class="row g-4 py-4">
            <!-- Column 1 -->
            <div class="col-lg-4 col-md-6">
                <asp:PlaceHolder runat="server" ID="ph1"></asp:PlaceHolder>
            </div>
            
            <!-- Column 2 -->
            <div class="col-lg-4 col-md-6">
                <asp:PlaceHolder runat="server" ID="ph2"></asp:PlaceHolder>
            </div>
            
            <!-- Column 3 -->
            <div class="col-lg-4 col-md-12">
                <asp:PlaceHolder runat="server" ID="ph3"></asp:PlaceHolder>
            </div>
        </div>
        
        <!-- Additional Content Placeholder -->
        <asp:PlaceHolder runat="server" ID="ph4"></asp:PlaceHolder>
        
        <!-- Footer Bottom -->
        <hr class="my-4 bg-secondary">
        
        <div class="row align-items-center">
            <div class="col-md-6 text-center text-md-start">
                <p class="mb-0 small">
                    &copy; <%= DateTime.Now.Year %> All rights reserved.
                </p>
            </div>
            <div class="col-md-6 text-center text-md-end">
                <p class="mb-0 small">
                    Powered by <a href="https://waiverbooking.com/" target="_blank" class="text-white text-decoration-none">
                        <strong>WaiverBooking</strong>
                    </a>
                </p>
            </div>
        </div>
    </div>
</footer>

<!-- Back to Top Button -->
<a href="#top" class="btn btn-primary position-fixed bottom-0 end-0 m-3 rounded-circle d-none" id="backToTop" style="width: 50px; height: 50px; z-index: 1000;">
    <i class="bi bi-arrow-up"></i>
</a>

<script>
    // Back to top button functionality
    window.addEventListener('scroll', function() {
        const backToTop = document.getElementById('backToTop');
        if (window.pageYOffset > 300) {
            backToTop.classList.remove('d-none');
        } else {
            backToTop.classList.add('d-none');
        }
    });
</script>
