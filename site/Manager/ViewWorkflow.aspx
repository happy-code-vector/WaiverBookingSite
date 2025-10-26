<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Public.Master" AutoEventWireup="true" CodeBehind="ViewWorkflow.aspx.cs" Inherits="WaiverFile.site.Manager.ViewWorkflow" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph1" runat="server">

    
      <div class=" pull-right">
        <a href="Default.aspx" class="btn btn-default">Back to List</a>
        &nbsp;
        <asp:LinkButton runat="server" ID="btnExportExcel" CssClass="btn btn-primary" OnClick="btnExportExcel_Click"><i class="fa fa-download"></i> Export to Excel</asp:LinkButton>
        &nbsp; 
          <a href="SearchMan.aspx?stepid=<%=stepID %>" class="btn btn-default"><i class="fa fa-search"></i> Search</a>


     </div>

 <h1><asp:Label runat="server" ID="lblHeading"></asp:Label>
      
 </h1>
  

    

<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<!--<div class="row">
    <div class="col-sm-6">
        <asp:RadioButtonList ID="rblCheckIn" runat="server" RepeatLayout ="UnorderedList" CssClass="list-unstyled list-inline" AutoPostBack="true" OnSelectedIndexChanged="rblCheckIn_SelectedIndexChanged">
            <asp:ListItem Value="ALL" Selected="True">All</asp:ListItem>
            <asp:ListItem Value="CHECKEDIN">Checked In</asp:ListItem>
            <asp:ListItem Value="NOTCHECKEDIN">Not Checked In</asp:ListItem>
        </asp:RadioButtonList>
    </div>
  
</div>-->
<telerik:RadGrid runat="server" Visible="False" ID="rgResults" AllowSorting="True" PageSize="100" AllowPaging="true" AutoGenerateColumns="False" OnItemDataBound="rgResults_ItemDataBound" OnNeedDataSource="rgResults_NeedDataSource" OnDataBound="rgResults_DataBound" OnInfrastructureExporting="rgResults_InfrastructureExporting">
    <MasterTableView>
    <PagerStyle Mode="NextPrevAndNumeric" PageSizeLabelText="Page Size: " PageSizes="100,500,1000,5000" />
        </MasterTableView>
</telerik:RadGrid>


</asp:Content>
