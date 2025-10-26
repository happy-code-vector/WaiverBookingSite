<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RenewChangePlan3.ascx.cs" Inherits="WaiverFile.Controls.RenewChangePlan3" %>

<script type="text/javascript">
    //PREVENT DOUBLE SUBMIT
    var isSubmitted = false;
    function preventMultipleSubmissions() {
        if (!isSubmitted) {
            $('#<%=btnSubmit.ClientID %>').val('Submitting.. Please Wait..');
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
        $('#<%=btnSubmit.ClientID%>').show();


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

<asp:UpdatePanel runat="server" ID="pnlWrapMaintVars">
    <ContentTemplate>
        <asp:HiddenField runat="server" id="hfOfferID"></asp:HiddenField>
    </ContentTemplate>
    
</asp:UpdatePanel>

<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<asp:Panel ID="pnlMain" runat="server">
<asp:PlaceHolder ID="phPrices" runat="server"></asp:PlaceHolder>
   

<asp:Panel ID="pnlBasicInformation" runat="server">

    

<legend>Billing Information</legend>


      <div class="row">
            <div class="col-xs-12 col-sm-6">
                  <div class="form-group"><label>First Name <span class="text-danger">*</span></label><asp:TextBox ID="txtFirst" runat="server" CssClass="form-control"/></div>
                  <div class="form-group"><label>Last Name <span class="text-danger">*</span></label><asp:TextBox ID="txtLast" runat="server" CssClass="form-control"/></div>
                <div class="form-group"><label>Company</label><asp:TextBox ID="txtCompany" runat="server" CssClass="form-control"/></div>
                <div class="form-group"><label>Address <span class="text-danger">*</span></label><asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"/></div>
                <div class="form-group"><label>Address 2</label><asp:TextBox ID="txtAddress2" runat="server" CssClass="form-control"/></div>
                <div class="form-group"><label>Address 3</label><asp:TextBox ID="txtAddress3" runat="server" CssClass="form-control"/></div>
            </div>
            <div class="col-xs-12 col-sm-6">
                
                 <div class="form-group"><label>City <span class="text-danger">*</span></label><asp:TextBox ID="txtCity" runat="server" CssClass="form-control"/></div>
                <%if(_supportInternationalAddresses){ %> 
                <div class="form-group"><label>Country <span class="text-danger">*</span></label><asp:DropDownList ID="cboCountry" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="cboCountry_SelectedIndexChanged"/></div>
                <%} %>
                <div class="form-group"><label>State/Province <span class="text-danger">*</span></label><asp:DropDownList ID="cboState" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="cboState_SelectedIndexChanged"/></div>
                <asp:Panel runat="server" ID="pnlCounty" CssClass="form-group">
                    <div class="form-group"><label>County <span class="text-danger">*</span></label><asp:DropDownList ID="cboCounty" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="cboCounty_SelectedIndexChanged"/></div>
                </asp:Panel>
                 <div class="form-group"><label>Postal Code <span class="text-danger">*</span></label><asp:TextBox ID="txtZip" runat="server" CssClass="form-control"/></div>
                 <div class="form-group"><label>Phone <span class="text-danger">*</span></label><asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"/></div>
            </div>
        </div>

     
 

</asp:Panel>
     <asp:PlaceHolder ID="phPastDueBillingItems" runat="server"></asp:PlaceHolder>
<asp:Panel ID="pnlPaymentInformation" runat="server">

    <div id="pmtMethodHeaderWrap" runat="server">
    <h4>Choose a payment method</h4>
    
    <div class="form-group">
        <asp:RadioButtonList ID="rblPaymentMethods" runat="server" RepeatLayout="Flow"></asp:RadioButtonList>
    </div>
        </div>
     
    <div class="form-group"><div id="total" style="font-size:200%"></div><%if (Page is Waypoint.Core.WPAdminPage){ %>Price Override: <%} %><input type="<%if(Page is Waypoint.Core.WPAdminPage){ %>text<%}else{ %>hidden<%} %>" name="hidTotal" id="hidTotal" />
        <asp:PlaceHolder ID="phAdminPreviousPriceOverride" runat="server"></asp:PlaceHolder>
    </div>
    
      <div class="row">
          <div class="col-xs-12">
            <asp:PlaceHolder ID="phPaymentForms" runat="server"></asp:PlaceHolder>
          </div>
      </div>  

    <div class="form-group" id="recurringpaymentsbox" style="display:none;"><asp:CheckBox ID="chkRecurringPayments" runat="server" Checked="true" /> Automatically charge me at each billing cycle. </div>

    <asp:PlaceHolder ID="phTax" runat="server"></asp:PlaceHolder>

    <div class="form-group"><asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-default" style="display:none;"
            onclick="btnSubmit_Click" OnClientClick="return preventMultipleSubmissions();" /></div>

   
    
     
</asp:Panel>


    </asp:Panel>

<br /><br />