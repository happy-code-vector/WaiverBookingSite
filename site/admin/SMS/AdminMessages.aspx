<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="AdminMessages.aspx.cs" Inherits="WaiverFile.site.admin.SMS.AdminMessages" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    
<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Administrative Text Messages
<span class="addbuttons"><a href="EditAdminSMSMessage.aspx" class="btn btn-primary pull-right">Add</a></span>
</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        
<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Bootstrap"  AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="False" AllowPaging="False" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         
            
                         <telerik:GridBoundColumn DataField="messageType" FilterControlAltText="Filter messageType column" HeaderText="Message Type"  UniqueName="messageType"></telerik:GridBoundColumn>

                         

                        
                         
                        

                          <telerik:GridBoundColumn DataField="message" FilterControlAltText="Filter Message column" HeaderText="Message" SortExpression="message" UniqueName="message"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="status" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="status" UniqueName="status"></telerik:GridBoundColumn>

                         
                        
                        
                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID,url" DataNavigateUrlFormatString="/b/{1}/admin/SMS/EditAdminSMSMessage.aspx?id={0}" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
    </div><!-- /.box-body -->
</div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="
    select m.*, s.url from tblWFSMSAdministrativeMessage m inner join tblWaiverSite s on s.Id=m.SiteID where siteID=@siteID and m.status<>@deletedStatus order by messageType, message
    ">
                  </asp:SqlDataSource>
                         

</asp:Content>
