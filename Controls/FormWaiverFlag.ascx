<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWaiverFlag.ascx.cs" Inherits="WaiverFile.Controls.FormWaiverFlag" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
            <div class="form" role="form">
                <h3>Waiver Flag</h3>
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
               
                 <div class="form-group">
                      <label for="<%=txtName.ClientID %>">Name</label><asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                     
                <div class="form-group">
                      <label for="<%=rcpColor.ClientID %>">Color</label>
                     <telerik:RadColorPicker runat="server" ID="rcpColor"></telerik:RadColorPicker>
                </div>

               <asp:Button ID="btnSave" runat="server" CssClass="btn btn-default" Text="Save" onclick="btnSave_Click" />
            </div>

       