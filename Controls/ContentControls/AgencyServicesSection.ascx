<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Services Section - Agency Style -->
<section class="content-section py-5">
    <div class="container">
        
        <!-- Section Header -->
        <div class="text-center mb-5">
            <h2 class="text-uppercase">
                <cc1:CmsLiteral 
                    ID="SectionTitle" 
                    runat="server" 
                    data-editable="true" 
                    data-name="Section Title" 
                    data-defaultval="Services" />
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
        
        <!-- Service Items -->
        <div class="row text-center">
            
            <!-- Service Item 1 -->
            <div class="col-md-4 mb-4">
                <div class="service-item text-center">
                    <div class="mb-3">
                        <cc1:CmsIcon 
                            ID="ServiceIcon1" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Service 1 Icon" 
                            data-defaultval="ci-shopping-cart"
                            data-extra-class="d-inline-block" 
                            style="font-size: 4rem; color: #ffc800;" />
                    </div>
                    <h4 class="my-3 fw-bold">
                        <cc1:CmsLiteral 
                            ID="ServiceTitle1" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Service 1 Title" 
                            data-defaultval="E-Commerce" />
                    </h4>
                    <p class="text-muted mb-0">
                        <cc1:CmsLiteral 
                            ID="ServiceDescription1" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Service 1 Description" 
                            data-defaultval="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit." />
                    </p>
                </div>
            </div>
            
            <!-- Service Item 2 -->
            <div class="col-md-4 mb-4">
                <div class="service-item text-center">
                    <div class="mb-3">
                        <cc1:CmsIcon 
                            ID="ServiceIcon2" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Service 2 Icon" 
                            data-defaultval="ci-monitor"
                            data-extra-class="d-inline-block" 
                            style="font-size: 4rem; color: #ffc800;" />
                    </div>
                    <h4 class="my-3 fw-bold">
                        <cc1:CmsLiteral 
                            ID="ServiceTitle2" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Service 2 Title" 
                            data-defaultval="Responsive Design" />
                    </h4>
                    <p class="text-muted mb-0">
                        <cc1:CmsLiteral 
                            ID="ServiceDescription2" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Service 2 Description" 
                            data-defaultval="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit." />
                    </p>
                </div>
            </div>
            
            <!-- Service Item 3 -->
            <div class="col-md-4 mb-4">
                <div class="service-item text-center">
                    <div class="mb-3">
                        <cc1:CmsIcon 
                            ID="ServiceIcon3" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Service 3 Icon" 
                            data-defaultval="ci-lock"
                            data-extra-class="d-inline-block" 
                            style="font-size: 4rem; color: #ffc800;" />
                    </div>
                    <h4 class="my-3 fw-bold">
                        <cc1:CmsLiteral 
                            ID="ServiceTitle3" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Service 3 Title" 
                            data-defaultval="Web Security" />
                    </h4>
                    <p class="text-muted mb-0">
                        <cc1:CmsLiteral 
                            ID="ServiceDescription3" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Service 3 Description" 
                            data-defaultval="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit." />
                    </p>
                </div>
            </div>
            
        </div>
    </div>
</section>
