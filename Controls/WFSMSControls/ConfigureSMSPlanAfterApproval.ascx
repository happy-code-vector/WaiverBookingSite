<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ConfigureSMSPlanAfterApproval.ascx.cs" Inherits="WaiverFile.Controls.WFSMSControls.ConfigureSMSPlanAfterApproval" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

  
      <link rel="stylesheet" href="/site/includes/intlTelInput.css">
  <script>






      $(document).ready(function () {
          console.log('here');
          var phoneInputID = "#txtBusinessPhone";
          var input = document.querySelector("#txtBusinessPhone");
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


<script type="text/javascript">

    function showHideNewSub() {
        if ($('#<%=cboSubscription.ClientID%>').val() == '00000000-0000-0000-0000-000000000000') {
            $('#divNewSub').show();
        } else {
            $('#divNewSub').hide();
        }
    }

    function showHideCustomDate() {
        if ($('#<%=cboNewExpiration.ClientID%>').val() == 'CUSTOM') {
            $('#divCustomDate').show();
         } else {
            $('#divCustomDate').hide();
         }
    }

    $(function () {
        showHideNewSub();
        $('#<%=cboSubscription.ClientID%>').change(function () { showHideNewSub(); });

        showHideCustomDate();
        $('#<%=cboNewExpiration.ClientID%>').change(function () { showHideCustomDate(); });

    });

   

   

</script>

  <script src="/site/includes/intlTelInput.min.js"></script>
    <script src="/site/includes/jquery.mask.min.js"></script>

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Configure SMS Plan for Approved Profile
</h3>
    </div><!-- /.box-header -->
    <div class="box-body">


        <div class="form-group">
            <label>Customer Info</label>
        </div>
        <div class="form-group">
            <asp:Label ID="lblCustomerInfo" runat="server"></asp:Label>
        </div>


        <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>


        <div class="form-group">
            <label>Subscription</label>
            <asp:DropDownList runat="server" ID="cboSubscription" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="cboSubscription_SelectedIndexChanged"></asp:DropDownList>
        </div>
        
        
        
        <div id="divNewSub">
            <h4>New Subscription Settings</h4>
         <div class="form-group">
            <label>Plan</label>
            <asp:DropDownList runat="server" ID="cboPlans" CssClass="form-control"></asp:DropDownList>
         </div>

          <div class="form-group">
            <label>Expiration Date</label>
            <asp:DropDownList runat="server" ID="cboNewExpiration" CssClass="form-control"></asp:DropDownList>
         </div>

            <div id="divCustomDate">

             <div class="form-group">
                     <label for="<%=dtExpirationDate.ClientID %>">Custom Expiration Date</label>
                       <telerik:RadDatePicker ID="dtExpirationDate" runat="server"></telerik:RadDatePicker>
                </div>

                </div>

          
          <div class="form-group">
            <label>Credit Card</label>
            <asp:DropDownList runat="server" ID="cboCreditCard" CssClass="form-control"></asp:DropDownList>
         </div>

             <div class="form-group">
            <asp:RadioButtonList runat="server" ID="rblProcessNow">
                <asp:ListItem Value="TRUE">Process payment for one billing cycle right now</asp:ListItem>
                <asp:ListItem Value="FALSE">Do not process (allow to expire)</asp:ListItem>
            </asp:RadioButtonList>
                 </div>

              <div class="form-group">
            <asp:RadioButtonList runat="server" ID="rblAdvanceExpirationDate">
                <asp:ListItem Value="TRUE">Advance the Expiration Date by one billing cycle</asp:ListItem>
                <asp:ListItem Value="FALSE">Leave expiration date where it is</asp:ListItem>
            </asp:RadioButtonList>
                 </div>
        </div>

          <div class="form-group">
            <label>Site</label>
            <asp:DropDownList runat="server" ID="cboSite" CssClass="form-control"></asp:DropDownList>
        </div>
          <div class="form-group">
              <label>Business Phone Number</label>
              <asp:TextBox runat="server" ID="txtBusinessPhone" CssClass="form-control" type="tel" ClientIDMode="Static"></asp:TextBox>
              <p class="help-block">Informs inbound callers of your main number.</p>
          </div>
            <asp:HiddenField runat="server" ID="hfCountry" />







    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Submit" OnClick="btnSave_Click" />
    </div>
</div>
