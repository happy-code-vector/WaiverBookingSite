<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Portfolio Section - Agency Style -->
<section class="content-section py-5 bg-light">
    <div class="container">
        
        <!-- Section Header -->
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
        
        <!-- Portfolio Items -->
        <div class="row text-center">
            
            <!-- Portfolio Item 1 -->
            <div class="col-lg-4 col-sm-6 mb-4">
                <div class="portfolio-item">
                    <cc1:CmsImage 
                        ID="PortfolioImage1" 
                        runat="server" 
                        data-editable="true" 
                        data-name="Portfolio 1 Image" 
                        data-defaultval="/sitebooking/Themes/Agency/images/portfolio/1.jpg"
                        CssClass="img-fluid" />
                    <div class="portfolio-overlay">
                        <div class="portfolio-overlay-content">
                            <h4>
                                <cc1:CmsLiteral 
                                    ID="PortfolioTitle1" 
                                    runat="server" 
                                    data-editable="true" 
                                    data-name="Portfolio 1 Title" 
                                    data-defaultval="Threads" />
                            </h4>
                            <p class="text-muted mb-0">
                                <cc1:CmsLiteral 
                                    ID="PortfolioCategory1" 
                                    runat="server" 
                                    data-editable="true" 
                                    data-name="Portfolio 1 Category" 
                                    data-defaultval="Illustration" />
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Portfolio Item 2 -->
            <div class="col-lg-4 col-sm-6 mb-4">
                <div class="portfolio-item">
                    <cc1:CmsImage 
                        ID="PortfolioImage2" 
                        runat="server" 
                        data-editable="true" 
                        data-name="Portfolio 2 Image" 
                        data-defaultval="/sitebooking/Themes/Agency/images/portfolio/2.jpg"
                        CssClass="img-fluid" />
                    <div class="portfolio-overlay">
                        <div class="portfolio-overlay-content">
                            <h4>
                                <cc1:CmsLiteral 
                                    ID="PortfolioTitle2" 
                                    runat="server" 
                                    data-editable="true" 
                                    data-name="Portfolio 2 Title" 
                                    data-defaultval="Explore" />
                            </h4>
                            <p class="text-muted mb-0">
                                <cc1:CmsLiteral 
                                    ID="PortfolioCategory2" 
                                    runat="server" 
                                    data-editable="true" 
                                    data-name="Portfolio 2 Category" 
                                    data-defaultval="Graphic Design" />
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Portfolio Item 3 -->
            <div class="col-lg-4 col-sm-6 mb-4">
                <div class="portfolio-item">
                    <cc1:CmsImage 
                        ID="PortfolioImage3" 
                        runat="server" 
                        data-editable="true" 
                        data-name="Portfolio 3 Image" 
                        data-defaultval="/sitebooking/Themes/Agency/images/portfolio/3.jpg"
                        CssClass="img-fluid" />
                    <div class="portfolio-overlay">
                        <div class="portfolio-overlay-content">
                            <h4>
                                <cc1:CmsLiteral 
                                    ID="PortfolioTitle3" 
                                    runat="server" 
                                    data-editable="true" 
                                    data-name="Portfolio 3 Title" 
                                    data-defaultval="Finish" />
                            </h4>
                            <p class="text-muted mb-0">
                                <cc1:CmsLiteral 
                                    ID="PortfolioCategory3" 
                                    runat="server" 
                                    data-editable="true" 
                                    data-name="Portfolio 3 Category" 
                                    data-defaultval="Identity" />
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Portfolio Item 4 -->
            <div class="col-lg-4 col-sm-6 mb-4">
                <div class="portfolio-item">
                    <cc1:CmsImage 
                        ID="PortfolioImage4" 
                        runat="server" 
                        data-editable="true" 
                        data-name="Portfolio 4 Image" 
                        data-defaultval="/sitebooking/Themes/Agency/images/portfolio/4.jpg"
                        CssClass="img-fluid" />
                    <div class="portfolio-overlay">
                        <div class="portfolio-overlay-content">
                            <h4>
                                <cc1:CmsLiteral 
                                    ID="PortfolioTitle4" 
                                    runat="server" 
                                    data-editable="true" 
                                    data-name="Portfolio 4 Title" 
                                    data-defaultval="Lines" />
                            </h4>
                            <p class="text-muted mb-0">
                                <cc1:CmsLiteral 
                                    ID="PortfolioCategory4" 
                                    runat="server" 
                                    data-editable="true" 
                                    data-name="Portfolio 4 Category" 
                                    data-defaultval="Branding" />
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Portfolio Item 5 -->
            <div class="col-lg-4 col-sm-6 mb-4">
                <div class="portfolio-item">
                    <cc1:CmsImage 
                        ID="PortfolioImage5" 
                        runat="server" 
                        data-editable="true" 
                        data-name="Portfolio 5 Image" 
                        data-defaultval="/sitebooking/Themes/Agency/images/portfolio/5.jpg"
                        CssClass="img-fluid" />
                    <div class="portfolio-overlay">
                        <div class="portfolio-overlay-content">
                            <h4>
                                <cc1:CmsLiteral 
                                    ID="PortfolioTitle5" 
                                    runat="server" 
                                    data-editable="true" 
                                    data-name="Portfolio 5 Title" 
                                    data-defaultval="Southwest" />
                            </h4>
                            <p class="text-muted mb-0">
                                <cc1:CmsLiteral 
                                    ID="PortfolioCategory5" 
                                    runat="server" 
                                    data-editable="true" 
                                    data-name="Portfolio 5 Category" 
                                    data-defaultval="Website Design" />
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Portfolio Item 6 -->
            <div class="col-lg-4 col-sm-6 mb-4">
                <div class="portfolio-item">
                    <cc1:CmsImage 
                        ID="PortfolioImage6" 
                        runat="server" 
                        data-editable="true" 
                        data-name="Portfolio 6 Image" 
                        data-defaultval="/sitebooking/Themes/Agency/images/portfolio/6.jpg"
                        CssClass="img-fluid" />
                    <div class="portfolio-overlay">
                        <div class="portfolio-overlay-content">
                            <h4>
                                <cc1:CmsLiteral 
                                    ID="PortfolioTitle6" 
                                    runat="server" 
                                    data-editable="true" 
                                    data-name="Portfolio 6 Title" 
                                    data-defaultval="Window" />
                            </h4>
                            <p class="text-muted mb-0">
                                <cc1:CmsLiteral 
                                    ID="PortfolioCategory6" 
                                    runat="server" 
                                    data-editable="true" 
                                    data-name="Portfolio 6 Category" 
                                    data-defaultval="Photography" />
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</section>
