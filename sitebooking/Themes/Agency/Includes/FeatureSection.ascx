<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Feature/About Section -->
<section class="py-5">
    <div class="container">
        <div class="row align-items-center">
            
            <!-- Image Column -->
            <div class="col-lg-6 mb-4 mb-lg-0">
                <cc1:CmsImage 
                    ID="FeatureImage" 
                    runat="server" 
                    data-editable="true" 
                    data-name="Feature Image" 
                    data-defaultval="/sitebooking/Themes/Agency/images/feature-placeholder.jpg"
                    CssClass="img-fluid rounded shadow" />
            </div>
            
            <!-- Content Column -->
            <div class="col-lg-6 ps-lg-5">
                
                <!-- Section Label -->
                <cc1:CmsLiteral 
                    ID="FeatureLabel" 
                    runat="server" 
                    data-editable="true" 
                    data-name="Section Label" 
                    data-defaultval="About Us"
                    CssClass="text-primary text-uppercase fw-semibold mb-2 d-block letter-spacing-2" />
                
                <!-- Feature Title -->
                <cc1:CmsLiteral 
                    ID="FeatureTitle" 
                    runat="server" 
                    data-editable="true" 
                    data-name="Feature Title" 
                    data-defaultval="We Create Amazing Experiences"
                    CssClass="h2 fw-bold mb-4 d-block" />
                
                <!-- Feature Description -->
                <cc1:CmsLiteral 
                    ID="FeatureDescription" 
                    runat="server" 
                    data-editable="true" 
                    data-name="Feature Description" 
                    data-defaultval="<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut eaque, laboriosam veritatis, quos non quis ad perspiciatis, totam corporis ea, alias ut unde.</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo voluptatum est, expedita impedit dolorum ab cupiditate totam animi pariatur velit.</p>"
                    data-textmode="richtext"
                    CssClass="text-body-secondary mb-4" />
                
                <!-- Call to Action Button -->
                <asp:HyperLink 
                    ID="FeatureCTAButton" 
                    runat="server" 
                    data-editable="true" 
                    data-name="Call to Action Button" 
                    data-defaultval="#" 
                    data-defaulttext="Learn More" 
                    data-defaulttarget="_self"
                    CssClass="btn btn-primary rounded-pill px-4" />
                
            </div>
            
        </div>
    </div>
</section>
