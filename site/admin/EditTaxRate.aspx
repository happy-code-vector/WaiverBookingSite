<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditTaxRate.aspx.cs" Inherits="WaiverFile.site.admin.EditTaxRate" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

                
                <h3>Tax Rate</h3>
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               

               
                 <div class="form-group">
                      <label for="<%=txtName.ClientID %>">Name</label><asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                     <p class="help-block">Enter name as it should appear to customers in their cart</p>
                </div>
               
              <div class="form-group">
    <label for="<%=txtRate.ClientID %>">Tax Rate (%)</label>
    <asp:TextBox ID="txtRate" CssClass="form-control" runat="server" placeholder="8.25" MaxLength="6"></asp:TextBox>
    <p class="help-block">Enter the tax rate as a percentage (e.g., 8.25 for 8.25%). Do not include the % symbol.</p>
</div>


    

               <asp:Button ID="btnSave" runat="server" CssClass="btn btn-default" Text="Save" onclick="btnSave_Click" />

            

</asp:Content>
