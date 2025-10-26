<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="WFFieldSelect.aspx.cs" Inherits="WaiverFile.site.admin.workflows.WFFieldSelect" %>
<%@ register src="~/Controls/FieldSelector.ascx" tagprefix="uc1" tagname="FieldSelector" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">



    <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>


    <h3>Workflow View Settings</h3>
    <asp:Panel runat="server" ID="pnlBreadcrumbs">
    <nav aria-label="breadcrumb"><ol class="breadcrumb">
    <li><a href="Workflows.aspx">Workflows</a></li>
        <li><a href="Viewer.aspx?id=<%=workflowID %>"><%=workflowName %></a></li>
    <li class="breadcrumb-item active" aria-current="page">View Settings</li>
  </ol></nav>
        </asp:Panel>

    <div class="row">
    <div class="col-xs-12">
        <div class="form-group">
            <label for="<%=cboMode.ClientID %>">View Mode</label>
            <asp:DropDownList runat="server" ID="cboMode" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="cboMode_SelectedIndexChanged"></asp:DropDownList>
        </div>
    </div>
        </div>

      
     <uc1:fieldselector runat="server" id="FieldSelector1" />

      <div class="row">
    <div class="col-xs-12">
        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" OnClick="btnSave_Click" Text="Save" />
        </div></div>

</asp:Content>
