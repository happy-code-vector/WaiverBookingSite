<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewWFAddonSvcDetails.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.ViewWFAddonSvcDetails" %>


<script type="text/javascript">
    function setOverides() {
        if ($('#<%=chkOverridePricing.ClientID%>').is(':checked')) {
            $('#overrides').show();
        } else {
            $('#overrides').hide();
        }
    }
    $(function(){
        setOverides();
        $('#<%=chkOverridePricing.ClientID%>').change(function () { setOverides(); });
    });
</script>


            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
            
                <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Addon Service</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
                <asp:PlaceHolder ID="ph0" runat="server"></asp:PlaceHolder>
               
                 <div class="form-group">
                     <label for="<%=lblServiceType.ClientID %>">Service Type</label>
                     <asp:Label ID="lblServiceType" CssClass="form-control" runat="server"></asp:Label>
                </div>
                   <div class="form-group">
                     <label for="<%=lblCurrentUsage.ClientID %>">Current Usage</label>
                     <asp:Label ID="lblCurrentUsage" CssClass="form-control" runat="server"></asp:Label>
                </div>
               
                 <div class="form-group">
                     <label for="<%=dtStartDate.ClientID %>">Start Date</label>
                       <telerik:RadDatePicker ID="dtStartDate" CssClass="form-control" runat="server"></telerik:RadDatePicker>
                </div>
               
                 <div class="form-group">
                     <label for="<%=dtExpirationDate.ClientID %>">Expiration Date</label>
                       <telerik:RadDatePicker ID="dtExpirationDate" CssClass="form-control" runat="server"></telerik:RadDatePicker>
                </div>
               
                 <div class="form-group">
                     <label for="<%=cboStatus.ClientID %>">Status</label>
                     <asp:DropdownList ID="cboStatus" CssClass="form-control" runat="server"></asp:DropdownList>
                </div>

                 <div class="form-group">
                     <label for="<%=cboRenewalPeriod.ClientID %>">Status</label>
                     <asp:DropdownList ID="cboRenewalPeriod" CssClass="form-control" runat="server"></asp:DropdownList>
                </div>
               
               
                 <div class="form-group">
                     <asp:CheckBox ID="chkOverridePricing" CssClass="form-control" runat="server" Text="Override Pricing"></asp:CheckBox>
                </div>
               
                <div id="overrides">
                     <div class="form-group">
                         <label for="<%=txtOverrideAmount.ClientID %>">Amount</label><asp:TextBox ID="txtOverrideAmount" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
               
                     <div class="form-group">
                         <label for="<%=cboOverrideInterval.ClientID %>">Interval</label>
                         <asp:DropdownList ID="cboOverrideInterval" CssClass="form-control" runat="server"></asp:DropdownList>
                    </div>
               </div>
                
               


                 </div><!-- /.box-body -->
    <div class="box-footer">
       <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />
        <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Delete this Addon" onclick="btnDelete_Click" />
    </div>
</div>


            
