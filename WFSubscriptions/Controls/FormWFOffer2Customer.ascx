<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWFOffer2Customer.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.FormWFOffer2Customer" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
            
                <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Edit Offer</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
                <asp:Panel runat="server" ID="pnlMain">
                <div class="form-group">
                    <label>Customer: </label>
                    <asp:Label runat="server" ID="lblCustomerName"></asp:Label>
                </div>
               
                 <div class="form-group">
                      <label for="<%=txtCode.ClientID %>">Code</label><asp:TextBox ID="txtCode" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                     <label for="<%=dtExpires.ClientID %>">Expires</label>
                       <telerik:RadDatePicker ID="dtExpires" CssClass="form-control" runat="server"></telerik:RadDatePicker>
                </div>
               
                </asp:Panel>

                 </div><!-- /.box-body -->
    <div class="box-footer">
       <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />
    </div>
</div>



            