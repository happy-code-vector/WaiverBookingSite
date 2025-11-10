<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Services Section - Creative Style -->
<section class="page-section" id="services">
    <div class="container px-4 px-lg-5">
        <h2 class="text-center mt-0">
            <cc1:CmsLiteral 
                ID="SectionTitle" 
                runat="server" 
                data-editable="true" 
                data-name="Section Title" 
                data-defaultval="At Your Service" />
        </h2>
        <hr class="divider" />
        <div class="row gx-4 gx-lg-5">
            <!-- Add ServiceItem widgets here -->
        </div>
    </div>
</section>
