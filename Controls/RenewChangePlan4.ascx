<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RenewChangePlan4.ascx.cs" Inherits="WaiverFile.Controls.RenewChangePlan4" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="~/Controls/GTMPixel.ascx" TagPrefix="uc1" TagName="GTMPixel" %>
<uc1:GTMPixel runat="server" id="GTMPixel" />

<style type="text/css">
    .loadingPanel {
    position: absolute;
    background: rgba(255, 255, 255, 0.6); /* Semi-transparent white */
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 999;
}

.loading-container {
    text-align: center;
    font-weight: bold;
    color: #333;
}

.loading-container img {
    width: 50px; /* Adjust spinner size */
    height: 50px;
    margin-bottom: 10px;
}

</style>

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
        <%  if (autoPopModalMainPlan) { %>
        $('#modalSelectPlanWaiver').modal('show');
        <%}%>
        $('#btnPlanWaiverSelect').click(function () {
            $('#modalSelectPlanWaiver').modal('show');
        });

        $('#<%=btnPlanSMSSelect.ClientID%>').click(function () {
            if ($(this).data('noplan') == 'true' || $(this).data('noplan') == true) {
                document.location.href = "../SMS/SMSDemo.aspx";
            } else {
                $('#modalSelectPlanSMS').modal('show');
            }
            
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

<asp:UpdatePanel runat="server" ID="pnlWrapMaintVars">
    <ContentTemplate>
        <asp:HiddenField runat="server" id="hfOfferID"></asp:HiddenField>
    </ContentTemplate>
    
</asp:UpdatePanel>

<p></p>

<asp:Panel runat="server" ID="pnlWayPastDueWarning" Visible="false">
     <div class="panel panel-danger" runat="server" id="div1">
                <div class="panel-heading">
                    <h4 class="text-center"><i class="fa fa-exclamation-triangle"></i> Special Notice</h4>
                </div>
                <div class="panel-body text-center">
                    <p>
                        Your account expired some time ago and the payment form below is requesting payment for this time as past due. If you have
                        not been using this account and wish to request an extension to cover that time, please click below. The expiration date needs 
                        to be adjusted manually so a WaiverFile team member will review your account and contact you with further instructions. 
                    </p>
                    <p>
                        <asp:Button runat="server" ID="btnRequestExtension" CssClass="btn btn-primary" Text="Request Extension" OnClick="btnRequestExtension_Click" />
                    </p>
                </div>
            </div>
</asp:Panel>

<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<asp:Panel ID="pnlMain" runat="server">

    <div class="row">
        <div class="col-xs-6">
            <div class="panel panel-primary" runat="server" id="divPanelPlan">
                <div class="panel-heading">
                    <h4 class="text-center">Waiver Plan</h4>
                </div>
                <div class="panel-body text-center">
                    <p></p>
                   
                    <p><strong><asp:Label ID="lblPlanWaiverDetail" runat="server"></asp:Label></strong></p>
                     <p>
                        <asp:Label ID="lblPlanWaiverPrice" runat="server"></asp:Label>
                    </p>
                    <p><small><asp:Label ID="lblPlanWaiverDetail2" runat="server"></asp:Label></small></p>
                    <p></p>
                    <a href="javascript:void(0);" id="btnPlanWaiverSelect" class="btn btn-primary">
                        <asp:Label ID="lblBtnPlanWaiverSelectText" runat="server">Change Plan</asp:Label>
                    </a>
                </div>
            </div>


        </div>
        <div class="col-xs-6">
           
               <div class="panel panel-primary" runat="server" id="divPanelPlanSMS">
                <div class="panel-heading">
                    <h4 class="text-center">Text Messaging Plan</h4>
                </div>
                <div class="panel-body text-center">
                    <p></p>
                    <p><strong>
                        <asp:Label ID="lblPlanSMSPrice" runat="server"></asp:Label>
                       </strong>
                    </p>
                    <p><asp:Label ID="lblPlanSMSDetail" runat="server"></asp:Label></p>
                    <p><small><asp:Label ID="lblPlanSMSDetail2" runat="server"></asp:Label></small></p>
                    <p></p>
                    <a href="javascript:void(0);" id="btnPlanSMSSelect" class="btn btn-primary" runat="server">
                        <asp:Label ID="lblBtnPlanSMSSelectText" runat="server">Change Plan</asp:Label>
                    </a>
                </div>
            </div>

        </div>
    </div>

    <!-- modals -->
    
    
<div id="modalSelectPlanWaiver" class="modal fade footer-to-bottom" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg " role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">Select a Waiver Plan</h4>
      </div>
      <div class="modal-body" >
        <asp:PlaceHolder ID="phPlansWaiver" runat="server"></asp:PlaceHolder>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div id="modalSelectPlanSMS" class="modal fade footer-to-bottom" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg " role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">Select a Text Messaging Plan</h4>
      </div>
      <div class="modal-body" >
        <asp:PlaceHolder ID="phPlansSMS" runat="server"></asp:PlaceHolder>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



   

       <asp:PlaceHolder ID="phCartView" runat="server"></asp:PlaceHolder>

<asp:Panel ID="pnlBasicInformation" runat="server">

    

<legend>Billing Information</legend>


    <div class="row">
        <div class="col-sm-6"><div class="form-group"><label for="txtFirst">First Name <span class="text-danger">*</span></label><asp:TextBox ID="txtFirst" ClientIDMode="Static" runat="server" CssClass="form-control"/></div></div>
        <div class="col-sm-6"><div class="form-group"><label for="txtLast">Last Name <span class="text-danger">*</span></label><asp:TextBox ID="txtLast" ClientIDMode="Static" runat="server" CssClass="form-control"/></div></div>
    </div>

    <div class="row">
        <div class="col-sm-6"><div class="form-group"><label for="txtCompany">Company</label><asp:TextBox ID="txtCompany" runat="server" ClientIDMode="Static" CssClass="form-control"/></div></div>
        <div class="col-sm-6"><div class="form-group"><label for="txtPhone">Phone <span class="text-danger">*</span></label><asp:TextBox ID="txtPhone"  ClientIDMode="Static" runat="server" CssClass="form-control"/></div></div>
    </div>
<telerik:RadAjaxLoadingPanel ID="RadLoadingPanel" runat="server" CssClass="loadingPanel">
    <div class="loading-container">
        <img src="/wp-content/images/loading.gif" alt="Loading..." />
        <span>Loading, please wait...</span>
    </div>
</telerik:RadAjaxLoadingPanel>

<telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadLoadingPanel">
   

    <div class="row">
        <div class="col-sm-6"><div class="form-group"><label for="cboCountry">Country <span class="text-danger">*</span></label><asp:DropDownList ID="cboCountry" runat="server" ClientIDMode="Static" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="cboCountry_SelectedIndexChanged"/></div></div>
    </div>
    <div class="row">
        <div class="col-sm-4"><div class="form-group"><label for="txtAddress">Address <span class="text-danger">*</span></label><asp:TextBox ID="txtAddress" runat="server" ClientIDMode="Static" CssClass="form-control"/></div></div>
        <div class="col-sm-4"><div class="form-group"><label for="txtAddress2">Address 2</label><asp:TextBox ID="txtAddress2" runat="server" CssClass="form-control" ClientIDMode="Static"/></div></div>
        <div class="col-sm-4"><div class="form-group"><label for="txtAddress3">Address 3</label><asp:TextBox ID="txtAddress3" runat="server" CssClass="form-control" ClientIDMode="Static"/></div></div>
    </div>
    <div class="row">
        <div class="col-sm-4"><div class="form-group"><label for="txtCity">City <span class="text-danger">*</span></label><asp:TextBox ID="txtCity" runat="server" CssClass="form-control" ClientIDMode="Static"/></div></div>
        <div class="col-sm-4"><div class="form-group"><label for="cboState">State/Province <span class="text-danger">*</span></label><asp:DropDownList ID="cboState" runat="server" CssClass="form-control" ClientIDMode="Static" AutoPostBack="true" OnSelectedIndexChanged="cboState_SelectedIndexChanged"/></div></div>
        <div class="col-sm-4"><div class="form-group"><label for="txtZip">Postal/Zip Code <span class="text-danger">*</span></label><asp:TextBox ID="txtZip" runat="server" CssClass="form-control" ClientIDMode="Static"/></div></div>
    </div>

     <asp:Panel runat="server" ID="pnlCounty" CssClass="form-group">
          <div class="row">
        <div class="col-sm-6">
                    <div class="form-group"><label for="cboCounty">County <span class="text-danger">*</span></label><asp:DropDownList ID="cboCounty" runat="server" ClientIDMode="Static" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="cboCounty_SelectedIndexChanged"/></div>
            </div></div>
                </asp:Panel>

     </telerik:RadAjaxPanel>

     
 

</asp:Panel>
  
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