<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Portfolio Section -->
<section class="portfolio-section py-5" id="portfolio">
    <div class="container">
        <div class="text-center mb-5">
            <h2 class="text-uppercase">
                <cc1:CmsLiteral 
                    ID="SectionTitle" 
                    runat="server" 
                    data-editable="true" 
                    data-name="Section Title" 
                    data-defaultval="Portfolio" />
            </h2>
            <h3 class="section-subheading text-muted">
                <cc1:CmsLiteral 
                    ID="SectionSubtitle" 
                    runat="server" 
                    data-editable="true" 
                    data-name="Section Subtitle" 
                    data-defaultval="Lorem ipsum dolor sit amet consectetur." />
            </h3>
        </div>
        <div class="row">
            <!-- Add PortfolioItem widgets here -->
        </div>
    </div>
</section>
