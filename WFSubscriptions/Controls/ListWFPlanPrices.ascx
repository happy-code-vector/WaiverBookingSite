<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListWFPlanPrices.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.ListWFPlanPrices" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">WFPlanPrices
<span class="addbuttons"><a href="?sc=WF_SUBS_EDIT_PLAN_PRICE&c=1" class="ico_add">Add</a></span>
</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Waypoint" EnableEmbeddedSkins="False" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         
                         
                         <telerik:GridBoundColumn DataField="price" FilterControlAltText="Filter price column" HeaderText="Price" SortExpression="price" UniqueName="price" DataFormatString="{0:c}"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="BillingInterval" FilterControlAltText="Filter BillingInterval column" HeaderText="Billing Interval" SortExpression="BillingInterval" UniqueName="BillingInterval"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="additionalWaiverPriceEach" FilterControlAltText="Filter AdditionalWaiverPriceEach column" HeaderText="Additional Waiver/Credit Price Each" SortExpression="additionalWaiverPriceEach" UniqueName="additionalWaiverPriceEach" DataFormatString="${0:0.00####}"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="quota" FilterControlAltText="Filter quota column" HeaderText="Quota" SortExpression="quota" UniqueName="quota"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="quotaInterval" FilterControlAltText="Filter quotaInterval column" HeaderText="Quota Interval" SortExpression="quotaInterval" UniqueName="quotaInterval"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="isCurrent" FilterControlAltText="Filter IsCurrent column" HeaderText="Is Current" SortExpression="isCurrent" UniqueName="isCurrent"></telerik:GridBoundColumn>

                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WF_SUBS_EDIT_PLAN_PRICE&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
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




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFPlanPrice where @wfplanid='00000000-0000-0000-0000-000000000000' or wfplanid=@wfplanid">
                  </asp:SqlDataSource>
                         