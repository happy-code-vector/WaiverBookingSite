<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Call to Action Section - Creative Style (replaces timeline) -->
<section class="cta">
    <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-lg-8 text-center">
                <h2 class="text-white mt-0">
                    <cc1:CmsLiteral 
                        ID="CTATitle" 
                        runat="server" 
                        data-editable="true" 
                        data-name="CTA Title" 
                        data-defaultval="Free Download at Start Bootstrap!" />
                </h2>
                <hr class="divider divider-light" />
                <p class="text-white-75 mb-4">
                    <cc1:CmsLiteral 
                        ID="CTADescription" 
                        runat="server" 
                        data-editable="true" 
                        data-name="CTA Description" 
                        data-defaultval="Ready to start your next project with us? Send us a message and we will get back to you as soon as possible!" />
                </p>
                <asp:HyperLink 
                    ID="CTAButton" 
                    runat="server" 
                    data-editable="true" 
                    data-name="CTA Button" 
                    data-defaultval="#contact" 
                    data-defaulttext="Get Started!"
                    CssClass="btn btn-light btn-xl">
                </asp:HyperLink>
            </div>
        </div>
    </div>
</section>
