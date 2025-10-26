<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListSMSDemos.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.ListSMSDemos" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Demos

</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Waypoint" EnableEmbeddedSkins="false" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         
                         <telerik:GridBoundColumn DataField="siteID" FilterControlAltText="Filter SiteID column" HeaderText="SiteID" SortExpression="siteID" UniqueName="siteID"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="userID" FilterControlAltText="Filter UserID column" HeaderText="UserID" SortExpression="userID" UniqueName="userID"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="testSMSNumber" FilterControlAltText="Filter TestSMSNumber column" HeaderText="TestSMSNumber" SortExpression="testSMSNumber" UniqueName="testSMSNumber"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="testSendingEnabled" FilterControlAltText="Filter TestSendingEnabled column" HeaderText="TestSendingEnabled" SortExpression="testSendingEnabled" UniqueName="testSendingEnabled"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="businessNumber" FilterControlAltText="Filter BusinessNumber column" HeaderText="BusinessNumber" SortExpression="businessNumber" UniqueName="businessNumber"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="status" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="status" UniqueName="status"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="planSelection" FilterControlAltText="Filter PlanSelection column" HeaderText="PlanSelection" SortExpression="planSelection" UniqueName="planSelection"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="settingsXml" FilterControlAltText="Filter SettingsXml column" HeaderText="SettingsXml" SortExpression="settingsXml" UniqueName="settingsXml"></telerik:GridBoundColumn>

                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=XXXXXXXXXXXX_EDIT_COMMAND_HERE_PLEASE&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
    </div><!-- /.box-body -->
</div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select top 1000 from tblWFSMSDemo order by ">
                  </asp:SqlDataSource>
                         