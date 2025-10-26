<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListWebHooks.ascx.cs" Inherits="WaiverFile.Controls.ListWebHooks" %>



            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Web Hooks
            <a href="EditWebHook.aspx" class="pull-right btn btn-primary">New Web Hook</a>
</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Bootstrap" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="false" AllowPaging="false" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         <telerik:GridBoundColumn DataField="name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="name" UniqueName="name"></telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="hookUrl" FilterControlAltText="Filter HookUrl column" HeaderText="HookUrl" SortExpression="hookUrl" UniqueName="hookUrl"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="status" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="status" UniqueName="status"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="triggerlist" FilterControlAltText="Filter Triggers column" HeaderText="Triggers" SortExpression="triggerlist" UniqueName="triggerlist"></telerik:GridBoundColumn>
                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/admin/Settings/EditWebHook.aspx?id={0}" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="editcol" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>

       <p><asp:LinkButton runat="server" ID="btnShowHideDeleted" OnClick="btnShowHideDeleted_Click">Show Deleted Items</asp:LinkButton></p>
       <asp:Panel runat="server" ID="pnlDeletedWebHooks" Visible="false">

           <h3>Deleted Items</h3>
           
            <telerik:RadGrid ID="RadGrid2" runat="server" Skin="Bootstrap" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid2_DeleteCommand" DataSourceID="SqlDataSource2" AllowFilteringByColumn="false" AllowPaging="false" AllowSorting="True">
                <groupingsettings casesensitive="False" />
                <MasterTableView DataSourceID="SqlDataSource2" DataKeyNames="ID">
        
                    <Columns>

                                     <telerik:GridBoundColumn DataField="name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="name" UniqueName="name"></telerik:GridBoundColumn>
                                     <telerik:GridBoundColumn DataField="hookUrl" FilterControlAltText="Filter HookUrl column" HeaderText="HookUrl" SortExpression="hookUrl" UniqueName="hookUrl"></telerik:GridBoundColumn>

                         
                                     <telerik:GridBoundColumn DataField="status" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="status" UniqueName="status"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="triggerlist" FilterControlAltText="Filter Triggers column" HeaderText="Triggers" SortExpression="triggerlist" UniqueName="triggerlist"></telerik:GridBoundColumn>
                         
                                    <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/admin/Settings/EditWebHook.aspx?id={0}" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="editcol" AllowFiltering="False">
                                    </telerik:GridHyperLinkColumn>
                                     <telerik:GridButtonColumn CommandName="DELETE" FilterControlAltText="Filter column1 column" HeaderText="Restore" Text="Restore" UniqueName="column1"></telerik:GridButtonColumn>
            
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>

       </asp:Panel>

    </div><!-- /.box-body -->
</div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="
select *, 
STUFF(
         (SELECT distinct ',' + convert(nvarchar(10), t1.TriggerVal)
          FROM tblWFAPIRestHookSub t2
          inner join tblWFAPIRestHookSubtrigger t1
            on t2.ID = t1.RestHookSubID
          where t.ID=t1.RestHookSubID  and t1.IsEnabled=1
          FOR XML PATH ('')), 1, 1, '') triggerlist
		  from tblWFAPIRestHookSub t where siteid=@siteid and status<>99
">
                  </asp:SqlDataSource>
                         


<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="
select *, 
STUFF(
         (SELECT distinct ',' + convert(nvarchar(10), t1.TriggerVal)
          FROM tblWFAPIRestHookSub t2
          inner join tblWFAPIRestHookSubtrigger t1
            on t2.ID = t1.RestHookSubID
          where t.ID=t1.RestHookSubID  and t1.IsEnabled=1
          FOR XML PATH ('')), 1, 1, '') triggerlist
		  from tblWFAPIRestHookSub t where siteid=@siteid and status=99
">
                  </asp:SqlDataSource>
                         

		  

