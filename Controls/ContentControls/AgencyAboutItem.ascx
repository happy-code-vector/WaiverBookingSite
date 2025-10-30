<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- About Timeline Item - Agency Style -->
<li class="timeline-item">
    <div class="timeline-image">
        <cc1:CmsImage 
            ID="TimelineImage" 
            runat="server" 
            data-editable="true" 
            data-name="Timeline Image" 
            data-defaultval="/sitebooking/Themes/Agency/images/about/1.jpg"
            CssClass="rounded-circle img-fluid" />
    </div>
    <div class="timeline-panel">
        <div class="timeline-heading">
            <h4>
                <cc1:CmsLiteral 
                    ID="TimelineYear" 
                    runat="server" 
                    data-editable="true" 
                    data-name="Year/Date" 
                    data-defaultval="2009-2011" />
            </h4>
            <h4 class="subheading">
                <cc1:CmsLiteral 
                    ID="TimelineTitle" 
                    runat="server" 
                    data-editable="true" 
                    data-name="Title" 
                    data-defaultval="Our Humble Beginnings" />
            </h4>
        </div>
        <div class="timeline-body">
            <p class="text-muted">
                <cc1:CmsLiteral 
                    ID="TimelineDescription" 
                    runat="server" 
                    data-editable="true" 
                    data-name="Description" 
                    data-defaultval="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!" />
            </p>
        </div>
    </div>
</li>
