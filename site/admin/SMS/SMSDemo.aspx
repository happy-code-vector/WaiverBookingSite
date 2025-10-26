<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SMSDemo.aspx.cs" Inherits="WaiverFile.site.admin.SMS.SMSDemo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <style type="text/css">
            .promoarea p{  }
            .promoarea .well p{ padding:0;}
        </style>

      <link rel="stylesheet" href="/site/includes/intlTelInput.css">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    

    <asp:Panel ID="pnlMain" runat="server" CssClass="promoarea">
        
        
        <h2>SMS Text Messaging</h2>
        <p>WaiverFile offers a built-in text messaging platform! As more customers turn to text messaging for communication, it’s important for businesses to leverage this form of communication to better reach out.
        When customers need to sign a waiver, it’s a perfect time to offer a chance to opt-in to SMS alerts, messages and promotions. It’s quick and easy for customers to enter their number, which they were likely going to add anyway.  </p>

       

        <div class="row">
            <div class="col-sm-7">
                
              <h3>Try the Demo</h3>

        <div class="well" style="display:inline-block;">
            <asp:Panel runat="server" ID="pnlGetStarted" DefaultButton="btnSubmit">
       
            <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>


        <div class="form-group">
              <label>Your Business Phone Number</label>
              <asp:TextBox runat="server" ID="txtBusinessPhone" CssClass="form-control" type="tel"></asp:TextBox>
              <p class="help-block">Informs inbound callers of your main number.</p>
          </div>
            <asp:HiddenField runat="server" ID="hfCountry" />


            
        <div class="form-group">
              <label>Your Cellphone Number</label>
              <asp:TextBox runat="server" ID="txtCellphone" CssClass="form-control" type="tel"></asp:TextBox>
              <p class="help-block">During the demo period, we will send all SMS messages to this number so you can see how it works.</p>
          </div>
            <asp:HiddenField runat="server" ID="hfCountry2" />
        
        <p>
            <span style="font-size: 12px;font-style:italic;">
            Use of WaiverFile's SMS service is subject to our <a href="https://www.waiverfile.com/Policies/Messaging-Policy.aspx" target="_blank">Messaging Policy <i class="fa fa-external-link"></i></a>. During the demo, a standard terms of use and privacy policy will be added to the registration screens. You can change this anytime under Text Messaging Settings.
            </span>
        </p>
        
        
        <p><asp:Button runat="server" ID="btnSubmit" Text="Start Texting" CssClass="btn btn-primary" OnClick="btnSubmit_Click" /></p>
        </asp:Panel>
        </div>

                 
        <div class="row">
<div class="col-sm-4"><img alt="98 percent of adults in the US own a mobile phone" src="https://www.waiverfile.com/GalleryContent/Original/stat-sms-98.gif" style="width:300px;max-width:100%;margin-bottom:30px;"></div>
<div class="col-sm-4"><img alt="90 percent of messages are opened and responded to within 3 minutes" src="https://www.waiverfile.com/GalleryContent/Original/stat-sms-3mins.gif" style="width:300px;max-width:100%;margin-bottom:30px;"></div>
<div class="col-sm-4"><img alt="sms messages have a 19% click through rate (CTR)" src="https://www.waiverfile.com/GalleryContent/Original/stat-sms-ctr.gif" style="width:300px;max-width:100%;"></div>
</div>
         <p style="text-align: right;"><small><a href="https://www.smscomparison.com/mass-text-messaging/2022-statistics/" target="_blank" class="text-muted">References</a></small></p>



                <h3 class="text-center">Why SMS?</h3>

                <p>Configure text messages to be sent out automatically based on date signed, event dates, or <a href="https://www.waiverfile.com/Article/how-to-book-more-birthday-parties-with-automa">birthdays</a>.&nbsp;</p>
                <p>Setup is easy, just configure the messages you want to send and when they should go out. By targeting the sending time of these messages, they can be extremely effective. Include links with our built-in short link tool.&nbsp;</p>
                <h3 class="text-center">Texting Campaigns</h3>
                <p>Build lists of SMS subscribers based on details collected as part of your waiver form and schedule targeted sms blasts to be sent out for promotions or other notifications.&nbsp;</p>
                <p>
                    SMS text messaging is an add-on service. <a href="https://www.waiverfile.com/Pricing.aspx#sms" target="_blank">Get Pricing</a>.
                </p>

          <h3 class="text-center">How it Works</h3>

                <iframe width="100%" height="477" src="https://www.youtube.com/embed/B0UNm3izrPw" title="WaiverFile SMS Intro Video" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen=""></iframe>


            </div>
            <div class="col-sm-5">
                
                <img alt="Scheduling an SMS campaign" src="https://www.waiverfile.com/GalleryContent/Original/phone-view-text-message-conversation.jpg" style="width:375px;max-width:100%;">

            </div>
        </div>

       
       


       
        
        <script>






            $(document).ready(function () {
                var phoneInputID = "#<%=txtBusinessPhone.ClientID%>";
          var input = document.querySelector("#<%=txtBusinessPhone.ClientID%>");
          var iti = window.intlTelInput(input, {
              // allowDropdown: false,
              // autoHideDialCode: false,
              // autoPlaceholder: "off",
              // dropdownContainer: document.body,
              // excludeCountries: ["us"],
              formatOnDisplay: true,
              // geoIpLookup: function(callback) {
              //   $.get("http://ipinfo.io", function() {}, "jsonp").always(function(resp) {
              //     var countryCode = (resp && resp.country) ? resp.country : "";
              //     callback(countryCode);
              //   });
              // },
              hiddenInput: "rawNum",
              initialCountry: "<%=countryCode.ToLower()%>",
              // localizedCountries: { 'de': 'Deutschland' },
              // nationalMode: false,
               onlyCountries: ['us', 'ca'], //FOR NOW
              // placeholderNumberType: "MOBILE",
              preferredCountries: ['us', 'ca'],
              // separateDialCode: true,
              utilsScript: "/site/includes/utils.js",
          });
          // listen to the telephone input for changes
          $(phoneInputID).on('countrychange', function (e) {
              // change the hidden input value to the selected country code
              $('#<%=hfCountry.ClientID%>').val(iti.getSelectedCountryData().iso2);
        

              // Get the selected country data to know which country is selected.
              var selectedCountryData = iti.getSelectedCountryData();

              // Get an example number for the selected country to use as placeholder.
              newPlaceholder = intlTelInputUtils.getExampleNumber(selectedCountryData.iso2, true, intlTelInputUtils.numberFormat.INTERNATIONAL),

                  // Reset the phone number input.
                //  iti.setNumber("");

              // Convert placeholder as exploitable mask by replacing all 1-9 numbers with 0s
              mask = newPlaceholder.replace(/[1-9]/g, "0");

              // Apply the new mask for the input
              $(this).mask(mask);
          });


          // When the plugin loads for the first time, we have to trigger the "countrychange" event manually, 
          // but after making sure that the plugin is fully loaded by associating handler to the promise of the 
          // plugin instance.

          iti.promise.then(function () {
              $(phoneInputID).trigger("countrychange");
          });

      });



      $(document).ready(function () {
          var phoneInputID = "#<%=txtCellphone.ClientID%>";
          var input = document.querySelector("#<%=txtCellphone.ClientID%>");
          var iti = window.intlTelInput(input, {
              // allowDropdown: false,
              // autoHideDialCode: false,
              // autoPlaceholder: "off",
              // dropdownContainer: document.body,
              // excludeCountries: ["us"],
              formatOnDisplay: true,
              // geoIpLookup: function(callback) {
              //   $.get("http://ipinfo.io", function() {}, "jsonp").always(function(resp) {
              //     var countryCode = (resp && resp.country) ? resp.country : "";
              //     callback(countryCode);
              //   });
              // },
              hiddenInput: "rawNum2",
              initialCountry: "<%=countryCode.ToLower()%>",
              // localizedCountries: { 'de': 'Deutschland' },
              // nationalMode: false,
              onlyCountries: ['us', 'ca'], //FOR NOW
              // placeholderNumberType: "MOBILE",
              preferredCountries: ['us', 'ca'],
              // separateDialCode: true,
              utilsScript: "/site/includes/utils.js",
          });
          // listen to the telephone input for changes
          $(phoneInputID).on('countrychange', function (e) {
              // change the hidden input value to the selected country code
              $('#<%=hfCountry.ClientID%>').val(iti.getSelectedCountryData().iso2);


              // Get the selected country data to know which country is selected.
              var selectedCountryData = iti.getSelectedCountryData();

              // Get an example number for the selected country to use as placeholder.
              newPlaceholder = intlTelInputUtils.getExampleNumber(selectedCountryData.iso2, true, intlTelInputUtils.numberFormat.INTERNATIONAL),

                  // Reset the phone number input.
                  //  iti.setNumber("");

                  // Convert placeholder as exploitable mask by replacing all 1-9 numbers with 0s
                  mask = newPlaceholder.replace(/[1-9]/g, "0");

              // Apply the new mask for the input
              $(this).mask(mask);
          });


          // When the plugin loads for the first time, we have to trigger the "countrychange" event manually, 
          // but after making sure that the plugin is fully loaded by associating handler to the promise of the 
          // plugin instance.

          iti.promise.then(function () {
              $(phoneInputID).trigger("countrychange");
          });

      });


        </script>

    </asp:Panel>

    <div class="row">
        <div class="col-xs-12">
             <asp:PlaceHolder runat="server" ID="phErrOuter"></asp:PlaceHolder>
        </div>
    </div>
    
  <script src="/site/includes/intlTelInput.min.js"></script>
    <script src="/site/includes/jquery.mask.min.js"></script>
  

</asp:Content>
