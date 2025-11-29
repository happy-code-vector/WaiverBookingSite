<%@ Control Language="C#" AutoEventWireup="true"  Inherits="WaiverFile.Core.Booking.WFSubControl" %>
<%@ Import Namespace="Waypoint.Core" %>
<%@ Import Namespace="WaiverFile.Core.Booking" %>
<%@ Import Namespace="WaiverFile.Core" %>

<!-- Footer -->
<footer class="footer newage-footer py-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 mb-4 mb-lg-0">
                <h5 class="text-white mb-3"><%= WaiverSiteRef.Name %></h5>
                <p class="small mb-3">Modern booking and waiver management solution.</p>
                <asp:PlaceHolder runat="server" ID="phFooterContent1"></asp:PlaceHolder>
            </div>
            <div class="col-lg-4 mb-4 mb-lg-0">
                <h6 class="text-white mb-3">Quick Links</h6>
                <ul class="list-unstyled small">
                    <li class="mb-2"><a href="<%= WaiverSiteRef.BasePathRelativeBooking %>" class="text-decoration-none">Home</a></li>
                    <li class="mb-2"><a href="<%= WaiverSiteRef.BasePathRelativeBooking %>/CustomerBookings.aspx" class="text-decoration-none">My Bookings</a></li>
                    <li class="mb-2"><a href="<%= WaiverSiteRef.BasePathRelativeBooking %>/CustomerOrders.aspx" class="text-decoration-none">Orders</a></li>
                </ul>
                <asp:PlaceHolder runat="server" ID="phFooterContent2"></asp:PlaceHolder>
            </div>
            <div class="col-lg-4">
                <h6 class="text-white mb-3">Connect</h6>
                <div class="d-flex gap-2">
                    <a href="#" class="btn btn-icon btn-sm btn-newage-social rounded-circle" aria-label="Facebook">
                        <i class="ci-facebook"></i>
                    </a>
                    <a href="#" class="btn btn-icon btn-sm btn-newage-social rounded-circle" aria-label="Twitter">
                        <i class="ci-x"></i>
                    </a>
                    <a href="#" class="btn btn-icon btn-sm btn-newage-social rounded-circle" aria-label="Instagram">
                        <i class="ci-instagram"></i>
                    </a>
                </div>
                <asp:PlaceHolder runat="server" ID="phFooterContent3"></asp:PlaceHolder>
            </div>
        </div>
        <hr class="my-4 border-secondary">
        <div class="row align-items-center">
            <div class="col-md-6 text-center text-md-start">
                <p class="small mb-0">&copy; <%= DateTime.Now.Year %> <%= WaiverSiteRef.Name %>. All rights reserved.</p>
            </div>
            <div class="col-md-6 text-center text-md-end">
                <p class="small mb-0">
                    <a href="#" class="text-decoration-none me-3">Privacy Policy</a>
                    <a href="#" class="text-decoration-none">Terms of Service</a>
                </p>
            </div>
        </div>
    </div>
</footer>
