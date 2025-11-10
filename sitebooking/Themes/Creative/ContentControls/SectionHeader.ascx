<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Section Header - Creative Style -->
<div class="text-center">
    <h2 class="mt-0">
        <cc1:CmsLiteral 
            ID="SectionTitle" 
            runat="server" 
            data-editable="true" 
            data-name="Section Title" 
            data-defaultval="At Your Service" />
    </h2>
    <hr class="divider" />
    <p class="text-muted mb-5">
        <cc1:CmsLiteral 
            ID="SectionSubtitle" 
            runat="server" 
            data-editable="true" 
            data-name="Section Subtitle" 
            data-defaultval="Lorem ipsum dolor sit amet consectetur." />
    </p>
</div>
