<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListSMSProfiles.ascx.cs" Inherits="WaiverFile.Controls.WFSMSControls.ListSMSProfiles" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Twilio Customer Profiles

</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Waypoint" EnableEmbeddedSkins="false" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         
                         <telerik:GridBoundColumn DataField="legalBusinessName" FilterControlAltText="Filter LegalBusinessName column" HeaderText="LegalBusinessName" SortExpression="legalBusinessName" UniqueName="legalBusinessName"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="requestStatus" FilterControlAltText="Filter RequestStatus column" HeaderText="RequestStatus" SortExpression="requestStatus" UniqueName="requestStatus"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="created" FilterControlAltText="Filter Created column" HeaderText="Created" SortExpression="created" UniqueName="created"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="modified" FilterControlAltText="Filter Modified column" HeaderText="Modified" SortExpression="modified" UniqueName="modified"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="accountSID" FilterControlAltText="Filter AccountSID column" HeaderText="AccountSID" SortExpression="accountSID" UniqueName="accountSID"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="authToken" FilterControlAltText="Filter AuthToken column" HeaderText="AuthToken" SortExpression="authToken" UniqueName="authToken"></telerik:GridBoundColumn>

                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WF_REVIEW_SMS_PROFILE&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="Review" Text="Review" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                           <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
    </div><!-- /.box-body -->
</div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFSMSTwilioCustomerProfile order by Created desc">
                  </asp:SqlDataSource>
                         