<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormCancelReason.ascx.cs" Inherits="WaiverFile.CRM.Controls.FormCancelReason" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
            
                <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Cancellation Reason</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
               
                 <div class="form-group">
                      <label for="<%=txtName.ClientID %>">Name</label><asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                      <label for="<%=txtDescription.ClientID %>">Description</label><asp:TextBox ID="txtDescription" CssClass="form-control" runat="server"></asp:TextBox>
                     <p class="help-block">Displays in parenthesis next to the name </p>
                </div>
               
                <div class="form-group">
                      <label for="<%=txtDescription.ClientID %>">Order Number</label><asp:TextBox ID="txtOrderNum" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                 <div class="form-group">
                      <label for="<%=chkShowOptionToCustomers.ClientID %>">ShowOptionToCustomers</label><asp:CheckBox ID="chkShowOptionToCustomers" CssClass="form-control" runat="server"></asp:CheckBox>
                </div>
               


                 </div><!-- /.box-body -->
    <div class="box-footer">
       <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />
    </div>
</div>



            