<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="CustomContent.aspx.cs" Inherits="WaiverFile.site.admin.settings.CustomContent" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register assembly="Waypoint" namespace="Waypoint.Forms" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

   
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

    

    
    <h3>Custom Content</h3>
<div class="row">
    <div class="col-sm-6">
        <p>Add HTML code below to customize the style of your web-based signing pages. <br />
                <a href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Help.aspx">Contact us</a> for assistance if you have any questions.
            </p>
    </div>
    <div class="col-sm-6">
        <div class="well">
        <em><strong>Note:</strong> Applies only to web-based signing pages. The WaiverFile mobile app (iOS/Android) will not be affected. <br /></em>
            </div>
    </div>
</div>



    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>

  

    <h3>Header</h3>
    <p>Appears on the top of all pages.</p>
    
    <div class="form-group">
            <asp:RadioButtonList runat="server" ID="rblHeaderMode">
                <asp:ListItem Value="ADD_ON_RIGHT" Selected="True">Add on top right side</asp:ListItem>
                <asp:ListItem Value="REPLACE">Replace header</asp:ListItem>
            </asp:RadioButtonList>
        </div>


                <telerik:RadEditor id="reHeader" 
    width="100%" height="440px" runat="server" enableresize="True" allowscripts="True"
    toolsfile="/wp-content/Plugins/WaiverFile/Docs/WaiverFileTools.xml" 
    spellchecksettings-dictionarypath="/wp-content/Common/radspell/" 
    imagemanager-viewpaths="/images"  
    imagemanager-uploadpaths="/images">
    <documentmanager viewpaths="/documents" uploadpaths="/documents" deletepaths="/documents" />
    </telerik:RadEditor>

   <h3>Footer</h3>
    <div class="form-group">
    <p>Appears on the bottom of all pages</p>
     <asp:RadioButtonList runat="server" ID="rblFooterMode">
         <asp:ListItem Value="ABOVE_WAIVERFILE_LOGO" Selected="True">Add above 'Powered by WaiverFile'</asp:ListItem>
         <asp:ListItem Value="BELOW_WAIVERFILE_LOGO">Add below 'Powered by WaiverFile'</asp:ListItem>
         <asp:ListItem Value="REPLACE">Replace 'Powered by WaiverFile'</asp:ListItem>
     </asp:RadioButtonList>
        </div>
    <div class="form-group">
        <asp:CheckBox runat="server" ID="chkIncludeOnSignaturePage" Text="Include on Signature page" />    <cc1:WPHelpIcon ID="WPHelpIcon1" runat="server" 
            HelpText="We omit the WaiverFile footer on the signature page so that the submit button is the last item and easy to get to. You can choose to omit your footer content on this page for the same reason if you wish.  ">
</cc1:WPHelpIcon>

    </div>
         
                      <telerik:RadEditor id="reFooter" 
width="100%" height="440px" runat="server" enableresize="True" allowscripts="True"
toolsfile="/wp-content/Plugins/WaiverFile/Docs/WaiverFileTools.xml" 
spellchecksettings-dictionarypath="/wp-content/Common/radspell/" 
imagemanager-viewpaths="/images"  
imagemanager-uploadpaths="/images">
<documentmanager viewpaths="/documents" uploadpaths="/documents" deletepaths="/documents" />
</telerik:RadEditor>
           
        

 <h3>Page &lt;head&gt; Tag</h3>
    <p>Appears inside the &lt;head&gt; tag on all pages.</p>

    <div class="hidetools">

                          <telerik:RadEditor id="rePageHead"  EditModes="Html" OnClientLoad="OnEditorLoad"
width="100%" height="440px" runat="server" enableresize="True" allowscripts="True"
 
>
</telerik:RadEditor>
        </div>

    
    <div class="form-group" style="margin-top:15px;">
    <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click" />
        </div>
</asp:Content>
