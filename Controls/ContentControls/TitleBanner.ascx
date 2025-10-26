<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TitleBanner.ascx.cs" Inherits="WaiverFile.Controls.ContentControls.TitleBanner" %>
<%@ Register assembly="WaiverFile" namespace="WaiverFile.Core.Booking" tagprefix="cc1" %>
<section class="position-relative bg-body-tertiary py-4">

    <cc1:CmsImage ID="fldPromoImage" runat="server"
              data-editable="true"
              data-name="Promo Image"
              data-defaultval="assets/img/contact/title-bg.png"
              alt="Background Image"
              class="position-absolute top-0 start-0 w-100 h-100 object-fit-cover rtl-flip" />

       
        <div class="container position-relative z-2 py-4 py-md-5 my-lg-3 my-xl-4 my-xxl-5">
          <div class="row pt-lg-2 pb-2 pb-sm-3 pb-lg-4">
            <div class="col-9 col-md-8 col-lg-6">
              <h1 class="display-4 mb-lg-4"><cc1:CmsLiteral ID="CmsLiteral1" runat="server" 
     data-defaultval="Heading Here" data-name="Heading" data-editable="true" /></h1>
              <p class="mb-0"> <cc1:CmsLiteral ID="fldParagraph" runat="server" 
 data-defaultval="Additional details here" data-name="Paragraph" data-editable="true" data-textmode="richtext" /></p>
            </div>
          </div>
        </div>
      </section>