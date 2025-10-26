<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWaiverPack.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.FormWaiverPack" %>

            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
            
                <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Edit Addon Pack</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
               
                 <div class="form-group">
                     <label for="<%=txtStatus.ClientID %>">Status</label><asp:TextBox ID="txtStatus" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                     <label for="<%=txtNumWaivers.ClientID %>">Number Added</label><asp:TextBox ID="txtNumWaivers" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               


                 </div><!-- /.box-body -->
    <div class="box-footer">
       <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />
    </div>
</div>



            