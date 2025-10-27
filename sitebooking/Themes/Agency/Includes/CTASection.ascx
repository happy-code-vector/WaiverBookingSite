<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Call to Action Section -->
<section class="py-5 text-center" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                
                <!-- CTA Title -->
                <cc1:CmsLiteral 
                    ID="CTATitle" 
                    runat="server" 
                    data-editable="true" 
                    data-name="CTA Title" 
                    data-defaultval="Ready to Get Started?"
                    CssClass="h2 fw-bold text-white mb-3 d-block" />
                
                <!-- CTA Description -->
                <cc1:CmsLiteral 
                    ID="CTADescription" 
                    runat="server" 
                    data-editable="true" 
                    data-name="CTA Description" 
                    data-defaultval="Join thousands of satisfied customers and experience the difference today."
                    CssClass="text-white fs-5 mb-4 d-block opacity-90" />
                
                <!-- CTA Button -->
                <asp:HyperLink 
                    ID="CTAButton" 
                    runat="server" 
                    data-editable="true" 
                    data-name="CTA Button" 
                    data-defaultval="/booking" 
                    data-defaulttext="Book Now" 
                    data-defaulttarget="_self"
                    CssClass="btn btn-light btn-lg rounded-pill px-5 py-3 fw-bold" />
                
            </div>
        </div>
    </div>
</section>
