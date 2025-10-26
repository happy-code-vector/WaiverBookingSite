<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Images.aspx.cs" Inherits="WaiverFile.site.admin.Style.Images" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

     
    <script type="text/javascript">

      $(document).on('change', ':file', function() {
      var input = $(this),
      numFiles = input.get(0).files ? input.get(0).files.length : 1,
      label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
      input.trigger('fileselect', [numFiles, label]);
      });

        $(document).ready(function () {
            $('a[href="#tab<%=_tabToShowOnLoad%>"]').tab('show');

      $(':file').on('fileselect', function(event, numFiles, label) {
      $('#lbl_' +  $(this).data('id').replace(new RegExp('\-', 'g'), '_')).val(label);

      });
      });
    </script>

    <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

    

       
           <ul class="nav nav-tabs help-top-nav">
                <li class="nav nav-tabs nav-active active">
                    <a data-toggle="tab" href="#tab0">Place Images</a></li>
                <li class="nav nav-tabs"><a data-toggle="tab" href="#tab1">Image Library</a></li>
               <li class="nav nav-tabs"><a data-toggle="tab" href="#tab2">Settings</a></li>
            
            </ul>
      

            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab0">
                     <h3>Images</h3>
                        <p>Customize your waiver signing pages by uploading images</p>

                       
                        <asp:PlaceHolder ID="phMain" runat="server"></asp:PlaceHolder>
                </div>
                <div class="tab-pane" id="tab1">
                
                    <div class="row">
                        <div class="col-md-8">
                             <div class="row">
                                <div class="col-xs-12">
                                    <h3>Image Library</h3>
                                </div>
                            </div>
                              <asp:PlaceHolder ID="phGallery" runat="server"></asp:PlaceHolder>
                        </div>
                        <div class="col-md-4">
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

                     
                     
                </div>
                 <div class="tab-pane fade in" id="tab2">
                     <h3>Image Settings</h3>
                        

                     <h4>Screen Saver</h4>
                     <p>When screen saver images are added, the device version of the signing area will display them. Configure the timing here.</p>

                     <div class="form-group">
                         <label for="<%=txtScreenSaverWaitTime.ClientID %>">Wait time (seconds)</label>
                         <asp:TextBox runat="server" ID="txtScreenSaverWaitTime" CssClass="form-control"></asp:TextBox>
                     </div>
                     <p class="help-block">How long to wait before showing screen saver when there is no activity</p>

                      <div class="form-group">
                         <label for="<%=txtScreenSaverWaitTime.ClientID %>">Time between slides (seconds)</label>
                         <asp:TextBox runat="server" ID="txtScreenSaverInterval" CssClass="form-control"></asp:TextBox>
                     </div>
                     <p class="help-block">You can add multiple screen saver images. Choose the amount of time each is shown before transitioning to the next.</p>
                     
                     <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click" />
                </div>
   </div>
      

  
   
    
    
</asp:Content>
