<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormGetResponse.ascx.cs" Inherits="WaiverFile.Connectors.Controls.FormGetResponse" %>
<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">GetResponse Settings</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
       


     


        <div class="form-group">
            <label>Target List</label>
            <asp:DropDownList runat="server" CssClass="form-control" ID="cboList" AutoPostBack="true"></asp:DropDownList>
        </div>
        <div class="form-group">
            <label>When to Send Records to GetResponse</label>
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

        <div class="form-group">
            <label>Field Mappings</label>
            <p class="help-block">Match the fields in WaiverFile with the filds in GetResponse</p>
        </div>
        <table class="table table-condensed">
            <thead>
                <tr>
                    <th>WaiverFile Field</th>
                    <th>GetResponse Field</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Name</td>
                    <td>Name</td>
                    <td> </td>
                </tr>
                 <tr>
                     <td>Email</td>
                    <td>Email</td>
                    <td> </td>
                </tr>
                
                <asp:PlaceHolder ID="phMappings" runat="server"></asp:PlaceHolder>
                <tr>
                    <td colspan="3"><strong>Add a new mapping:</strong></td>
                    
                </tr>
                <tr>
                    <td><asp:DropDownList runat="server" ID="cboLocalFields" CssClass="form-control"></asp:DropDownList></td>
                    <td>
                        <asp:DropDownList runat="server" ID="cboServiceFields" CssClass="form-control"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:Button runat="server" ID="btnAdd" CssClass="btn btn-sm btn-primary" OnClick="btnAdd_Click" Text="Add" />
                    </td>
                </tr>
            </tbody>
        </table>

       
        
    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Save and Activate" OnClick="btnSave_Click"  />
        <asp:Button runat="server" ID="btnSaveDontActivate" CssClass="btn btn-default" Text="Save Without Activating" OnClick="btnSaveDontActivate_Click"  />
    </div>
</div>

<asp:Panel runat="server" ID="pnlPastSync" Visible="false">
    <div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Sync Old Data</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phPastDataErr" runat="server"></asp:PlaceHolder>
       
        <p>The GetResponse connector will push new data to your GetResponse account once per hour, as it is collected. Use the button below to push all your past data over to GetResponse now.</p>
        
         <div class="form-group">
            <label>Records to Send</label>
            <asp:DropDownList runat="server" CssClass="form-control" ID="cboPushAllOption">
                
                <asp:ListItem Value="ONLY_OPTIN">Only send names that chose to opt-in</asp:ListItem>
                <asp:ListItem Value="ALL">Send all names</asp:ListItem>
            </asp:DropDownList>
        </div>
        
    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button runat="server" ID="btnSyncPastData" CssClass="btn btn-primary" Text="Send All Data to GetResponse" OnClick="btnSyncPastData_Click"  />
    </div>
</div>

</asp:Panel>

<asp:Button runat="server" ID="btnTEST" OnClick="btnTEST_Click" Text="TEST" />