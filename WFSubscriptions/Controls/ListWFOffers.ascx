<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListWFOffers.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.ListWFOffers" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">WFOffers
<span class="addbuttons"><a href="?sc=WF_SUBS_EDIT_OFFER&c=1" class="ico_add">Add</a></span>
</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Waypoint" EnableEmbeddedSkins="false" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         
                         <telerik:GridBoundColumn DataField="code" FilterControlAltText="Filter Code column" HeaderText="Code" SortExpression="code" UniqueName="code"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="name" UniqueName="name"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="percentOff" FilterControlAltText="Filter PercentOff column" HeaderText="PercentOff" SortExpression="percentOff" UniqueName="percentOff"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="numMonths" FilterControlAltText="Filter NumMonths column" HeaderText="NumMonths" SortExpression="numMonths" UniqueName="numMonths"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="offerExpires" FilterControlAltText="Filter OfferExpires column" HeaderText="OfferExpires" SortExpression="offerExpires" UniqueName="offerExpires"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="status" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="status" UniqueName="status"></telerik:GridBoundColumn>

                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WF_SUBS_EDIT_OFFER&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
    </div><!-- /.box-body -->
</div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFOffer">
                  </asp:SqlDataSource>
                         