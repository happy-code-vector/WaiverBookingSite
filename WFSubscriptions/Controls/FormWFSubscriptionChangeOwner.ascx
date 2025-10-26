<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWFSubscriptionChangeOwner.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.FormWFSubscriptionChangeOwner" %>

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Change Subscription Owner
</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        
        <p>
            Use this form to change the owner of a subscription. In order to become the owner, the user must already have administrator access to one of the sites in the subscription.
        </p>
        <p><strong>Subscription details: </strong></p>
        <asp:PlaceHolder ID="phSubDetails" runat="server"></asp:PlaceHolder>



        <div class="form-group">
            <label>New Owner</label>
            <asp:DropDownList runat="server" ID="cboOwner" CssClass="form-control"></asp:DropDownList>
        </div>
        
    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Submit" OnClick="btnSave_Click" />
    </div>
</div>