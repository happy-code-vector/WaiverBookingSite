<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListWFAccountSetupPacks.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.ListWFAccountSetupPacks" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Waiver Account Setup Packs
                  <span class="addbuttons"><a href="?sc=WF_SETUP_CREATE_PACK&c=1" class="ico_add">Add</a></span>

        </h3>
    </div><!-- /.box-header -->
    <div class="box-body  no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
       
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
      

    

      <telerik:GridHyperLinkColumn DataNavigateUrlFields="ID"
        DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WF_SETUP_EDIT_PACK&amp;c=1"
        HeaderText="Edit" Text="Edit" UniqueName="column">
      </telerik:GridHyperLinkColumn>
      <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="This item will be permanently deleted. Do you wish to continue?"
        HeaderText="Delete" Text="Delete" UniqueName="column1">
      </telerik:GridButtonColumn>
    </Columns>
  </MasterTableView>
</telerik:RadGrid>
    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Submit" />
    </div>
</div>


