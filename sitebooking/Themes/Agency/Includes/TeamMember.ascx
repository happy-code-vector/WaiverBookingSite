<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Team Member -->
<div class="col-lg-4 col-md-6 mb-4">
    <div class="team-member text-center">
        
        <!-- Member Photo -->
        <cc1:CmsImage 
            ID="MemberPhoto" 
            runat="server" 
            data-editable="true" 
            data-name="Member Photo" 
            data-defaultval="/sitebooking/Themes/Agency/images/team-placeholder.jpg"
            CssClass="rounded-circle img-fluid mb-4" 
            style="max-width: 225px;" />
        
        <!-- Member Name -->
        <cc1:CmsLiteral 
            ID="MemberName" 
            runat="server" 
            data-editable="true" 
            data-name="Member Name" 
            data-defaultval="Kay Garland"
            CssClass="h4 fw-bold mb-1 d-block" />
        
        <!-- Member Position -->
        <cc1:CmsLiteral 
            ID="MemberPosition" 
            runat="server" 
            data-editable="true" 
            data-name="Position" 
            data-defaultval="Lead Designer"
            CssClass="text-body-secondary mb-3 d-block" />
        
        <!-- Social Links (Optional) -->
        <div class="d-flex justify-content-center gap-2">
            <asp:HyperLink 
                ID="TwitterLink" 
                runat="server" 
                data-editable="true" 
                data-name="Twitter Link" 
                data-defaultval="#" 
                data-defaulttext="<i class='ci-twitter'></i>" 
                data-defaulttarget="_blank"
                CssClass="btn btn-icon btn-sm btn-outline-secondary rounded-circle" />
            
            <asp:HyperLink 
                ID="FacebookLink" 
                runat="server" 
                data-editable="true" 
                data-name="Facebook Link" 
                data-defaultval="#" 
                data-defaulttext="<i class='ci-facebook'></i>" 
                data-defaulttarget="_blank"
                CssClass="btn btn-icon btn-sm btn-outline-secondary rounded-circle" />
            
            <asp:HyperLink 
                ID="LinkedInLink" 
                runat="server" 
                data-editable="true" 
                data-name="LinkedIn Link" 
                data-defaultval="#" 
                data-defaulttext="<i class='ci-linkedin'></i>" 
                data-defaulttarget="_blank"
                CssClass="btn btn-icon btn-sm btn-outline-secondary rounded-circle" />
        </div>
        
    </div>
</div>
