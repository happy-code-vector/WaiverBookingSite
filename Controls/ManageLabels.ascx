<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageLabels.ascx.cs" Inherits="WaiverFile.Controls.ManageLabels" %>

<script type="text/javascript">
    $(document).ready(function () {
        $('.btnReset').click(function () {
            $('#' + $(this).data('btnid')).val($('#' + $(this).data('btnid')).data('default'));
        });

        $('.btnResetAll').click(function () {
            $('.btnReset').each(function () {
                $(this).click();
            });
        });
    });
</script>
 <div class="widget">
    <h3>Manage Labels</h3>
    <div class="widgetcontentgrid">
    
        <p>Use this screen to customize the wording on your WaiverFile site.</p>

        <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        <asp:PlaceHolder ID="phMain" runat="server"></asp:PlaceHolder>

        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click" />
        <a href="javascript:void(0);" class="btn btn-default btnResetAll" data-btnid="txt_{Code}">Reset All</a>
</div></div>
