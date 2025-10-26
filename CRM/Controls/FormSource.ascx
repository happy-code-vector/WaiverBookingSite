<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormSource.ascx.cs" Inherits="WaiverFile.CRM.Controls.FormSource" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
            
                <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Source</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
               
                 <div class="form-group">
                      <label for="<%=txtName.ClientID %>">Name</label><asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                     <label for="<%=cboStatus.ClientID %>">Status</label><asp:DropDownList runat="server" ID="cboStatus" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="form-group">
                      <label for="<%=txtQSCode.ClientID %>">QueryString Code</label><asp:TextBox ID="txtQSCode" CssClass="form-control" runat="server"></asp:TextBox>
                    <p class="help-block">Track sources using ?wcs=CODE on the querystring. (wcs = WaiverFile CRM Source)</p>

                </div>
               


                 </div><!-- /.box-body -->
    <div class="box-footer">
       <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />
    </div>
</div>



            