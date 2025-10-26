<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ManageTaxRates.aspx.cs" Inherits="WaiverFile.site.admin.ManageTaxRates" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

                <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>



        <h2>Sales Tax Rates
	<div class="pull-right"><a href="EditTaxRate.aspx" class="btn btn-primary">Add</a></div>
</h2>

<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Bootstrap"  AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" OnItemCommand="RadGrid1_ItemCommand" DataSourceID="SqlDataSource1"  AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         
                         
                         <telerik:GridBoundColumn DataField="isCurrent" FilterControlAltText="Filter IsCurrent column" HeaderText="Active" SortExpression="isCurrent" UniqueName="isCurrent"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="name" UniqueName="name"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="rate" FilterControlAltText="Filter Rate column" HeaderText="Rate" SortExpression="rate" UniqueName="rate"></telerik:GridBoundColumn>

                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="editcol" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridTemplateColumn HeaderText="Actions" UniqueName="deleteColumn" AllowFiltering="False">
    <ItemTemplate>
          <asp:Button ID="btnMakeDefault" runat="server" 
      CommandName="MAKEDEFAULT" 
      Text="Make Default"  CssClass="btn btn-sm"
      />
         <asp:Button ID="btnReactivate" runat="server" Text="Reactivate"
             CommandName="REACTIVATE" 
             CssClass="btn btn-sm"
            />
        <asp:Button ID="btnDelete" runat="server" 
            CommandName="DELETE" 
            CssClass="btn btn-sm"
           />
    </ItemTemplate>
</telerik:GridTemplateColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
 



<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFTaxRate where siteID=@siteID and status<>@deletedStatus">
                  </asp:SqlDataSource>
                         

</asp:Content>
