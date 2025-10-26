<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InstallSetupPackToExistingSite.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.InstallSetupPackToExistingSite" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

 <script type="text/javascript">
     function OnClientItemsRequesting(sender, eventArgs) {
         var context = eventArgs.get_context();
         context["FilterString"] = eventArgs.get_text();
     }
     </script>



<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Install Setup Pack to Existing WaiverFile Site/Account</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
       
        <p>Use this tool to install elements from a setup pack into an existing site.</p>

            <div class="form-group">
               <label>Select a Customer</label>
               <telerik:RadComboBox ID="cboCustomer" runat="server" EnableLoadOnDemand="true" OnClientItemsRequesting="OnClientItemsRequesting" OnSelectedIndexChanged="cboCustomer_SelectedIndexChanged" AutoPostBack="true">
               <WebServiceSettings Method="SearchCustomerForRadCombo"  Path="/Controls/SearchCustomersCRM.asmx" />
               </telerik:RadComboBox>
           </div>
            <div class="form-group">
               <label>Select a Site</label>
           <asp:DropDownList runat="server" id="cboSite" CssClass="form-control"></asp:DropDownList>
                </div>


            <div class="form-group">
                <label>Setup Pack</label>
                 <asp:DropDownList runat="server" ID="cboSetupPack" CssClass="form-control"></asp:DropDownList>
            </div>
            
            <div class="form-group">
                <label>Items to include</label>
            </div>
        <div class="form-group">
            <asp:CheckBox ID="chkForms" runat="server" Text="Waiver Forms" Checked="False" /><br />
            <asp:CheckBox ID="chkPages" runat="server" Text="Pages" Checked="False" /><br />
            <asp:CheckBox ID="chkSubcontrols" runat="server" Text="SubControls (controls on all pages like in the header/footer - replaces existing controls)" Checked="False" /><br />
            <asp:CheckBox ID="chkSiteSettings" runat="server" Text="Site Settings" Checked="False" /><br />
         </div>

        <asp:Button runat="server" ID="btnInstall" Text="Install" CssClass="btn btn-primary" OnClick="btnInstall_Click" />

        </div>
    </div>
