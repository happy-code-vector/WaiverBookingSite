<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Hero Section -->
<section class="hero-section d-flex align-items-center justify-content-center text-center text-white position-relative">
    
    <!-- Background Image -->
    <cc1:CmsImage 
        ID="HeroBackgroundImage" 
        runat="server" 
        data-editable="true" 
        data-name="Background Image" 
        data-defaultval="/sitebooking/Themes/Agency/images/hero-bg.jpg"
        CssClass="position-absolute top-0 start-0 w-100 h-100 hero-bg-image" 
        style="z-index: 0;" />
    
    <!-- Overlay for better text readability -->
    <div class="position-absolute top-0 start-0 w-100 h-100 bg-dark opacity-50" style="z-index: 1;"></div>
    
    <!-- Hero Content -->
    <div class="container position-relative" style="z-index: 2;">
        <div class="row justify-content-center">
            <div class="col-lg-10 col-xl-8">
                
                <!-- Subtitle -->
                <cc1:CmsLiteral 
                    ID="HeroSubtitle" 
                    runat="server" 
                    data-editable="true" 
                    data-name="Subtitle" 
                    data-defaultval="Welcome To Our Studio"
                    CssClass="hero-subtitle text-uppercase fs-sm fw-semibold mb-3 d-block letter-spacing-2" />
                
                <!-- Main Title -->
                <cc1:CmsLiteral 
                    ID="HeroTitle" 
                    runat="server" 
                    data-editable="true" 
                    data-name="Main Title" 
                    data-defaultval="It's Nice To Meet You"
                    data-textmode="richtext"
                    CssClass="hero-title display-1 fw-bold mb-4" />
                
                <!-- Call to Action Button -->
                <asp:HyperLink 
                    ID="HeroCTAButton" 
                    runat="server" 
                    data-editable="true" 
                    data-name="Call to Action Button" 
                    data-defaultval="#services" 
                    data-defaulttext="Tell Me More" 
                    data-defaulttarget="_self"
                    CssClass="btn btn-primary btn-lg rounded-pill px-5 py-3 text-uppercase fw-bold" />
                
            </div>
        </div>
    </div>
    
</section>
