<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditWaiverValues.ascx.cs" Inherits="WaiverFile.Controls.EditWaiverValues" %>
<%@ Register Assembly="WaiverFile" Namespace="WaiverFile.Core" TagPrefix="cc2" %>

<!-- FORM VALIDATION ELEMENTS -->
<script type="text/javascript" src="/wp-content/Plugins/WaiverFile/Docs/FormValidation/formValidation.custom.min.js"></script>
<script type="text/javascript" src="/wp-content/Plugins/WaiverFile/Docs/FormValidation/bootstrap.min.js"></script><!-- different than the main bootstrap js -->
<link rel="stylesheet" href="/wp-content/Plugins/WaiverFile/Docs/FormValidation/formValidation.min.css" />
<link rel="stylesheet" href="/wp-content/Plugins/WaiverFile/Docs/FormValidation/fixes.css" />


<script type="text/javascript">

    //MOBILENUM AUTOFILL VALIDATE FIX
    var mobileNumLateValidatePending = false;
    function mobleNumLateValidate() {
        if (mobileNumLateValidatePending == true) {
            return;
        }
        mobileNumLateValidatePending = true;
        setTimeout(() => {
            var formValidation = $('#Form1').data('formValidation');
            formValidation.revalidateField($('#<%=txtMobileNum.ClientID%>').attr('name'));
            mobileNumLateValidatePending = false;
        }, 500);

    }

    $(function () {
        $("input[data-ensuretrigger='true']").change(function () {
            var formValidation = $('#Form1').data('formValidation');
            formValidation.revalidateField($("input[data-fieldcidmaster='" + $(this).data('fieldcidalt') + "']").attr('name'));
        });

        //SETUP VALIDATION
        $('#Form1').formValidation({
            framework: 'bootstrap',
            container: '#messages',
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            }
        })
            .on('err.field.fv', function (e, data) {
                data.fv.disableSubmitButtons(false);
            })
            .on('success.field.fv', function (e, data) {
                data.fv.disableSubmitButtons(false);
            });

        <% if(IsPostBack){ %>
        $('#Form1').formValidation().formValidation('validate');//THIS DISABLES BUTTONS EVEN THOUGH WE HAVE CODE TO PREVENT ABOVE.
        $('#<%=btnSave.ClientID%>').removeAttr('disabled');//SO RE-ENABLE THEM
        $('#<%=btnSave.ClientID%>').removeClass('disabled');

        <% } %>
    });

</script>

<h3>Edit Waiver</h3>
<p><strong>* All original values will be saved. You can view or restore them anytime.</strong></p>
<asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>
 <link rel="stylesheet" href="/site/includes/intlTelInput.css">
  <script src="/site/includes/intlTelInput.min.js"></script>
    <script src="/site/includes/jquery.mask.min.js"></script>

<script type="text/javascript">

    $(function () {

    

    var phoneInputID = "#txtMobileNum";
    var input = document.querySelector("#txtMobileNum");
    var iti = window.intlTelInput(input, {
        formatOnDisplay: true,
        hiddenInput: "rawNum",
        initialCountry: "<%=_defaultCountryCode.ToLower()%>",
               onlyCountries: ['us', 'ca'], //FOR NOW
              //preferredCountries: ['us', 'ca'],
              utilsScript: "/site/includes/utils.js",
          });
          $(phoneInputID).on('countrychange', function (e) {
              $('#<%=hfCountry.ClientID%>').val(iti.getSelectedCountryData().iso2);
              var selectedCountryData = iti.getSelectedCountryData();
              newPlaceholder = intlTelInputUtils.getExampleNumber(selectedCountryData.iso2, true, intlTelInputUtils.numberFormat.INTERNATIONAL),
                  mask = newPlaceholder.replace(/[1-9]/g, "0");
              $(this).mask(mask);
          });

    iti.promise.then(function () {
        $(phoneInputID).trigger("countrychange");
    });

    });

</script>
     
            
             <h3>
                  <%=instance.GetLabel("PARENT_GUARDIAN_INFO", conn, site) %>
             </h3>
            
            
        <div class="row">
            <% if (includeFirstNameFields) { %>
            <div class="<%=_colClassFields1 %>">
                <div class="form-group">
                    <label for="<%=txtSignedNameFirst.ClientID %>"><%=instance.GetLabel("LBL_FIRSTNAME", conn, site) %> <span class="text-danger">*</span></label>
                    <asp:TextBox CssClass="form-control" ID="txtSignedNameFirst" runat="server" MaxLength="500"></asp:TextBox>
                </div>
            </div>
            <% } %>
            <div class="<%=_colClassFields1 %>">
                <div class="form-group">
                    <label for="<%=txtSignedName.ClientID %>">
                         <% if (includeFirstNameFields) { %>
                            <%=instance.GetLabel("LBL_LASTNAME", conn, site) %>
                        <% } else { %>
                        <%=instance.GetLabel("YOUR_FULL_NAME", conn, site) %>
                         <% } %>
                        <span class="text-danger">*</span>
                    </label>
                    <asp:TextBox CssClass="form-control" ID="txtSignedName" runat="server" MaxLength="500"></asp:TextBox>
                </div>
            </div>
        

            
            <div id="dobfield" runat="server">
                <div class="form-group">
                <label class="control-label"><%=instance.GetLabel("YOUR_DATE_OF_BIRTH", conn, site) %>
                    <span class="text-danger" id="reqStar_DOB" runat="server">*</span>
                </label>
                    <cc2:WFDatePicker runat="server" ID="dpDOB" EnableClientSideValidation="false"/>
                    
           </div>
            </div>
            <div runat="server" id="div_email">
                <div class="form-group">
                <label for="<%=txtEmail.ClientID %>" class="control-label"><%=instance.GetLabel("LBL_EMAILADDRESS", conn, site) %> <span class="text-danger" id="reqStar_email" runat="server">*</span>
                </label>
            
                    <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" type="email" MaxLength="500"></asp:TextBox>
                </div>
            </div>
            <div runat="server" id="div_phone">
                <div class="form-group">
                <label for="<%=txtTelephone.ClientID %>" class="control-label"><%=instance.GetLabel("STD_FIELD_LABEL_PHONE", conn, site) %> <span class="text-danger" id="reqStart_phone" runat="server">*</span>
                </label>
            
                    <asp:TextBox CssClass="form-control" ID="txtTelephone" runat="server" type="tel" MaxLength="20"></asp:TextBox>
              </div>
            </div>



               <div runat="server" id="div_mobilenum">
                <div class="form-group">
                <label for="txtMobileNum" class="control-label"><%=instance.GetLabel("SMS_FIELD_LABEL", conn, site) %> <span class="text-danger" id="req_mobilenum" runat="server">*</span>
                </label>
                    <div style="">
            <asp:TextBox runat="server" ID="txtMobileNum" CssClass="form-control" type="tel" ClientIDMode="Static"></asp:TextBox>
                    <asp:HiddenField runat="server" ID="hfCountry" />
                    <p class="help-block">
                        <%=instance.GetLabel("SMS_FIELD_DESCRIPTION", conn, site) %>
                    </p>
                        </div>
              </div>

                    <div runat="server" id="div_mobile_confirm">
                        <asp:CheckBox runat="server" ID="chkSMSOptIn" />
                         <p class="help-block">
                        <%=instance.GetLabel("SMS_OPTIN_DESCRIPTION", conn, site) %>
                    </p>
                     </div>
            </div>


        </div>







        <div runat="server" id="div_address">
            <div class="row">
            <div class="col-sm-6">
            <div class="form-group">
                <label for="<%=txtAddress.ClientID %>" class="control-label"><%=instance.GetLabel("LBL_ADDRESS", conn, site) %> <span class="text-danger" id="reqStart_addr1" runat="server">*</span></label>
                
                    <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" MaxLength="500"></asp:TextBox>
            </div>
                </div>
             <div class="col-sm-6">
            <div class="form-group">
                <label for="<%=txtAddress2.ClientID %>" class="control-label"><%=instance.GetLabel("LBL_ADDRESSLINE2", conn, site) %>
                </label>
                
                    <asp:TextBox CssClass="form-control" ID="txtAddress2" runat="server" MaxLength="500"></asp:TextBox>
            </div>
                </div>
</div>

            <div class="row">
                <div class="col-sm-4">
            <div class="form-group">
                <label  for="<%=txtCity.ClientID %>" class="control-label"><%=instance.GetLabel("LBL_CITY", conn, site) %> <span class="text-danger" id="reqStart_addr2" runat="server">*</span>
                   
                </label>
                
                    <asp:TextBox CssClass="form-control" ID="txtCity" runat="server" MaxLength="255"></asp:TextBox>
            </div>
                    </div>
                 <div class="col-sm-4">
            <div class="form-group">
                <label for="<%=txtState.ClientID %>"  class="control-label"><%=instance.GetLabel("LBL_STATE", conn, site) %> <span class="text-danger" id="reqStart_addr3" runat="server">*</span>
                </label>
                
                    <asp:TextBox CssClass="form-control" ID="txtState" runat="server" MaxLength="2"></asp:TextBox>
            </div>
                     </div>
                 <div class="col-sm-4">
            <div class="form-group">
                <label  for="<%=txtZip.ClientID %>" class="control-label"><%=instance.GetLabel("LBL_ZIP", conn, site) %> <span class="text-danger" id="reqStart_addr4" runat="server">*</span>
                </label>
                
                    <asp:TextBox CssClass="form-control" ID="txtZip" runat="server" MaxLength="6"></asp:TextBox>
            </div></div>
                </div>

        </div>

<asp:PlaceHolder runat="server" ID="phForm"></asp:PlaceHolder>
    <asp:Panel ID="pnlJoinMailingList" runat="server">

                <div class="row">
                    <div class="col-xs-12">
                <div class="form-group">
                    <asp:CheckBox runat="server" ID="chkJoinMailingList" CssClass="checkbox"></asp:CheckBox>
                    <asp:PlaceHolder runat="server" ID="phJoinMailingListHelpBlock"></asp:PlaceHolder>
                </div></div>
                    </div>

            </asp:Panel>
  
     <div id="messages"></div>
<asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click" />