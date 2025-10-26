<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="AddPage.aspx.cs" Inherits="WaiverFile.site.admin.CMS.AddPage" %>
               <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">


 
                <h3>Add Page</h3>
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               

               
                 <div class="form-group">
                     <label for="<%=cboParentPage.ClientID %>">Page Location</label>
                     <asp:DropDownList ID="cboParentPage" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
               
                 <div class="form-group">
                     <label for="<%=txtTitle.ClientID %>">Title</label>
                     <asp:TextBox ID="txtTitle" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                 <div class="form-group">
                     <label for="<%=cboNavbarMode.ClientID %>">Navigation Bar Mode</label>
                     <asp:DropDownList ID="cboNavbarMode" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
               
                  <div class="form-group">
                         <label for="<%=cboTemplate.ClientID %>">Template</label>
                         <asp:DropDownList ID="cboTemplate" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
               
               
               <asp:Button ID="btnSave" runat="server" CssClass="btn btn-default" Text="Save" onclick="btnSave_Click" />

            

</asp:Content>
