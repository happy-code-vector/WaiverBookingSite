<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListDBDumps.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.ListDBDumps" %>
  <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Database Dumps
</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Waypoint" EnableEmbeddedSkins="False" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

             <telerik:GridBoundColumn DataField="name" FilterControlAltText="Filter Name column" HeaderText="Site Name" SortExpression="name" UniqueName="name"></telerik:GridBoundColumn>

             <telerik:GridBoundColumn DataField="Url" FilterControlAltText="Filter Url column" HeaderText="Site URL" SortExpression="Url" UniqueName="Url"></telerik:GridBoundColumn>

             <telerik:GridBoundColumn DataField="filesize" FilterControlAltText="Filter Size column" HeaderText="Size" SortExpression="filesize" UniqueName="filesize"></telerik:GridBoundColumn>


                         
                         <telerik:GridBoundColumn DataField="status" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="Status" UniqueName="Status"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="devicename" FilterControlAltText="Filter Device Name column" HeaderText="Device Name" SortExpression="devicename" UniqueName="devicename"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="datesaved" FilterControlAltText="Filter Saved column" HeaderText="Saved" SortExpression="datesaved" UniqueName="datesaved"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="Errors" FilterControlAltText="Filter Errors column" HeaderText="Errors" SortExpression="Errors" UniqueName="Errors"></telerik:GridBoundColumn>

          
                         <telerik:GridHyperLinkColumn AllowSorting = "False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/wp-content/Plugins/WaiverFile/Controls/DownloadDBDump.ashx?id={0}" FilterControlAltText="Filter column1 column" HeaderText="Download" Text="Download" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="This data dump will be permanenty deleted. Are you sure?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>

<EditFormSettings>
<EditColumn InsertImageUrl="Update.gif" UpdateImageUrl="Update.gif" CancelImageUrl="Cancel.gif"></EditColumn>
</EditFormSettings>
    </MasterTableView>

<FilterMenu EnableEmbeddedSkins="False"></FilterMenu>

<HeaderContextMenu EnableEmbeddedSkins="False"></HeaderContextMenu>
</telerik:RadGrid>
    </div><!-- /.box-body -->
</div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select d.*, s.url, s.name, dev.DeviceName from tblwfdbdump d 
left join tblwaiversite s on s.id=d.siteid 
left join tblWFAPIDevice dev on d.WFAPIDeviceID=dev.DeviceID
where d.STatus<>3 order by DateSAved desc
">
                  </asp:SqlDataSource>
                         