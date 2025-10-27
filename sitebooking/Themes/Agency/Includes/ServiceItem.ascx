<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Service Item -->
<div class="col-md-4 mb-4 mb-md-0">
    <div class="service-item text-center px-3 py-4">
        
        <!-- Service Icon -->
        <div class="mb-4">
            <cc1:CmsIcon 
                ID="ServiceIcon" 
                runat="server" 
                data-editable="true" 
                data-name="Service Icon" 
                data-defaultval="ci-shopping-cart"
                data-extra-class="fs-1 text-primary p-4 rounded-circle bg-body-secondary" />
        </div>
        
        <!-- Service Title -->
        <cc1:CmsLiteral 
            ID="ServiceTitle" 
            runat="server" 
            data-editable="true" 
            data-name="Service Title" 
            data-defaultval="E-Commerce"
            CssClass="h4 fw-bold mb-3 d-block" />
        
        <!-- Service Description -->
        <cc1:CmsLiteral 
            ID="ServiceDescription" 
            runat="server" 
            data-editable="true" 
            data-name="Service Description" 
            data-defaultval="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit."
            data-textmode="richtext"
            CssClass="text-body-secondary" />
        
    </div>
</div>
