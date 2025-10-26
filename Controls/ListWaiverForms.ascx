<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListWaiverForms.ascx.cs" Inherits="WaiverFile.Controls.ListWaiverForms" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<a href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/Waiver-Forms/Edit-Waiver-General.aspx" class="btn btn-primary pull-right" style="margin-top: 20px;"><i class="fa fa-plus-circle"></i> New Waiver Form</a>
 
    

 
     <h3>Waiver Forms</h3>
     


<telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" OnDeleteCommand="RadGrid1_DeleteCommand" OnItemDataBound="RadGrid1_ItemDataBound" OnItemCommand="RadGrid1_ItemCommand"
    CellSpacing="0" DataSourceID="SqlDataSource1" GridLines="None" AllowPaging="True" 
            AllowSorting="True">
<MasterTableView DataKeyNames="ID" DataSourceID="SqlDataSource1">
<CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>

    <Columns>
        <telerik:GridBoundColumn DataField="Name" 
            FilterControlAltText="Filter Name column" HeaderText="Name" 
            SortExpression="Name" UniqueName="Name">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Status" 
            FilterControlAltText="Filter Status column" HeaderText="Status" 
            SortExpression="Status" UniqueName="Status">
        </telerik:GridBoundColumn>


        <telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" 
            DataNavigateUrlFormatString="/admin/Settings/Waiver-Forms/Edit-Waiver-General.aspx?id={0}" 
            Text="General Settings" AllowFiltering="false" AllowSorting="false"
            HeaderText="General Settings">
        </telerik:GridHyperLinkColumn>
        <telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" 
            DataNavigateUrlFormatString="/admin/Settings/Waiver-Forms/Edit-Waiver-Form-Fields.aspx?id={0}" 
            Text="Edit Form Fields" AllowFiltering="false" AllowSorting="false"
            HeaderText="Edit Form Fields">
        </telerik:GridHyperLinkColumn>
       
        <telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" 
            DataNavigateUrlFormatString="/admin/Settings/Waiver-Forms/Edit-Waiver-Agreement-Text.aspx?id={0}" 
            Text="Edit Agreement Text" AllowFiltering="false" AllowSorting="false"
            HeaderText="Edit Agreement Text">
        </telerik:GridHyperLinkColumn>
         <telerik:GridButtonColumn CommandName="DUPLICATE" 
            ConfirmText="This will create a duplicate copy of this waiver form. The new form will be placed in draft status. Edit it and make changes to activate it." 
            FilterControlAltText="Filter column1 column" HeaderText="Duplicate" Text="Duplicate" 
            UniqueName="column1">
        </telerik:GridButtonColumn>
        <telerik:GridButtonColumn CommandName="DELETE" 
            ConfirmText="Are you sure you wish to delete this waiver form?" 
            FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" 
            UniqueName="column1">
        </telerik:GridButtonColumn>
    </Columns>

<EditFormSettings>
<EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
</EditFormSettings>
</MasterTableView>

<FilterMenu EnableImageSprites="False">
<WebServiceSettings>
<ODataSettings InitialContainerName=""></ODataSettings>
</WebServiceSettings>
</FilterMenu>

<HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
<WebServiceSettings>
<ODataSettings InitialContainerName=""></ODataSettings>
</WebServiceSettings>
</HeaderContextMenu>
</telerik:RadGrid>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>" 
    SelectCommand="SELECT * from tblWaiverForm where status<>2 and siteID=@siteID order by Name">


</asp:SqlDataSource>

