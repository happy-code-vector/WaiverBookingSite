<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SetupProfile.aspx.cs" Inherits="WaiverFile.site.admin.SMS.SetupProfile" %>
<%@ Register assembly="Waypoint" namespace="Waypoint.Forms" tagprefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style type="text/css">
        .btn-box-tool{ margin-top:-10px; }/*fix vertical align issue*/
    </style>



        <asp:Panel runat="server">
<script type="text/javascript">
    //PREVENT DOUBLE SUBMIT
    var isSubmitted = false;
    function preventMultipleSubmissions() {
        if (!isSubmitted) {
            $('#<%=btnSaveStep6.ClientID %>').val('Submitting.. Please Wait..');
            isSubmitted = true;
            return true;
        }
        else {
            return false;
        }
    }

</script>

    <script type="text/javascript">
        function strStartsWith(str, prefix) {
            return str.indexOf(prefix) === 0;
        }

        function setPaymentMethod(s) {
            var pModID = s.replace('PMOD_', '').replace('CCPROF_', '');
            $('.payment_module_box').hide();
            //$('.payment_module_box').each(function(){ $(this).fadeOut(); });
            $('#pmod_' + pModID).fadeIn();
            


            if (strStartsWith(s, 'CCPROF_')) {
                $('#recurringpaymentsbox').show();
            } else {
                if ($('#pmod_' + pModID).data('includerecurring') == 'True') {
                    $('#recurringpaymentsbox').show();
                } else {
                    $('#recurringpaymentsbox').hide();
                }
            }
        }

        $(document).ready(function () {
        $('#btnPlanWaiverSelect').click(function () {
            $('#modalSelectPlanWaiver').modal('show');
        });


        //HANDLE PAYMENT BOXES
        $('#<%=rblPaymentMethods.ClientID%> input').change(function () {
            setPaymentMethod($(this).attr('value'));
        });
        //SET THE FORM ON LOAD
        $('#<%=rblPaymentMethods.ClientID%> input').each(function () {
            if ($(this).is(':checked')) {
                setPaymentMethod($(this).attr('value'));
            }
        });

    });

    </script>

              <script>




                  <%if (pnl1.Visible) {%>

            

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


      <% } %>


              </script>


<script type="text/javascript">

    function showHidedivauth2() {
        if ($('#<%=chkAddSecondAuthRep.ClientID%>').is(':checked')) {
            $('#divauth2').show();
        } else {
            $('#divauth2').hide();
        }
    }
    $(function () {
        showHidedivauth2();
        $('#<%=chkAddSecondAuthRep.ClientID%>').change(function () { showHidedivauth2(); })

        $('#btnFeeDialog').click(function () {
            $('#modalFees').modal('show');
        });
    });

</script>
        </asp:Panel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    
    
<div class="modal fade" id="modalFees" tabindex="-1" role="dialog" aria-labelledby="lblFeeDlg">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="lblFeeDlg">About Registration Fees</h4>
      </div>
      <div class="modal-body">
        <p>Our service provider charges a one-time setup fee for each new SMS text message marketing campaign. This fee covers the costs associated with vetting your business and creating your custom campaign. The vetting process helps ensure that our customers' campaigns are compliant with carrier and industry regulations, which in turn helps to weed out spammers and maintain good SMS message deliverability rates. We are passing these fees directly onto our customers, without marking them up. We believe in transparency and want our customers to know exactly what they're paying for. 
        </p>
      </div>
      <div class="modal-footer">
          <a href="javascript:void(0);" class="btn btn-muted" data-dismiss="modal">Close</a>
      </div>
    </div>
  </div>
</div>


    <asp:HiddenField runat="server" ID="hfPanelNum" />

    


<h3>Upgrade to Full Plan</h3>
    
    <p>In order to start using text messaging, we need to aquire a verified phone number. Please complete the application below to begin the process. </p>

<asp:PlaceHolder runat="server" ID="phErrOuter"></asp:PlaceHolder>
    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>
<asp:Panel runat="server" ID="pnlMain">


   <div style="height:10px;width:100%;"></div>
   <div class="wfprogress">
       <div class="progress-track"> </div>
       <div class="progress-step" runat="server" id="divStep1">Business Details</div>
       <div class="progress-step" runat="server" id="divStep2">Business Address</div>
       <div class="progress-step" runat="server" id="divStep3">Business Contact</div>
       <div class="progress-step" runat="server" id="divStep4">Brand</div>
       <div class="progress-step" runat="server" id="divStep5">Campaign</div>
       <div class="progress-step" runat="server" id="divStep6">Plan</div>
       </div>
    <div style="height:20px;width:100%;"></div>
       
       <asp:Panel runat="server" ID="pnl1">
        




           <div class="row">
                <div class="col-sm-6">
        <div class="form-group">
            <label for="<%=cboBusinessType.ClientID %>">Business Type <span class="text-danger">*</span></label>
            <asp:DropDownList ID="cboBusinessType" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="cboBusinessType_SelectedIndexChanged">
                <asp:ListItem Value="">Select</asp:ListItem>
                <asp:ListItem>Corporation</asp:ListItem>
                <asp:ListItem>Non-profit Corporation</asp:ListItem>
                <asp:ListItem>Limited Liability Corporation</asp:ListItem>
                <asp:ListItem>Partnership</asp:ListItem>
                <asp:ListItem>Co-operative</asp:ListItem>
                <asp:ListItem>Sole Proprietorship</asp:ListItem>

            </asp:DropDownList>
        </div>
    </div>
                <div class="col-sm-6">
        
                
<div class="form-group">
    <label>Country <span class="text-danger">*</span> <cc1:WPHelpIcon ID="WPHelpIcon1" runat="server" HelpText="Currently we only support SMS in the US and Canada. Contact us if you are in another country and interested in SMS service. " /></label>
<asp:DropDownList ID="cboCountry" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="cboCountry_SelectedIndexChanged">

    <asp:ListItem Text="United States" Value="US"></asp:ListItem>
    <asp:ListItem Text="Canada" Value="CA"></asp:ListItem>
</asp:DropDownList></div>
</div>


               


           </div>


<div class="row">
   
    <div class="col-sm-6">


        <div class="form-group">
    <label for="<%=txtBusinessName.ClientID %>" style="padding:4px;"><asp:Label ID="lblBizName" runat="server">Legal Business Name</asp:Label> <span class="text-danger">*</span></label>
    <asp:TextBox ID="txtBusinessName" runat="server" CssClass="form-control" MaxLength="64"></asp:TextBox>
</div>
        
    </div>
    <div class="col-sm-6">

        <asp:Panel runat="server" ID="pnltxtBusinessIDNnum">
        <div class="form-group">
    <label for="<%=txtBusinessIDNnum.ClientID %>"><asp:Label runat="server" ID="lblBusinessNumberLabel"></asp:Label> <span class="text-danger">*</span></label>
    <asp:TextBox ID="txtBusinessIDNnum" runat="server" CssClass="form-control"></asp:TextBox>
</div>
            </asp:Panel>

     </div>

    <div class="col-sm-6">
          <div class="form-group">
              <label>Your Business Phone Number</label>
              <asp:TextBox runat="server" ID="txtBusinessPhone" CssClass="form-control" type="tel"></asp:TextBox>
          </div>
            <asp:HiddenField runat="server" ID="hfCountry" />
    </div>


</div>



           <asp:Panel runat="server" ID="pnlIndustry">
<div class="row">

   
   
    <div class="col-sm-6">
            <div class="form-group">
                <label for="<%=cboIndustry.ClientID %>">Industry <span class="text-danger">*</span></label>
                <asp:DropDownList ID="cboIndustry" runat="server" CssClass="form-control">

                     <asp:ListItem Value="">Select</asp:ListItem>
                    <asp:ListItem Value="AUTOMOTIVE">AUTOMOTIVE</asp:ListItem>
                    <asp:ListItem Value="AGRICULTURE">AGRICULTURE</asp:ListItem>
                    <asp:ListItem Value="BANKING">BANKING</asp:ListItem>
                    <asp:ListItem Value="CONSUMER">CONSUMER</asp:ListItem>
                    <asp:ListItem Value="EDUCATION">EDUCATION</asp:ListItem>
                    <asp:ListItem Value="ENGINEERING">ENGINEERING</asp:ListItem>
                    <asp:ListItem Value="ENERGY">ENERGY</asp:ListItem>
                    <asp:ListItem Value="OIL_AND_GAS">OIL AND GAS</asp:ListItem>
                    <asp:ListItem Value="FAST_MOVING_CONSUMER_GOODS">FAST MOVING CONSUMER GOODS</asp:ListItem>
                    <asp:ListItem Value="FINANCIAL">FINANCIAL</asp:ListItem>
                    <asp:ListItem Value="FINTECH">FINTECH</asp:ListItem>
                    <asp:ListItem Value="FOOD_AND_BEVERAGE">FOOD AND BEVERAGE</asp:ListItem>
                    <asp:ListItem Value="GOVERNMENT">GOVERNMENT</asp:ListItem>
                    <asp:ListItem Value="HEALTHCARE">HEALTHCARE</asp:ListItem>
                    <asp:ListItem Value="HOSPITALITY">HOSPITALITY</asp:ListItem>
                    <asp:ListItem Value="INSURANCE">INSURANCE</asp:ListItem>
                    <asp:ListItem Value="LEGAL">LEGAL</asp:ListItem>
                    <asp:ListItem Value="MANUFACTURING">MANUFACTURING</asp:ListItem>
                    <asp:ListItem Value="MEDIA">MEDIA</asp:ListItem>
                    <asp:ListItem Value="ONLINE">ONLINE</asp:ListItem>
                    <asp:ListItem Value="RAW_MATERIALS">RAW MATERIALS</asp:ListItem>
                    <asp:ListItem Value="REAL_ESTATE">REAL ESTATE</asp:ListItem>
                    <asp:ListItem Value="RELIGION">RELIGION</asp:ListItem>
                    <asp:ListItem Value="RETAIL">RETAIL</asp:ListItem>
                    <asp:ListItem Value="JEWELRY">JEWELRY</asp:ListItem>
                    <asp:ListItem Value="TECHNOLOGY">TECHNOLOGY</asp:ListItem>
                    <asp:ListItem Value="TELECOMMUNICATIONS">TELECOMMUNICATIONS</asp:ListItem>
                    <asp:ListItem Value="TRANSPORTATION">TRANSPORTATION</asp:ListItem>
                    <asp:ListItem Value="TRAVEL">TRAVEL</asp:ListItem>
                    <asp:ListItem Value="ELECTRONICS">ELECTRONICS</asp:ListItem>
                    <asp:ListItem Value="NOT_FOR_PROFIT">NOT FOR PROFIT</asp:ListItem>
                   

                </asp:DropDownList>
            </div>
    </div>

</div>
               </asp:Panel>

  <asp:Panel runat="server" ID="pnlWebSocial">

<div class="row">

    
    <div class="col-sm-6">
        <div class="form-group">
                <label for="<%=txtWebsiteUrl.ClientID %>">Website URL <span class="text-danger">*</span></label>
                <asp:TextBox ID="txtWebsiteUrl" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
    </div>
    <div class="col-sm-6">
           <div class="form-group">
                <label for="<%=txtSocialUrl.ClientID %>">Social Media Profile URL</label>
                <asp:TextBox ID="txtSocialUrl" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
    </div>
</div>
      </asp:Panel>

<p>
<asp:CheckBox runat="server" ID="chkAgree" Text="" />
    <strong>
I declare that the information provided is accurate. I acknowledge that WaiverFile will be processing the information provided for the purposes of identity verification, and that WaiverFile reserves the right to retain the Business Profile information after account closure in the case of a traceback from a regulatory authority or equivalent.
        </strong>
    </p>


<p>WaiverFile will process your personal data in accordance with our <a href="https://www.waiverfile.com/Policies/Privacy-Policy.aspx" target="_blank">Privacy Policy</a>.</p>

<asp:Button runat="server" ID="btnSaveStep1" CssClass="btn btn-primary" Text="Save and Continue" OnClick="btnSaveStep1_Click" />



    </asp:Panel><!-- step 1 -->

    <asp:Panel runat="server" ID="pnl2">

       
        
                    <h3>Business Address</h3>
                    <div class="WPERR_Information">We currently only accept physical addresses for Business Profiles. P.O. box addresses are not accepted. You should also use the same address that is registered with your business ID number entered earlier</div>

                    <div class="row">

                        <div class="col-sm-6">
                              <div class="form-group"><label for="<%=txtAddress.ClientID %>">Street Address <span class="text-danger">*</span></label><asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"/></div>
                        </div>
                        <div class="col-sm-6">  <div class="form-group"><label for="<%=txtAddress2.ClientID %>">Street Address Line 2</label><asp:TextBox ID="txtAddress2" runat="server" CssClass="form-control"/></div></div>

                    </div>

                    <div class="row">

                        <div class="col-sm-4"><div class="form-group"><label for="<%=txtCity.ClientID%>">City <span class="text-danger">*</span></label><asp:TextBox ID="txtCity" runat="server" CssClass="form-control"/></div></div>
                        <div class="col-sm-4"><div class="form-group"><label for="<%=cboState.ClientID%>"><asp:Label runat="server" ID="lblStateProv">State/Province</asp:Label> <span class="text-danger">*</span></label><asp:DropDownList ID="cboState" runat="server" CssClass="form-control" /></div></div>
                        <div class="col-sm-4"><div class="form-group"><label for="<%=txtZip.ClientID%>"><asp:Label runat="server" ID="lblPostalZipCode">Postal/Zip Code</asp:Label> <span class="text-danger">*</span></label><asp:TextBox ID="txtZip" runat="server" CssClass="form-control" MaxLength="20"/></div></div>

                    </div>
            



        <asp:Button runat="server" ID="btnSaveStep2" CssClass="btn btn-primary" Text="Save and Continue" OnClick="btnSaveStep2_Click" />



    </asp:Panel>

    
    <asp:Panel runat="server" ID="pnl3">
        
           

<h3>Authorized Representative #1</h3>
<p>We will contact your authorized representatives to verify your identities. Please ensure that they are contactable via email and phone.</p>

<div class="row">
    <div class="col-sm-6">
        <div class="form-group"><label for="<%=txtRep1First.ClientID %>">First Name <span class="text-danger">*</span></label><asp:TextBox ID="txtRep1First" runat="server" CssClass="form-control"/></div>
    </div>
      <div class="col-sm-6">
          <div class="form-group"><label for="<%=txtRep1Last.ClientID %>">Last Name <span class="text-danger">*</span></label><asp:TextBox ID="txtRep1Last" runat="server" CssClass="form-control"/></div>
    </div>
</div>

        <asp:Panel runat="server" ID="pnlPositionTitle">

<div class="row">
    <div class="col-sm-6">
        <div class="form-group"><label for="<%=cboRep1Position.ClientID %>">Position <span class="text-danger">*</span></label>
            <asp:DropDownList ID="cboRep1Position" runat="server" CssClass="form-control">
                
                 <asp:ListItem Value="">Select</asp:ListItem>
                <asp:ListItem Value="Director">Director</asp:ListItem>
                <asp:ListItem Value="GM">GM</asp:ListItem>
                <asp:ListItem Value="VP">VP</asp:ListItem>
                <asp:ListItem Value="CEO">CEO</asp:ListItem>
                <asp:ListItem Value="CFO">CFO</asp:ListItem>
                <asp:ListItem Value="General Counsel">General Counsel</asp:ListItem>
                <asp:ListItem Value="Other">Other</asp:ListItem>
            </asp:DropDownList>
            
        </div>
    </div>
      <div class="col-sm-6">
          <div class="form-group"><label for="<%=txtRep1Title.ClientID %>">Job Title <span class="text-danger">*</span></label><asp:TextBox ID="txtRep1Title" runat="server" CssClass="form-control"/></div>
    </div>
</div>

            </asp:Panel>


      <div class="row">
            <div class="col-xs-12 col-sm-6">
                <div class="form-group"><label for="<%=txtRep1Email.ClientID %>">Email Address <span class="text-danger">*</span></label><asp:TextBox ID="txtRep1Email" runat="server" CssClass="form-control"/></div>
            </div>
            <div class="col-xs-12 col-sm-6">
                 <div class="form-group"><label for="<%=txtRep1Phone.ClientID %>">Mobile Phone # <span class="text-danger">*</span></label><asp:TextBox ID="txtRep1Phone" runat="server" CssClass="form-control"/></div>

               

            </div>
        </div>

         <asp:Panel runat="server" ID="pnlSolePropVerification">
             <div class="row">
                 <div class="col-xs-12">
                     
                     <img src="/wp-content/images/campaignregsms.png" style="width:250px;max-width:100% " alt="Sample SMS for verification" />

                     <p style="width:250px;max-width:100% "> <span style="font-weight:bold; color:red;">The mobile # entered above will receive a text message from The Campaign Registry (TCR). Once sent, you will have 24 hours to confirm it by replying <u>Yes</u>.</span></p>
                 </div>
             </div>
            
        </asp:Panel>


        <asp:Panel runat="server" ID="pnlRep2">
<asp:CheckBox runat="server" ID="chkAddSecondAuthRep" Text="Add a Second Authorized Representative" />

<div id="divauth2" style="display:none;">
<h3>Authorized Representative #2</h3>
<p>We will contact your authorized representatives to verify your identities. Please ensure that they are contactable via email and phone.</p>
    <div class="row">
    <div class="col-sm-6">
        <div class="form-group"><label for="<%=txtRep2First.ClientID %>">First Name <span class="text-danger">*</span></label><asp:TextBox ID="txtRep2First" runat="server" CssClass="form-control"/></div>
    </div>
      <div class="col-sm-6">
          <div class="form-group"><label for="<%=txtRep2Last.ClientID %>">Last Name <span class="text-danger">*</span></label><asp:TextBox ID="txtRep2Last" runat="server" CssClass="form-control"/></div>
    </div>
</div>
<div class="row">
    <div class="col-sm-6">
        <div class="form-group"><label for="<%=cboRep2Position.ClientID %>">Position <span class="text-danger">*</span></label><asp:DropDownList ID="cboRep2Position" runat="server" CssClass="form-control">
               <asp:ListItem Value="">Select</asp:ListItem>
                <asp:ListItem Value="Director">Director</asp:ListItem>
                <asp:ListItem Value="GM">GM</asp:ListItem>
                <asp:ListItem Value="VP">VP</asp:ListItem>
                <asp:ListItem Value="CEO">CEO</asp:ListItem>
                <asp:ListItem Value="CFO">CFO</asp:ListItem>
                <asp:ListItem Value="General_Counsel">General_Counsel</asp:ListItem>
                <asp:ListItem Value="Other">Other</asp:ListItem>
                                                                                                                               </asp:DropDownList></div>
    </div>
      <div class="col-sm-6">
          <div class="form-group"><label for="<%=txtRep2Title.ClientID %>">Job Title <span class="text-danger">*</span></label><asp:TextBox ID="txtRep2Title" runat="server" CssClass="form-control"/></div>
    </div>
</div>

      <div class="row">
            <div class="col-xs-12 col-sm-6">
                <div class="form-group"><label for="<%=txtRep2Email.ClientID %>">Email Address <span class="text-danger">*</span></label><asp:TextBox ID="txtRep2Email" runat="server" CssClass="form-control"/></div>
            </div>
            <div class="col-xs-12 col-sm-6">
                 <div class="form-group"><label for="<%=txtRep2Phone.ClientID %>">Phone <span class="text-danger">*</span></label><asp:TextBox ID="txtRep2Phone" runat="server" CssClass="form-control"/></div>
            </div>
        </div>

  

</div>
              </asp:Panel>

        <div>
         <asp:Button runat="server" ID="btnSaveStep3" CssClass="btn btn-primary" Text="Save and Continue" OnClick="btnSaveStep3_Click" />
            </div>
    </asp:Panel>

    <asp:Panel runat="server" ID="pnl4">

        


        


        <div class="form-group">
            <label>What type of messaging do you need? <span class="text-danger">*</span></label>
        </div>

        <asp:Panel runat="server" ID="pnlBrandSoleProp">
            <asp:RadioButton runat="server" ID="rbSoleProp" Text="Sole Proprietor ($19 registration fee)" GroupName="rbMessageType" />
        </asp:Panel>
        <asp:Panel runat="server" ID="pnlBrandLoHiVol">

            <div class="form-group">
                <asp:RadioButton runat="server" ID="rbLowVolume" Text="Low Volume ($19 registration fee)" GroupName="rbMessageType" />
                <p class="help-block">Recommended for customers sending fewer than 6,000 message segments per day to the US (2,000 message segments per day to T-Mobile)</p>
            </div>
             <div class="form-group">
               <asp:RadioButton runat="server" ID="rbStandard" Text="Standard ($59 registration fee)" GroupName="rbMessageType" />
                <p class="help-block">Recommended for customers sending messages at scale. Your daily limit may fall between 6,000 and 600,000 message segments per day to the US (2,000 - 200,000 per day to T-Mobile).</p>
            </div>

        </asp:Panel>
   
        <hr />
    
        <asp:Panel runat="server" ID="pnlCompanyType">
         <div class="form-group">
            <label>Company Type <span class="text-danger">*</span> </label>
        <asp:DropDownList ID="cboCompanyType" runat="server" CssClass="form-control" >
        <asp:ListItem Text="Select" Value=""></asp:ListItem>
            <asp:ListItem Text="Private" Value="private"></asp:ListItem>
            <asp:ListItem Text="Public" Value="public"></asp:ListItem>
            <asp:ListItem Text="Non-profit" Value="non-profit"></asp:ListItem>
            <asp:ListItem Text="Government" Value="government"></asp:ListItem>
        </asp:DropDownList></div>
</asp:Panel>

        <div class="form-group">
            <asp:CheckBox runat="server" ID="chkAgreeBrandRegFee" Text="I agree to the one-time brand registration fee" />
                <p class="help-block"><a href="javascript:void(0);" id="btnFeeDialog">About Registration Fees <i class="fa fa-external-link"></i> </a></p>
            </div>

        <div>
        <asp:Button runat="server" ID="btnSaveStep4" CssClass="btn btn-primary" Text="Save and Continue" OnClick="btnSaveStep4_Click" />
            </div>



    </asp:Panel>

    <asp:Panel runat="server" ID="pnl5">

        <asp:Panel runat="server" ID="pnlVertical">
         <div class="form-group">
            <label>Vertical (Industry)</label>
            <asp:DropDownList runat="server" ID="cboVertical" CssClass="form-control">
                <asp:ListItem Value=""></asp:ListItem>
                <asp:ListItem Value="AGRICULTURE">AGRICULTURE</asp:ListItem>
                <asp:ListItem Value="COMMUNICATION">COMMUNICATION</asp:ListItem>
                <asp:ListItem Value="CONSTRUCTION">CONSTRUCTION</asp:ListItem>
                <asp:ListItem Value="EDUCATION">EDUCATION</asp:ListItem>
                <asp:ListItem Value="ENERGY">ENERGY</asp:ListItem>
                <asp:ListItem Value="ENTERTAINMENT">ENTERTAINMENT</asp:ListItem>
                <asp:ListItem Value="FINANCIAL">FINANCIAL</asp:ListItem>
                <asp:ListItem Value="GAMBLING">GAMBLING</asp:ListItem>
                <asp:ListItem Value="GOVERNMENT">GOVERNMENT</asp:ListItem>
                <asp:ListItem Value="HEALTHCARE">HEALTHCARE</asp:ListItem>
                <asp:ListItem Value="HOSPITALITY">HOSPITALITY</asp:ListItem>
                <asp:ListItem Value="HUMAN_RESOURCES">HUMAN_RESOURCES</asp:ListItem>
                <asp:ListItem Value="INSURANCE">INSURANCE</asp:ListItem>
                <asp:ListItem Value="LEGAL">LEGAL</asp:ListItem>
                <asp:ListItem Value="MANUFACTURING">MANUFACTURING</asp:ListItem>
                <asp:ListItem Value="NGO">NGO</asp:ListItem>
                <asp:ListItem Value="POLITICAL">POLITICAL</asp:ListItem>
                <asp:ListItem Value="POSTAL">POSTAL</asp:ListItem>
                <asp:ListItem Value="PROFESSIONAL">PROFESSIONAL</asp:ListItem>
                <asp:ListItem Value="REAL_ESTATE">REAL_ESTATE</asp:ListItem>
                <asp:ListItem Value="RETAIL">RETAIL</asp:ListItem>
                <asp:ListItem Value="TECHNOLOGY">TECHNOLOGY</asp:ListItem>
                <asp:ListItem Value="TRANSPORTATION">TRANSPORTATION</asp:ListItem>
                
            </asp:DropDownList>
              
        </div>

            </asp:Panel>


        <asp:Panel runat="server" ID="pnlUseCase">
        <div class="form-group">
            <label>Campaign Use Case  <span class="text-danger">*</span></label>
           
    <telerik:RadDropDownList runat="server" ID="cboCampaignUseCase" Skin="Bootstrap" DataTextField="Title" DataValueField="Value" Width="100%">


        <ItemTemplate>
            <div><strong><%#Eval("Title") %></strong></div>
            <%#Eval("Description") %>
        </ItemTemplate>

    </telerik:RadDropDownList>



        </div>
            </asp:Panel>

        <div class="form-group">
            <label>Campaign Description <span class="text-danger">*</span></label>
            <asp:TextBox runat="server" ID="txtCampaignDescription" CssClass="form-control" TextMode="MultiLine" MaxLength="4096"></asp:TextBox>
            <p class="help-block"><strong>Must be 40 characters or more. </strong> Describe what you will be using this campaign for. Example: This campaign sends confirmations for signed waivers</p>            
            <p class="help-block"></p>            
        </div>

          <div class="form-group">
            <label>Sample Message #1 <span class="text-danger">*</span></label>
            <asp:TextBox runat="server" ID="txtCampaignSample1" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            <p class="help-block">Provide an example of a message that you will be sending with this campaign. This sample will be used by carriers to help identify your traffic.</p>
              <p class="help-block" runat="server" id="p_SamplePrefill1"><strong>* This sample was pre-filled based on the messages you have created. You can edit it if you wish for the application.</strong></p>
        </div>

         <div class="form-group">
            <label>Sample Message #2 <span class="text-danger">*</span></label>
            <asp:TextBox runat="server" ID="txtCampaignSample2" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            <p class="help-block">Provide an example of a message that you will be sending with this campaign. This sample will be used by carriers to help identify your traffic.</p>
             <p class="help-block" runat="server" id="p_SamplePrefill2"><strong>* This sample was pre-filled based on the messages you have created. You can edit it if you wish for the application.</strong></p>
        </div>

        <div class="form-group">
            <label>Message contents</label>
        </div>
        <asp:CheckBox runat="server" ID="chkCampaignInclLinks" Text="Campaign will include embedded links" /> <br />
        <asp:CheckBox runat="server" ID="chkCampaignInclPhoneNumbers" Text="Campaign will include phone numbers"  /> <br />

          <div class="form-group">
            <label>How do end-users consent to receive messages? <span class="text-danger">*</span></label>
            <asp:TextBox runat="server" ID="txtCampaignOptInConsent" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            <p class="help-block">This field should describe how end users opt-in to the campaign, therefore giving consent to the sender to receive their messages. If multiple opt-in methods can be used for the same campaign, they must all be listed.</p>
             <p class="help-block" runat="server" id="p1"><strong>* This question was pre-filled based on your settings. You can edit it if needed.</strong></p>
        </div>

          <asp:Button runat="server" ID="btnSaveStep5" CssClass="btn btn-primary" Text="Save and Continue" OnClick="btnSaveStep5_Click" />



    </asp:Panel>

       <asp:Panel runat="server" ID="pnl6">

        
        <div class="form-group">
            <label>Select a Plan</label>
        </div>
            <div class="WPERR_Information">Payments will not begin processing until after your SMS profile is approved</div>
           <asp:PlaceHolder runat="server" ID="phPlansSMS"></asp:PlaceHolder>


           

       <asp:PlaceHolder ID="phCartView" runat="server"></asp:PlaceHolder>

<asp:Panel ID="pnlBasicInformation" runat="server">

    
    <div class="form-group"></div>
    <h3>Billing Information</h3>

    <div class="row">
        <div class="col-sm-6">
            <div class="form-group"><label>First Name <span class="text-danger">*</span></label><asp:TextBox ID="txtBillAddrFirst" runat="server" CssClass="form-control"/></div>
        </div>
        <div class="col-sm-6">
            <div class="form-group"><label>Last Name <span class="text-danger">*</span></label><asp:TextBox ID="txtBillAddrLast" runat="server" CssClass="form-control"/></div>
        </div>
    </div>

     <div class="row">
        <div class="col-sm-6">
            <div class="form-group"><label>Company</label><asp:TextBox ID="txtBillAddrCompany" runat="server" CssClass="form-control"/></div>
        </div>
        <div class="col-sm-6">
            <div class="form-group"><label>Phone <span class="text-danger">*</span></label><asp:TextBox ID="txtBillAddrPhone" runat="server" CssClass="form-control"/></div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-6">
            
     <div class="form-group"><label>Country <span class="text-danger">*</span></label><asp:DropDownList ID="cboBillAddrCountry" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="cboBillAddrCountry_SelectedIndexChanged">
    <asp:ListItem Text="United States" Value="US"></asp:ListItem>
    <asp:ListItem Text="Canada" Value="CA"></asp:ListItem>
                                                                                                 </asp:DropDownList></div>

        </div>
    </div>


       <div class="row">
        <div class="col-sm-4">
            <div class="form-group"><label>Address <span class="text-danger">*</span></label><asp:TextBox ID="txtBillAddrAddress" runat="server" CssClass="form-control"/></div>
        </div>
        <div class="col-sm-4">
            <div class="form-group"><label>Address 2</label><asp:TextBox ID="txtBillAddr2" runat="server" CssClass="form-control"/></div>
        </div>
           <div class="col-sm-4">
               <div class="form-group"><label>Address 3</label><asp:TextBox ID="txtBillAddr3" runat="server" CssClass="form-control"/></div>
        </div>
    </div>




     <div class="row">
        <div class="col-sm-4">
            <div class="form-group"><label>City <span class="text-danger">*</span></label><asp:TextBox ID="txtBillAddrCity" runat="server" CssClass="form-control"/></div>
        </div>
        <div class="col-sm-4">
            <div class="form-group"><label>State/Province <span class="text-danger">*</span></label><asp:DropDownList ID="cboBillAddrStateProv" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="cboState_SelectedIndexChanged"/></div>
        </div>
         <div class="col-sm-4">
             <div class="form-group"><label>Postal/Zip Code <span class="text-danger">*</span></label><asp:TextBox ID="txtBillAddrZip" runat="server" CssClass="form-control"/></div>
        </div>
    </div>

    
    <asp:Panel runat="server" ID="pnlCounty" CssClass="form-group">
        <div class="row">
        <div class="col-sm-6">
                    <div class="form-group"><label>County <span class="text-danger">*</span></label><asp:DropDownList ID="cboBillAddrCounty" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="cboCounty_SelectedIndexChanged"/></div>
            </div>
            </div>
                </asp:Panel>


     
 

</asp:Panel>
  

           <div id="pmtMethodHeaderWrap" runat="server">
            <h4>Choose a payment method</h4>
    
            <div class="form-group">
                <asp:RadioButtonList ID="rblPaymentMethods" runat="server" RepeatLayout="Flow"></asp:RadioButtonList>
            </div>
                </div>
        
           <div class="row">
          <div class="col-xs-12">
            <asp:PlaceHolder ID="phPaymentForms" runat="server"></asp:PlaceHolder>
          </div>
      </div>  
             <asp:PlaceHolder ID="phTax" runat="server"></asp:PlaceHolder>

           <asp:CheckBox runat="server" id="cboBypassPayment" Visible="false" Text="Bypass payment processing (for admin use only)" />

          <asp:Button runat="server" ID="btnSaveStep6" CssClass="btn btn-primary" Text="Submit Profile" OnClick="btnSaveStep6_Click"
              OnClientClick="return preventMultipleSubmissions();"
              />



    </asp:Panel>

    </asp:Panel><!-- pnlmain -->

   




</asp:Content>
