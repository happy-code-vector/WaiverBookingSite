<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListWFSubChangeLogSystemWideFull.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.ListWFSubChangeLogSystemWideFull" %>
  <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Account Change History

</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Waypoint" EnableEmbeddedSkins="False" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound"  DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1">
        <Columns>

                         
                       
            <telerik:GridBoundColumn DataField="DateSaved" FilterControlAltText="Filter DateSaved column" HeaderText="Date" SortExpression="DateSaved" UniqueName="DateSaved" DataType="System.DateTime"></telerik:GridBoundColumn>

                         
                         
                         <telerik:GridBoundColumn DataField="ChangeAction" FilterControlAltText="Filter ChangeAction column" HeaderText="Change" SortExpression="ChangeAction" UniqueName="ChangeAction" DataType="System.Int32"></telerik:GridBoundColumn>

                         
                         
                         <telerik:GridBoundColumn DataField="details" FilterControlAltText="Filter details column" HeaderText="Details" SortExpression="details" UniqueName="details"></telerik:GridBoundColumn>

                          <telerik:GridBoundColumn DataField="customer_name" FilterControlAltText="Filter customer_name column" HeaderText="Customer Name" SortExpression="customer_name" UniqueName="customer_name" ReadOnly="True">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="customer_email" FilterControlAltText="Filter customer_email column" HeaderText="Customer mail" SortExpression="customer_email" UniqueName="customer_email">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="customerCompany" FilterControlAltText="Filter customerCompany column" HeaderText="Company" SortExpression="customerCompany" UniqueName="customerCompany">
            </telerik:GridBoundColumn>
                         
                         <telerik:GridBoundColumn DataField="user" FilterControlAltText="Filter user column" HeaderText="Changed By" SortExpression="user" UniqueName="user" ReadOnly="True"></telerik:GridBoundColumn>

                        
                        <telerik:GridBoundColumn DataField="email_address" FilterControlAltText="Filter email_address column" HeaderText="Changed by Email" SortExpression="email_address" UniqueName="email_address">
            </telerik:GridBoundColumn>
           
            
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







<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select l.DateSaved, l.ChangeAction, l.details, u.first_name + ' ' + u.last_name as [user], u.email_address, c.firstname + ' ' + c.lastName as customer_name, c.email as customer_email, c.Company as customerCompany from tblWFSubscriptionChangeLog l left join tblwpuser u on u.id=l.wpuserid left join tblwfsubscription sub on sub.id=l.WFSubscriptionID left join tblcustomer c on c.customer_ID=sub.customerID  order by DateSaved desc">
                  </asp:SqlDataSource>


