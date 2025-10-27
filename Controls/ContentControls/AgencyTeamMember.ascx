<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AgencyTeamMember.ascx.cs" Inherits="WaiverFile.Controls.ContentControls.AgencyTeamMember" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Team Member - Agency Style -->
<div class="col-lg-4">
    <div class="team-member">
        
        <!-- Member Photo -->
        <cc1:CmsImage 
            ID="MemberPhoto" 
            runat="server" 
            data-editable="true" 
            data-name="Member Photo" 
            data-defaultval="/sitebooking/Themes/Agency/images/team/1.jpg"
            CssClass="mx-auto rounded-circle" />
        
        <!-- Member Name -->
        <h4>
            <cc1:CmsLiteral 
                ID="MemberName" 
                runat="server" 
                data-editable="true" 
                data-name="Member Name" 
                data-defaultval="Kay Garland" />
        </h4>
        
        <!-- Member Position -->
        <p class="text-muted">
            <cc1:CmsLiteral 
                ID="MemberPosition" 
                runat="server" 
                data-editable="true" 
                data-name="Position" 
                data-defaultval="Lead Designer" />
        </p>
        
        <!-- Social Links -->
        <div class="d-flex justify-content-center gap-2 mt-3">
            <asp:HyperLink 
                ID="TwitterLink" 
                runat="server" 
                data-editable="true" 
                data-name="Twitter Link" 
                data-defaultval="#" 
                data-defaulttext="<i class='ci-twitter'></i>" 
                data-defaulttarget="_blank"
                CssClass="btn btn-dark btn-social mx-2" />
            
            <asp:HyperLink 
                ID="FacebookLink" 
                runat="server" 
                data-editable="true" 
                data-name="Facebook Link" 
                data-defaultval="#" 
                data-defaulttext="<i class='ci-facebook'></i>" 
                data-defaulttarget="_blank"
                CssClass="btn btn-dark btn-social mx-2" />
            
            <asp:HyperLink 
                ID="LinkedInLink" 
                runat="server" 
                data-editable="true" 
                data-name="LinkedIn Link" 
                data-defaultval="#" 
                data-defaulttext="<i class='ci-linkedin'></i>" 
                data-defaulttarget="_blank"
                CssClass="btn btn-dark btn-social mx-2" />
        </div>
        
    </div>
</div>
