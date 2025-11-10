<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- About Content - Creative Style -->
<h2 class="text-white mt-0">
    <cc1:CmsLiteral 
        ID="AboutTitle" 
        runat="server" 
        data-editable="true" 
        data-name="About Title" 
        data-defaultval="We've got what you need!" />
</h2>
<hr class="divider divider-light" />
<p class="text-white-75 mb-4">
    <cc1:CmsLiteral 
        ID="AboutDescription" 
        runat="server" 
        data-editable="true" 
        data-name="About Description" 
        data-defaultval="Start Bootstrap has everything you need to get your new website up and running in no time! Choose one of our open source, free to download, and easy to use themes! No strings attached!" />
</p>
<asp:HyperLink 
    ID="AboutButton" 
    runat="server" 
    data-editable="true" 
    data-name="About Button" 
    data-defaultval="#services" 
    data-defaulttext="Get Started!"
    CssClass="btn btn-light btn-xl">
</asp:HyperLink>
