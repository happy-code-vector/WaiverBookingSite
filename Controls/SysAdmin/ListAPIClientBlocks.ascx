<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListAPIClientBlocks.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.ListAPIClientBlocks" %>
<%@ Register Assembly="Telerik.Web.UI"
    Namespace="Telerik.Web.UI" TagPrefix="rad" %>



<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Blocked Client IP's
</h3>
    </div><!-- /.box-header -->
    <div class="box-body no-padding">
        
<rad:RadGrid Skin="Waypoint" EnableEmbeddedSkins="False"  ID="RadGrid1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnItemDataBound="RadGrid1_ItemDataBound" OnItemCommand="RadGrid1_ItemCommand">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ClientIP">
        <Columns>
            <rad:GridBoundColumn DataField="ClientIP" HeaderText="ClientIP" UniqueName="ClientIP" FilterControlAltText="Filter ClientIP column" SortExpression="ClientIP">
            </rad:GridBoundColumn>
            <rad:GridBoundColumn DataField="FailDate" HeaderText="FailDate" UniqueName="FailDate" DataFormatString="{0:d}" DataType="System.DateTime" FilterControlAltText="Filter FailDate column" SortExpression="FailDate">
            </rad:GridBoundColumn>
            <rad:GridBoundColumn DataField="NumFails" HeaderText="NumFails" UniqueName="NumFails" DataType="System.Int32" FilterControlAltText="Filter NumFails column" SortExpression="NumFails">
            </rad:GridBoundColumn>
            <rad:GridBoundColumn DataField="BlockedUntil" DataType="System.DateTime" FilterControlAltText="Filter BlockedUntil column" HeaderText="BlockedUntil" SortExpression="BlockedUntil" UniqueName="BlockedUntil">
            </rad:GridBoundColumn>
             <rad:GridButtonColumn CommandName="UNBLOCK" ConfirmText="Unblock this client IP?" FilterControlAltText="Filter column1 column" HeaderText="Unblock" Text="Unblock" UniqueName="unblock"></rad:GridButtonColumn>
            
        </Columns>
        <ExpandCollapseColumn Resizable="False" Visible="False">
            <HeaderStyle Width="20px" />
        </ExpandCollapseColumn>
        <RowIndicatorColumn Visible="False">
            <HeaderStyle Width="20px" />
        </RowIndicatorColumn>

<EditFormSettings>
<EditColumn InsertImageUrl="Update.gif" UpdateImageUrl="Update.gif" CancelImageUrl="Cancel.gif"></EditColumn>
</EditFormSettings>
    </MasterTableView>

<FilterMenu EnableEmbeddedSkins="False"></FilterMenu>

<HeaderContextMenu EnableEmbeddedSkins="False"></HeaderContextMenu>
</rad:RadGrid>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>" SelectCommand="select * from tblWFAPIFailCount fc left join tblWFAPIClientIPBlock b on fc.ClientIP=b.ClientIP where BLockedUntil>@cutoff order by FailDate desc">
</asp:SqlDataSource>




    </div><!-- /.box-body -->
    <div class="box-footer">
    </div>
</div>




<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Recent Fail Counts
</h3>
    </div><!-- /.box-header -->
    <div class="box-body no-padding">
        

<rad:RadGrid Skin="Waypoint" EnableEmbeddedSkins="False"  ID="RadGrid2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnItemDataBound="RadGrid1_ItemDataBound">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

    <MasterTableView DataSourceID="SqlDataSource2" DataKeyNames="ClientIP">
        <Columns>
            <rad:GridBoundColumn DataField="ClientIP" HeaderText="ClientIP" UniqueName="ClientIP" FilterControlAltText="Filter ClientIP column" SortExpression="ClientIP">
            </rad:GridBoundColumn>
            <rad:GridBoundColumn DataField="FailDate" HeaderText="FailDate" UniqueName="FailDate" DataType="System.DateTime" DataFormatString="{0:d}" FilterControlAltText="Filter FailDate column" SortExpression="FailDate">
            </rad:GridBoundColumn>
            <rad:GridBoundColumn DataField="NumFails" HeaderText="NumFails" UniqueName="NumFails" DataType="System.Int32" FilterControlAltText="Filter NumFails column" SortExpression="NumFails">
            </rad:GridBoundColumn>
            
            
        </Columns>
        <ExpandCollapseColumn Resizable="False" Visible="False">
            <HeaderStyle Width="20px" />
        </ExpandCollapseColumn>
        <RowIndicatorColumn Visible="False">
            <HeaderStyle Width="20px" />
        </RowIndicatorColumn>

<EditFormSettings>
<EditColumn InsertImageUrl="Update.gif" UpdateImageUrl="Update.gif" CancelImageUrl="Cancel.gif"></EditColumn>
</EditFormSettings>
    </MasterTableView>

<FilterMenu EnableEmbeddedSkins="False"></FilterMenu>

<HeaderContextMenu EnableEmbeddedSkins="False"></HeaderContextMenu>
</rad:RadGrid>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>" SelectCommand="select * from tblWFAPIFailCount fc  order by FailDate desc">
</asp:SqlDataSource>

    </div><!-- /.box-body -->
    <div class="box-footer">
    </div>
</div>




