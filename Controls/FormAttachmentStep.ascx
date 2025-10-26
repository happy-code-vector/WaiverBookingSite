<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormAttachmentStep.ascx.cs" Inherits="WaiverFile.Controls.FormAttachmentStep" %>

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

        $('.btncheckall2').click(function () {
            $('#filetypes input[type="checkbox"]').each(function () {
                $(this).prop('checked', true);
            });
        });
        $('.btnchecknone2').click(function () {
            $('#filetypes input[type="checkbox"]').each(function () {
                $(this).prop('checked', false);
            });
        });
    });

</script>

<asp:PlaceHolder runat="server" ID="phErr" ></asp:PlaceHolder>
<h3>Waiver File Attachment Prompt</h3>
<p>This will add a prompt to upload a file to attach to each waiver.</p>
<div class="form-group">
    <label for="<%=txtTitle.ClientID %>">Title/Label</label>
    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="form-group">
    <label for="<%=txtTitle.ClientID %>">Description</label>
    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control"></asp:TextBox>
    <p class="help-block">Appears as small text below the upload button</p>
</div>


<div class="form-group">
    <asp:CheckBox ID="chkRequired" runat="server" Text="Required"></asp:CheckBox>
    <p class="help-block">If selected, requires users upload a file in order to complete their waiver.</p>
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
    <label for="<%=cboFormSelectionMode.ClientID %>">Permitted File Types</label>
</div>
<div id="filetypes" class="form-group">
    <div><a href="javascript:void(0);" class="btn btn-sm btn-default btncheckall2">Check All</a> <a href="javascript:void(0);" class="btn btn-sm  btn-default btnchecknone2">Check None</a></div>
    <div class="checkboxlist">
    <asp:CheckBoxList ID="cblFileTypes" runat="server">
        <asp:ListItem Value="pdf">PDF</asp:ListItem>
        <asp:ListItem Value="jpg,jpeg,png,gif">Images (jpg, png, or gif)</asp:ListItem>
        <asp:ListItem Value="doc,docx">Word  (doc, docx)</asp:ListItem>
        <asp:ListItem Value="xls,xlsx">Excel (xls, xlsx)</asp:ListItem>
        <asp:ListItem Value="ppt,pptx">Powerpoint (ppt, pptx)</asp:ListItem>
        <asp:ListItem Value="pages,key,numbers">iWork (Pages, Keynote, Numbers)</asp:ListItem>
        <asp:ListItem Value="webm,mpg,mp2,mpeg,mpe,mpv,ogg,mp4,m4p,m4v,avi,wmv,mov,qt">Video (mpg,mov,wmv,qt,mp4,m4v)</asp:ListItem>
        <asp:ListItem Value="zip">ZIP</asp:ListItem>

    </asp:CheckBoxList>
  
        </div>
</div>




<asp:Panel runat="server" ID="pnlAgreeStorage">
    <div class="WPERR_Information">Enabling attachments will add an additional storage fee. This fee is billed automatically based on your usage. <a href="StoragePricing.aspx">View Pricing</a>   </div>
    <div class="form-group">
        <asp:CheckBox ID="chkAgreeStorage" runat="server" Text="Add a storage plan to my account"></asp:CheckBox>
    </div>
</asp:Panel>
<asp:Panel runat="server" ID="pnlStorageInfo">
    <div class="WPERR_Information">Attachments will be added to your add-on storage service.</div>
    </asp:Panel>

<asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click" />
