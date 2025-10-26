<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormRollover.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.FormRollover" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
            
                <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">WFPeriodRollover</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
                 <div class="form-group">
                     <label for="<%=cboFrom.ClientID %>">From</label><asp:DropDownList runat="server" ID="cboFrom" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="form-group">
                     <label for="<%=cboTo.ClientID %>">To</label><asp:DropDownList runat="server" ID="cboTo" CssClass="form-control"></asp:DropDownList>
                </div>
               
                 <div class="form-group">
                     <label for="<%=txtNumWaivers.ClientID %>">NumWaivers</label><asp:TextBox ID="txtNumWaivers" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               


                 </div><!-- /.box-body -->
    <div class="box-footer">
       <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />
    </div>
</div>



            