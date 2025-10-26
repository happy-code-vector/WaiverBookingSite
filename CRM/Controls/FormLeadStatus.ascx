<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormLeadStatus.ascx.cs" Inherits="WaiverFile.CRM.Controls.FormLeadStatus" %>
 <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
            
                <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">LeadStatus</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
               
                 <div class="form-group">
                      <label for="<%=txtName.ClientID %>">Name</label><asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                    <div class="form-group">
                      <label for="<%=txtDescription.ClientID %>">Name</label><asp:TextBox ID="txtDescription" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                     <label for="<%=txtOrderNumber.ClientID %>">OrderNumber</label><asp:TextBox ID="txtOrderNumber" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                      <label for="<%=rcpColor.ClientID %>">Color</label>
                     <telerik:RadColorPicker runat="server" ID="rcpColor"></telerik:RadColorPicker>
                </div>


                 </div><!-- /.box-body -->
    <div class="box-footer">
       <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />
    </div>
</div>


