<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListWaiverSiteLinkCodeTemplates.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.ListWaiverSiteLinkCodeTemplates" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

 <div class="widget">
    <h3>Waiver Site Code Templates
       <span class="addbuttons"><a href="?sc=WF_EDIT_SITELINK_CODE_TEMPLATES&c=1" class="ico_add">Add</a></span>
    </h3>
    <div class="widgetcontentgrid">

<telerik:RadGrid Skin="Waypoint" EnableEmbeddedSkins="false" 
   ID="RadGrid1" runat="server" AutoGenerateColumns="False" OnNeedDataSource="RadGrid1_NeedDataSource"
     OnDeleteCommand="RadGrid1_DeleteCommand" 
  GridLines="None">
  <MasterTableView DataKeyNames="ID">
    <RowIndicatorColumn>
      <HeaderStyle Width="20px" />
    </RowIndicatorColumn>
    <ExpandCollapseColumn>
      <HeaderStyle Width="20px" />
    </ExpandCollapseColumn>
    <Columns>
      <telerik:GridBoundColumn DataField="Name" HeaderText="Name"
        SortExpression="Name" UniqueName="Name">
      </telerik:GridBoundColumn>
      

      <telerik:GridBoundColumn DataField="Description" HeaderText="Description" SortExpression="Description"
        UniqueName="Description">
      </telerik:GridBoundColumn>
           

      <telerik:GridHyperLinkColumn DataNavigateUrlFields="ID"
        DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WF_EDIT_SITELINK_CODE_TEMPLATES&amp;c=1"
        HeaderText="Edit" Text="Edit" UniqueName="column">
      </telerik:GridHyperLinkColumn>
      <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="This item will be permanently deleted. Do you wish to continue?"
        HeaderText="Delete" Text="Delete" UniqueName="column1">
      </telerik:GridButtonColumn>
    </Columns>
  </MasterTableView>
</telerik:RadGrid>

  </div></div>
