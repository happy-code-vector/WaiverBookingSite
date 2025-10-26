<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewLead.ascx.cs" Inherits="WaiverFile.CRM.Controls.ViewLead" %>
<%@ Register Src="ListMonitoredMailingsForLead2.ascx" TagPrefix="uc1" TagName="ListMonitoredMailingsForLead" %>
<%@ Register Src="~/Controls/SysAdmin/ManageWaiverFileCustomer.ascx" TagPrefix="uc1" TagName="ManageWaiverFileCustomer" %>
<%@ Register Src="../../WFSubscriptions/Controls/ManageCustomerOffers.ascx" TagPrefix="uc1" TagName="ManageCustomerOffers" %>
<%@ Register Assembly="Telerik.Web.UI"   Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="row">
    <div class="col-md-6">
        <asp:PlaceHolder ID="ph0" runat="server"></asp:PlaceHolder>
        <uc1:ManageWaiverFileCustomer runat="server" id="ManageWaiverFileCustomer" />
        
        <!-- grid: mailing lists -->
         <div class="widget">
    <h3>Mailing Lists</h3>
    <div class="widgetcontentgrid">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>" 
SelectCommand="SELECT RG.name, RG.description, RG.recipientGroup_ID 
FROM [tblRecipientGroup] RG inner join tblRecipientGroupRecipient RGR 
ON RG.recipientGroup_ID=RGR.recipientGroup_ID 
inner join tblRecipient R on RGR.recipient_ID=R.recipient_ID
where RGR.isOptOut=0 and ( r.recipient_ID=@recipientID)"></asp:SqlDataSource>
<telerik:RadGrid Skin="Waypoint" EnableEmbeddedSkins="false"  ID="RadGrid2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnDeleteCommand="RadGrid2_DeleteCommand"
  GridLines="None">
  <MasterTableView DataKeyNames="recipientGroup_ID" DataSourceID="SqlDataSource2">
    <Columns>
      <telerik:GridBoundColumn DataField="name" HeaderText="Subscription Name" SortExpression="name"
        UniqueName="name">
      </telerik:GridBoundColumn>
      <telerik:GridBoundColumn DataField="description" HeaderText="Description" SortExpression="description"
        UniqueName="description">
      </telerik:GridBoundColumn>
       <telerik:GridButtonColumn CommandName="Delete" HeaderText="Unsubscribe" Text="Unsubscribe" UniqueName="column1" ConfirmText="Are you sure you wish to unsibscribe?">
            </telerik:GridButtonColumn>
    </Columns>
    <ExpandCollapseColumn>
      <HeaderStyle Width="20px" />
    </ExpandCollapseColumn>
    <RowIndicatorColumn>
      <HeaderStyle Width="20px" />
    </RowIndicatorColumn>
  </MasterTableView>
</telerik:RadGrid>
        </div></div>



    </div>
    <div class="col-md-6">
        <a href="/wp-admin/default.aspx?sc=WFCRM_LEAD_TRACKER&c=0" class="btn btn-default btn-block"><i class="fa fa-arrow-left"></i> Back to Lead Tracker</a>
        <uc1:ListMonitoredMailingsForLead runat="server" id="ListMonitoredMailingsForLead" />
        <uc1:ManageCustomerOffers runat="server" id="ManageCustomerOffers1" />
 <div class="widget">
    <h3>Message Queue</h3>
    <div class="widgetcontentgrid">

<telerik:radgrid Skin="Waypoint" EnableEmbeddedSkins="false"  id="RadGrid1" runat="server" autogeneratecolumns="False" datasourceid="SqlDataSource1" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand"
  gridlines="None" AllowPaging="True">
<MasterTableView DataKeyNames="Message_ID" DataSourceID="SqlDataSource1"><Columns>
<telerik:GridBoundColumn SortExpression="SentOn" DataField="SentOn" UniqueName="SentOn" DataType="System.DateTime" HeaderText="Send Date"></telerik:GridBoundColumn>
<telerik:GridBoundColumn SortExpression="toGroups" DataField="toGroups" UniqueName="toGroups" HeaderText="To"></telerik:GridBoundColumn>
<telerik:GridBoundColumn SortExpression="Subject" DataField="Subject" UniqueName="Subject" HeaderText="Subject"></telerik:GridBoundColumn>
<telerik:GridBoundColumn SortExpression="Status" DataField="Status" UniqueName="Status" DataType="System.Int32" HeaderText="Status"></telerik:GridBoundColumn>
    <telerik:GridBoundColumn SortExpression="numViews" DataField="numViews" UniqueName="numViews" DataType="System.Int32" HeaderText="Viewed"></telerik:GridBoundColumn>
<telerik:GridBoundColumn SortExpression="Modified" DataField="Modified" UniqueName="Modified" DataType="System.DateTime" HeaderText="Modified"></telerik:GridBoundColumn>
<telerik:GridHyperLinkColumn DataNavigateUrlFormatString="/wp-admin/default.aspx?sc=EDITMAILINGLISTMESSAGE&amp;id={0}&amp;c=1" DataNavigateUrlFields="Message_ID" UniqueName="column" Text="Edit" HeaderText="Edit"></telerik:GridHyperLinkColumn>
<telerik:GridButtonColumn HeaderText="Delete" UniqueName="column1" ConfirmText="Are you sure you wish to delete this message?" Text="Delete" CommandName="Delete"></telerik:GridButtonColumn>
</Columns>
</MasterTableView>
</telerik:radgrid>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"
  SelectCommand="select top 5000 message_ID, subject, status, isdeleted, Modified, SentOn, ShowInQueue, AllowViewViaUrl, (select count(*) from tblMessageView mv where mv.MessageID=m.Message_ID and mv.recipientid=@recipientid) as numViews,
toRecipients = STUFF((select ', ' + r.FirstName +' ' + r.LastName from tblMessageRecipient mr inner join tblRecipient r on r.Recipient_ID=mr.Recipient_ID  where mr.Message_ID=m.Message_ID FOR XML PATH('')), 1, 2, '') ,
toGroups = STUFF((select ', [' + g.Name + ']' from tblMessageRecipientGroup mrg inner join tblRecipientGroup g on g.RecipientGroup_ID=mrg.RecipientGroup_ID where mrg.Message_ID=m.Message_ID  FOR XML PATH('')), 1, 2, '')
 from tblMessage m
 where isdeleted=0  and 
 @recipientid<>'00000000-0000-0000-0000-000000000000' and 
    (
	m.message_ID in (select message_ID from tblMessageRecipient where recipient_ID=@recipientid)
	OR
	m.message_ID in (select Message_ID from tblMessageRecipientGroup mg inner join tblRecipientGroupRecipient rgr on rgr.RecipientGroup_ID=mg.RecipientGroup_ID where rgr.Recipient_ID=@recipientid)
	 )
   and m.SentOn >= @datejoined
     order by status, senton desc"></asp:SqlDataSource>


  </div></div>

         <div class="widget">
    <h3>Payment History</h3>
    <div class="widgetcontentgrid">
        <!-- grid: orders -->
     
    <telerik:RadGrid Skin="Waypoint" EnableEmbeddedSkins="false"  id="RadGrid3" runat="server" DataSourceID="SqlDataSource3" GridLines="None" AutoGenerateColumns="False" AllowPaging="True" OnItemDataBound="RadGrid3_ItemDataBound">
        <mastertableview datasourceid="SqlDataSource3"><Columns>
<telerik:GridBoundColumn DataField="dateCreated" UniqueName="column1" HeaderText="Date"></telerik:GridBoundColumn>
<telerik:GridBoundColumn DataField="orderNumber" UniqueName="column" HeaderText="Order Number"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="status" DataType="System.Int32" HeaderText="Status"
                UniqueName="column4">
            </telerik:GridBoundColumn>

<telerik:GridBoundColumn DataField="order_total" UniqueName="column3" DataFormatString="{0:c}" HeaderText="Total"></telerik:GridBoundColumn>
<telerik:GridHyperLinkColumn DataNavigateUrlFormatString="/wp-admin/default.aspx?sc=EDITORDER&amp;c=1&amp;id={0}" UniqueName="column5" DataNavigateUrlFields="order_ID" Text="Edit" HeaderText="Action"></telerik:GridHyperLinkColumn>
</Columns>

<ExpandCollapseColumn Visible="False" Resizable="False">
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>

<RowIndicatorColumn Visible="False">
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>
</mastertableview>
    </telerik:RadGrid> 


    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"
        SelectCommand="spListOrdersForCustomerAll" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        </div></div>


        <!-- grid: addresses -->
             <div class="widget">
    <h3>Addresses</h3>
    <div class="widgetcontentgrid">
    <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
    <telerik:radgrid Skin="Waypoint" EnableEmbeddedSkins="false"  id="RadGrid4" runat="server" autogeneratecolumns="False" datasourceid="SqlDataSource4" OnDeleteCommand="RadGrid1_DeleteCommand"
    gridlines="None">
<MasterTableView DataSourceID="SqlDataSource4" DataKeyNames="Address_ID"><Columns>
<telerik:GridBoundColumn DataField="customer" UniqueName="customer" SortExpression="customer" HeaderText="Name"></telerik:GridBoundColumn>
<telerik:GridBoundColumn DataField="address" UniqueName="address" SortExpression="address" HeaderText="Address"></telerik:GridBoundColumn>
<telerik:GridBoundColumn DataField="address2" UniqueName="address2" SortExpression="address2" HeaderText="Address2"></telerik:GridBoundColumn>
<telerik:GridBoundColumn DataField="city" UniqueName="city" SortExpression="city" HeaderText="City"></telerik:GridBoundColumn>
<telerik:GridBoundColumn DataField="stateCode" UniqueName="stateCode" SortExpression="stateCode" HeaderText="State"></telerik:GridBoundColumn>
<telerik:GridBoundColumn DataField="zipCode" UniqueName="zipCode" SortExpression="zipCode" HeaderText="Zip"></telerik:GridBoundColumn>
<telerik:GridHyperLinkColumn DataNavigateUrlFormatString="/wp-admin/default.aspx?sc=EDITADDRESS&amp;id={0}&amp;c=1" UniqueName="column" DataNavigateUrlFields="Address_ID" Text="Edit" HeaderText="Edit"></telerik:GridHyperLinkColumn>
<telerik:GridButtonColumn CommandName="Delete" Text="Delete" HeaderText="Delete" ConfirmText="Are you sure you wish to delete this address?"></telerik:GridButtonColumn>
</Columns>

<ExpandCollapseColumn Visible="False" Resizable="False">
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>

<RowIndicatorColumn Visible="False">
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>
</MasterTableView>
</telerik:radgrid>
<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"
    SelectCommand="SELECT firstName + ' ' + LastName as customer, address, address2, city, stateCode, zipCode, Address_ID FROM [tblAddress] WHERE ([Customer_ID] = @Customer_ID) and isDeleted=0">
    <SelectParameters>
    </SelectParameters>
</asp:SqlDataSource>


</div></div>

        <!-- grid: api keys -->
            <div class="widget">
    <h3>API Keys</h3>
    <div class="widgetcontentgrid">
    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
    <telerik:radgrid Skin="Waypoint" EnableEmbeddedSkins="false"  id="RadGrid5" runat="server" autogeneratecolumns="False" datasourceid="SqlDataSource5" OnDeleteCommand="RadGrid1_DeleteCommand"
    gridlines="None">
<MasterTableView DataSourceID="SqlDataSource5" DataKeyNames="KeyID"><Columns>
<telerik:GridBoundColumn DataField="APIKey" UniqueName="APIKey" SortExpression="APIKey" HeaderText="API Key"></telerik:GridBoundColumn>
<telerik:GridBoundColumn DataField="Created" UniqueName="Created" SortExpression="Created" HeaderText="Created" DataFormatString="{0:d}"></telerik:GridBoundColumn>
<telerik:GridBoundColumn DataField="numcalls" UniqueName="numcalls" SortExpression="numcalls" HeaderText="Number of Calls"></telerik:GridBoundColumn>
</Columns>

<ExpandCollapseColumn Visible="False" Resizable="False">
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>

<RowIndicatorColumn Visible="False">
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>
</MasterTableView>
</telerik:radgrid>
<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"
    SelectCommand="select  k.KeyID, k.APIKey, k.Created, k.DailyCallLimit, k.IsActive, k.SiteID, sum(u.numcalls) as numcalls  
from tblWFAPIKey k 
inner join tblWaiverSite s on s.ID = k.SiteID
left join tblWFAPIKeyUsage u on u.KeyID=k.KeyID
where s.CustomerID=@customerid
group by k.KeyID, k.APIKey, k.Created, k.DailyCallLimit, k.IsActive, k.SiteID
order by k.Created desc">
    <SelectParameters>
    </SelectParameters>
</asp:SqlDataSource>


</div></div>

    </div>
</div>