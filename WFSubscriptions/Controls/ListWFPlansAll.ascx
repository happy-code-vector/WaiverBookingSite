<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListWFPlansAll.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.ListWFPlansAll" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>




<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Waiver and SMS Plans - Main
<span class="addbuttons">
    <a href="/wp-admin/default.aspx?sc=WF_SUBS_LIST_PLAN_GROUPS&c=1"><i class="fa fa-cog"></i> Manage Plan Groups</a>
    <a href="?sc=WF_SUBS_ADD_PLAN&c=1" class="ico_add">Add</a>
    

</span>
</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Waypoint" EnableEmbeddedSkins="false" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowPaging="False" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        <GroupByExpressions>
                    <telerik:GridGroupByExpression>
                        <SelectFields>
                            <telerik:GridGroupByField FieldAlias="Group" FieldName="groupname"></telerik:GridGroupByField>
                        </SelectFields>
                        <GroupByFields>
                            <telerik:GridGroupByField FieldName="groupname" SortOrder="Descending"></telerik:GridGroupByField>
                        </GroupByFields>
                    </telerik:GridGroupByExpression>
                  
                </GroupByExpressions>
        <Columns>

                         
                       
            <telerik:GridBoundColumn DataField="groupname" FilterControlAltText="Filter groupname column" HeaderText="Group" SortExpression="groupname" UniqueName="groupname"></telerik:GridBoundColumn>

                         
                         
                         <telerik:GridBoundColumn DataField="name" FilterControlAltText="Filter name column" HeaderText="Name" SortExpression="name" UniqueName="name"></telerik:GridBoundColumn>

                         
                         
                         <telerik:GridBoundColumn DataField="status" FilterControlAltText="Filter status column" HeaderText="Status" SortExpression="status" UniqueName="status"></telerik:GridBoundColumn>

                         
                         
                         <telerik:GridBoundColumn DataField="description" FilterControlAltText="Filter description column" HeaderText="Description" SortExpression="description" UniqueName="description"></telerik:GridBoundColumn>

                        
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WF_SUBS_EDIT_PLAN&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
    </div><!-- /.box-body -->
</div>




<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Waiver and SMS Plans - Private
<span class="addbuttons"><a href="?sc=WF_SUBS_ADD_PLAN&c=1" class="ico_add">Add</a></span>
</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr2" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid2" runat="server" Skin="Waypoint" EnableEmbeddedSkins="false" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource2" AllowFilteringByColumn="True" AllowPaging="False" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource2" DataKeyNames="ID">
        
        <Columns>

                         
                         
                         
                         
                         <telerik:GridBoundColumn DataField="name" FilterControlAltText="Filter name column" HeaderText="Name" SortExpression="name" UniqueName="name"></telerik:GridBoundColumn>

                         
                         
                         <telerik:GridBoundColumn DataField="status" FilterControlAltText="Filter status column" HeaderText="Status" SortExpression="status" UniqueName="status"></telerik:GridBoundColumn>

                         
                         
                         <telerik:GridBoundColumn DataField="description" FilterControlAltText="Filter description column" HeaderText="Description" SortExpression="description" UniqueName="description"></telerik:GridBoundColumn>

                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WF_SUBS_EDIT_PLAN&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
    </div><!-- /.box-body -->
</div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select p.*, case when g.GroupName is null then 'Ungrouped' else g.GroupName end as groupname from tblWFPlan p
left join tblWFPlanGroup g on g.ID = p.GroupID
where status=@status 
 order by name">
                  </asp:SqlDataSource>


<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select p.*, case when g.GroupName is null then 'Ungrouped' else g.GroupName end as groupname from tblWFPlan p
left join tblWFPlanGroup g on g.ID = p.GroupID
where status=@status
 order by name">
                  </asp:SqlDataSource>


