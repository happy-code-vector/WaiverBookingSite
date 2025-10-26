<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormPhotoStep.ascx.cs" Inherits="WaiverFile.Controls.FormPhotoStep" %>

<script type="text/javascript">
    function showHideFormSelect() {
        if ($('#<%=cboFormSelectionMode.ClientID%>').val() == 'Only_selected_forms') {
            $('#formselections').show();
        } else{
            $('#formselections').hide();
        }
    }
    $(function () {
        showHideFormSelect();
        $('#<%=cboFormSelectionMode.ClientID%>').change(function () { showHideFormSelect(); });

        $('.btncheckall').click(function () {
            $('#formselections input[type="checkbox"]').each(function () {
                $(this).prop('checked', true);
            });
        });
        $('.btnchecknone').click(function () {
            $('#formselections input[type="checkbox"]').each(function () {
                $(this).prop('checked', false);
            });
        });
    });

</script>

<asp:PlaceHolder runat="server" ID="phErr" ></asp:PlaceHolder>
<h3>Photo Step</h3>
<p>This will act as an additional step in the waiver process on our mobile app only. It does not appear on web-based signing pages.</p>
<div class="form-group">
    <label for="<%=txtTitle.ClientID %>">Title</label>
    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control"></asp:TextBox>
    <p class="help-block">Appears at the top of the photo screen</p>
</div>

<div class="form-group">
    <label for="<%=cboCamera.ClientID %>">Camera</label>
    <asp:DropDownList ID="cboCamera" runat="server" CssClass="form-control"></asp:DropDownList>
</div>

<div class="form-group">
    <label for="<%=cboFormSelectionMode.ClientID %>">Form Selection Mode</label>
    <asp:DropDownList ID="cboFormSelectionMode" runat="server" CssClass="form-control"></asp:DropDownList>
</div>

<div id="formselections" class="form-group">
    <div><a href="javascript:void(0);" class="btn btn-sm btn-default btncheckall">Check All</a> <a href="javascript:void(0);" class="btn btn-sm  btn-default btnchecknone">Check None</a></div>
    <div class="checkboxlist">
    <asp:CheckBoxList ID="cblFormSelections" runat="server">

    </asp:CheckBoxList>
  
        </div>
</div>

<div class="form-group">
    <asp:CheckBox ID="chkLowRes" runat="server" Text="Use Lower Resolution Images"></asp:CheckBox>
    <p class="help-block">If checked, images will be sized down and compressed which will result in a lower quality image but saves storage space. </p>
</div>

<div class="form-group">
    <asp:CheckBox ID="chkOptional" runat="server" Text="Optional"></asp:CheckBox>
    <p class="help-block">If selected, allows users to skip the step.</p>
</div>

<div class="form-group" style="display:none;"><!-- not implementing this on the app just yet -->
    <asp:CheckBox ID="chkCountdown" runat="server" Text="Include Countdown"></asp:CheckBox>
    <p class="help-block">If selected, runs a short countdown before taking the picture.</p>
</div>

<h4>Customize Labels</h4>
<div class="form-group">
    <label for="<%=txtBtnTakePicture.ClientID %>">Button: Take Picture</label>
    <asp:TextBox ID="txtBtnTakePicture" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="form-group">
    <label for="<%=txtBtnRetakePicture.ClientID %>">Button: Retake Picture</label>
    <asp:TextBox ID="txtBtnRetakePicture" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="form-group">
    <label for="<%=txtBtnContinue.ClientID %>">Button: Continue</label>
    <asp:TextBox ID="txtBtnContinue" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="form-group">
    <label for="<%=txtBtnSkip.ClientID %>">Button: Skip</label>
    <asp:TextBox ID="txtBtnSkip" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="form-group">
    <label for="<%=txtBottomScreenInstr.ClientID %>">Bottom-of-Screen Instructions</label>
    <asp:TextBox ID="txtBottomScreenInstr" runat="server" CssClass="form-control"></asp:TextBox>
    <p class="help-block">Provide instructions that will appear below the preview and above the buttons</p>
</div>
<div class="form-group">
    <label for="<%=txtBottomScreenInstr.ClientID %>">Instructions Popup</label>
    </div>
<div class="form-group">
    <asp:TextBox ID="txtInstructionsPopup" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
    <p class="help-block">When specified, shows a dialog with instructions before beginning photo process</p>
</div>

<asp:Panel runat="server" ID="pnlAgreeStorage">
    <div class="WPERR_Information">Photo steps will add an additional storage fee. This fee is billed automatically based on your usage. <a href="StoragePricing.aspx">View Pricing</a>   </div>
    <div class="form-group">
        <asp:CheckBox ID="chkAgreeStorage" runat="server" Text="Add a storage plan to my account"></asp:CheckBox>
    </div>
</asp:Panel>
<asp:Panel runat="server" ID="pnlStorageInfo">
    <div class="WPERR_Information">Photos stored from this step will be applied to your add-on storage service.</div>
    </asp:Panel>

<asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click" />
