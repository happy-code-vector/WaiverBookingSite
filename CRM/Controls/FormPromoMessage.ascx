<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormPromoMessage.ascx.cs" Inherits="WaiverFile.CRM.Controls.FormPromoMessage" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
     
       <style type="text/css">
.reToolbar .WaypointImage
{
  background-image: url(/wp-content/Common/images/WaypointImage.gif) !important;
}
.reToolbar .WaypointFile
{
  background-image: url(/wp-content/Common/images/WaypointFile.gif) !important;
}
</style>


 <script type="text/javascript">

     Telerik.Web.UI.Editor.CommandList["WaypointImage"] = function (commandName, editor, args) {
         var elem = editor.getSelectedElement(); //returns the selected element.
         var myCallbackFunction = function (sender, args) {
             //editor.pasteHtml(String.format("<a href={0} target='{1}' class='{2}'>{3}</a> ", args.href, args.target, args.className, args.name))
             editor.pasteHtml(args);
         }
         editor.showExternalDialog('/wp-admin/Dialogs/GalleryItemSelect.aspx', "", 585, 328, myCallbackFunction, null, 'Insert Image From Gallery', true, Telerik.Web.UI.WindowBehaviors.Close + Telerik.Web.UI.WindowBehaviors.Move, false, true);
     };
     Telerik.Web.UI.Editor.CommandList["WaypointFile"] = function (commandName, editor, args) {
         var elem = editor.getSelectedElement(); //returns the selected element.
         var myCallbackFunction = function (sender, args) {
             //editor.pasteHtml(String.format("<a href={0} target='{1}' class='{2}'>{3}</a> ", args.href, args.target, args.className, args.name))
             editor.pasteHtml(args);
         }
         editor.showExternalDialog('/wp-admin/Dialogs/FileLibraryItemSelect.aspx', "", 585, 328, myCallbackFunction, null, 'Insert File From File Library', true, Telerik.Web.UI.WindowBehaviors.Close + Telerik.Web.UI.WindowBehaviors.Move, false, true);
     };

 </script> 
                <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">PromoMessage</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
               
                 <div class="form-group">
                     <label for="<%=cboStatus.ClientID %>">Status</label>
                     <asp:DropDownList ID="cboStatus" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
               <div class="form-group">
                     <label for="<%=cboFilterMode.ClientID %>">Filter Mode</label>
                   <asp:DropDownList ID="cboFilterMode" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
               <div class="form-group">
                     <label for="<%=cboWrapperTemplate.ClientID %>">Wrapper Template</label>
                   <asp:DropDownList ID="cboWrapperTemplate" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
               
                 <div class="form-group">
                      <label for="<%=txtSubject.ClientID %>">Subject</label><asp:TextBox ID="txtSubject" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <telerik:RadEditor id="RadEditor1" 
        width="100%" height="440px" runat="server" enableresize="True" allowscripts="True"  
        toolsfile="/wp-content/Common/WPStandardTools.xml"
        spellchecksettings-dictionarypath="/wp-content/Common/radspell/" 
        imagemanager-viewpaths="/images"  
        imagemanager-uploadpaths="/images">
        <documentmanager viewpaths="/documents" uploadpaths="/documents" deletepaths="/documents" />



        </telerik:RadEditor>
        
               <h4>Codes that can be used:</h4>
                 <pre>
                     {{FIRSTNAME}}<br />
                     {{LASTNAME}}<br />
                     {{EMAIL}}<br />
                     {{URL}} (BaseUrlAbsolute)<br />
                 </pre>


                 </div><!-- /.box-body -->
    <div class="box-footer">
       <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />
    </div>
</div>



            