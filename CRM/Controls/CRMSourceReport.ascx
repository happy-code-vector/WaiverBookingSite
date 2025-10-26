<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CRMSourceReport.ascx.cs" Inherits="WaiverFile.CRM.Controls.CRMSourceReport" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

NEXT TO DO HERE: 
make it so you can click into each CRM source and list new customers who came in that way<br />
it will help us identify the quality of the leads that are coming in 

<asp:Button runat="server" ID="btnExportToExcel" OnClick="btnExportToExcel_Click" CssClass="btn btn-primary" Text="Export to Excel" />
<telerik:RadGrid runat="server" Skin="Waypoint" OnPreRender="rgResults_PreRender" EnableEmbeddedSkins="false" ID="rgResults" AllowSorting="True" PageSize="100" AllowPaging="true" AutoGenerateColumns="True" OnColumnCreated="rgResults_ColumnCreated">
    <MasterTableView>
    <PagerStyle Mode="NextPrevAndNumeric" PageSizeLabelText="Page Size: " PageSizes="100,500,1000,5000" />
        </MasterTableView>
</telerik:RadGrid>