<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Service Box - Creative Style -->
<div class="col-lg-3 col-md-6 text-center">
    <div class="service-box mt-5 mx-auto">
        <cc1:CmsIcon 
            ID="ServiceIcon" 
            runat="server" 
            data-editable="true" 
            data-name="Service Icon" 
            data-defaultval="ci-heart"
            data-extra-class="d-inline-block" 
            style="font-size: 4rem; color: #f4623a;" />
        
        <h3 class="h4 mb-2">
            <cc1:CmsLiteral 
                ID="ServiceTitle" 
                runat="server" 
                data-editable="true" 
                data-name="Service Title" 
                data-defaultval="Sturdy Themes" />
        </h3>
        
        <p class="text-muted mb-0">
            <cc1:CmsLiteral 
                ID="ServiceDescription" 
                runat="server" 
                data-editable="true" 
                data-name="Service Description" 
                data-defaultval="Our themes are updated regularly to keep them bug free!" />
        </p>
    </div>
</div>
