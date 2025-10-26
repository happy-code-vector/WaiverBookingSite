<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminDialog.Master" AutoEventWireup="true" CodeBehind="ImageSelect.aspx.cs" Inherits="WaiverFile.site.admin.Dialogs.ImageSelect" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     

    <style type="text/css">
        #main-dialog-area{ padding-top:0 !important; }
        .help-top-nav{ margin-left:-15px;margin-right:-15px;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph0" runat="server">
    
       <script type="text/javascript">

           function getRadWindow() {
               if (window.radWindow) {
                   return window.radWindow;
               }
               if (window.frameElement && window.frameElement.radWindow) {
                   return window.frameElement.radWindow;
               }
               return null;
           }

           $(document).on('change', ':file', function () {
               var input = $(this),
                   numFiles = input.get(0).files ? input.get(0).files.length : 1,
                   label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
               input.trigger('fileselect', [numFiles, label]);
           });

           $(document).ready(function () {
               $('.imgselector').click(function () {
                   <% if(Request.QueryString["mode"] == "directsrc"){ %>
                   var imgPath = $(this).data('sourceuri');
                   <% } else { %>
                   var imgPath = '/Controls/GetImg.ashx?ID=' + $(this).data('id');
                   <% } %>
                   getRadWindow().close(imgPath);
               });

               $(':file').on('fileselect', function (event, numFiles, label) {
                   $('#lbl_fileUploadGallery').val(label);
               });

           });


       </script>


     <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

    

       
           <ul class="nav nav-tabs help-top-nav">
                <li class="nav nav-tabs nav-active active">
                    <a data-toggle="tab" href="#tab0">Select</a></li>
                <li class="nav nav-tabs"><a data-toggle="tab" href="#tab1">Upload</a></li>
            
            </ul>
      

            <div class="tab-content">
                <div class="tab-pane fade in  <%if (imagesExist) {  %>active<%} %>" id="tab0">
                        <asp:PlaceHolder ID="phMain" runat="server"></asp:PlaceHolder>
                </div>
                <div class="tab-pane <%if (!imagesExist) {  %>active<%} %>" id="tab1">
                
                       
                            <div class="row">
                                <div class="col-xs-12">
                                    <h3>Add Images</h3>
                                </div>
                            </div>
                            <div class="row">
                                  <div class="col-lg-8">
                                    <div class="input-group">
                                      <label class="input-group-btn">
                                        <span class="btn btn-default">
                                          Browse
                                          <asp:FileUpload ID="fileUpload1" data-id="fileUploadGallery" runat="server" CssClass="fileupload" data-labelid="" style="display:none;"></asp:FileUpload>
                                        </span>
                                      </label>
                                      <input type="text" class="form-control" readonly="readonly" id="lbl_fileUploadGallery"/>
                                    </div>
                                  </div>
                                  <div class="col-lg-4">
                                    <asp:Button data-id="fileUploadGallery" runat="server" CommandName="UPLOAD" Text="Upload" CssClass="btn btn-primary btn-block" OnClick="btnUploadGallery_Click"></asp:Button>
                                  </div>
                                </div>
                        </div>
                
   </div>
      



</asp:Content>
