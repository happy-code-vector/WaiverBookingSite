<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Scanner-Settings.aspx.cs" Inherits="WaiverFile.site.admin.settings.Scanner_Settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    <script type="text/javascript">

        function isWholeNumber(value) {
            // Convert value to number and check if it's a whole number
            const num = Number(value);
            return !isNaN(num) && num % 1 === 0; // true if it's a whole number
        }

        function showHideWarn() {
            
            var value = $('#<%=txtTicketExpirationDates.ClientID%>').val();
            if (value == '') {
                $('#ticketagewarning').show();
            }
            else if (isWholeNumber(value)) {
                if (value > 90) {
                    $('#ticketagewarning').show();
                } else {
                    $('#ticketagewarning').hide();
                }
            } else {
                $('#ticketagewarning').hide();
            }
        }
        function tweakExpirationForEntryMode() {
            var selMode = $('#<%=cboReEntryMode.ClientID%>').val();
            var isOptional = true;
            if (selMode == 'Always_allow') {
                isOptional = true;
            } else if (selMode == 'One_entry_per_waiver') {
                isOptional = false;
            } else if (selMode == 'One_entry_daily') {
                isOptional = true;
            }
            if (isOptional) {
                $('#ticketagewarningwrap').hide();
                $('#spnOptional').show();
                $('#spnRequired').hide();
            } else {
                $('#ticketagewarningwrap').show();
                $('#spnOptional').hide();
                $('#spnRequired').show();
            }
        }

        $(function () {
            showHideWarn();
            $('#<%=txtTicketExpirationDates.ClientID%>').on('input', function () {
                showHideWarn();
            });

            tweakExpirationForEntryMode();
            $('#<%=cboReEntryMode.ClientID%>').on('change', function () {
                tweakExpirationForEntryMode();
                showHideWarn();
            });
        });

    </script>

    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>
    <h2>Scanner Check-In Settings</h2>
    <p>Use the WaiverScan app on a barcode scanning device to check customers in and verify their waivers in real time. Below are settings to manage how this process operates.</p>
    
    <div class="form-group">
        <label for="<%=cboReEntryMode.ClientID %>">Re-Entry Mode </label>
        <asp:DropDownList runat="server" ID="cboReEntryMode" CssClass="form-control"></asp:DropDownList>
    </div>
    
        
    <div class="form-group">
        <label for="<%=txtTicketExpirationDates.ClientID %>">Tickets Expire (days after signing) <span id="spnOptional" style="display:none;"> (Optional)</span><span id="spnRequired" class="text-danger" style="display:none;">*</span></label>
        <asp:TextBox runat="server" ID="txtTicketExpirationDates" CssClass="form-control"></asp:TextBox>
        <p class="help-block">Required only when allowing just one entry per waiver. Otherwise leave blank to allow unlimited usage. </p>
    </div>
 
    <div id="ticketagewarningwrap" style="display:none;">
    <div id="ticketagewarning" style="display:none;">
        <div class="WPERR_Warning">Ticket age of 90 days or less is recommended. Longer times require downloading more data to each device which can cause slower sync and scan speed.</div>
    </div>
        </div>

    <h3>Scan Confirmation Screen Fields</h3>
    <p class="help-block">
        The selected fields will be shown on the screen of the barcode scanner when a valid code is scanned.
    </p>

    <div class="form-group">
        <label for="<%=cboSigneeName.ClientID %>">Signee Name</label>
        <asp:DropDownList runat="server" ID="cboSigneeName" CssClass="form-control"></asp:DropDownList>
    </div>
    <div class="form-group">
        <label for="<%=cboPartName.ClientID %>">Participant Names</label>
        <asp:DropDownList runat="server" ID="cboPartName" CssClass="form-control"></asp:DropDownList>
    </div>

    <div class="form-group">
        <asp:CheckBox runat="server" ID="chkHeadcount" CssClass="form-control" Text="Headcount"></asp:CheckBox>
    </div>
    <div class="form-group">
        <asp:CheckBox runat="server" ID="chkSigneeAge" CssClass="form-control" Text="Signee Age"></asp:CheckBox>
    </div>
    <div class="form-group">
        <asp:CheckBox runat="server" ID="chkPartAge" CssClass="form-control" Text="Participant Age"></asp:CheckBox>
    </div>
    <div class="form-group">
        <asp:CheckBox runat="server" ID="chkDateSigned" CssClass="form-control" Text="Date Signed"></asp:CheckBox>
    </div>


    <asp:Button runat="server" id="btnSave" CssClass="btn btn-primary" Text="Save" OnClick="BtnSave_Click" />

</asp:Content>
