<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ManageAvailabilitySchedules.aspx.cs" Inherits="WaiverFile.site.admin.ManageAvailabilitySchedules" %>

         <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

         <div class="pull-right" style="margin-top:20px;">
             <span class="addbuttons"><a href="EditAvailabilitySchedule.aspx" class="btn btn-primary">New Schedule</a></span>
          </div>

         <h3 style="display:inline-block;">Availability Schedules</h3>

<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Bootstrap" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnItemCommand="RadGrid1_ItemCommand" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="false" AllowPaging="false" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         
                         
                         <telerik:GridBoundColumn DataField="name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="name" UniqueName="name"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="mode" FilterControlAltText="Filter Mode column" HeaderText="Mode" SortExpression="mode" UniqueName="mode"></telerik:GridBoundColumn>

                         
                         
                         

                         
                        
            <telerik:GridButtonColumn CommandName="SETDEFAULT" FilterControlAltText="Filter column1 column" HeaderText="Set as Default" Text="Set as Default" UniqueName="makedefaultcol"></telerik:GridButtonColumn>             
            <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="editcol" AllowFiltering="False">
</telerik:GridHyperLinkColumn>
            <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFAvailabilitySchedule where siteID=@siteID and status<>@deletedStatus order by isdefault desc, name">
                  </asp:SqlDataSource>
                         

    <hr />

    <asp:LinkButton runat="server" ID="btnShowDeletedSchedules" Text="Show Deleted Schedules" CssClass="btn btn-muted" OnClick="btnShowDeletedSchedules_Click"></asp:LinkButton>
    <asp:Panel runat="server" Visible="false" ID="pnlDeletedItems">

        <h3>Deleted Schedules</h3>
        
<telerik:RadGrid ID="RadGrid2" runat="server" Skin="Bootstrap" AutoGenerateColumns="False" OnItemDataBound="RadGrid2_ItemDataBound" OnItemCommand="RadGrid2_ItemCommand"  DataSourceID="SqlDataSource2" AllowFilteringByColumn="false" AllowPaging="false" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource2" DataKeyNames="ID">
        
        <Columns>

                         
                         
                         <telerik:GridBoundColumn DataField="name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="name" UniqueName="name"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="mode" FilterControlAltText="Filter Mode column" HeaderText="Mode" SortExpression="mode" UniqueName="mode"></telerik:GridBoundColumn>

                        
            <telerik:GridButtonColumn CommandName="RESTORE" FilterControlAltText="Filter column1 column" HeaderText="Restore" Text="Restore" UniqueName="restorecol"></telerik:GridButtonColumn>             
            
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFAvailabilitySchedule where siteID=@siteID and status=@deletedStatus order by isdefault desc, name">
                  </asp:SqlDataSource>
                         

    </asp:Panel>

</asp:Content>
