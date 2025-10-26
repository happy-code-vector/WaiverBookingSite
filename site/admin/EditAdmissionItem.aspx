<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditAdmissionItem.aspx.cs" Inherits="WaiverFile.site.admin.EditAdmissionItem" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="/wp-admin/Scripts/jqueryupload/jquery.fileupload.css">
      <script src="/site/includes/Sortable.min.js"></script>
    <script type="text/javascript" src="/wp-content/Common/Scripts/jquery-ui-1.11.4.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    <asp:HiddenField ID="hfActiveTab" runat="server" />

    <asp:Panel runat="server" ID="pnlNew">

        <h3>New Admission Item</h3>
        <asp:PlaceHolder runat="server" ID="phErrNew"></asp:PlaceHolder>
         <div class="form-group">
      <label for="<%=txtNewName.ClientID %>">Name</label><asp:TextBox ID="txtNewName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
               
             <div class="form-group">
                 <label for="<%=cboPricingGrid.ClientID %>">Pricing Grid <small>(<a href="ManagePricingGrids.aspx">Manage Pricing Grids</a>)</small></label>
                 <asp:DropDownList runat="server" ID="cboPricingGrid" CssClass="form-control"></asp:DropDownList>
     
            </div>

      <asp:PlaceHolder runat="server" ID="phAvailabilitySchedulesNew"></asp:PlaceHolder>
         
        
       

        <asp:Button runat="server" ID="btnSaveNew" Text="Continue" CssClass="btn btn-primary" OnClick="btnSaveNew_Click" />
    </asp:Panel>
    <asp:Panel runat="server" ID="pnlEdit">


    
    
    
  <style type="text/css">
.reToolbar .WaiverFileImage
{
  background-image: url(/wp-content/Common/images/WaypointImage.gif) !important;
}
.reToolbar .WaypointFile
{
  background-image: url(/wp-content/Common/images/WaypointFile.gif) !important;
}

html body  .RadEditor .reToolBarWrapper {
    display: none;
}

input[type=radio]{ margin: 4px 5px 0; }

        /* Add border and padding to tab content */
        .tab-content {
            border: 1px solid #ddd;
            padding: 15px;
            border-top: none; /* Avoid double border at the top */
        }
</style>

    
<script type="text/javascript"> 


    Telerik.Web.UI.Editor.CommandList["WaiverFileImage"] = function (commandName, editor, args) {
        var elem = editor.getSelectedElement(); //returns the selected element.
        var myCallbackFunction = function (sender, args) {
            editor.pasteHtml(String.format('<img src="{0}" class="waiverimage" alt="Image" />', args))
        }
        editor.showExternalDialog('/b/<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.Url%>/admin/Dialogs/ImageSelect.aspx', "", 585, 328, myCallbackFunction, null, 'Insert Image', true, Telerik.Web.UI.WindowBehaviors.Close + Telerik.Web.UI.WindowBehaviors.Move, false, true);


    };

    function OnEditorLoad(sender, args) {
        let textArea = sender.get_element().querySelector(".reTextArea");
        scrollTo(0, 0);

        setTimeout(() => {
            textArea.blur();
        }, 100)
    }



</script> 


    <script type="text/javascript"> 

        var isreordering = false;
        function showHidePricingBySeason() {
            $('.cboseasonavail').each(function () {
                var seasonid = $(this).data('seasonid');
                var $rows = $('.seasonpricerow[data-seasonid="' + seasonid + '"]');

                if ($(this).val() === '') {
                    $rows.hide();
                    $('.seasonpriceoffrow[data-seasonid="' + seasonid + '"]').show();
                } else {
                    $rows.show();
                    $('.seasonpriceoffrow[data-seasonid="' + seasonid + '"]').hide();
                }
            });
        }
        function setupItemClickHandling() {
            $('.item').click(function () {
                if (isreordering == false) {
                    $('#imgholder').html('<img src="' + $(this).data('fullsrc') + '" class="img-responsive" alt="Full size image"/>');
                    $('#<%=hfImageIDToDelete.ClientID%>').val($(this).attr('id'));
                    $('#viewimage').modal('show');
                }
            });
        }
        function rbWork(curr) {
            if ($(curr).is(':checked')) {
                var disableTB = $(curr).parent().data('value') == "FREE" || $(curr).parent().data('value') == "NO";
                $('input[type="text"][data-ptid="' + $(curr).parent().data('ptid') + '"][data-trid="' + $(curr).parent().data('trid') + '"]').prop('disabled', disableTB);
            }
        }
        $(function () {

            showHidePricingBySeason();
            $('.cboseasonavail').change(function () {
                showHidePricingBySeason();
            });
            setupItemClickHandling(); 

            $('.priceradio input[type="radio"]').click(function () {
                rbWork($(this));
            });
            $('.priceradio input[type="radio"]').each(function () {
                rbWork($(this)); // Call the function for initialization
            });

            /*
            $('.priceradio input[type="radio"]').each(function () {
                $(this).click(function () {
                    rbWork($(this));
                });
                rbWork($(this));
            });*/


               // Initialize the SortableJS with the gallery element
            const gallery = document.getElementById('gallery');
        if (!gallery) {
            console.error("Gallery element not found.");
            return;
        }
        let sortable = new Sortable(gallery, {
              animation: 150,
              disabled: true, // initially disable dragging
            });

            const toggleReorderBtn = document.getElementById('toggleReorder');
            const saveOrderBtn = document.getElementById('saveOrder');
            const cancelOrderBtn = document.getElementById('cancelOrder');

            let initialOrder = Array.from(gallery.children).map((item) => item.innerHTML);

            toggleReorderBtn.addEventListener('click', () => {
              sortable.option('disabled', false); // Enable dragging
              toggleReorderBtn.style.display = 'none';
              saveOrderBtn.style.display = 'inline';
                cancelOrderBtn.style.display = 'inline';
                isreordering = true;
            });

            saveOrderBtn.addEventListener('click', () => {
              sortable.option('disabled', true); // Disable dragging
              toggleReorderBtn.style.display = 'inline';
              saveOrderBtn.style.display = 'none';
                cancelOrderBtn.style.display = 'none';
                isreordering = false;


                $.post('/Controls/WFItemImageHandler.ashx?siteID=<%=site.ID%>&mode=ORDERUPDATE&ItemID=<%=id%>&itemType=Admission_Item', { order: Array.from(gallery.children).map((item) => item.id) }, function () {
                    
                });

            });

            cancelOrderBtn.addEventListener('click', () => {
              sortable.option('disabled', true); // Disable dragging
              toggleReorderBtn.style.display = 'inline';
              saveOrderBtn.style.display = 'none';
              cancelOrderBtn.style.display = 'none';
                isreordering = false;
              // Reset to the initial order
              gallery.innerHTML = '';
              initialOrder.forEach((content) => {
                const item = document.createElement('div');
                item.className = 'item';
                item.innerHTML = content;
                gallery.appendChild(item);
              });

              // Re-initialize sortable to apply to the restored order
              sortable = new Sortable(gallery, {
                animation: 150,
                  disabled: true,
                
              });
            });
        });
    </script>

                <h3>Admission Item</h3>
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
               
                 <div class="form-group">
                      <label for="<%=txtName.ClientID %>">Name</label><asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                     <label for="<%=cboStatus.ClientID %>">Status</label>
                     <asp:DropDownList runat="server" ID="cboStatus" CssClass="form-control"></asp:DropDownList>
                     
                </div>
             

      

        <!-- Nav tabs -->
    <ul class="nav nav-tabs">
        <li class="active"><a href="#description" data-toggle="tab">Description</a></li>
        <li><a href="#pictures" data-toggle="tab">Images</a></li>
        <li><a href="#availability" data-toggle="tab">Availability</a></li>   
        <li><a href="#pricing" data-toggle="tab">Pricing</a></li>   
        <li><a href="#blackoutdates" data-toggle="tab">Blackout Dates</a></li>   
        <li><a href="#waivers" data-toggle="tab">Waivers</a></li>   
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
        <div id="description" class="tab-pane fade in active">

             <telerik:RadEditor id="reDescription"  Skin="Bootstrap"
         width="100%" height="440px" runat="server" enableresize="True" allowscripts="True"
         toolsfile="/wp-content/Plugins/WaiverFile/Docs/WaiverBookingToolsSimple.xml" 
          
         imagemanager-viewpaths="/images"  
         imagemanager-uploadpaths="/images">
         <documentmanager viewpaths="/documents" uploadpaths="/documents" deletepaths="/documents" />
             </telerik:RadEditor>


        </div>
        <div id="pictures" class="tab-pane fade">
           <!-- begin pictures tab -->

            
    <div class="row">
        <div class="col-sm-8">

            <div class="row">
                <div class="col-xs-12">
                     <h3 class="pull-left" style="margin:0 0 15px;">Images</h3>
                        <div style=" " class="pull-right">
                <a href="javascript:void(0);" id="toggleReorder" role="button" class="btn btn-default btn-sm"><i class="fa fa-arrows"></i> Reorder Items</a>
        <a href="javascript:void(0);"  id="saveOrder" style="display: none;" role="button" class="btn btn-primary btn-sm">Save</a>
        <a href="javascript:void(0);"  id="cancelOrder" style="display: none;" role="button" class="btn btn-muted btn-sm">Cancel</a>
</div>

                    

                   </div>
            </div>
              <div class="row">
      <div class="col-xs-12">
            <div id="gallery" class="grid">
                    <asp:PlaceHolder runat="server" ID="phGalleryItems"></asp:PlaceHolder>
                  </div>
      </div>
  </div>
              
                  

                     
                 
                




                <div id="err" class="WPERR_error" style="display:none"></div>
                <div id="savesuccess" class="WPERR_Success" style="display:none">Changes saved successfully.</div>
                <div class="clear"></div>
                <div id="dragdirections" class="WPERR_Information hidden">Drag images to reorder. Click Save Changes below when finished. </div>
                    <ul id="gm" class="gm">
	                    <asp:PlaceHolder ID="ph0" runat="server"/>
                    </ul>


                <div class="clear"></div>
                <div id="savebuttons" style="margin:5px; display:none;"><input id="btnSave" class="btn btn-primary" type="button" value="Save Changes" onclick="postform()" /> <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-default" /></div>


        </div>
        <div class=" col-sm-4">

            <h3 style="margin-top:0;">Add Images</h3>
                    <div id="processing" style="display:none;">
                            <img src="/wp-content/images/processing.gif" alt="Processing images" /><br />
                            Processing images. Please wait...
                        </div>
                        <div id="uploaderwrap">
        
                <div id="dropzone" class="fade well">Drag image files here</div>
                    <!-- The global progress bar -->
                    <div id="progress" class="progress" style="display:none;">
                        <div class="progress-bar progress-bar-success"></div>
                    </div>
                    <!-- The container for the uploaded files -->
                    <div id="files" class="files"></div>


                  <span class="btn btn-success fileinput-button">
                        <i class="glyphicon glyphicon-plus"></i>
                        <span>Select image files...</span>
                        <!-- The file input field used as target for the file upload widget -->
                        <input id="fileupload" type="file" name="files[]" multiple="multiple"/>
                    </span>


                        

                            </div>

        </div>
    </div>

     
    
            <!-- end pictures tab -->
        </div>
          <div id="availability" class="tab-pane fade">
              <!-- begin availability tab -->
                    <asp:PlaceHolder runat="server" ID="phAvailabilitySchedules"></asp:PlaceHolder>
              <!-- end availability tab -->
              </div>
          <div id="pricing" class="tab-pane fade">
              <!-- begin pricing tab -->
              <asp:PlaceHolder runat="server" ID="phPricingGrid"></asp:PlaceHolder>
              <!-- end pricing tab -->
           </div>
           <div id="blackoutdates" class="tab-pane fade">
                <!-- begin blackoutdates tab -->
               

                            <div class="form-group"><h4>Blackout Dates <asp:Button runat="server" ID="btnAddBlackoutDate" CssClass="btn btn-default btn-sm" OnClick="btnAddBlackoutDate_Click" Text="Add" /> </h4></div>
  <div class="form-group">
<telerik:RadGrid ID="RadGrid2" runat="server" Skin="Bootstrap" AutoGenerateColumns="False" OnItemDataBound="RadGrid2_ItemDataBound" OnItemCommand="RadGrid2_ItemCommand" OnDeleteCommand="RadGrid2_DeleteCommand" DataSourceID="SqlDataSource2" AllowFilteringByColumn="false" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource2" DataKeyNames="ID">
        
        <Columns>

                         <telerik:GridBoundColumn DataField="startDate" FilterControlAltText="Filter StartDate column" HeaderText="Start" SortExpression="startDate" UniqueName="startDate"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="endDate" FilterControlAltText="Filter EndDate column" HeaderText="End" SortExpression="endDate" UniqueName="endDate"></telerik:GridBoundColumn>

                         
                         
                        <telerik:GridButtonColumn CommandName="EDIT"  FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="editcol"></telerik:GridButtonColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>

      </div>

                <!-- end blackoutdates tab -->
           </div>

        <script>
            function showHideFormSelections() {
                
                var hideGrid = true;

                if ($("#<%= rbWaiverForm.ClientID %>").is(":checked")) {
                    $("#<%=cboWaiverForm.ClientID%>").prop("disabled", false);
                }
                else if ($("#<%= rbMultipleWaiverForms.ClientID %>").is(":checked")) {
                    hideGrid = false;
                }
                

                if(hideGrid == true) {
                    $('#gridWrap').hide();
                    $('#btnAddForm').hide();
                } else {
                    $('#gridWrap').show();
                    $('#btnAddForm').show();
                }

            }
            $(function () {
                showHideFormSelections();
                $("#<%= rbWaiverForm.ClientID %>").on("change", showHideFormSelections);
                $("#<%= rbMultipleWaiverForms.ClientID %>").on("change", showHideFormSelections);
               
            });
        </script>

         <div id="waivers" class="tab-pane fade">
    <!-- begin waivers tab -->

             <p>
                 Attach a waiver forms to this admission item. After booking, customers will be required to complete the forms that you attach here.
                 
             </p>
             <div class="form-group">
                 <label><asp:RadioButton runat="server" GroupName="waiverworkflow" ID="rbWaiverForm" Checked="true" /> Single Waiver Form</label>
                 <asp:DropDownList runat="server" ID="cboWaiverForm" CssClass="form-control"></asp:DropDownList>
             </div>
             <div class="form-group">
                <label><asp:RadioButton runat="server" GroupName="waiverworkflow" ID="rbMultipleWaiverForms" Checked="true" /> Multiple Waiver Forms
                                         <a href="javascript:void(0);" 
   id="btnAddForm" 
   class="btn btn-primary btn-sm">
   <i class="fa fa-files-o"></i> Add Forms
</a>

                </label>
                
                 <div id="divWaivers">
                                             <asp:PlaceHolder runat="server" ID="phErrGridForms"></asp:PlaceHolder>

   


                     
                     <div id="gridWrap">

                               <telerik:RadGrid ID="gridForms" Skin="Bootstrap" runat="server" AutoGenerateColumns="False" OnRowDrop="gridForms_RowDrop" OnItemCommand="gridForms_ItemCommand" OnItemDataBound="gridForms_ItemDataBound"
                                    DataSourceID="sdsForms" CellSpacing="-1" GridLines="Both">
                            <MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">
                                <Columns>
                                      <telerik:GridDragDropColumn HeaderStyle-Width="18px" Visible="true">
                            <HeaderStyle Width="18px"></HeaderStyle>
                                                        </telerik:GridDragDropColumn>

                                     
                                   
                                      <telerik:GridBoundColumn DataField="Name" 
                                        FilterControlAltText="Filter Name column" HeaderText="Form Name" 
                                        SortExpression="Name" UniqueName="Name">
                                    </telerik:GridBoundColumn>

                                       <telerik:GridBoundColumn DataField="SIGNOPTION" 
                                        FilterControlAltText="Filter Adult-Child Mode column" HeaderText="Adult-Child Mode" 
                                        SortExpression="SIGNOPTION" UniqueName="SIGNOPTION">
                                    </telerik:GridBoundColumn>
                                  
                                    <telerik:GridButtonColumn CommandName="SWAPREQUIRED"  DataTextField="requiredText"
                                        FilterControlAltText="Filter Required column" HeaderText="Required" Text="Required" 
                                        UniqueName="RequiredCol">
                                    </telerik:GridButtonColumn>

                                    
                                    <telerik:GridButtonColumn CommandName="DELETE" 
                                        FilterControlAltText="Filter column1 column" HeaderText="Remove" Text="Remove" ConfirmText="Are you sure you wish to remove this form?" 
                                        UniqueName="deletecol">
                                    </telerik:GridButtonColumn>
                                </Columns>
                            </MasterTableView>
                                <ClientSettings AllowRowsDragDrop="True">
                                      <Selecting AllowRowSelect="True" EnableDragToSelectRows="false"></Selecting>
                                </ClientSettings>
                            </telerik:RadGrid>

                        <asp:SqlDataSource ID="sdsForms" runat="server" SelectCommand=""   ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>">
                            <SelectParameters>
                                <asp:Parameter Name="siteid" />
                                <asp:Parameter Name="stepid" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                          </div>             
                     
                 </div>

            </div>
            

             <!-- begin waivers tab -->
             </div>

    </div>

                
                     
               
      



<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFBlackoutDate b inner join tblWFBlackoutDateAdmissionItem s on s.blackoutID=b.id where admissionItemID=@admissionItemID and status=@activeStatus">
                  </asp:SqlDataSource>
                         


            
               
    


           

        <div class="form-group">


               
               <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary btn-lg" Text="Save" onclick="btnSave_Click" />

            </div>

            



    
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="/wp-admin/Scripts/jqueryupload/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="/wp-admin/Scripts/jqueryupload/jquery.fileupload.js"></script>
<!-- The File Upload processing plugin -->
<script src="/wp-admin/Scripts/jqueryupload/jquery.fileupload-process.js"></script>

<!-- The File Upload audio preview plugin -->
<script src="/wp-admin/Scripts/jqueryupload/jquery.fileupload-audio.js"></script>
<!-- The File Upload video preview plugin -->
<script src="/wp-admin/Scripts/jqueryupload/jquery.fileupload-video.js"></script>
<!-- The File Upload validation plugin -->
<script src="/wp-admin/Scripts/jqueryupload/jquery.fileupload-validate.js"></script>

<script>

    /*jslint unparam: true, regexp: true */
    /*global window, $ */
    $(function () {
        'use strict';
        // Define the server-side upload handler URL
        var url = '/Controls/WFItemImageHandler.ashx?siteID=<%=site.ID%>&mode=UPLOAD&ItemID=<%=id%>&itemType=Admission_Item';

        $('#btnAddForm').click(function (e) {
            e.preventDefault();
            $('#dlgAddForm').modal('show');
            $('#<%= rbMultipleWaiverForms.ClientID %>').prop('checked', true);
        });
       $('#fileupload').fileupload({
           url: url,
           dataType: 'json',
           autoUpload: true,
           acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
           maxFileSize: <%= Waypoint.Core.MiscUtils.GetMaxRequestLength() * 1024 %>,
        previewMaxWidth: 100,
        previewMaxHeight: 100,
        previewCrop: true,
        dropZone: $('#dropzone')
    }).on('fileuploadadd', function (e, data) {
        // Append each file to the file list
        data.context = $('<div/>').appendTo('#files');
        $.each(data.files, function (index, file) {
            var node = $('<p/>').append($('<span/>').text(file.name));
            node.appendTo(data.context);
        });
    }).on('fileuploadprocessalways', function (e, data) {
        var index = data.index,
            file = data.files[index],
            node = $(data.context.children()[index]);

        // Add preview and error messages if applicable
        if (file.preview) {
            node.prepend('<br>').prepend(file.preview);
        }
        if (file.error) {
            node.append('<br>').append($('<span class="text-danger"/>').text(file.error));
        }
        if (index + 1 === data.files.length) {
            data.context.find('button').text('Upload').prop('disabled', !!data.files.error);
        }
    }).on('fileuploadprogressall', function (e, data) {
        $('#progress').show(); // Show progress bar during upload
        var progress = parseInt(data.loaded / data.total * 100, 10);
        $('#progress .progress-bar').css('width', progress + '%');

        // Show the processing spinner when progress reaches 100%
        if (progress === 100) {
            $('#uploaderwrap').hide();
            $('#processing').show();
        }
    }).on('fileuploaddone', function (e, data) {
        

        // Clear the file list and hide the progress bar after upload is done
        $('#files').empty();
        $('#progress').hide();
        $('#processing').hide();
    }).on('fileuploadfail', function (e, data) {
        $.each(data.files, function (index) {
            var error = $('<span class="text-danger"/>').text('File upload failed.');
            $(data.context.children()[index]).append('<br>').append(error);
        });
    }).on('fileuploadstop', function (e, data) {
        // Hide progress bar and clear file list after upload stop
        $('#progress').hide();
        $('#files').empty();
        UploadComplete();
    }).prop('disabled', !$.support.fileInput).parent().addClass($.support.fileInput ? undefined : 'disabled');
});

// Trigger input file click on drop zone click
$("#dropzone").on("click", function () {
    $("#fileupload").trigger('click');
});

// Drag and drop hover behavior
$(document).bind('dragover', function (e) {
    var dropZone = $('#dropzone'),
        timeout = window.dropZoneTimeout;
    if (!timeout) {
        dropZone.addClass('in');
    } else {
        clearTimeout(timeout);
    }
    var found = false,
        node = e.target;
    do {
        if (node === dropZone[0]) {
            found = true;
            break;
        }
        node = node.parentNode;
    } while (node != null);
    if (found) {
        dropZone.addClass('hover');
    } else {
        dropZone.removeClass('hover');
    }
    window.dropZoneTimeout = setTimeout(function () {
        window.dropZoneTimeout = null;
        dropZone.removeClass('in hover');
    }, 100);
});

    function UploadComplete() {
    $('#progress').hide();
    $('#uploaderwrap').show();
    $('#processing').hide(); // Ensure processing spinner is hidden

    // Optionally reload the gallery or perform other actions after upload
        $.get('/Controls/WFItemImageHandler.ashx?siteID=<%=site.ID%>&mode=GETIMAGES&ItemID=<%=id%>&itemType=Admission_Item', {}, function (data) {
        if (data) {
                $('#gallery').html(data);
            setupItemClickHandling();
        }
        });
    }

    $(function () {
        $('.btncheckall').click(function () {
            $('#<%=cblFormSelections.ClientID%> input[type="checkbox"]').each(function () {
                  $(this).prop('checked', true);
              });
          });
        $('.btnchecknone').click(function () {
            $('#<%=cblFormSelections.ClientID%> input[type="checkbox"]').each(function () {
          $(this).prop('checked', false);
      });
        });

        // record last shown tab into hidden field
        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            var href = $(e.target).attr('href');   // e.g. "#waivers"
            var paneId = href ? href.substring(1) : '';
            $('#<%= hfActiveTab.ClientID %>').val(paneId);
              });

              // activate server-specified tab (from code-behind tabOnLoad or hidden field)
              var tabId = '<%= string.IsNullOrEmpty(tabOnLoad) ? "" : tabOnLoad %>';
        if (tabId) {
            var $trigger = $('a[data-toggle="tab"][href="#' + tabId + '"]');
            if ($trigger.length) {
                $trigger.tab('show');
            }
        } else if ($('#<%= hfActiveTab.ClientID %>').val() != '') {
            tabId = $('#<%= hfActiveTab.ClientID %>').val();
            var $trigger = $('a[data-toggle="tab"][href="#' + tabId + '"]');
            if ($trigger.length) {
                $trigger.tab('show');
            }
        } else {
                  // optional default to first tab
                  var $first = $('a[data-toggle="tab"]').first();
                  if ($first.length) $first.tab('show');
              }
          });    
 
</script>



        <div class="modal fade" id="dlgAddForm" tabindex="-1" role="dialog" aria-labelledby="lblDlgAddForm">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      
      <!-- Modal Header -->
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title" id="lblDlgAddForm">Add Waiver Forms</h4>
      </div>

      <!-- Modal Body -->
      <div class="modal-body">
        <asp:PlaceHolder runat="server" ID="phErrdlgAddForm"></asp:PlaceHolder>

        <div id="formselections" class="form-group">
          <div class="mb-2">
            <a href="javascript:void(0);" class="btn btn-sm btn-default btncheckall">Check All</a>
            <a href="javascript:void(0);" class="btn btn-sm btn-default btnchecknone">Check None</a>
          </div>
          <div class="checkboxlist">
            <asp:CheckBoxList ID="cblFormSelections" runat="server"></asp:CheckBoxList>
          </div>
        </div>

        <div class="form-group">
          <label class="d-block">Form Required Mode</label>
          <div class="radio-inline">
            <asp:RadioButton ID="rbRequired" runat="server" GroupName="requiredopt" Checked="true" /> Required
          </div>
          <div class="radio-inline">
            <asp:RadioButton ID="rbOptional" runat="server" GroupName="requiredopt" /> Optional
          </div>
        </div>
      </div>

      <!-- Modal Footer -->
      <div class="modal-footer">
        <asp:Button runat="server" ID="btnAddForms" CssClass="btn btn-primary" Text="Add" OnClick="btnAddForms_Click" />
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
      </div>

    </div>
  </div>
</div>


              
<!-- Modal -->
<div class="modal fade" id="viewimage" tabindex="-1" role="dialog" aria-labelledby="notifLabel2">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="notifLabel2">Image</h4>
      </div>
      <div class="modal-body">

          <div id="imgholder"></div>
      

      </div>
        <div class="modal-footer left-align">
            <asp:HiddenField ID="hfImageIDToDelete" runat="server" />
            <div class="pull-left">
            <asp:LinkButton runat="server" ID="btnDelImage" CssClass="btn btn-danger" OnClick="btnDelImage_Click" ><i class="fa fa-times"></i> Delete</asp:LinkButton>
                </div>

            <div class="pull-right">
                <a href="javascript:void(0);" class="btn btn-muted" data-dismiss="modal">Close</a>
                   
            </div>

            
        </div>
    </div>
  </div>
</div>

        </asp:Panel><!-- edit panel -->

</asp:Content>
