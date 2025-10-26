<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListAdmissionItems_edit.ascx.cs" Inherits="WaiverFile.Controls.CMSEndUserControls.ListAdmissionItems_edit" %>


<script type="text/javascript">
    function checkAll() {
        $('#<%= cblItems.ClientID %> input[type=checkbox]').prop('checked', true);
    }

    function uncheckAll() {
        $('#<%= cblItems.ClientID %> input[type=checkbox]').prop('checked', false);
    }
</script>
<div class="form-group">
    <label>Template</label>
    <asp:DropDownList runat="server" ID="cboTemplate" CssClass="form-control"></asp:DropDownList>
</div>

<div class="form-group">
    <label>Admission Items To Show</label>
    
    <!-- Check All / Uncheck All Buttons -->
    <div class="mb-2">
        <button type="button" class="btn btn-primary btn-sm" onclick="checkAll()">Check All</button>
        <button type="button" class="btn btn-secondary btn-sm" onclick="uncheckAll()">Uncheck All</button>
    </div>

    <!-- CheckBoxList -->
    <asp:CheckBoxList runat="server" ID="cblItems" CssClass="checkbox-list"></asp:CheckBoxList>
</div>

