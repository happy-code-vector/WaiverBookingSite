<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="GetStarted.aspx.cs" Inherits="WaiverFile.site.admin.SMS.GetStarted" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
            .promoarea p{ padding:10px 0 20px; }
            .promoarea .well p{ padding:0;}
        </style>

      <link rel="stylesheet" href="/site/includes/intlTelInput.css">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <asp:PlaceHolder runat="server" ID="phErrOuter"></asp:PlaceHolder>


    <script type="text/javascript">
        $(document).ready(function () {
            window.location.href = "./SMSDemo.aspx";
        });
    </script>

    <asp:Panel ID="pnlMain" runat="server" CssClass="promoarea">
        
        <div class="text-center">
        <h2>SMS Text Messaging</h2>
        <p>Automatic text messaging with WaiverFile means you can schedule automated SMS messages to be sent to your customers for notifications, promotions and more!  </p>
       </div>



        <div class="row">


            <div class="col-sm-6">


            </div>

            <div class="col-sm-6"></div>


        </div>




        <div class="row">
        <div class="col-sm-4">

            <div class="box">							
				<div class="icon">
					<div class="image"><i class="fa fa-users"></i></div>
					<div class="info">
						<h3 class="title">Reach Customers Directly</h3>
						<p> By collecting mobile numbers as part of your waiver form, you'll quickly start building a valuable list of contacts to market to.</p> 
						
					</div>
				</div>
				<div class="space"></div>
			</div> 

        </div>
        <div class="col-sm-4">

              <div class="box">							
				<div class="icon">
					<div class="image"><i class="fa fa-pencil"></i></div>
					<div class="info">
						<h3 class="title">Personalized Messages</h3>
						 <p> Messages can be customized with names or any other info collected on your waiver forms to customize messaging to each person automatically.</p>
						
					</div>
				</div>
				<div class="space"></div>
			</div> 

        </div>
		<div class="clear visible-sm" style="clear:both;">
			
		</div>
        <div class="col-sm-4">

			  <div class="box">							
				<div class="icon">
					<div class="image"><i class="fa fa-bullhorn"></i></div>
					<div class="info">
						<h3 class="title">Promote</h3>
						<p>
						 Texts have a much higher open rate than email. Send promos and offers via SMS to maximize visibility and responses.
						</p>
						
					</div>
				</div>
				<div class="space"></div>
			</div> 

        </div>
    </div>

        
        <div class="row">
        <div class="col-sm-4">

            <div class="box">							
				<div class="icon">
					<div class="image"><i class="fa fa-line-chart"></i></div>
					<div class="info">
						<h3 class="title">Track Results</h3>
						<p>
							See what's working easily. We track click throuh and delivey rates so you can hone your customer outreach.
						</p>
						
					</div>
				</div>
				<div class="space"></div>
			</div> 

        </div>
        <div class="col-sm-4">

              <div class="box">							
				<div class="icon">
					<div class="image"><i class="fa fa-smile-o"></i></div>
					<div class="info">
						<h3 class="title">Delight Customers</h3>
						<p>
							 Your customers would rather text than email or call. Being able to text for more information will greatly enhance your customer service and brand image.
						</p>
						
					</div>
				</div>
				<div class="space"></div>
			</div> 

        </div>
		<div class="clear visible-sm" style="clear:both;">
			
		</div>
        <div class="col-sm-4">

			  <div class="box">							
				<div class="icon">
					<div class="image"><i class="fa fa-user-times"></i></div>
					<div class="info">
						<h3 class="title">Reduce No-Shows</h3>
						<p>
						 Prevent missed appointments with automated texting combined with WaiverFile's events featureset. 
						</p>
						
					</div>
				</div>
				<div class="space"></div>
			</div> 

        </div>
    </div>


      

       

         <div class="text-center">
              <h2>Get Started</h2>
             </div>

        <div class="well">

       
            <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>

        <p>
            <strong>How it works: </strong>
           
        </p> 
            <ul>
                <li>Submit the form below</li>
                <li>You'll get an SMS sending number</li>
                <li>Start sending texts today</li>
                <li>Choose a plan. <a href="https://www.waiverfile.com/Pricing.aspx#sms" target="_blank">SMS Plans <i class="fa fa-external-link"></i></a></li>
                <li>Billing starts after 100 messages or 30 days</li>
            </ul>

        <div class="form-group">
              <label>Your Business Phone Number</label>
              <asp:TextBox runat="server" ID="txtBusinessPhone" CssClass="form-control" type="tel"></asp:TextBox>
              <p class="help-block">Informs inbound callers of your main number.</p>
          </div>
            <asp:HiddenField runat="server" ID="hfCountry" />

        
        <p>
            <span style="font-size: 12px;font-style:italic;">
            Use of WaiverFile's SMS service is subject to our <a href="https://www.waiverfile.com/Policies/Messaging-Policy.aspx" target="_blank">Messaging Policy <i class="fa fa-external-link"></i></a>. 
            </span>
        </p>
        
        
        <p><asp:Button runat="server" ID="btnSubmit" Text="Start Texting" CssClass="btn btn-primary" OnClick="btnSubmit_Click" /></p>
        
        </div>

    </asp:Panel>

    
  <script src="/site/includes/intlTelInput.min.js"></script>
    <script src="/site/includes/jquery.mask.min.js"></script>
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

  </script>




</asp:Content>
