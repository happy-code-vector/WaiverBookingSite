<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWaiverSiteLinkCodeTemplate.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.FormWaiverSiteLinkCodeTemplate" %>

<script>
    $(document).ready(function () {
        $('.codepermitted').each(function () {
            var e = $(this);
            var ex = $('<input type="hidden" name="' + e.attr('name') + '" value="' + escape(e.val()) + '" />');
            e.before(ex);
            e.removeAttr('name');
            e.change(function () {
                ex.val(escape(e.val()));
            });
        });
    });
    
    </script>

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Waiver Site Link Code Template
</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
         <div class="form-group">
            <label>Image Preview</label>
            <asp:FileUpload ID="upload1" runat="server" />
            <asp:PlaceHolder ID="phImagePreview" runat="server"></asp:PlaceHolder>
             <p class="help-block">To replace image, upload a new one.</p>  
        </div>

        <div class="form-group">
            <label>Name</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Name"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Description</label>
            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder="Description" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Order Number</label>
            <asp:TextBox ID="txtOrderNum" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Code Template</label>
        </div>
        <div class="form-group">
            <asp:TextBox ID="txtCode" runat="server" CssClass="form-control codepermitted" placeholder="Description" TextMode="MultiLine" ValidateRequestMode="Disabled"></asp:TextBox>
             <p class="help-block">{{URL}}, {{SITENAME}}, {{URL_PORTION}}</p>
            <p class="help-block">{{TEXT:CODENAME:Label:Default Value}} - allows customization of a text field. </p>
            <p class="help-block">{{COLOR:CODENAME:Label:Default Value}} - allows customization of a color. </p>
        </div>

    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Submit" OnClick="btnSave_Click" />
    </div>
</div>