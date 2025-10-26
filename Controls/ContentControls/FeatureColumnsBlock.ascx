<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeatureColumnsBlock.ascx.cs" Inherits="WaiverFile.Controls.ContentControls.FeatureColumnsBlock" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

<section class="container pt-5 mt-xxl-3">
        <div class="row row-cols-1 row-cols-sm-3 gy-4 gy-sm-0 pt-1 pt-sm-2 pt-md-3 pt-lg-4 pt-xl-5">
          <div class="col text-center mb-2 mb-sm-0">

                    <cc1:CmsIcon 
ID="CmsIcon1" 
runat="server" 
data-defaultval="ci-phone-outgoing"
data-name="Feature Icon 1"
data-editable="true"
data-extra-class="fs-4 p-3 rounded-circle bg-body-secondary text-body" />

            <h3 class="text-body fs-sm fw-normal mb-2">
                <cc1:CmsLiteral ID="fldHeaderText" runat="server" 
                data-defaultval="Call us directly" data-name="Feature 1 Text" data-editable="true" data-textmode="richtext" />

            </h3>
            <div class="nav animate-underline justify-content-center">
                <asp:HyperLink 
    ID="HyperLink1" 
    runat="server" 
    CssClass="nav-link animate-target text-dark-emphasis fs-base p-0" 
    data-editable="true" 
    data-name="Link 1" 
    data-defaultval="tel:+15555555555" 
    data-defaulttext="+1 (555) 555-5555" 
    data-defaulttarget="_self">
</asp:HyperLink>

            </div>
          </div>
          <div class="col text-center mb-2 mb-sm-0">
              
            
            <cc1:CmsIcon 
                    ID="CmsIcon2" 
                    runat="server" 
                    data-defaultval="ci-mail"
                    data-name="Feature Icon 2"
                    data-editable="true"
                  data-extra-class="fs-4 p-3 rounded-circle bg-body-secondary text-body" />





            
            <i class="ci-mail bg-body-secondary text-white fs-4 rounded-circle p-3 mb-3 d-none d-inline-flex-dark"></i>
            <h3 class="text-body fs-sm fw-normal mb-2"> <cc1:CmsLiteral ID="CmsLiteral1" runat="server" 
                    data-defaultval="Send us a message" data-name="Feature 2 Text" data-editable="true" /></h3>
            <div class="nav animate-underline justify-content-center">

                 <asp:HyperLink 
                    ID="HyperLink2" 
                    runat="server" 
                    CssClass="nav-link animate-target text-dark-emphasis fs-base p-0" 
                    data-editable="true" 
                    data-name="Link 2" 
                    data-defaultval="mailto:info@waiverfile.com" 
                    data-defaulttext="info@waiverfile.com" 
                    data-defaulttarget="_self">
                </asp:HyperLink>

            </div>
          </div>
          <div class="col text-center">
            
               <cc1:CmsIcon 
         ID="CmsIcon3" 
         runat="server" 
         data-defaultval="ci-help-circle"
         data-name="Feature Icon 3"
         data-editable="true"
       data-extra-class="fs-4 p-3 rounded-circle bg-body-secondary text-body" />

            
            <h3 class="text-body fs-sm fw-normal mb-2">
                 <cc1:CmsLiteral ID="CmsLiteral2" runat="server" 
                    data-defaultval="Looking for support?" data-name="Feature 3 Text" data-editable="true" />
            </h3>
            <div class="nav animate-underline justify-content-center">
                 <asp:HyperLink 
                        ID="HyperLink3" 
                        runat="server" 
                        CssClass="nav-link animate-target text-dark-emphasis fs-base p-0" 
                        data-editable="true" 
                        data-name="Link 3" 
                        data-defaultval="" 
                        data-defaulttext="Help Center" 
                        data-defaulttarget="_self">
                    </asp:HyperLink>

            </div>
          </div>
        </div>
      </section>