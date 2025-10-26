<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormSignPostConn.ascx.cs" Inherits="WaiverFile.Connectors.Controls.FormSignPostConn" %>

<script type="text/javascript">
    function handleKeyBox() {
        if ($('#<%=chkUseCustomAPIKey.ClientID%>').is(':checked')) {
            $('#customkey').show();
        } else {
            $('#customkey').hide();
        }
    }

    $(document).ready(function () {
        handleKeyBox();
        $('#<%=chkUseCustomAPIKey.ClientID%>').click(function () {
            handleKeyBox();
        });
    });

</script>

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">SignPost Settings</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        <p>The SignPost connector will send all collected contact data to your SignPost account once per hour.</p>
         <div class="form-group">
            <label>Status</label>
            <asp:DropDownList runat="server" CssClass="form-control" ID="cboStatus"></asp:DropDownList>
        </div>
        <div class="form-group">
            <label>Live Mode</label>
            <asp:DropDownList runat="server" CssClass="form-control" ID="cboLiveMode"></asp:DropDownList>
        </div>


        


        <div class="form-group">
            <label>Merchant ID</label>
            <asp:TextBox runat="server" CssClass="form-control" ID="txtMerchantID"></asp:TextBox>
        </div>

        <div class="form-group">
            <label><asp:CheckBox runat="server" ID="chkUseCustomAPIKey" /> Use a Custom API Key</label>
            <p class="help-block">If you inform your SignPost account manager that you wish to use WaiverFile, you won't need a custom API Key.</p>
        </div>


        <div class="form-group" id="customkey" style="display:none;">
            <label>API Key</label>
            <asp:TextBox runat="server" CssClass="form-control" ID="txtAPIKey"></asp:TextBox>
            <p class="help-block">To get your API Key and Merchant ID, please contact your SignPost account manager or email <a href="mailto:api@signpost.com">api@signpost.com</a>.</p>
        </div>


          
          <div class="form-group">
            <label>When to Send Records</label>
            <asp:DropDownList runat="server" CssClass="form-control" ID="cboWhenToPush"></asp:DropDownList>
             <p class="help-block">Records are sent hourly. Allow up to an hour for data to sync from time specified.</p>
        </div>
          <div class="form-group">
            <label>Opt-In setting</label>
            <asp:DropDownList runat="server" CssClass="form-control" ID="cboOptInSettings">
                <asp:ListItem Value="ONLY_OPTIN">Only send when customers choose to opt in</asp:ListItem>
                <asp:ListItem Value="ALWAYS">Always send</asp:ListItem>
            </asp:DropDownList>
        </div>

        <asp:Panel runat="server" ID="pnlAddOptInToForms">
            <div class="form-group">
                <div class="WPERR_Warning">One or more of your waiver forms don't have the mailing list opt-in checkbox turned on.</div>
            <asp:CheckBox runat="server" ID="chkEnableOptIn" Text="Enable the Opt-In question on my Waiver Forms"></asp:CheckBox>
        </div>
        </asp:Panel>
       <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click" />
        
       
        
    </div><!-- /.box-body -->
    <div class="box-footer">
    </div>
</div>


