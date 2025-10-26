<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CloseToQuota.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.CloseToQuota" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="rad" %>



<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Close to Quota
</h3>
    </div><!-- /.box-header -->
    <div class="box-body no-padding">

       <rad:RadGrid Skin="Waypoint" EnableEmbeddedSkins="False"  id="RadGrid1" runat="server" DataSourceID="sqlDataSource1" AutoGenerateColumns="False">
        <mastertableview datasourceid="sqlDataSource1"><Columns>

            <rad:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="url" DataNavigateUrlFormatString="https://www.waiverfile.com/b/{0}" DataTextField="url" FilterControlAltText="Filter column column" HeaderText="Url" Target="_blank" UniqueName="column">
            </rad:GridHyperLinkColumn>
            <rad:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="customer_ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?sc=WF_EDITCUSTOMER&amp;id={0}&amp;c=1" DataTextField="customerName" DataTextFormatString="{0}" FilterControlAltText="Filter column1 column" HeaderText="Customer" UniqueName="column1">
            </rad:GridHyperLinkColumn>


<rad:GridBoundColumn DataField="name" UniqueName="name" HeaderText="Site Name" FilterControlAltText="Filter name column" SortExpression="name"></rad:GridBoundColumn>
<rad:GridBoundColumn DataField="NumIncludedTotal" UniqueName="NumIncludedTotal" HeaderText="Included" FilterControlAltText="Filter NumIncludedTotal column" SortExpression="NumIncludedTotal" DataType="System.Int32"></rad:GridBoundColumn>
            <rad:GridBoundColumn DataField="NumUsed" HeaderText="Used"
                UniqueName="NumUsed" FilterControlAltText="Filter NumUsed column" SortExpression="NumUsed" DataType="System.Int32">
            </rad:GridBoundColumn>
            <rad:GridBoundColumn DataField="percentUsed" FilterControlAltText="Filter percentUsed column" HeaderText="Percent Used" UniqueName="percentUsed" SortExpression="percentUsed" ReadOnly="True" DataFormatString="{0:P2}">
            </rad:GridBoundColumn>
            <rad:GridBoundColumn DataField="remaining" HeaderText="Remaining"
                UniqueName="remaining" FilterControlAltText="Filter NumUsed column" SortExpression="remaining" DataType="System.Int32">
            </rad:GridBoundColumn>
            <rad:GridBoundColumn DataField="PeriodBegins" DataType="System.DateTime" FilterControlAltText="Filter PeriodBegins column" HeaderText="Period Begins" SortExpression="PeriodBegins" UniqueName="PeriodBegins" DataFormatString="{0:d}">
            </rad:GridBoundColumn>
            <rad:GridBoundColumn DataField="PeriodEnds" DataType="System.DateTime" FilterControlAltText="Filter PeriodEnds column" HeaderText="Period Ends" SortExpression="PeriodEnds" UniqueName="PeriodEnds" DataFormatString="{0:d}">
            </rad:GridBoundColumn>
</Columns>

<ExpandCollapseColumn Visible="False" Resizable="False">
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>

<RowIndicatorColumn Visible="False">
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<EditFormSettings>
<EditColumn InsertImageUrl="Update.gif" UpdateImageUrl="Update.gif" CancelImageUrl="Cancel.gif"></EditColumn>
</EditFormSettings>
</mastertableview>

<FilterMenu EnableEmbeddedSkins="False"></FilterMenu>

<HeaderContextMenu EnableEmbeddedSkins="False"></HeaderContextMenu>
    </rad:RadGrid>
 
        
        
    </div><!-- /.box-body -->
</div>


 <asp:SqlDataSource ID="sqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"
        SelectCommand="select  case when NumIncludedTotal<=0 then 0 else convert(float,NumUsed)/convert(float,NumIncludedTotal) end as percentUsed, c.Customer_ID, s.url, s.name, c.firstName + ' ' + c.lastName as customername, c.email, per.NumIncludedTotal, per.NumUsed, per.NumIncludedTotal - per.NumUsed as remaining, per.PeriodBegins, per.PeriodEnds from tblWFSubscription sub 
inner join tblCustomer c on c.Customer_ID = sub.CustomerID
inner join tblWFSubscriptionPeriod per on sub.id=per.WFSubscriptionID and per.id in (select top 1 AA.id from tblWFSubscriptionPeriod aa where aa.WFSubscriptionID=sub.ID order by aa.PeriodEnds desc)
inner join tblWaiverSite s on s.WFSubscriptionID=sub.ID and s.ID in (select top 1 bb.ID from tblWaiverSite BB where bb.ID=s.ID order by url)
where  NumUsed <= NumIncludedtotal and NumIncludedTotal>0 and convert(float,NumUsed)/convert(float,NumIncludedTotal) > 0.8
order by s.Url, per.PeriodEnds desc" ProviderName="System.Data.SqlClient" >
        </asp:SqlDataSource>


