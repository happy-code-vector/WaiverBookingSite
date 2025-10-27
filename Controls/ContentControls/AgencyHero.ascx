<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Agency Hero/Masthead Section -->
<header class="masthead" id="agencyHeroSection" style="background-size: cover; background-position: center; background-repeat: no-repeat; min-height: 100vh; display: flex; align-items: center; justify-content: center; text-align: center; color: white; position: relative;">
    
    <!-- Hero Content -->
    <div class="container">
        <div class="masthead-subheading">
            <cc1:CmsLiteral 
                ID="HeroSubtitle" 
                runat="server" 
                data-editable="true" 
                data-name="Subtitle" 
                data-defaultval="Welcome To Our Studio!" />
        </div>
        
        <div class="masthead-heading text-uppercase">
            <cc1:CmsLiteral 
                ID="HeroTitle" 
                runat="server" 
                data-editable="true" 
                data-name="Main Title" 
                data-defaultval="It's Nice To Meet You" />
        </div>
        
        <asp:HyperLink 
            ID="HeroCTAButton" 
            runat="server" 
            data-editable="true" 
            data-name="Call to Action Button" 
            data-defaultval="#services" 
            data-defaulttext="Tell Me More" 
            data-defaulttarget="_self"
            CssClass="btn btn-primary btn-xl text-uppercase" />
    </div>
    
    <!-- Background Image -->
    <cc1:CmsImage 
        ID="HeroBackgroundImage" 
        runat="server" 
        data-editable="true" 
        data-name="Background Image" 
        data-defaultval="/sitebooking/Themes/Agency/images/header-bg.jpg"
        style="display:none;" />
    
    <script type="text/javascript">
        (function() {
            var header = document.getElementById('agencyHeroSection');
            var img = document.getElementById('<%= HeroBackgroundImage.ClientID %>');
            if (header && img && img.src) {
                header.style.backgroundImage = 'url("' + img.src + '")';
            }
        })();
    </script>
    
</header>
