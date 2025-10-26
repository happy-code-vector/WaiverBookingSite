<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListWFPlanGroups.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.ListWFPlanGroups" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">WaiverFile Plan Groups
<span class="addbuttons"><a href="?sc=WF_SUBS_EDIT_PLAN_GROUP&c=1" class="ico_add">Add</a></span>
</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Waypoint" EnableEmbeddedSkins="false" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         
                         <telerik:GridBoundColumn DataField="groupName" FilterControlAltText="Filter GroupName column" HeaderText="GroupName" SortExpression="groupName" UniqueName="groupName"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="description" FilterControlAltText="Filter Description column" HeaderText="Description" SortExpression="description" UniqueName="description"></telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="isPrimaryPublic" FilterControlAltText="Filter IsPrimaryPublic column" HeaderText="Primary Public Plan" SortExpression="isPrimaryPublic" UniqueName="isPrimaryPublic"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="isPrimaryHighSecurity" FilterControlAltText="Filter isPrimaryHighSecurity column" HeaderText="Primary High Security Plan" SortExpression="isPrimaryHighSecurity" UniqueName="isPrimaryHighSecurity"></telerik:GridBoundColumn>
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WF_SUBS_EDIT_PLAN_GROUP&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
    </div><!-- /.box-body -->
</div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFPlanGroup order by groupname">
                  </asp:SqlDataSource>
                         