<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AssignNumberToSite.ascx.cs" Inherits="WaiverFile.Controls.WFSMSControls.AssignNumberToSite" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<script type="text/javascript">
     function OnClientItemsRequesting(sender, eventArgs) {
         var context = eventArgs.get_context();
         context["FilterString"] = eventArgs.get_text();
    }
    </script>
<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Assign SMS Number to WaiverFile Site
</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        <div class="form-group">
            <label>SMS Number</label>
            <asp:Label ID="lblSMSNum" runat="server"></asp:Label>
        </div>
        <div class="form-group">
            <label>Waiver Site</label>
            <telerik:RadComboBox ID="cboSite" runat="server" EnableLoadOnDemand="true" OnClientItemsRequesting="OnClientItemsRequesting">
  <WebServiceSettings Method="SearchWaiverSitesForRadCombo" Path="/Controls/SysAdmin/WFSiteSearch.asmx" />
  </telerik:RadComboBox>
        </div>
    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click" />
    </div>
</div>
