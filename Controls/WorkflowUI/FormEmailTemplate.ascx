<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormEmailTemplate.ascx.cs" Inherits="WaiverFile.Controls.WorkflowUI.FormEmailTemplate" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


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

    function OnClientCommandExecuting(editor, args) {
        var name = args.get_name();
        var val = args.get_value();

        if (name == "CODES") {
            editor.pasteHtml(val);
            //Cancel the further execution of the command as such a command does not exist in the editor command list        
            args.set_cancel(true);

            $('#aboutwaivertools').fadeIn();
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

           
                <h3>Email Template</h3>
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
           
               
<div class="row">
    <div class="col-sm-7">
            <div class="form-group">
                      <label for="<%=cboAction.ClientID %>">Type</label>
                     <asp:DropDownList runat="server" ID="cboAction" CssClass="form-control" AutoPostBack="true" ></asp:DropDownList>
                </div>

             
         <div class="form-group">
                      <label for="<%=txtName.ClientID %>">Name</label><asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                      <label for="<%=txtSubject.ClientID %>">Subject</label><asp:TextBox ID="txtSubject" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
    </div>
    <div class="col-sm-5">
        <asp:Panel runat="server" ID="pnlCodes">
            <h4>Codes</h4>
            <p>Use the following codes in the subject or message body to fill in corresponding values:</p>
            {{EVENT_NAME}}<br />
            {{EVENT_DATE}}<br />
            {{EVENT_CATEGORY}}<br />
            {{TYPED_MESSAGE}} (Message typed in the box on the invite screen. If the code is not present, any message will be added at the end. <br />

        </asp:Panel>
        <asp:Panel runat="server" ID="pnlCodesWorkflow">
            <h4>Codes</h4>
            <p>Use the following codes in the subject or message body to fill in corresponding values:</p>
            {{NAME}}<br />
            {{DESCRIPTION}}<br />
            {{TITLE}}<br />
            {{TYPED_MESSAGE}} (Message typed in the box on the invite screen. If the code is not present, any message will be added at the end. <br />

        </asp:Panel>
    </div>
</div>
                
                 
      
<asp:Panel runat="server" ID="pnlConfirmationOptions">
       <div class="form-group">
                      <label for="<%=cboWaiverCopyIncludeMode.ClientID %>">Include Waiver Copy in Email</label>
                     <asp:DropDownList runat="server" ID="cboWaiverCopyIncludeMode" CssClass="form-control" ></asp:DropDownList>
                </div>
    <div class="form-group">
                      <asp:CheckBox runat="server" ID="chkAttachPDF" Text="Attach PDF copy of waiver"  />
                </div>

    <div class="form-group">
                      <asp:CheckBox runat="server" ID="chkIncludeSignatures" Text="Include signatures" />
                </div>


</asp:Panel>

<asp:Panel runat="server" ID="pnlConfirmationOptionsComplete">
    <div class="form-group">
                      <asp:CheckBox runat="server" ID="chkAttachZip" Text="Attach ZIP copy of waiver pdf files" />
                </div>

    <div class="form-group">
                      <asp:CheckBox runat="server" ID="chkIncludeSignaturesMultiple" Text="Include Signatures" />
                </div>


</asp:Panel>
               
               
                 <div class="form-group">
                      <label for="<%=RadEditor1.ClientID %>">Message Body</label>
                </div>



                            
        <telerik:RadEditor id="RadEditor1" OnClientPasteHtml="OnClientPasteHtml"  OnClientCommandExecuting="OnClientCommandExecuting" 
        width="100%" height="440px" runat="server" enableresize="True" allowscripts="False" 
        toolsfile="/wp-content/Plugins/WaiverFile/Docs/WaiverFileTools.xml" 
        spellchecksettings-dictionarypath="/wp-content/Common/radspell/" 
        imagemanager-viewpaths="/images"  
        imagemanager-uploadpaths="/images">
        <documentmanager viewpaths="/documents" uploadpaths="/documents" deletepaths="/documents" />

           


        </telerik:RadEditor>

                    <div class="form-group">
                      <asp:CheckBox runat="server" ID="chkMakeDefault" Text="Make this the default template for this type of message" />
                </div>

               
               
               <asp:Button ID="btnSave" runat="server" CssClass="btn btn-default" Text="Save" onclick="btnSave_Click" />
            

            