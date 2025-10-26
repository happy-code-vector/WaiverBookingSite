<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ManageBlackoutDates.aspx.cs" Inherits="WaiverFile.site.admin.ManageBlackoutDates" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">



      <div class="pull-right" style="margin-top:20px;">
      <span class="addbuttons"><a href="EditBlackoutDate.aspx" class="btn btn-primary">New Blackout Date</a></span>
   </div>

  <h3 style="display:inline-block;">Blackout Dates (Account-wide)</h3>
    <p>The blackout dates listed here will apply to all items across your entire account.</p>


<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Bootstrap" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="false" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         

                         
                         <telerik:GridBoundColumn DataField="startDate" FilterControlAltText="Filter StartDate column" HeaderText="StartDate" SortExpression="startDate" UniqueName="startDate"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="endDate" FilterControlAltText="Filter EndDate column" HeaderText="EndDate" SortExpression="endDate" UniqueName="endDate"></telerik:GridBoundColumn>

            
                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="EditBlackoutDate.aspx?id={0}" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="editcol" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFBlackoutDate where isSiteWide=1 and siteid=@siteID and status=@activeStatus">
                  </asp:SqlDataSource>
                         



</asp:Content>
