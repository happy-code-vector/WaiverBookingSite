<%@ Control Language="C#" AutoEventWireup="true"  Inherits="WaiverFile.Core.Booking.WFSubControl" %>
<%@ Import Namespace="Waypoint.Core" %>
<%@ Import Namespace="WaiverFile.Core.Booking" %>
<%@ Import Namespace="WaiverFile.Core" %>

        <!-- Close page content wrapper -->
    </div>
</div>

<!-- Footer -->
<footer class="footer-stylish">
    <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-lg-8 text-center">
                <h4 class="text-white mb-4"><%= WaiverSiteRef.Name %></h4>
                <p class="mb-4">Modern booking and waiver management solution</p>
                
                <!-- Social Links -->
                <div class="mb-4">
                    <a class="social-link" href="#"><i class="ci-facebook"></i></a>
                    <a class="social-link" href="#"><i class="ci-x"></i></a>
                    <a class="social-link" href="#"><i class="ci-instagram"></i></a>
                    <a class="social-link" href="#"><i class="ci-linkedin"></i></a>
                </div>
                
                <p class="small mb-0">
                    &copy; <%= DateTime.Now.Year %> <%= WaiverSiteRef.Name %>. All rights reserved.
                </p>
                <p class="small mt-2">
                    <a href="#" class="me-3">Privacy Policy</a>
                    <a href="#">Terms of Service</a>
                </p>
            </div>
        </div>
    </div>
</footer>

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top" style="display: none;">
    <i class="ci-arrow-up"></i>
</a>

<script>
    // Scroll to top button
    window.addEventListener('scroll', function() {
        var scrollButton = document.querySelector('.scroll-to-top');
        if (window.pageYOffset > 100) {
            scrollButton.style.display = 'block';
        } else {
            scrollButton.style.display = 'none';
        }
    });
    
    // Smooth scroll
    document.querySelector('.scroll-to-top').addEventListener('click', function(e) {
        e.preventDefault();
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });
</script>
