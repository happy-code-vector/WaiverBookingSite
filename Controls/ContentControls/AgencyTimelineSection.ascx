<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Timeline Section - Agency Style -->
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
                    data-defaultval="About" />
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
        
        <!-- Timeline Items -->
        <ul class="timeline">
            
            <!-- Timeline Item 1 -->
            <li class="timeline-item">
                <div class="timeline-image">
                    <cc1:CmsImage 
                        ID="TimelineImage1" 
                        runat="server" 
                        data-editable="true" 
                        data-name="Timeline 1 Image" 
                        data-defaultval="/sitebooking/Themes/Agency/images/about/1.jpg"
                        CssClass="rounded-circle img-fluid" />
                </div>
                <div class="timeline-panel">
                    <h4 class="fw-bold">
                        <cc1:CmsLiteral 
                            ID="TimelineYear1" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Timeline 1 Year" 
                            data-defaultval="2009-2011" />
                    </h4>
                    <h4 class="subheading">
                        <cc1:CmsLiteral 
                            ID="TimelineTitle1" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Timeline 1 Title" 
                            data-defaultval="Our Humble Beginnings" />
                    </h4>
                    <p class="text-muted">
                        <cc1:CmsLiteral 
                            ID="TimelineDescription1" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Timeline 1 Description" 
                            data-defaultval="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!" />
                    </p>
                </div>
            </li>
            
            <!-- Timeline Item 2 -->
            <li class="timeline-item">
                <div class="timeline-image">
                    <cc1:CmsImage 
                        ID="TimelineImage2" 
                        runat="server" 
                        data-editable="true" 
                        data-name="Timeline 2 Image" 
                        data-defaultval="/sitebooking/Themes/Agency/images/about/2.jpg"
                        CssClass="rounded-circle img-fluid" />
                </div>
                <div class="timeline-panel">
                    <h4 class="fw-bold">
                        <cc1:CmsLiteral 
                            ID="TimelineYear2" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Timeline 2 Year" 
                            data-defaultval="March 2011" />
                    </h4>
                    <h4 class="subheading">
                        <cc1:CmsLiteral 
                            ID="TimelineTitle2" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Timeline 2 Title" 
                            data-defaultval="An Agency is Born" />
                    </h4>
                    <p class="text-muted">
                        <cc1:CmsLiteral 
                            ID="TimelineDescription2" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Timeline 2 Description" 
                            data-defaultval="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!" />
                    </p>
                </div>
            </li>
            
            <!-- Timeline Item 3 -->
            <li class="timeline-item">
                <div class="timeline-image">
                    <cc1:CmsImage 
                        ID="TimelineImage3" 
                        runat="server" 
                        data-editable="true" 
                        data-name="Timeline 3 Image" 
                        data-defaultval="/sitebooking/Themes/Agency/images/about/3.jpg"
                        CssClass="rounded-circle img-fluid" />
                </div>
                <div class="timeline-panel">
                    <h4 class="fw-bold">
                        <cc1:CmsLiteral 
                            ID="TimelineYear3" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Timeline 3 Year" 
                            data-defaultval="December 2015" />
                    </h4>
                    <h4 class="subheading">
                        <cc1:CmsLiteral 
                            ID="TimelineTitle3" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Timeline 3 Title" 
                            data-defaultval="Transition to Full Service" />
                    </h4>
                    <p class="text-muted">
                        <cc1:CmsLiteral 
                            ID="TimelineDescription3" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Timeline 3 Description" 
                            data-defaultval="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!" />
                    </p>
                </div>
            </li>
            
            <!-- Timeline Item 4 -->
            <li class="timeline-item">
                <div class="timeline-image">
                    <cc1:CmsImage 
                        ID="TimelineImage4" 
                        runat="server" 
                        data-editable="true" 
                        data-name="Timeline 4 Image" 
                        data-defaultval="/sitebooking/Themes/Agency/images/about/4.jpg"
                        CssClass="rounded-circle img-fluid" />
                </div>
                <div class="timeline-panel">
                    <h4 class="fw-bold">
                        <cc1:CmsLiteral 
                            ID="TimelineYear4" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Timeline 4 Year" 
                            data-defaultval="July 2020" />
                    </h4>
                    <h4 class="subheading">
                        <cc1:CmsLiteral 
                            ID="TimelineTitle4" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Timeline 4 Title" 
                            data-defaultval="Phase Two Expansion" />
                    </h4>
                    <p class="text-muted">
                        <cc1:CmsLiteral 
                            ID="TimelineDescription4" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Timeline 4 Description" 
                            data-defaultval="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!" />
                    </p>
                </div>
            </li>
            
            <!-- Timeline Item 5 -->
            <li class="timeline-item">
                <div class="timeline-image">
                    <cc1:CmsImage 
                        ID="TimelineImage5" 
                        runat="server" 
                        data-editable="true" 
                        data-name="Timeline 5 Image" 
                        data-defaultval="/sitebooking/Themes/Agency/images/about/5.jpg"
                        CssClass="rounded-circle img-fluid" />
                </div>
                <div class="timeline-panel">
                    <h4 class="fw-bold">
                        <cc1:CmsLiteral 
                            ID="TimelineYear5" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Timeline 5 Year" 
                            data-defaultval="2024" />
                    </h4>
                    <h4 class="subheading">
                        <cc1:CmsLiteral 
                            ID="TimelineTitle5" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Timeline 5 Title" 
                            data-defaultval="Looking to the Future" />
                    </h4>
                    <p class="text-muted">
                        <cc1:CmsLiteral 
                            ID="TimelineDescription5" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Timeline 5 Description" 
                            data-defaultval="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!" />
                    </p>
                </div>
            </li>
            
        </ul>
    </div>
</section>
