<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Testimonial -->
<div class="testimonial-item p-4 bg-white rounded shadow-sm">
    
    <!-- Quote Icon -->
    <div class="mb-3">
        <i class="ci-quote text-primary fs-1 opacity-25"></i>
    </div>
    
    <!-- Testimonial Text -->
    <cc1:CmsLiteral 
        ID="TestimonialText" 
        runat="server" 
        data-editable="true" 
        data-name="Testimonial Text" 
        data-defaultval="This service exceeded all my expectations. The team was professional, responsive, and delivered outstanding results. Highly recommended!"
        data-textmode="richtext"
        CssClass="mb-4 d-block text-body-secondary" />
    
    <!-- Author Info -->
    <div class="d-flex align-items-center">
        
        <!-- Author Photo -->
        <cc1:CmsImage 
            ID="AuthorPhoto" 
            runat="server" 
            data-editable="true" 
            data-name="Author Photo" 
            data-defaultval="/sitebooking/Themes/Agency/images/team-placeholder.jpg"
            CssClass="rounded-circle me-3" 
            style="width: 60px; height: 60px; object-fit: cover;" />
        
        <div>
            <!-- Author Name -->
            <cc1:CmsLiteral 
                ID="AuthorName" 
                runat="server" 
                data-editable="true" 
                data-name="Author Name" 
                data-defaultval="John Doe"
                CssClass="fw-bold d-block mb-1" />
            
            <!-- Author Title/Company -->
            <cc1:CmsLiteral 
                ID="AuthorTitle" 
                runat="server" 
                data-editable="true" 
                data-name="Author Title" 
                data-defaultval="CEO, Company Name"
                CssClass="text-body-secondary small d-block" />
        </div>
        
    </div>
    
</div>
