<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWFSubCancelReason.ascx.cs" Inherits="WaiverFile.CRM.Controls.FormWFSubCancelReason" %>

                      <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
            
                <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">SubscriptionCancelReason</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
                <asp:PlaceHolder ID="phCustomerSubDetails" runat="server"></asp:PlaceHolder>
              
                   <div class="form-group">
                      <label for="<%=cboReason.ClientID %>">Reason</label><asp:DropDownList ID="cboReason" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
               
              

                 <div class="form-group">
                      <label for="<%=txtDetails.ClientID %>">Details</label><asp:TextBox ID="txtDetails" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
              
               


                 </div><!-- /.box-body -->
    <div class="box-footer">
       <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />
    </div>
</div>



            