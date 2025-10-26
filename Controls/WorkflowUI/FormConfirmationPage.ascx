<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormConfirmationPage.ascx.cs" Inherits="WaiverFile.Controls.WorkflowUI.FormConfirmationPage" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register assembly="Waypoint" namespace="Waypoint.Forms" tagprefix="cc1" %>

  <style type="text/css">
.reToolbar .WaiverFileImage
{
  background-image: url(/wp-content/Common/images/WaypointImage.gif) !important;
}
.reToolbar .WaypointFile
{
  background-image: url(/wp-content/Common/images/WaypointFile.gif) !important;
}
</style>

<script type="text/javascript"> 
function OnClientPasteHtml(sender, args) 
{ 
    var commandName = args.get_commandName(); 
    var value = args.get_value(); //this is the pasted content 
    if (commandName == "Paste") 
    { 
        if (value.indexOf('___') != -1) {
            $('#alertFields').fadeIn();
        } else {
            $('#alertFields').fadeOut('close');
        }
     } 
    } 

    Telerik.Web.UI.Editor.CommandList["WaiverFileImage"] = function (commandName, editor, args) {
        var elem = editor.getSelectedElement(); //returns the selected element.
        var myCallbackFunction = function (sender, args) {
            editor.pasteHtml(String.format('<img src="{0}" class="waiverimage" alt="Image" />', args))
        }
        editor.showExternalDialog('/b/<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.Url%>/admin/Dialogs/ImageSelect.aspx', "", 585, 328, myCallbackFunction, null, 'Insert Image', true, Telerik.Web.UI.WindowBehaviors.Close + Telerik.Web.UI.WindowBehaviors.Move, false, true);

         //leaving off here
         //make the handler
         //then look at some styles to control sizing

    };

</script> 

            <div class="form-horizontal" role="form">
                <h3>ConfirmationPage</h3>
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
               
                 <div class="form-group">
                      <label for="<%=txtName.ClientID %>">Name (Not displayed to signees)</label>
                     <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                <div class="form-group">
                      <label for="<%=txtHeading.ClientID %>">Heading</label>
                    <asp:TextBox ID="txtHeading" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                 <div class="form-group">
                      <label for="<%=txtSubheading.ClientID %>">Subheading</label>
                    <asp:TextBox ID="txtSubheading" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                
        <telerik:RadEditor id="RadEditor1"  OnClientPasteHtml="OnClientPasteHtml"
        width="100%" height="440px" runat="server" enableresize="True" allowscripts="True"
        toolsfile="/wp-content/Plugins/WaiverFile/Docs/WaiverFileTools.xml" 
        spellchecksettings-dictionarypath="/wp-content/Common/radspell/" 
        imagemanager-viewpaths="/images"  
        imagemanager-uploadpaths="/images">
        <documentmanager viewpaths="/documents" uploadpaths="/documents" deletepaths="/documents" />

            <Tools>
        <telerik:EditorToolGroup>
            <telerik:EditorDropDown Name="CODES" Text="Elements">
                <telerik:EditorDropDownItem Name="Button: Continue" Value="{{CONTINUE}}" />
                <telerik:EditorDropDownItem Name="Button: Print All" Value="{{BTN_PRINT_ALL}}" />
                <telerik:EditorDropDownItem Name="Button: Email All" Value="{{BTN_EMAIL_ALL}}" />
                <telerik:EditorDropDownItem Name="List of Completed Forms" Value="{{FORMS_LIST}}" />

            </telerik:EditorDropDown>
        </telerik:EditorToolGroup>
    </Tools>


        </telerik:RadEditor>
                
               
               <asp:Button ID="btnSave" runat="server" CssClass="btn btn-default" Text="Save" onclick="btnSave_Click" />
            </div>

            