<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Stat Counter -->
<div class="col-md-3 col-sm-6 mb-4 mb-md-0">
    <div class="stat-item text-center">
        
        <!-- Stat Icon -->
        <div class="mb-3">
            <cc1:CmsIcon 
                ID="StatIcon" 
                runat="server" 
                data-editable="true" 
                data-name="Stat Icon" 
                data-defaultval="ci-user-check"
                data-extra-class="fs-1 text-primary" />
        </div>
        
        <!-- Stat Number -->
        <cc1:CmsLiteral 
            ID="StatNumber" 
            runat="server" 
            data-editable="true" 
            data-name="Stat Number" 
            data-defaultval="1,234"
            CssClass="display-4 fw-bold text-primary mb-2 d-block" />
        
        <!-- Stat Label -->
        <cc1:CmsLiteral 
            ID="StatLabel" 
            runat="server" 
            data-editable="true" 
            data-name="Stat Label" 
            data-defaultval="Happy Clients"
            CssClass="text-body-secondary text-uppercase fw-semibold small d-block letter-spacing-2" />
        
    </div>
</div>
