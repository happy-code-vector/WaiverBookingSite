<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddSiteUser.ascx.cs" Inherits="WaiverFile.Controls.AddSiteUser" %>

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

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Add Site Admin User
</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        <div class="form-group">
            <label>First Name</label>
            <asp:TextBox ID="txtFirst" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Last Name</label>
            <asp:TextBox ID="txtLast" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Email address</label>
            <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="form-control" placeholder="Email Address"></asp:TextBox>
        </div>
          
        <asp:Panel runat="server" ID="pnlSMS">
                <div class="form-group">
    <label for="txtMobileNum" class="control-label">Mobile Number
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
    
        </asp:Panel>
               

        <div class="form-group">
            <label>Access Level</label>
            <asp:DropDownList runat="server" ID="cboRole" CssClass="form-control"></asp:DropDownList>
        </div>

    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Submit" OnClick="btnSave_Click"
             />
    </div>
</div>
