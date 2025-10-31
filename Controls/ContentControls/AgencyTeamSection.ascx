<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<!-- Team Section - Agency Style -->
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
                    data-defaultval="Our Amazing Team" />
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
        
        <!-- Team Members -->
        <div class="row text-center">
            
            <!-- Team Member 1 -->
            <div class="col-lg-4">
                <div class="team-member">
                    <cc1:CmsImage 
                        ID="MemberPhoto1" 
                        runat="server" 
                        data-editable="true" 
                        data-name="Member 1 Photo" 
                        data-defaultval="/sitebooking/Themes/Agency/images/team/1.jpg"
                        CssClass="mx-auto rounded-circle" />
                    <h4>
                        <cc1:CmsLiteral 
                            ID="MemberName1" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Member 1 Name" 
                            data-defaultval="Kay Garland" />
                    </h4>
                    <p class="text-muted">
                        <cc1:CmsLiteral 
                            ID="MemberPosition1" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Member 1 Position" 
                            data-defaultval="Lead Designer" />
                    </p>
                    <div class="d-flex justify-content-center gap-2 mt-3">
                        <asp:HyperLink 
                            ID="TwitterLink1" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Member 1 Twitter" 
                            data-defaultval="https://twitter.com/" 
                            data-defaulttarget="_blank"
                            CssClass="btn btn-dark btn-social mx-2 social-twitter"
                            ToolTip="Twitter">
                        </asp:HyperLink>
                        <asp:HyperLink 
                            ID="FacebookLink1" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Member 1 Facebook" 
                            data-defaultval="https://facebook.com/" 
                            data-defaulttarget="_blank"
                            CssClass="btn btn-dark btn-social mx-2 social-facebook"
                            ToolTip="Facebook">
                        </asp:HyperLink>
                        <asp:HyperLink 
                            ID="LinkedInLink1" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Member 1 LinkedIn" 
                            data-defaultval="https://linkedin.com/" 
                            data-defaulttarget="_blank"
                            CssClass="btn btn-dark btn-social mx-2 social-linkedin"
                            ToolTip="LinkedIn">
                        </asp:HyperLink>
                    </div>
                </div>
            </div>
            
            <!-- Team Member 2 -->
            <div class="col-lg-4">
                <div class="team-member">
                    <cc1:CmsImage 
                        ID="MemberPhoto2" 
                        runat="server" 
                        data-editable="true" 
                        data-name="Member 2 Photo" 
                        data-defaultval="/sitebooking/Themes/Agency/images/team/2.jpg"
                        CssClass="mx-auto rounded-circle" />
                    <h4>
                        <cc1:CmsLiteral 
                            ID="MemberName2" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Member 2 Name" 
                            data-defaultval="Larry Parker" />
                    </h4>
                    <p class="text-muted">
                        <cc1:CmsLiteral 
                            ID="MemberPosition2" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Member 2 Position" 
                            data-defaultval="Lead Marketer" />
                    </p>
                    <div class="d-flex justify-content-center gap-2 mt-3">
                        <asp:HyperLink 
                            ID="TwitterLink2" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Member 2 Twitter" 
                            data-defaultval="https://twitter.com/" 
                            data-defaulttarget="_blank"
                            CssClass="btn btn-dark btn-social mx-2 social-twitter"
                            ToolTip="Twitter">
                        </asp:HyperLink>
                        <asp:HyperLink 
                            ID="FacebookLink2" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Member 2 Facebook" 
                            data-defaultval="https://facebook.com/" 
                            data-defaulttarget="_blank"
                            CssClass="btn btn-dark btn-social mx-2 social-facebook"
                            ToolTip="Facebook">
                        </asp:HyperLink>
                        <asp:HyperLink 
                            ID="LinkedInLink2" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Member 2 LinkedIn" 
                            data-defaultval="https://linkedin.com/" 
                            data-defaulttarget="_blank"
                            CssClass="btn btn-dark btn-social mx-2 social-linkedin"
                            ToolTip="LinkedIn">
                        </asp:HyperLink>
                    </div>
                </div>
            </div>
            
            <!-- Team Member 3 -->
            <div class="col-lg-4">
                <div class="team-member">
                    <cc1:CmsImage 
                        ID="MemberPhoto3" 
                        runat="server" 
                        data-editable="true" 
                        data-name="Member 3 Photo" 
                        data-defaultval="/sitebooking/Themes/Agency/images/team/3.jpg"
                        CssClass="mx-auto rounded-circle" />
                    <h4>
                        <cc1:CmsLiteral 
                            ID="MemberName3" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Member 3 Name" 
                            data-defaultval="Diana Petersen" />
                    </h4>
                    <p class="text-muted">
                        <cc1:CmsLiteral 
                            ID="MemberPosition3" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Member 3 Position" 
                            data-defaultval="Lead Developer" />
                    </p>
                    <div class="d-flex justify-content-center gap-2 mt-3">
                        <asp:HyperLink 
                            ID="TwitterLink3" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Member 3 Twitter" 
                            data-defaultval="https://twitter.com/" 
                            data-defaulttarget="_blank"
                            CssClass="btn btn-dark btn-social mx-2 social-twitter"
                            ToolTip="Twitter">
                        </asp:HyperLink>
                        <asp:HyperLink 
                            ID="FacebookLink3" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Member 3 Facebook" 
                            data-defaultval="https://facebook.com/" 
                            data-defaulttarget="_blank"
                            CssClass="btn btn-dark btn-social mx-2 social-facebook"
                            ToolTip="Facebook">
                        </asp:HyperLink>
                        <asp:HyperLink 
                            ID="LinkedInLink3" 
                            runat="server" 
                            data-editable="true" 
                            data-name="Member 3 LinkedIn" 
                            data-defaultval="https://linkedin.com/" 
                            data-defaulttarget="_blank"
                            CssClass="btn btn-dark btn-social mx-2 social-linkedin"
                            ToolTip="LinkedIn">
                        </asp:HyperLink>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</section>
