<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TwoColBlockWithImage.ascx.cs" Inherits="WaiverFile.Controls.ContentControls.TwoColBlockWithImage" %>
  <%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>

        <div class="row py-4 py-lg-5">
          <div class="col-md-6 col-lg-7">
            <div class="position-relative h-100">
              <div class="ratio ratio-16x9"></div>
              
                 <cc1:CmsImage ID="fldPromoImage" runat="server"
           data-editable="true"
           data-name="Image"
           data-defaultval=""
           alt="Image"
           class="position-absolute top-0 start-0 w-100 h-100 object-fit-cover rounded-5" />

            </div>
          </div>
          <div class="col-md-6 col-lg-5">
            <div class="pt-4 py-md-5 my-lg-3 my-xl-4 my-xxl-5 ps-md-3 ps-lg-4 ps-xxl-5">
              
                
 <cc1:CmsLiteral ID="fldContent" runat="server" 
 data-defaultval="Place your content here" data-name="Right Column Content" data-editable="true" data-textmode="richtext" />

            </div>
          </div>
        </div>