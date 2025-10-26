<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListDeletedSites.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.ListDeletedSites" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Deleted WaiverFile Sites
</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Waypoint" EnableEmbeddedSkins="false" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>


       


                         
                         <telerik:GridBoundColumn DataField="name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="name" UniqueName="name"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="firstName" FilterControlAltText="Filter firstName column" HeaderText="First Name" SortExpression="firstName" UniqueName="firstName"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lastName" FilterControlAltText="Filter lastName column" HeaderText="Last Name" SortExpression="lastName" UniqueName="lastName"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Email" FilterControlAltText="Filter Email column" HeaderText="Email" SortExpression="Email" UniqueName="Email"></telerik:GridBoundColumn>
                         
                         
                         <telerik:GridBoundColumn DataField="totalWaivers" FilterControlAltText="Filter TotalWaivers column" HeaderText="Waivers" SortExpression="totalWaivers" UniqueName="totalWaivers"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="totalParticipants" FilterControlAltText="Filter TotalParticipants column" HeaderText="Participants" SortExpression="totalParticipants" UniqueName="totalParticipants"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="totalFormsActive" FilterControlAltText="Filter TotalFormsActive column" HeaderText="Forms (active)" SortExpression="totalFormsActive" UniqueName="totalFormsActive"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="totalForms" FilterControlAltText="Filter TotalForms column" HeaderText="Forms (all)" SortExpression="totalForms" UniqueName="totalForms"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="totalEvents" FilterControlAltText="Filter TotalEvents column" HeaderText="Events" SortExpression="totalEvents" UniqueName="totalEvents"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="dateDeleted" FilterControlAltText="Filter DateDeleted column" HeaderText="Deleted" DataFormatString="{0:d}" SortExpression="dateDeleted" UniqueName="dateDeleted"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="deletionStatus" FilterControlAltText="Filter DeletionStatus column" HeaderText="Status" SortExpression="deletionStatus" UniqueName="deletionStatus"></telerik:GridBoundColumn>

                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WF_DELETE_WAIVER_SITE&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="Delete Completely" Text="Delete Completely" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
    </div><!-- /.box-body -->
</div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWaiverSiteDeleted s left join tblCustomer c on c.Customer_ID=s.customerID">
                  </asp:SqlDataSource>
                         