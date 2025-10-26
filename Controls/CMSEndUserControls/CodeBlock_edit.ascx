<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CodeBlock_edit.ascx.cs" Inherits="WaiverFile.Controls.CMSEndUserControls.CodeBlock_edit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<style>
    .RadEditor .reToolZone {
    display: none !important;
}
</style>
<div class="mb-3">
    <label class="form-label">Html Code</label>
</div>

<telerik:RadEditor ID="RadEditor1" runat="server" EditModes="Html"  ToolbarMode="ShowOnFocus" Width="100%" >
   <Tools />
</telerik:RadEditor>

<p class="help-block">The code you add will be placed directly on the page.</p>
