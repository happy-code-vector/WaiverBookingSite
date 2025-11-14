<%@ Control Language="C#" AutoEventWireup="true"  Inherits="WaiverFile.Core.Booking.WFSubControl" %>

<!-- Footer -->
<footer class="footer bg-black small text-center text-white-50">
    <div class="container px-4 px-lg-5">
        <div class="row">
            <div class="col-lg-12">
                <asp:PlaceHolder runat="server" ID="ph0"></asp:PlaceHolder>
                
                <p class="mb-0">
                    Copyright &copy; <%= DateTime.Now.Year %> <%= WaiverSiteRef.Name %>. All rights reserved.
                </p>
            </div>
        </div>
    </div>
</footer>
