<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditPersonType.aspx.cs" Inherits="WaiverFile.site.admin.EditPersonType" %>
   <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
        
    
    <h3>Person Type</h3>
    <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

               
               
                 <div class="form-group">
                      <label for="<%=txtName.ClientID %>">Name</label><asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                 <div class="form-group">
                     <asp:CheckBox runat="server" id="chkIsChild" Text="Person is a Child" />
                     <p class="help-block">Consider this person a child for waiver purposes</p>
                 </div>
                 <div class="form-group">
                      <label for="<%=txtDescription.ClientID %>">Description</label><asp:TextBox ID="txtDescription" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
    
               
                
               <asp:Button ID="btnSave" runat="server" CssClass="btn btn-default" Text="Save" onclick="btnSave_Click" />

            


</asp:Content>
