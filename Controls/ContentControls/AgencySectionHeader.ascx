<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Section Header - Agency Style -->
<div class="text-center">
    
    <!-- Section Title -->
    <h2 class="text-uppercase">
        <cc1:CmsLiteral 
            ID="SectionTitle" 
            runat="server" 
            data-editable="true" 
            data-name="Section Title" 
            data-defaultval="Services" />
    </h2>
    
    <!-- Section Subtitle -->
    <h3 class="section-subheading text-muted">
        <cc1:CmsLiteral 
            ID="SectionSubtitle" 
            runat="server" 
            data-editable="true" 
            data-name="Section Subtitle" 
            data-defaultval="Lorem ipsum dolor sit amet consectetur." />
    </h3>
    
</div>

<div class="row text-center">
    <asp:PlaceHolder runat="server" ID="ph100"></asp:PlaceHolder>
</div>