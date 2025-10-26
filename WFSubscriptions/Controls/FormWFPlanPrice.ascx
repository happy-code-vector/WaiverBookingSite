<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWFPlanPrice.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.FormWFPlanPrice" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
            
                <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Plan Price</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
                 <div class="form-group">
                     <label for="<%=cboPlan.ClientID %>">Plan</label><asp:DropDownList runat="server" ID="cboPlan" CssClass="form-control"></asp:DropDownList>
                </div>
               
                 <div class="form-group">
                     <label for="<%=txtIntervalPrice.ClientID %>">Sale Price</label><asp:TextBox ID="txtIntervalPrice" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                 <div class="form-group">
                     <label for="<%=txtListPrice.ClientID %>">List Price</label><asp:TextBox ID="txtListPrice" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                     <label for="<%=cboInterval.ClientID %>">Billing Interval</label><asp:DropDownList runat="server" ID="cboInterval" CssClass="form-control"></asp:DropDownList>
                </div>
               
                               
                 <div class="form-group">
                     <label for="<%=txtQuota.ClientID %>">Quota</label><asp:TextBox ID="txtQuota" CssClass="form-control" runat="server"></asp:TextBox>
                     <p class="help-block">Set to -1 for unlimited</p>
                </div>
               
                 <div class="form-group">
                     <label for="<%=cboQuotaInterval.ClientID %>">Quota Interval</label><asp:DropDownList runat="server" ID="cboQuotaInterval" CssClass="form-control"></asp:DropDownList>
                </div>
               

                 <div class="form-group">
                     <label for="<%=txtAdditionalWaiverPriceEach.ClientID %>">Additional Waiver Price Each</label><asp:TextBox ID="txtAdditionalWaiverPriceEach" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                
               

                

                 <div class="form-group">
                      <label for="<%=cboSaveOption.ClientID %>">Save Option</label><asp:DropDownList ID="cboSaveOption" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
               

               


                 </div><!-- /.box-body -->
    <div class="box-footer">
       <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />
    </div>
</div>



            