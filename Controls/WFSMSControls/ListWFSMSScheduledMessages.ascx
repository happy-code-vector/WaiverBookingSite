<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListWFSMSScheduledMessages.ascx.cs" Inherits="WaiverFile.Controls.WFSMSControls.ListWFSMSScheduledMessages" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Waiver Based Messages
<span class="addbuttons"><a href="AddScheduledMessage.aspx" class="btn btn-primary pull-right">Add</a></span>
</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        
<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Bootstrap"  AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="False" AllowPaging="False" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         
            
                         <telerik:GridBoundColumn DataField="TriggerCriteria" FilterControlAltText="Filter TriggerCriteria column" HeaderText="Mode"  UniqueName="TriggerCriteria"></telerik:GridBoundColumn>

                         

                         <telerik:GridBoundColumn DataField="" FilterControlAltText="Filter Filters column" HeaderText="Filters" SortExpression="" UniqueName="filters"></telerik:GridBoundColumn>

                        
                         
                        

                          <telerik:GridBoundColumn DataField="messageShort" FilterControlAltText="Filter Message column" HeaderText="Message" SortExpression="message" UniqueName="message"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="status" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="status" UniqueName="status"></telerik:GridBoundColumn>

                         
                        
                        
                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID,url" DataNavigateUrlFormatString="/b/{1}/admin/SMS/EditSMSScheduledMessage.aspx?id={0}" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
    </div><!-- /.box-body -->
</div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select *,s.url,(left(m.message, 60)+ case when len(m.message)>60 then '...' end) as messageShort, case when m.SendingNumID='00000000-0000-0000-0000-000000000000' then 'Any available number' else n.FriendlyName end as sendingNumName from tblWFSMSScheduledMessage  m left join tblWFSMSSendingNum n on n.ID=m.SendingNumID left join tblWaiverSite s on s.id=m.siteid
where m.siteID=@siteID and m.status<>@deletedStatus">
                  </asp:SqlDataSource>
                         