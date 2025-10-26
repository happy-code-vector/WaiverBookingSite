<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ManageSeasons.aspx.cs" Inherits="WaiverFile.site.admin.ManageSeasons" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

             
     <div class="pull-right" style="margin-top:20px;">
     <span class="addbuttons"><a href="EditSeason.aspx" class="btn btn-primary">New Season</a></span>
  </div>
<h3 style="display:inline-block;">Manage Seasons</h3>
   


<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Bootstrap" EnableEmbeddedSkins="true" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="false" AllowPaging="false" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         
                         
                         <telerik:GridBoundColumn DataField="name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="name" UniqueName="name"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="status" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="status" UniqueName="status"></telerik:GridBoundColumn>

                         
                     <telerik:GridTemplateColumn HeaderText="Starts" SortExpression="dayOfYearStart" UniqueName="dayOfYearStart">
    <ItemTemplate>
        <%# Eval("dayOfYearStart", "{0:MMMM d}") %>
    </ItemTemplate>
</telerik:GridTemplateColumn>

<telerik:GridTemplateColumn HeaderText="Ends" SortExpression="dayOfYearEnd" UniqueName="dayOfYearEnd">
    <ItemTemplate>
        <%# Eval("dayOfYearEnd", "{0:MMMM d}") %>
    </ItemTemplate>
</telerik:GridTemplateColumn>

                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="EditSeason.aspx?id={0}" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="editcol" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
  



<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFSeason where siteid=@siteid and  status<>@deletedStatus">
                  </asp:SqlDataSource>
                         
</asp:Content>
