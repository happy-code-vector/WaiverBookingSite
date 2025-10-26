<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormConstantContact.ascx.cs" Inherits="WaiverFile.Connectors.Controls.FormConstantContact" %>
<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Constant Contact Settings</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
       
        <div class="form-group">
            <label>Target List</label>
            <asp:DropDownList runat="server" CssClass="form-control" ID="cboList"></asp:DropDownList>
        </div>
        <div class="form-group">
            <label>When to Send Records to Constant Contact</label>
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
        
    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Save and Activate" OnClick="btnSave_Click"  />
        <asp:Button runat="server" ID="btnSaveDontActivate" CssClass="btn btn-default" Text="Save Without Activating" OnClick="btnSaveDontActivate_Click"  />
    </div>
</div>



<asp:Panel runat="server" ID="pnlPastSync">
    <div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Sync Old Data</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phPastDataErr" runat="server"></asp:PlaceHolder>
       
        <p>The Constant Contact connector will push new data to your Constant Contact account once per hour, as it is collected. Use the button below to push all your past data over to Constant Contact now.</p>
        
          <div class="form-group">
            <label>Records to Send</label>
            <asp:DropDownList runat="server" CssClass="form-control" ID="cboPushAllOption">
                
                <asp:ListItem Value="ONLY_OPTIN">Only send names that chose to opt-in</asp:ListItem>
                <asp:ListItem Value="ALL">Send all names</asp:ListItem>
            </asp:DropDownList>
        </div>
        
    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button runat="server" ID="btnSyncPastData" CssClass="btn btn-primary" Text="Send All Data to Constant Contact" OnClick="btnSyncPastData_Click"  />
    </div>
</div>

</asp:Panel>