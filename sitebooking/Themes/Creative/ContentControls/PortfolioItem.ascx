<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Portfolio Box - Creative Style -->
<div class="col-lg-4 col-sm-6">
    <a class="portfolio-box" href="#" title="">
        <cc1:CmsImage 
            ID="PortfolioImage" 
            runat="server" 
            data-editable="true" 
            data-name="Portfolio Image" 
            data-defaultval="/sitebooking/Themes/Creative/images/portfolio/1.jpg"
            CssClass="img-fluid" />
        
        <div class="portfolio-box-caption">
            <div class="project-category text-white-50">
                <cc1:CmsLiteral 
                    ID="ProjectCategory" 
                    runat="server" 
                    data-editable="true" 
                    data-name="Category" 
                    data-defaultval="Category" />
            </div>
            <div class="project-name">
                <cc1:CmsLiteral 
                    ID="ProjectName" 
                    runat="server" 
                    data-editable="true" 
                    data-name="Project Name" 
                    data-defaultval="Project Name" />
            </div>
        </div>
    </a>
</div>
