<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Portfolio Item -->
<div class="col-lg-4 col-md-6 mb-4">
    <div class="portfolio-item position-relative overflow-hidden rounded">
        
        <!-- Portfolio Image -->
        <cc1:CmsImage 
            ID="PortfolioImage" 
            runat="server" 
            data-editable="true" 
            data-name="Portfolio Image" 
            data-defaultval="/sitebooking/Themes/Agency/images/portfolio-placeholder.jpg"
            CssClass="img-fluid w-100" />
        
        <!-- Overlay with Title and Category -->
        <div class="portfolio-overlay position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center justify-content-center flex-column text-center p-4">
            
            <!-- Portfolio Title -->
            <cc1:CmsLiteral 
                ID="PortfolioTitle" 
                runat="server" 
                data-editable="true" 
                data-name="Portfolio Title" 
                data-defaultval="Project Name"
                CssClass="h4 fw-bold text-dark mb-2 d-block" />
            
            <!-- Portfolio Category -->
            <cc1:CmsLiteral 
                ID="PortfolioCategory" 
                runat="server" 
                data-editable="true" 
                data-name="Category" 
                data-defaultval="Branding"
                CssClass="text-dark-emphasis d-block" />
            
            <!-- Optional Link -->
            <asp:HyperLink 
                ID="PortfolioLink" 
                runat="server" 
                data-editable="true" 
                data-name="Portfolio Link" 
                data-defaultval="#" 
                data-defaulttext="View Details" 
                data-defaulttarget="_self"
                CssClass="btn btn-sm btn-dark mt-3" />
            
        </div>
        
    </div>
</div>
