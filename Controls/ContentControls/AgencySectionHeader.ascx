<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AgencySectionHeader.ascx.cs" Inherits="WaiverFile.Controls.ContentControls.AgencySectionHeader" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Section Header - Agency Style -->
<div class="text-center mb-5">
    
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
