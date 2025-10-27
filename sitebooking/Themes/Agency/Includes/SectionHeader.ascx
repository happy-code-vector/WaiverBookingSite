<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Section Header -->
<div class="text-center mb-5">
    
    <!-- Section Title -->
    <cc1:CmsLiteral 
        ID="SectionTitle" 
        runat="server" 
        data-editable="true" 
        data-name="Section Title" 
        data-defaultval="Services"
        CssClass="h2 fw-bold text-uppercase mb-3 d-block" />
    
    <!-- Section Subtitle -->
    <cc1:CmsLiteral 
        ID="SectionSubtitle" 
        runat="server" 
        data-editable="true" 
        data-name="Section Subtitle" 
        data-defaultval="Lorem ipsum dolor sit amet consectetur."
        CssClass="text-body-secondary fs-5 d-block" />
    
</div>
