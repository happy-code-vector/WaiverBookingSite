<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Service Item - Agency Style -->
<div class="col-md-4">
    <div class="service-item">
        
        <!-- Service Icon -->
        <span class="d-block mb-3">
            <cc1:CmsIcon 
                ID="ServiceIcon" 
                runat="server" 
                data-editable="true" 
                data-name="Service Icon" 
                data-defaultval="ci-shopping-cart"
                data-extra-class="" />
        </span>
        
        <!-- Service Title -->
        <h4 class="my-3">
            <cc1:CmsLiteral 
                ID="ServiceTitle" 
                runat="server" 
                data-editable="true" 
                data-name="Service Title" 
                data-defaultval="E-Commerce" />
        </h4>
        
        <!-- Service Description -->
        <p class="text-muted">
            <cc1:CmsLiteral 
                ID="ServiceDescription" 
                runat="server" 
                data-editable="true" 
                data-name="Service Description" 
                data-defaultval="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit." />
        </p>
        
    </div>
</div>
