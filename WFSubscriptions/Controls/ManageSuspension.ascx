<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageSuspension.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.ManageSuspension" %>
     <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script type="text/javascript">
    $(function () {
        $('.btnShowManualEdit').click(function () {
            $('#divEditDate').show();
        });

        <%=onloadBonusCode%>
    });
</script>




<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Manage Suspension
</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        <div class="form-group">
            <label>Customer</label>
            <asp:Label runat="server" ID="lblCustomerName"></asp:Label>
            <asp:HiddenField ID="hfSubID" runat="server" />
        </div>
        <div class="form-group">
            <label>Sites in subscription</label>
            <asp:Label runat="server" ID="lblSites"></asp:Label>
            <asp:HiddenField ID="HiddenField1" runat="server" />
        </div>

        <div class="form-group">
            <label>Suspension Date</label>
            <asp:Label runat="server" ID="lblSuspendDate"></asp:Label>
        </div>

       
        <asp:Panel runat="server" ID="pnlEditDateManuallyLink">
            <a href="javascript:void(0);" class="btnShowManualEdit btn btn-default btn-sm">Change Suspension Date</a><br /><br />
            <asp:Button runat="server" ID="btnCancelSuspension" Text="Cancel Suspension" CssClass="btn btn-default" OnClick="btnCancelSuspension_Click" />
        </asp:Panel>
        <asp:Panel runat="server" ID="pnlSetDateStandard">
            <asp:Button runat="server" ID="btnSetDateStandard" CssClass="btn btn-danger btn-sm" Text="Set Suspension Date - 2 Weeks" OnClick="btnSetDateStandard_Click" />
            <p class="help-block">This will set the suspension date for 2 weeks from today and begin sending a series of emails to notify the customer about the suspension. Alternatively, you can <a href="javascript:void(0);" class="btnShowManualEdit">set a date manually</a>. Note that the emails will run based on the number of days before the suspend date that they are scheduled for.</p>
        </asp:Panel>

        <div class="form-group" style="display:none;" id="divEditDate">
             <label for="<%=dtSuspendDate.ClientID %>">Suspension Date</label>
             <telerik:RadDatePicker ID="dtSuspendDate" runat="server"></telerik:RadDatePicker>

             <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Submit" OnClick="btnSave_Click" />

        </div>


        <asp:Panel runat="server" ID="pnlSuspendDateReached">
        <p><strong>Suspension date has passed</strong>. Click below to mark subscription as suspended.  </p>
        </asp:Panel>

        <asp:Panel runat="server" ID="pnlSubscriptionIsSuspended">
        <p><strong class="text-danger">Subscription is Suspended</strong><br />
            This subscription has been suspended. If you need the link to direct them to reactivate, use the following: 
            <asp:HyperLink runat="server" ID="linkReactivate"></asp:HyperLink>

        </p>
        </asp:Panel>




    </div><!-- /.box-body -->
    
</div>
