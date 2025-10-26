<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventManagerViewV2.ascx.cs" Inherits="WaiverFile.Controls.EventManagerViewV2" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

 <h3><asp:Label runat="server" ID="lblHeading"></asp:Label>
      <a href="Default.aspx" class="btn btn-default pull-right">Back to List</a>
 </h3>
  <h4><asp:Label runat="server" ID="lblHeading2"></asp:Label></h4>

<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<div class="row">
    <div class="col-sm-6">
        <asp:RadioButtonList ID="rblCheckIn" runat="server" RepeatLayout ="UnorderedList" CssClass="list-unstyled list-inline" AutoPostBack="true" OnSelectedIndexChanged="rblCheckIn_SelectedIndexChanged">
            <asp:ListItem Value="ALL" Selected="True">All</asp:ListItem>
            <asp:ListItem Value="CHECKEDIN">Checked In</asp:ListItem>
            <asp:ListItem Value="NOTCHECKEDIN">Not Checked In</asp:ListItem>
        </asp:RadioButtonList>
    </div>
    <div class="col-sm-6 text-right">
        <asp:LinkButton runat="server" ID="btnExportExcel" CssClass="btn btn-primary btn-sm" OnClick="btnExportExcel_Click"><i class="fa fa-download"></i> Export to Excel</asp:LinkButton>
        
     </div>
</div>
<telerik:RadGrid runat="server" Visible="False" ID="rgResults" AllowSorting="True" PageSize="100" AllowPaging="true" AutoGenerateColumns="False" OnItemDataBound="rgResults_ItemDataBound" OnNeedDataSource="rgResults_NeedDataSource" OnDataBound="rgResults_DataBound" OnInfrastructureExporting="rgResults_InfrastructureExporting">
    <MasterTableView>
    <PagerStyle Mode="NextPrevAndNumeric" PageSizeLabelText="Page Size: " PageSizes="100,500,1000,5000" />
        </MasterTableView>
</telerik:RadGrid>
