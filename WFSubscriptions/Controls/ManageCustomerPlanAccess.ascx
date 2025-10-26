<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageCustomerPlanAccess.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.ManageCustomerPlanAccess" %>

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Manage Customer Plan Access</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        
        <div class="form-group">
            <label>Access to Groups</label>
            </div>
        <div class="form-group">
        <div class="checkboxlist">
            <asp:CheckBoxList runat="server" ID="cblPlanGroups"></asp:CheckBoxList>
        </div>
            </div>

         <div class="form-group">
            <label>Access to Specialty Plans</label>
            </div>
        <div class="form-group">
        <div class="checkboxlist">
            <asp:CheckBoxList runat="server" ID="cblPlans"></asp:CheckBoxList>
        </div>
            </div>
    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Submit" OnClick="btnSave_Click" />
    </div>
</div>