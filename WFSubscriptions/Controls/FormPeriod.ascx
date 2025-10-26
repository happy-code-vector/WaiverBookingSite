<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormPeriod.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.FormPeriod" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
            
                <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Subscription Period</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
                <div class="form-group">
                     <label>Date Range</label><asp:Label ID="lblDates" runat="server"></asp:Label>
                </div>
                 <div class="form-group">
                     <label for="<%=txtNumIncluded.ClientID %>">Waivers Included</label><asp:TextBox ID="txtNumIncluded" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                     <label>Num Used</label><asp:Label ID="lblNumUsed" runat="server"></asp:Label>
                </div>
                
               


                 </div><!-- /.box-body -->
    <div class="box-footer">
       <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />
    </div>
</div>



            