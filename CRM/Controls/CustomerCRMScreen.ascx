<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerCRMScreen.ascx.cs" Inherits="WaiverFile.CRM.Controls.CustomerCRMScreen" %>



<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">CRM Settings
</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        <div class="form-group">
            <label>Status</label>
            <asp:DropDownList runat="server" ID="cboStatus" CssClass="form-control"></asp:DropDownList>
        </div>

         <div class="form-group">
            <label>Affiliate</label>
            <asp:DropDownList runat="server" ID="cboAffiliate" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group">
            <label>Source</label>
            <asp:DropDownList runat="server" ID="cboSource" CssClass="form-control"></asp:DropDownList>
        </div>

        <asp:PlaceHolder ID="phAssignments" runat="server"></asp:PlaceHolder>

          <p><label>Groups</label></p>
                    <div class="checkboxlist">
                        <asp:CheckBoxList ID="cblGroups" runat="server" CssClass="entrycheckbox"></asp:CheckBoxList>
                    </div>


    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Submit" OnClick="btnSave_Click" />
    </div>
</div>
