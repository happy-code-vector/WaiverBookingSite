<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditUserMobileNum.aspx.cs" Inherits="WaiverFile.site.admin.settings.EditUserMobileNum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" href="/site/includes/intlTelInput.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
      <script src="/site/includes/intlTelInput.min.js"></script>
    <script src="/site/includes/jquery.mask.min.js"></script>
     <script type="text/javascript">
         $(function () {

             var phoneInputID = "#txtMobileNum";
             var input = document.querySelector("#txtMobileNum");
             var iti = window.intlTelInput(input, {
                 formatOnDisplay: true,
                 hiddenInput: "rawNum",
                 initialCountry: "us",
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


    <h3><asp:Label runat="server" ID="lblHeading"></asp:Label></h3>
    <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

    <asp:Panel runat="server" ID="pnlMain">
        <div class="form-group">
            <label>User: </label>
            <asp:Label ID="lblName" runat="server"></asp:Label>
        </div>
         <div>
                <div class="form-group">
                <label for="txtMobileNum" class="control-label">Mobile Number <span class="text-danger" id="req_mobilenum" runat="server">*</span>
                </label>
                    <div style="">
            <asp:TextBox runat="server" ID="txtMobileNum" CssClass="form-control" type="tel" ClientIDMode="Static"></asp:TextBox>
                    <asp:HiddenField runat="server" ID="hfCountry" />
                    
                        </div>
              </div>

                    <div>
                        
                         <p class="help-block"><asp:CheckBox runat="server" ID="chkSMSOptIn" /> I have permission to send SMS text messages to this number. (<a href="https://www.waiverfile.com/Policies/Messaging-Policy.aspx" target="_blank">Messaging policy <i class="fa fa-external-link"></i></a>)
                   
                    </p>
                     </div>

             <asp:Panel runat="server" ID="pnlGetSMS">
                 <div class="WPERR_Validation">In order to send SMS text messages, you need to have a texting plan. <a href="../SMS/SMSDemo.aspx" target="_blank">Learn More <i class="fa fa-external-link"></i></a></div>
             </asp:Panel>
             
            </div>

    <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click" />
</asp:Panel>

</asp:Content>
