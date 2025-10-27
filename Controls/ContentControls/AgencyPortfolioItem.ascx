<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AgencyPortfolioItem.ascx.cs" Inherits="WaiverFile.Controls.ContentControls.AgencyPortfolioItem" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Portfolio Item - Agency Style -->
<div class="col-lg-4 col-sm-6 mb-4">
    <div class="portfolio-item">
        
        <!-- Portfolio Image -->
        <cc1:CmsImage 
            ID="PortfolioImage" 
            runat="server" 
            data-editable="true" 
            data-name="Portfolio Image" 
            data-defaultval="/sitebooking/Themes/Agency/images/portfolio/01-thumbnail.jpg"
            CssClass="img-fluid" />
        
        <!-- Overlay with Title and Category -->
        <div class="portfolio-overlay">
            <div class="portfolio-overlay-content">
                
                <!-- Portfolio Title -->
                <h4>
                    <cc1:CmsLiteral 
                        ID="PortfolioTitle" 
                        runat="server" 
                        data-editable="true" 
                        data-name="Portfolio Title" 
                        data-defaultval="Threads" />
                </h4>
                
                <!-- Portfolio Category -->
                <p class="text-muted mb-0">
                    <cc1:CmsLiteral 
                        ID="PortfolioCategory" 
                        runat="server" 
                        data-editable="true" 
                        data-name="Category" 
                        data-defaultval="Illustration" />
                </p>
                
            </div>
        </div>
        
    </div>
</div>
