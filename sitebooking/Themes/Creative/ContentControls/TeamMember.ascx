<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Team Member - Creative Style -->
<div class="col-lg-4 col-md-6 text-center">
    <div class="mt-5">
        <div class="mb-2">
            <cc1:CmsIcon 
                ID="MemberIcon" 
                runat="server" 
                data-editable="true" 
                data-name="Member Icon" 
                data-defaultval="ci-user"
                data-extra-class="d-inline-block" 
                style="font-size: 3rem; color: #f4623a;" />
        </div>
        <h3 class="h4 mb-2">
            <cc1:CmsLiteral 
                ID="MemberName" 
                runat="server" 
                data-editable="true" 
                data-name="Member Name" 
                data-defaultval="John Doe" />
        </h3>
        <p class="text-muted mb-0">
            <cc1:CmsLiteral 
                ID="MemberRole" 
                runat="server" 
                data-editable="true" 
                data-name="Member Role" 
                data-defaultval="Lead Designer" />
        </p>
    </div>
</div>
