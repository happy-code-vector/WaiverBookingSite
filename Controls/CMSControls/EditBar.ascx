<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditBar.ascx.cs" Inherits="WaiverFile.Controls.CMSControls.EditBar" %>

<asp:Panel runat="server" ID="pnlMain">
    <script>
        var isDockLayoutDirty = false;
        $(function () {
            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl, {
                    delay: { show: 100, hide: 500 },
                    trigger: 'hover' // Remove focus trigger
                });
            });
        });
        $(document).on('click', '.RadDock .rdCommand, .RadDock .rdCommands a, .RadDock .rdCommands button', function (e) {
            if (isDockLayoutDirty) {
                e.preventDefault();
                e.stopPropagation();

                alert("Please save the layout before performing other actions.");
                return false;
            }
        });

        function OnClientDock(dock) {
            isDockLayoutDirty = true;

            $('#btnSaveDockLayoutWrap').show('slow');
            $(window).on('beforeunload', function () {
                return "Layout changes not saved. Are you sure you want to leave this page?";
            });
            // Skip the warning when the save button is clicked
            $('.btn-save-layout').on('click', function () {
                // Temporarily unbind the beforeunload event
                $(window).off('beforeunload');
            });




        }
        function onClientClose(dockableObject, eventArgs) {
            if (isDockLayoutDirty) { return; }
            if (confirm('Are you sure you wish to remove this widget?')) {

                //USE GENERIC HANDLER
                $.post("/Controls/CMSControls/Main.ashx", { cmd: 'REMOVEWIDGET', pageInstanceID: '<%=InstanceRef.InstanceID %>', id: eventArgs.command.get_name() },
                    function (data) {
                        if (data == "SUCCESS") {
                            location.reload(true);
                        } else {
                            PopErrDialog(data, 'Error Removing Widget');
                        }
                    });

                //dockableObject.set_closed(true);
                //location.reload(true);
            }
        }
        function PopIframeDialog(url, title) {
            if (isDockLayoutDirty) { return; }

            $("#wfIframeDialogHeading").html(title);
            $("#wfIframeDialog").modal("show");
            

            let iframe = $('#wfIframe');
            if (iframe.attr('src') === url) {
                iframe.attr('src', 'about:blank'); // Temporarily clear the src
                setTimeout(() => {
                    iframe.attr('src', url); // Set the original URL again
                }, 50); // Small delay to ensure reload
            } else {
                iframe.attr('src', url); // Set the URL normally if it's different
            }

        }
       
        function onClientEdit(dockableObject, eventArgs) {
            if (isDockLayoutDirty) { return; }
            //todo: make an iframe dialog for settings. probably make each control that we use have an edit mode and a display mode so they can manage themselves. rather than reflection, just make the forms.
            //controls will have to inherit from something to handle edit mode flag.
            PopIframeDialog('/Controls/CMSControls/WFEditDialog.aspx?mode=editwidget&pageInstanceID=<%=InstanceRef.InstanceID%>&id=' + eventArgs.command.get_name(), 'Edit This Widget');

        }


        $(document).ready(function () {
            // Open the modal when the button is clicked
            $(".add-widget-link").click(function () {
                
                $('#<%=hfAddWidgetZoneID.ClientID%>').val($(this).data('zoneid'));
                $('#<%=hfAddWidgetSubControlID.ClientID%>').val($(this).data('subciid'));
                //subcid
                $("#cartzillaModal").modal("show");
            });

            
        });
    </script>

    
<style>
        body {
            margin: 0;
            padding-top: 56px; /* Height of the navbar */
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

.add-widget-box.site-wide {
    border: 2px dashed #dc3545; /* Bootstrap's red (danger) */
    background-color: #fff5f5;  /* Light red background */
    position: relative;
}

.add-widget-box.site-wide::before {
    content: "Site-wide";
    position: absolute;
    top: -10px;
    left: 10px;
    background-color: #dc3545;
    color: white;
    font-size: 12px;
    padding: 2px 6px;
    border-radius: 4px;
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


   <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm editing-bar">
        <div class="container-fluid">
            <!-- Logo -->
            <a class="navbar-brand" href="<%=_site.BasePathRelative %>" runat="server" id="homeLink">
                <img src="/sitebooking/images/waiverbooking-logo.jpg" alt="Logo" width="63" height="30" class="d-inline-block align-text-top">
            </a>

            <!-- Toggler for mobile view -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navbar Content -->
            <div class="collapse navbar-collapse" id="navbarContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            
                     

                    
                    <li class="nav-item">
                        <a class="nav-link" href="<%=_site.BasePathRelative %>/admin">Site Admin</a>
                    </li>
                   
                    <li class="nav-item">
                        <a href="<%=_site.BasePathRelative %>/admin/CMS/PageSettings.aspx?id=<%=InstanceRef.PageID %>" class="btn btn-outline-secondary me-2" title="Page Settings">
                            <i class="ci-settings"> </i>
                            </a>
                    </li>
                    
                    <li class="nav-item">
                            <a href="https://www.waiverfile.com/Resources/Help/Getting-Started/Quick-Start/Waiver-Form-Setup.aspx" class="btn btn-info" title="Help" target="_blank">
                                 <i class="ci-help-circle"> </i>
                                 </a>
                       
                    </li>
                </ul>

                <span id="btnSaveDockLayoutWrap" style="display:none;"><asp:Button runat="server" ID="btnSaveDockLayout" CssClass="btn btn-outline-primary me-2 btn-save-layout" Text="Save Layout" OnClick="btnSaveDockLayout_Click" /></span>
                <a href="javascript:void(0);" class="btn btn-outline-primary me-2" runat="server" id="btnEdit">Edit Page</a>
            
                <div class="btn-group me-2" runat="server" id="divBtnPublishWrap">
    <!-- Main Publish Button -->
    <asp:Button 
        runat="server" 
        ID="btnPublish" 
        CssClass="btn btn-success" 
        Text="Publish" 
        OnClick="btnPublish_Click" />

    <!-- Dropdown Toggle Button -->
   <button 
    type="button" 
    class="btn btn-outline-secondary dropdown-toggle dropdown-toggle-split" 
    data-bs-toggle="dropdown" 
    aria-expanded="false">
    <span class="visually-hidden">Toggle Dropdown</span>
</button>

    <!-- Dropdown Menu -->
    <ul class="dropdown-menu">
        <li>
            <asp:LinkButton 
                runat="server" 
                ID="btnDiscard" 
                CssClass="dropdown-item" 
                Text="Discard Changes" 
                OnClick="btnDiscard_Click" />
        </li>
        <li>
            <a href="javascript:void(0);" class="dropdown-item" runat="server" id="btnView">View Live Page</a>
        </li>
        <li>
            <asp:LinkButton 
                runat="server" 
                ID="btnViewHistory" 
                CssClass="dropdown-item" 
                Text="View History" 
                OnClick="btnViewHistory_Click" />
        </li>
    </ul>
</div>


               <div class="status-box d-flex align-items-center gap-2" id="documentStatus" runat="server" >
   <asp:Label runat="server" ID="lblDocStatus"></asp:Label>
</div>
            </div>

        </div>
    </nav>
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

    <!-- ADD WIDGET DIALOG -->

  <!-- Bootstrap 5 Modal with Scrollable Content -->
<div class="modal fade" id="cartzillaModal" tabindex="-1" aria-labelledby="cartzillaModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg"> <!-- Large modal for better spacing -->
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="cartzillaModalLabel">Select Items</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="max-height: 400px; overflow-y: auto;"> <!-- Scrollable content -->
        <asp:HiddenField runat="server" ID="hfAddWidgetZoneID" />
          <asp:HiddenField runat="server" ID="hfAddWidgetSubControlID" />
          
          <asp:PlaceHolder ID="phAddWidgetModalBody" runat="server"></asp:PlaceHolder>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

      <!-- Bootstrap 5 Modal with Scrollable Content -->
<div class="modal fade" id="wfIframeDialog" tabindex="-1" aria-labelledby="wfIframeDialogHeading" aria-hidden="true">
  <div class="modal-dialog modal-fullscreen "> <!-- Large modal for better spacing -->
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="wfIframeDialogHeading">Widget Settings</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="margin:0; padding:0;overflow:hidden;"> <!-- Scrollable content -->
            <iframe id="wfIframe" frameborder="0" scrolling="auto" src="/wp-content/Common/Loading.html" title="wpIframe"
          class="w-100 h-100">
        </iframe>

      </div>
   
    </div>
  </div>
</div>

 


    </asp:Panel>

<asp:PlaceHolder runat="server" ID="phTempLoadingZone"></asp:PlaceHolder>