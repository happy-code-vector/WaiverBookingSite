<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Contact Info Block -->
<div class="contact-info-block p-4 bg-body-tertiary rounded">
    
    <!-- Contact Icon -->
    <div class="mb-3">
        <cc1:CmsIcon 
            ID="ContactIcon" 
            runat="server" 
            data-editable="true" 
            data-name="Contact Icon" 
            data-defaultval="ci-mail"
            data-extra-class="fs-2 text-primary" />
    </div>
    
    <!-- Contact Title -->
    <cc1:CmsLiteral 
        ID="ContactTitle" 
        runat="server" 
        data-editable="true" 
        data-name="Contact Title" 
        data-defaultval="Email Us"
        CssClass="h5 fw-bold mb-2 d-block" />
    
    <!-- Contact Details -->
    <cc1:CmsLiteral 
        ID="ContactDetails" 
        runat="server" 
        data-editable="true" 
        data-name="Contact Details" 
        data-defaultval="info@example.com"
        CssClass="text-body-secondary d-block" />
    
    <!-- Optional Link -->
    <asp:HyperLink 
        ID="ContactLink" 
        runat="server" 
        data-editable="true" 
        data-name="Contact Link" 
        data-defaultval="mailto:info@example.com" 
        data-defaulttext="Send Message" 
        data-defaulttarget="_self"
        CssClass="btn btn-sm btn-outline-primary mt-3" />
    
</div>
