<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SetWaiverText.ascx.cs" Inherits="WaiverFile.Controls.SetWaiverText" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


    <h3>Edit Waiver Text</h3>
    <p>Add the text of your waiver below.</p>
    <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

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


 <telerik:RadEditor id="RadEditor1" 
width="840px" height="440px" runat="server" enableresize="True" allowscripts="True" 
toolsfile="/wp-content/Plugins/WaiverFile/Docs/WaiverFileTools.xml" 
spellchecksettings-dictionarypath="/wp-content/Common/radspell/" 
imagemanager-viewpaths="/images"  
imagemanager-uploadpaths="/images">
<documentmanager viewpaths="/documents" uploadpaths="/documents" deletepaths="/documents" />
</telerik:RadEditor>

<p class="help-block">
    To insert boxes for initialing, add the following code: &nbsp; &nbsp; &nbsp; {{INITIAL}}
</p>
   <p><asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" 
           onclick="btnSave_Click" /></p>

           
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

