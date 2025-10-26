<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListWFOffers2.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.ListWFOffers2" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">WaiverFile Offers (v2)
<span class="addbuttons"><a href="?sc=WF_SUBS_EDIT_OFFER2&c=1" class="ico_add">Add</a></span>
</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Waypoint" EnableEmbeddedSkins="false" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         
                         <telerik:GridBoundColumn DataField="displayName" FilterControlAltText="Filter DisplayName column" HeaderText="DisplayName" SortExpression="displayName" UniqueName="displayName"></telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="status" FilterControlAltText="Filter status column" HeaderText="Status" SortExpression="status" UniqueName="status"></telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="details" FilterControlAltText="Filter Details column" HeaderText="Details" SortExpression="details" UniqueName="details"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="amount" FilterControlAltText="Filter Amount column" HeaderText="Amount" SortExpression="amount" UniqueName="amount"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="discountMode" FilterControlAltText="Filter DiscountMode column" HeaderText="DiscountMode" SortExpression="discountMode" UniqueName="discountMode"></telerik:GridBoundColumn>
            

                         
                         <telerik:GridBoundColumn DataField="expireDaysAfterInvite" FilterControlAltText="Filter ExpireDaysAfterInvite column" HeaderText="Expire After Invite (days)" SortExpression="expireDaysAfterInvite" UniqueName="expireDaysAfterInvite"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="monthsValidForOnceClaimed" FilterControlAltText="Filter MonthsValidForOnceClaimed column" HeaderText="Months Valid Once Claimed" SortExpression="monthsValidForOnceClaimed" UniqueName="monthsValidForOnceClaimed"></telerik:GridBoundColumn>

                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WF_SUBS_EDIT_OFFER2&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
    </div><!-- /.box-body -->
</div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFOffer2 where status<>99">
                  </asp:SqlDataSource>
                         