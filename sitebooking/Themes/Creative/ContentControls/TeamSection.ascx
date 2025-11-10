<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Team Section - Creative Style -->
<section class="page-section" id="team">
    <div class="container px-4 px-lg-5">
        <h2 class="text-center mt-0">
            <cc1:CmsLiteral 
                ID="SectionTitle" 
                runat="server" 
                data-editable="true" 
                data-name="Section Title" 
                data-defaultval="Our Team" />
        </h2>
        <hr class="divider" />
        <div class="row gx-4 gx-lg-5">
            <!-- Add TeamMember widgets here -->
        </div>
    </div>
</section>
