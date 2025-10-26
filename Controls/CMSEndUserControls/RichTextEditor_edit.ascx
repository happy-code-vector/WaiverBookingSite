<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RichTextEditor_edit.ascx.cs" Inherits="WaiverFile.Controls.CMSEndUserControls.RichTextEditor_edit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<style type="text/css">
  /* Force RadEditor toolbar to display properly */
.reToolZone, .reToolbar, .reToolGroup {
    display: flex !important;
    flex-wrap: wrap !important;
    gap: 0px !important;
    align-items: center !important;
}

/* Ensure tools are inline */
.reTool {
    display: inline-block !important;
}

/* Prevent unnecessary vertical stacking */
.reToolbar {
    flex-direction: row !important;
}
/* Ensure RadEditor tabs are horizontal */
.reModeWrapper {
    display: flex !important;
    flex-direction: row !important;
    justify-content: flex-start;
    gap: 10px;
}

/* Ensure tabs are inline */
.reMode, .reMode_selected {
    display: inline-block !important;
    padding: 5px 15px;
}

/* Optional: Improve spacing and remove unnecessary margins */
.reWrapper {
    margin: 0 !important;
    padding: 0 !important;
}
/* Ensure RadEditor fills the iframe */
html, body, form, .reWrapper, .RadEditor {
    height: 100% !important;
    width: 100% !important;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
}

/* Make editor content (inside) expand fully */
.reContentWrapper {
    flex-grow: 1;
    height: auto !important;
}

/* Ensure text editor grows inside */
.reContent {
    height: 100% !important;
    width: 100% !important;
}

.reWrapper, .RadEditor {
    display: block !important;
    font-size: 1rem !important;
}

.reMode, .reMode_selected {
    padding: 6px 12px !important;
    border: 1px solid #ccc;
    border-radius: 0.25rem;
    white-space: nowrap;
}

.reModeWrapper {
    display: flex;
    flex-wrap: nowrap;
    overflow-x: auto;
    gap: 8px;
}
/*move save button down a bit */
.telerik-editor-wrapper{ padding-bottom:5px; }
/* Fix list style for RadEditor tabs */
.telerik-editor-wrapper .reEditorModes ul,
.telerik-editor-wrapper .reModeWrapper,
.telerik-editor-wrapper .reToolbar {
  list-style: none !important;
  padding-left: 0 !important;
  margin: 0 !important;
}

/* Fix tab buttons (which may be seen as buttons or inputs) */
.telerik-editor-wrapper .reMode,
.telerik-editor-wrapper .reMode_selected {
  display: inline-block !important;
  border: 1px solid #ccc;
  padding: 5px 12px;
  border-radius: 4px;
  background-color: #f8f9fa;
  color: #000;
  font-size: 0.9rem;
  text-transform: none;
  white-space: nowrap;
  overflow: visible !important;
}
.reMode_selected{ padding:0 !important;}
/* Fix toolbar layout */
.telerik-editor-wrapper .reToolZone,
.telerik-editor-wrapper .reToolbar {
  display: flex !important;
  flex-wrap: wrap;
  gap: 5px;
  align-items: center;
}

/* Fix inner content editor height/width */
.telerik-editor-wrapper .reWrapper,
.telerik-editor-wrapper .RadEditor,
.telerik-editor-wrapper .reContent {
  width: 100% !important;
  height: 100% !important;
}

/* Prevent collapsing or font inheritance issues */
.telerik-editor-wrapper * {
  font-size: initial;
  line-height: normal;
  box-sizing: content-box;
}

/* RadEditor CSS Isolation Container */
.radeditor-isolated {
    /* Reset Bootstrap/Cartzilla interference */
    font-family: inherit;
    font-size: 14px;
    line-height: 1.4;
    
    /* Isolate from parent flexbox/grid */
    display: block !important;
    position: relative;
    width: 100%;
    box-sizing: border-box;
}

/* Fix RadEditor toolbar buttons */
.radeditor-isolated .RadEditor .reToolbar .reToolbarWrapper {
    display: block !important;
    width: 100% !important;
    overflow: visible !important;
}

.radeditor-isolated .RadEditor .reToolbar .reToolbarWrapper .reToolbarGroup {
    display: inline-block !important;
    vertical-align: top !important;
    margin: 0 !important;
    padding: 0 !important;
}

/* Reset button styles that conflict with Bootstrap/Cartzilla */
.radeditor-isolated .RadEditor .reToolbar a.reTool,
.radeditor-isolated .RadEditor .reToolbar .reDropdown,
.radeditor-isolated .RadEditor .reToolbar .reColorPicker {
    /* Override Bootstrap button styles */
    background: none !important;
    border: 1px solid #ccc !important;
    border-radius: 0 !important;
    box-shadow: none !important;
    color: #333 !important;
    text-decoration: none !important;
    
    /* Reset Bootstrap/Cartzilla button sizing */
    padding: 2px 4px !important;
    margin: 0 1px !important;
    font-size: 12px !important;
    line-height: 16px !important;
    height: 22px !important;
    min-width: auto !important;
    
    /* Reset flexbox properties */
    display: inline-block !important;
    vertical-align: top !important;
    flex: none !important;
    
    /* Reset transitions that might interfere */
    transition: none !important;
}

/* Button hover states */
.radeditor-isolated .RadEditor .reToolbar a.reTool:hover,
.radeditor-isolated .RadEditor .reToolbar .reDropdown:hover {
    background-color: #e6e6e6 !important;
    border-color: #999 !important;
    color: #000 !important;
}

/* Fix dropdown buttons specifically */
.radeditor-isolated .RadEditor .reToolbar .reDropdown {
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAcAAAAECAYAAABCxiV9AAAAGklEQVQIHWPY9+8fAzYwChkYGBgYmJhQAQAAVQANADMqWnEAAAAASUVORK5CYII=') !important;
    background-repeat: no-repeat !important;
    background-position: right center !important;
    padding-right: 12px !important;
}

/* Fix separator lines */
.radeditor-isolated .RadEditor .reToolbar .reToolbarSeparator {
    display: inline-block !important;
    width: 1px !important;
    height: 22px !important;
    background-color: #ccc !important;
    margin: 0 2px !important;
    vertical-align: top !important;
}

/* Fix content area */
.radeditor-isolated .RadEditor .reContentCell {
    display: block !important;
    width: 100% !important;
    position: relative !important;
}

/* Fix bottom toolbar if present */
.radeditor-isolated .RadEditor .reBottomZone {
    display: block !important;
    width: 100% !important;
    clear: both !important;
}

/* Reset any Cartzilla-specific modal/dialog interference */
.radeditor-isolated .RadEditor .reDialog,
.radeditor-isolated .RadEditor .reToolbar .reDropdownPopup {
    z-index: 9999 !important;
    position: absolute !important;
    font-family: Arial, sans-serif !important;
    font-size: 12px !important;
    line-height: 1.4 !important;
}

/* Fix any text selection issues */
.radeditor-isolated .RadEditor .reContentArea {
    user-select: text !important;
    -webkit-user-select: text !important;
    -moz-user-select: text !important;
}
</style>
<div class="telerik-editor-wrapper">
<telerik:RadEditor runat="server" ID="RadEditor1" Width="100%" Height="400px" OnClientPasteHtml="OnClientPasteHtml" Skin="Bootstrap"
    ContentFilters="RemoveScripts,ConvertToXhtml,FixEnclosingP,ConvertFontToSpan"
      ContentAreaMode="Iframe" OnClientLoad="onRadEditorLoadTaller"
    CssClass="radeditor-isolated" ContentAreaCssFile="/sitebooking/css/RadEditorMinimal.css"
    toolsfile="/wp-content/Plugins/WaiverFile/Docs/WaiverBookingToolsSimple.xml">
    <CssFiles>
        <telerik:EditorCssFile Value="/sitebooking/css/RadEditorMinimal.css" />
    </CssFiles>
</telerik:RadEditor>
</div>
<!-- -->