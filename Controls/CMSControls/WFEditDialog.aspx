<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeBehind="WFEditDialog.aspx.cs" Inherits="WaiverFile.Controls.CMSControls.WFEditDialog" %>
<%@ Register Assembly="Telerik.Web.UI"
    Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Dialog</title>

       
     <!-- Preloaded local web font (Inter) -->
 <link rel="preload" href="/sitebooking/Themes/Default/fonts/inter-variable-latin.woff2" as="font" type="font/woff2" crossorigin/>

     <!-- Font icons -->
 <link rel="preload" href="/sitebooking/Themes/Default/icons/cartzilla-icons.woff2" as="font" type="font/woff2" crossorigin/>
 <link rel="stylesheet" href="/sitebooking/Themes/Default/icons/cartzilla-icons.min.css"/>


     <!-- Bootstrap + Theme styles -->
 <link rel="preload" href="/sitebooking/Themes/Default/css/theme.min.css" as="style"/>
 <link rel="preload" href="/sitebooking/Themes/Default/css/theme.rtl.min.css" as="style"/>
 <link rel="stylesheet" href="/sitebooking/Themes/Default/css/theme.min.css" id="themestyles"/>

    <link rel="stylesheet" href="/sitebooking/vendor/choices.js/public/assets/styles/choices.min.css">
    
        <script src="/sitebooking/vendor/choices.js/public/assets/scripts/choices.min.js"></script>

   <script type="text/javascript">

       function fixEditorHeight(editor, designHeight, htmlHeight) {
           try {
               var mode = editor.get_mode();

               if (mode === Telerik.Web.UI.EditorModes.Design) {
                   var iframe = editor.get_contentAreaElement();
                   if (!iframe) return;

                   iframe.style.height = designHeight + "px";

                   var doc = iframe.contentWindow?.document;
                   if (doc && doc.body) {
                       doc.body.style.minHeight = designHeight + "px";
                       doc.body.style.height = "auto";
                   }
               } else if (mode === Telerik.Web.UI.EditorModes.Html) {
                   var htmlArea = editor.get_htmlPanel();
                   if (htmlArea) {
                       htmlArea.style.height = htmlHeight + "px";
                   }
               }
           } catch (e) {
               console.warn("Editor height fix failed:", e);
           }
       }

       function onRadEditorLoad(editor) {
           var designHeight = 440;
           var htmlHeight = 300; // Set smaller height for HTML view

           // Initial fix
           fixEditorHeight(editor, designHeight, htmlHeight);

           // Fix on mode change
           editor.add_modeChange(function () {
               fixEditorHeight(editor, designHeight, htmlHeight);
           });

           // Keep fixing every second (optional, but safer)
           setInterval(function () {
               fixEditorHeight(editor, designHeight, htmlHeight);
           }, 1000);
       }

       function onRadEditorLoadTaller(editor) {
           // Delay ensures content is rendered first
           setTimeout(function () {
               try {
                   var wrapper = editor.get_element(); // outer container
                   var iframe = editor.get_contentAreaElement(); // iframe
                   var height = 440; // or calculate dynamically if needed

                   if (iframe) {
                       iframe.style.height = height + "px";
                   }

                   // Optionally set .reContent or .reContentCell as well
                   var contentArea = iframe?.contentWindow?.document?.body;
                   if (contentArea) {
                       contentArea.style.minHeight = height + "px";
                       contentArea.style.height = "auto";
                   }
               } catch (ex) {
                   console.warn("RadEditor height fix error:", ex);
               }
           }, 200); // small delay after load for stability
       }
      
   </script>


    <style type="text/css">
.reToolbar .WaiverFileImage
{
  background-image: url(/wp-content/Common/images/WaypointImage.gif) !important;
}
.reToolbar .WaypointFile
{
  background-image: url(/wp-content/Common/images/WaypointFile.gif) !important;
}
body, html, form{ height: 100% !important; }
        body {
            padding:15px; 
            margin:0;
            
        }
        .editing-bar {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1050; /* Higher than other elements */
        }  .status-box {
            border: 1px solid #ccc;
            padding: 5px 10px;
            border-radius: 4px;
            background-color: #f8f9fa;
            font-weight: bold;
        }
           .add-widget-box {
    border: 1px solid #dee2e6; /* Matches Bootstrap's border */
    border-radius: 0.25rem;    /* Consistent rounded corners */
    padding: 12px;
    margin-top: 0;
    background-color: #f8f9fa; /* Light background like Bootstrap cards */
    text-align: center;
    transition: background-color 0.3s ease, box-shadow 0.3s ease;
    cursor: pointer;
}

.add-widget-box:hover {
    background-color: #e9ecef; /* Slight hover effect */
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1); /* Subtle shadow */
}

.add-widget-link {
    font-weight: 500;
    color: #0d6efd; /* Bootstrap primary color */
    text-decoration: none;
    font-size: 16px;
}

.add-widget-link i {
    margin-right: 6px; /* Spacing between icon and text */
    font-size: 18px;
    vertical-align: middle;
}

.add-widget-link:hover {
    text-decoration: underline;
    color: #0a58ca; /* Darker shade on hover */
}

.RadDock .rdCommands {
    display: flex !important;
    flex-direction: row;
    gap: 5px;
}
    .reEditorModes ul {
        display: block;
    }
    </style>

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
.reContent strong,
.reContent b,
.reContent u,
.reContent i,
.reContent span {
  display: inline !important;
  white-space: normal !important;
}

.rwControlButtons{ display: block !important; }
</style>

   

</head>
<body>
    <form id="form1" runat="server">
             <asp:scriptmanager runat="server"></asp:scriptmanager>  
        <div>
            
     <script type="text/javascript">
         var allowUnsafePaste = false;
         function OnClientPasteHtml(editor, args) {
             if (window.allowUnsafePaste) {
                 return;
             }

             var allowedTags = ['B', 'I', 'U', 'A', 'H1', 'H2', 'H3', 'STRONG', 'EM', 'P'];
             var html = args.get_value();
             var container = document.createElement('div');
             container.innerHTML = html;

             function sanitize(node) {
                 var children = Array.from(node.childNodes);
                 for (var i = 0; i < children.length; i++) {
                     var child = children[i];
                     if (child.nodeType === 1) { // ELEMENT_NODE
                         if (!allowedTags.includes(child.tagName)) {
                             // Replace disallowed tag with its content
                             var frag = document.createDocumentFragment();
                             while (child.firstChild) {
                                 frag.appendChild(child.firstChild);
                             }
                             child.parentNode.replaceChild(frag, child);
                         } else {
                             sanitize(child); // recurse
                         }
                     }
                 }
             }

             sanitize(container);
             args.set_value(container.innerHTML);
         }


         Telerik.Web.UI.Editor.CommandList["WaiverFileImage"] = function (commandName, editor, args) {
             var elem = editor.getSelectedElement(); //returns the selected element.
             var myCallbackFunction = function (sender, args) {

                 allowUnsafePaste = true; // set the flag before inserting HTML
                 editor.pasteHtml('<img src="' + args + '" class="waiverimage" alt="Image" />');
                 allowUnsafePaste = false; // reset it right after
                 
             }
             var width = window.width;
             if (width > 640) {
                 width -= 100;
                 if (width > 1200) { width = 1200; }
             } else {
                 width -= 20;
             }

             editor.showExternalDialog('<%=site.BasePathRelative %>/admin/Dialogs/ImageSelect.aspx', "", width, 328, myCallbackFunction, null, 'Insert Image', true, Telerik.Web.UI.WindowBehaviors.Close + Telerik.Web.UI.WindowBehaviors.Move, false, true);
         };


     </script>

            
    <script type="text/javascript">
        // Capture the close event
        function onImageSelected(sender, args) {
            var imageUrl = args.get_argument(); // <-- This is the value from .close(imgPath)

            if (!imageUrl) return;

            // Assuming you passed a global variable for the field to fill
            if (window.currentImageTextboxId) {
                var input = document.getElementById(window.currentImageTextboxId);
                if (input) {
                    input.value = imageUrl;
                }
            }
        }

        // Function to open the selector and specify the field
        function openImageSelector(fieldId) {
            window.currentImageTextboxId = fieldId;
            var oWnd = $find("<%= RadWin_ImageSelect.ClientID %>");
            oWnd.show();

            setRadWindowSizeAndCenter();
        }

        function setRadWindowSizeAndCenter() {
            var oWnd = $find("<%= RadWin_ImageSelect.ClientID %>");
            if (oWnd) {
                var viewportWidth = $(window).width();
                var viewportHeight = $(window).height();

                // Calculate 80% width and 70% height
                var desiredWidth = Math.ceil(viewportWidth * 0.8);
                var desiredHeight = Math.ceil(viewportHeight * 0.7);

                oWnd.setSize(desiredWidth, desiredHeight);
                oWnd.center();
                oWnd.maximize();
            }
        }
    </script>
          <telerik:RadWindow ID="RadWin_ImageSelect" runat="server" Skin="Bootstrap" 
             NavigateUrl=""
              Modal="true" 
                Width="400" 
                Height="300"  Behaviors="Maximize,Close"
                OnClientClose="onImageSelected">
            </telerik:RadWindow>

          <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>
            <div>    
           <asp:PlaceHolder runat="server" ID="phMain"></asp:PlaceHolder>
            </div>
            <div>
                <asp:Button runat="server" ID="btnSave" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
            </div>
        </div>
    </form>
</body>
</html>
