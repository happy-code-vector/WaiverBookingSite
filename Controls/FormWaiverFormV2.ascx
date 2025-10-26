<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWaiverFormV2.ascx.cs" Inherits="WaiverFile.Controls.FormWaiverFormV2" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register assembly="Waypoint" namespace="Waypoint.Forms" tagprefix="cc1" %>

 <link rel="stylesheet" href="/wp-content/styles/formbuilder/formbuilder.css" />

<style type="text/css">
    .btn-box-tool{ padding:0; }
</style>

  <script type="text/javascript" src="/wp-content/Scripts/vendor.js"></script>
  <script type="text/javascript" src="/wp-content/Scripts/formbuilder.custom.js"></script>


<script type="text/javascript">
    
    var fb;

    function handleQuickForm() {
        var somethingVisible = false;
        if ($('#<%=rbSendForm.ClientID%>').is(':checked')) { $('#divSendForm').show(); somethingVisible = true; } else { $('#divSendForm').hide(); }
        if ($('#<%=rbWebDemo.ClientID%>').is(':checked')) { $('#divWebDemo').show();somethingVisible = true; } else { $('#divWebDemo').hide(); }
        if ($('#<%=rbCallMe.ClientID%>').is(':checked')) { $('#divCallMe').show(); somethingVisible = true;} else { $('#divCallMe').hide(); }
        if ($('#<%=rbEmail.ClientID%>').is(':checked')) { $('#divEmail').show();somethingVisible = true; } else { $('#divEmail').hide(); }
        if (somethingVisible) {
            $('#divSidebarSubmit').show();
        }
    }

    var selectorButtonToClick = '#<%=btnSave2.ClientID %>';

    var saveSuccess = true;
    $(function () {


        $('.btncheckall').click(function () {
            $('#formselections input[type="checkbox"]').each(function () {
                $(this).prop('checked', true);
            });
        });
        $('.btnchecknone').click(function () {
            $('#formselections input[type="checkbox"]').each(function () {
                $(this).prop('checked', false);
            });
        });

        $('.btncheckall2').click(function () {
            $('#formselections2 input[type="checkbox"]').each(function () {
                $(this).prop('checked', true);
            });
        });
        $('.btnchecknone2').click(function () {
            $('#formselections2 input[type="checkbox"]').each(function () {
                $(this).prop('checked', false);
            });
        });


        fb = new Formbuilder({
            selector: '.fb-main',
            bootstrapData: 
              <%=jsonText %>
            
            });

         handleQuickForm();
        $('#<%=rbSendForm.ClientID%>').click(function () { handleQuickForm(); });
        $('#<%=rbWebDemo.ClientID%>').click(function () { handleQuickForm(); });
        $('#<%=rbCallMe.ClientID%>').click(function () { handleQuickForm(); });
        $('#<%=rbEmail.ClientID%>').click(function () { handleQuickForm(); });
        
        fb.on('save', function (payload) {
            //SAVE THE RESULTS. 
            $.post("/Controls/FormDesignerSave.ashx", { siteid: '<%=siteid%>', waiverformid:'<%=id.ToString()%>', data: payload},
                  function (data) {
                      //clear items from controlToUpdate
                      if (data == "SUCCESS") {
                          saveSuccess = true;
                          $(selectorButtonToClick).click();
                          //SAVED.
                      }else{
                          saveSuccess = false;
                          alert(data);
                      }
                  });

        });
        fb.on('formSaved', function (payload) {
            //SAVE THE RESULTS. 
            $.post("/Controls/FormDesignerSave.ashx", { waiverformid:'<%=id.ToString()%>', data: payload},
                  function (data) {
                      //clear items from controlToUpdate
                      if (data == "SUCCESS") {
                          saveSuccess = true;
                           $(selectorButtonToClick).click();
                          //SAVED.
                      }else{
                          saveSuccess = false;
                          alert(data);
                      }
                  });

        });

      

        $('#<%=chkFieldInclude_Email.ClientID%>').change(function () { ensureUnChecked($(this), $('#<%=chkFieldRequire_Email.ClientID%>')); ensureUnChecked($(this), $('#<%=chkEmailVerify.ClientID%>')); ensureUnChecked($(this), $('#<%=chkEmailConfirm.ClientID%>')); });
        $('#<%=chkFieldRequire_Email.ClientID%>').change(function () { ensureChecked($(this), $('#<%=chkFieldInclude_Email.ClientID%>')); });

        
        $('#<%=chkEmailVerify.ClientID%>').change(function () { ensureChecked($(this), $('#<%=chkFieldInclude_Email.ClientID%>')); ensureChecked($(this), $('#<%=chkFieldRequire_Email.ClientID%>')); });
        $('#<%=chkEmailConfirm.ClientID%>').change(function () { ensureChecked($(this), $('#<%=chkFieldInclude_Email.ClientID%>')); ensureChecked($(this), $('#<%=chkFieldRequire_Email.ClientID%>')); });

        $('#<%=chkFieldInclude_Address.ClientID%>').change(function(){ ensureUnChecked($(this), $('#<%=chkFieldRequire_Address.ClientID%>')); });
        $('#<%=chkFieldRequire_Address.ClientID%>').change(function(){ ensureChecked($(this), $('#<%=chkFieldInclude_Address.ClientID%>')); });

        $('#<%=chkFieldInclude_Phone.ClientID%>').change(function(){ ensureUnChecked($(this), $('#<%=chkFieldRequire_Phone.ClientID%>')); });
        $('#<%=chkFieldRequire_Phone.ClientID%>').change(function(){ ensureChecked($(this), $('#<%=chkFieldInclude_Phone.ClientID%>')); });

        $('#<%=chkFieldInclude_DOB.ClientID%>').change(function(){ ensureUnChecked($(this), $('#<%=chkFieldRequire_DOB.ClientID%>')); });
        $('#<%=chkFieldRequire_DOB.ClientID%>').change(function(){ ensureChecked($(this), $('#<%=chkFieldInclude_DOB.ClientID%>')); });

          $('#<%=chkFieldIncludeJoinMailingList.ClientID%>').change(function(){ ensureUnChecked($(this), $('#<%=chkFieldJoinMailingListCheckedByDefault.ClientID%>')); });
        $('#<%=chkFieldJoinMailingListCheckedByDefault.ClientID%>').change(function(){ ensureChecked($(this), $('#<%=chkFieldIncludeJoinMailingList.ClientID%>')); });

           $('#<%=chkIncludeParticipantDOB.ClientID%>').change(function(){ ensureUnChecked($(this), $('#<%=chkRequireParticipantDOB.ClientID%>')); });
        $('#<%=chkRequireParticipantDOB.ClientID%>').change(function(){ ensureChecked($(this), $('#<%=chkIncludeParticipantDOB.ClientID%>')); });


        $('#<%=chkFieldIncludeSMSNumber.ClientID%>').change(function () { ensureUnChecked($(this), $('#<%=chkFieldRequireSMSNumber.ClientID%>')); });
        $('#<%=chkFieldRequireSMSNumber.ClientID%>').change(function () { ensureChecked($(this), $('#<%=chkFieldIncludeSMSNumber.ClientID%>')); });

    });

    function ensureUnChecked(sender, target){
        if(!$(sender).is(':checked') && $(target).is(':checked')){
            $(target).prop('checked', false);
        }
    }
    function ensureChecked(sender, target){
        //SOME CHECKBOXES DEPEND ON OTHERS
        if($(sender).is(':checked') && !$(target).is(':checked')){
            $(target).prop('checked', true);
        }
    }
    function HandleSave() {
        selectorButtonToClick = '#<%=btnSave2.ClientID %>';
        if(fb.mainView.formSaved){
            return true;
        }
        fb.mainView.saveForm.call(fb.mainView);
        return false; 
    }

    function HandleSaveSideBar() {
        selectorButtonToClick = '#<%=btnSubmitEmail2.ClientID %>';
         if(fb.mainView.formSaved){
            return true;
        }
        fb.mainView.saveForm.call(fb.mainView);
        return false; 
    }

    
    function OnClientCommandExecuting(editor, args)
    {    
        var name = args.get_name();    
        var val = args.get_value();    

        if (name == "CODES")    
        {        
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
</style>

<asp:HiddenField runat="server" ID="hfID" />

<div class="row">
    <div class="col-sm-8">

        <h3 runat="server" id="h3Main">Waiver Form Setup</h3>
        <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
               
            <div class="form-group">
                <label for="<%=txtName.ClientID %>">Waiver Form Title</label><asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>


       

        <div class="form-group">
            <label>Enter your Agreement Text</label>
                <div class="pull-right">
                    <asp:CheckBox runat="server" ID="chkAdvancedTools" Text="Show advanced editor tools" AutoPostBack="true" OnCheckedChanged="chkAdvancedTools_CheckedChanged" />
                </div>
            
            <cc1:WPHelpIcon ID="WPHelpIcon2" runat="server" HelpText="Copy and paste your main agreement text here."></cc1:WPHelpIcon>
            </div>

        <telerik:RadEditor id="RadEditor1"  OnClientPasteHtml="OnClientPasteHtml"
        width="100%" height="440px" runat="server" enableresize="True" allowscripts="True" OnClientCommandExecuting="OnClientCommandExecuting" 
        
             toolsfile="/wp-content/Plugins/WaiverFile/Docs/WaiverFileToolsSimple.xml"
        spellchecksettings-dictionarypath="/wp-content/Common/radspell/" 
        imagemanager-viewpaths="/images"  
        imagemanager-uploadpaths="/images">
        <documentmanager viewpaths="/documents" uploadpaths="/documents" deletepaths="/documents" />

            <Tools>
        <telerik:EditorToolGroup>
            <telerik:EditorDropDown Name="CODES" Text="Waiver Tools">
                <telerik:EditorDropDownItem Name="Add Initial Box" Value="{{INITIAL}}" />
                <telerik:EditorDropDownItem Name="Add Initial Box (Optional)" Value="{{INITIAL_OPTIONAL}}" />
                <telerik:EditorDropDownItem Name="Add Initial Box (No adopting)" Value="{{INITIAL_NOADOPT}}" />
                <telerik:EditorDropDownItem Name="Add Signature Box" Value="{{SIGNATURE}}" />
                <telerik:EditorDropDownItem Name="Add Signature Box (Optional)" Value="{{SIGNATURE_OPTIONAL}}" />
                <telerik:EditorDropDownItem Name="Add Signature Box (No adopting)" Value="{{SIGNATURE_NOADOPT}}" />
                <telerik:EditorDropDownItem Name="Add Checkbox, Required" Value="{{CHECKBOX_REQUIRED}}" />
                <telerik:EditorDropDownItem Name="Add Checkbox, Optional" Value="{{CHECKBOX_OPTIONAL}}" />
                <telerik:EditorDropDownItem Name="Add First Name (Signee)" Value="{{FIRST_NAME}}" />
                <telerik:EditorDropDownItem Name="Add Last Name (Signee)" Value="{{LAST_NAME}}" />
                <telerik:EditorDropDownItem Name="Add Email Address" Value="{{EMAIL}}" />
                <telerik:EditorDropDownItem Name="Add Date, short format" Value="{{DATE}}" />
                <telerik:EditorDropDownItem Name="Add Date, long format" Value="{{DATE_LONG}}" />
                <telerik:EditorDropDownItem Name="Add Address" Value="{{ADDRESS}}" />
                <telerik:EditorDropDownItem Name="Add Phone" Value="{{PHONE}}" />
                <telerik:EditorDropDownItem Name="Add Event Name" Value="{{EVENT_NAME}}" />
                <telerik:EditorDropDownItem Name="Add Event Date" Value="{{EVENT_DATE}}" />
                <telerik:EditorDropDownItem Name="Add Participant Names" Value="{{PARTICIPANT_NAMES}}" />
                <telerik:EditorDropDownItem Name="Add Participant 1 First Name" Value="{{PART_1_FIRST}}" />
                <telerik:EditorDropDownItem Name="Add Participant 1 Last Name" Value="{{PART_1_LAST}}" />
                <telerik:EditorDropDownItem Name="Add Participant 2 First Name" Value="{{PART_2_FIRST}}" />
                <telerik:EditorDropDownItem Name="Add Participant 2 Last Name" Value="{{PART_2_LAST}}" />
                <telerik:EditorDropDownItem Name="Add Participant 3 First Name" Value="{{PART_3_FIRST}}" />
                <telerik:EditorDropDownItem Name="Add Participant 3 Last Name" Value="{{PART_3_LAST}}" />
                <telerik:EditorDropDownItem Name="Add Participant 4 First Name" Value="{{PART_4_FIRST}}" />
                <telerik:EditorDropDownItem Name="Add Participant 4 Last Name" Value="{{PART_4_LAST}}" />
                <telerik:EditorDropDownItem Name="Add Participant 5 First Name" Value="{{PART_5_FIRST}}" />
                <telerik:EditorDropDownItem Name="Add Participant 5 Last Name" Value="{{PART_5_LAST}}" />

            </telerik:EditorDropDown>
        </telerik:EditorToolGroup>
    </Tools>


        </telerik:RadEditor>
        

        <p> </p>
       
        <div class="panel with-nav-tabs panel-default">
            <div class="panel-heading">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a data-toggle="tab" href="#tab_standard">Standard Fields</a></li>
                    <li><a data-toggle="tab" href="#tab_custom">Custom Fields</a></li>
                    <li runat="server" id="tabPhotos"><a data-toggle="tab" href="#tab_photos">Photo Steps</a></li>
                    <li runat="server" id="tabAttachments"><a data-toggle="tab" href="#tab_attachments">Attachments</a></li>
                    <li><a data-toggle="tab" href="#tab_initials">Codes</a></li>
            
                </ul>
            </div>
            <div class="panel-body">
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="tab_standard">

                             
                        


                         <div class="form-group">
                            <label class="col-sm-3 control-label" for="<%=chkSignOption_Adult.ClientID %>">Who can participate? <cc1:WPHelpIcon ID="WPHelpIcon1" runat="server" HelpText="Choose who can participate in this activity. This will help determine if adults can sign for children, and who counts as a participant."></cc1:WPHelpIcon></label><div class="col-sm-9">
                             <asp:CheckBox ID="chkSignOption_Adult" runat="server" Checked="true" /> Adults Only
                            &nbsp;&nbsp;&nbsp; <asp:CheckBox ID="chkSignOption_AdultChildren" runat="server" Checked="true" /> Adults and Children
                            &nbsp;&nbsp;&nbsp; <asp:CheckBox ID="chkSignOption_Children" runat="server" Checked="true" /> Children Only
                            </div>
                        </div> 

        
                        <div class="form-group checkrow">
                            <label class="col-sm-3 control-label" for="<%=chkFieldInclude_Email.ClientID %>">Name <cc1:WPHelpIcon ID="WPHelpIcon3" runat="server" HelpText="Name must always be included and required."></cc1:WPHelpIcon></label><div class="col-sm-9"> 
                                <input type="checkbox" id="chkName" disabled="disabled" checked="checked" />
                                Include &nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" id="chkNameRequire" disabled="disabled" checked="checked" />  Require
                
                                                                                                                          </div>
                          </div>
                        <div class="form-group checkrow">
                                      <label class="col-sm-3 control-label" for="<%=chkFieldInclude_Email.ClientID %>">Email</label><div class="col-sm-9"> 
                                          <asp:CheckBox ID="chkFieldInclude_Email" runat="server" Checked="true"></asp:CheckBox> Include &nbsp;&nbsp;&nbsp;&nbsp; <asp:CheckBox ID="chkFieldRequire_Email" runat="server" Checked="true"></asp:CheckBox> Require
                                          &nbsp;&nbsp;&nbsp;&nbsp; Confirm <cc1:WPHelpIcon ID="WPHelpIcon5" runat="server" HelpText="Prompts signee to enter their email address twice to confirm accuracy."></cc1:WPHelpIcon> <asp:CheckBox ID="chkEmailConfirm" runat="server" Checked="false"></asp:CheckBox> 
                                          &nbsp;&nbsp;&nbsp;&nbsp; Verify <cc1:WPHelpIcon ID="WPHelpIcon4" runat="server" HelpText="Sends an email to the entered address with a link to verify a real email address."></cc1:WPHelpIcon> <asp:CheckBox ID="chkEmailVerify" runat="server" Checked="false"></asp:CheckBox> 
                                         

                                                                                                                                    </div>
                                </div>
               
                                 <div class="form-group checkrow">
                                      <label class="col-sm-3 control-label" for="<%=chkFieldInclude_Address.ClientID %>">Address</label><div class="col-sm-9"> <asp:CheckBox ID="chkFieldInclude_Address" runat="server" Checked="true"></asp:CheckBox> Include &nbsp;&nbsp;&nbsp;&nbsp; <asp:CheckBox ID="chkFieldRequire_Address" runat="server" Checked="true"></asp:CheckBox> Require</div>
                                </div>
               
                                 <div class="form-group checkrow">
                                      <label class="col-sm-3 control-label" for="<%=chkFieldInclude_Phone.ClientID %>">Phone</label><div class="col-sm-9"> <asp:CheckBox ID="chkFieldInclude_Phone" runat="server" Checked="true"></asp:CheckBox> Include &nbsp;&nbsp;&nbsp;&nbsp; <asp:CheckBox ID="chkFieldRequire_Phone" runat="server" Checked="true"></asp:CheckBox> Require</div>
                                </div>
               
                                 <div class="form-group checkrow">
                                      <label class="col-sm-3 control-label" for="<%=chkFieldInclude_DOB.ClientID %>">Date of Birth</label><div class="col-sm-9"> <asp:CheckBox ID="chkFieldInclude_DOB" runat="server" Checked="true"></asp:CheckBox> Include &nbsp;&nbsp;&nbsp;&nbsp; <asp:CheckBox ID="chkFieldRequire_DOB" runat="server" Checked="true"></asp:CheckBox> Require</div>
                                </div>

                                <div class="form-group checkrow">
                                      <label class="col-sm-3 control-label" for="<%=chkFieldIncludeJoinMailingList.ClientID %>">Join the Mailing List</label>
                                    <div class="col-sm-9"> <asp:CheckBox ID="chkFieldIncludeJoinMailingList" runat="server" Checked="true"></asp:CheckBox> Include &nbsp;&nbsp;&nbsp;&nbsp;  <asp:CheckBox ID="chkFieldJoinMailingListCheckedByDefault" runat="server" Checked="true"></asp:CheckBox>  Check by Default</div>
                                </div>

                        
                                <div class="form-group checkrow">
                                      <label class="col-sm-3 control-label" for="<%=chkFieldIncludeSMSNumber.ClientID %>">Mobile Phone Number  <cc1:WPHelpIcon ID="helpIconMobileNum" runat="server" HelpText="Mobile number is configured to appear on all forms. To set on a form by form basis, go to Text Messaging, Settings."></cc1:WPHelpIcon></label>
                                    <div class="col-sm-9"> <asp:CheckBox ID="chkFieldIncludeSMSNumber" runat="server" Checked="true"></asp:CheckBox> Include &nbsp;&nbsp;&nbsp;&nbsp;  <asp:CheckBox ID="chkFieldRequireSMSNumber" runat="server" Checked="true"></asp:CheckBox> Require

                                     

                                    </div>
                                </div>

                        <asp:Panel runat="server" ID="pnlMobileOptIn">
                                <div class="form-group checkrow">
                                      <label class="col-sm-3 control-label" for="<%=cboOptInConfig.ClientID %>">Opt-In Configuration</label>
                                    <div class="col-sm-9 form-inline"> <asp:DropDownList runat="server" ID="cboOptInConfig" CssClass="form-control input-sm"></asp:DropDownList></div>
                                </div>
                            </asp:Panel>
                        
                         <div class="form-group checkrow" style="padding-left:30px;">
                             <asp:Label runat="server" ID="lblSMSInfo"></asp:Label>
                         </div>

                        <div class="form-group checkrow">
                        <label class="col-sm-3 control-label" for="<%=chkIncludeParticipantDOB.ClientID %>">Participant Date of Birth</label>
                            <div class="col-sm-9"> <asp:CheckBox ID="chkIncludeParticipantDOB" runat="server" /> Include &nbsp;&nbsp;&nbsp;&nbsp; 
                               <asp:CheckBox ID="chkRequireParticipantDOB" runat="server" />  Require</div>
                        </div>


                               


                    </div>
                    <div class="tab-pane fade" id="tab_custom">
                        <div class='fb-main'></div>
                    </div>
                    <div class="tab-pane fade" id="tab_photos">

                        <asp:Panel ID="pnlPhotoNone" runat="server">
                            <p>The WaiverFile mobile app allows for capturing photos while collecting waivers. <asp:LinkButton runat="server" ID="btnSaveAndGoToPhotoSteps2" Text="Save this form and setup photos." OnClick="btnSaveAndGoToPhotoSteps_Click"></asp:LinkButton></p>
                        </asp:Panel>
                        <asp:Panel ID="pnlPhotoMain" runat="server">
                              <p>Select the photo steps that this form should include. <asp:LinkButton runat="server" ID="btnSaveAndGoToPhotoSteps" Text="Save and go to photo step setup page." OnClick="btnSaveAndGoToPhotoSteps_Click"></asp:LinkButton></p>
                         
                        <div id="formselections" class="form-group">
                            <div><a href="javascript:void(0);" class="btn btn-sm btn-default btncheckall">Check All</a> <a href="javascript:void(0);" class="btn btn-sm  btn-default btnchecknone">Check None</a></div>
                        <div class="checkboxlist">
                        <asp:CheckBoxList runat="server" ID="cblPhotoSteps"></asp:CheckBoxList>
                             </div>
                            </div>
                        </asp:Panel>

                      
                    </div>

                     <div class="tab-pane fade" id="tab_attachments">

                        <asp:Panel ID="pnlAttachmentNone" runat="server">
                            <p>Signees can upload attachments to their waiver when signing via the web. <asp:LinkButton runat="server" ID="btnSaveAndGoToAttachments" Text="Save this form and setup attachments." OnClick="btnSaveAndGoToAttachments_Click"></asp:LinkButton></p>
                        </asp:Panel>
                        <asp:Panel ID="pnlAttachmentMain" runat="server">
                              <p>Select the attachment prompts that this form should include. <asp:LinkButton runat="server" ID="btnSaveAndGoToAttachments2" Text="Save and go to attachment setup page." OnClick="btnSaveAndGoToAttachments_Click"></asp:LinkButton></p>
                         
                        <div id="formselections2" class="form-group">
                            <div><a href="javascript:void(0);" class="btn btn-sm btn-default btncheckall2">Check All</a> <a href="javascript:void(0);" class="btn btn-sm  btn-default btnchecknone2">Check None</a></div>
                        <div class="checkboxlist">
                        <asp:CheckBoxList runat="server" ID="cblAttachmentSteps"></asp:CheckBoxList>
                             </div>
                            </div>
                        </asp:Panel>

                      
                    </div>

                    
                    
                    <div class="tab-pane fade" id="tab_initials">
                        <p>
                            To place additional elements, including initial boxes, additional signatures, etc., add the codes below to your agreement text. 
                        </p>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Code</th>
                                    <th>Description</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>{{INITIAL}}</td>
                                    <td>Adds a box for the signee to initial</td>
                                </tr>
                                 <tr>
                                    <td>{{INITIAL_OPTIONAL}}</td>
                                    <td>Adds a box for the signee to initial (optional)</td>
                                </tr>
                                 <tr>
                                    <td>{{INITIAL_NOADOPT}}</td>
                                    <td>Adds a box for the signee to initial (disallows adopted initials)</td>
                                </tr>
                                 <tr>
                                    <td>{{SIGNATURE}}</td>
                                    <td>Adds an extra signature box within the form itself</td>
                                </tr>
                                 <tr>
                                    <td>{{SIGNATURE_OPTIONAL}}</td>
                                    <td>Adds an extra signature box within the form itself that is optional</td>
                                </tr>
                                 <tr>
                                    <td>{{SIGNATURE_NOADOPT}}</td>
                                    <td>Adds an extra signature box within the form itself that is optional (disallows adopted signature)</td>
                                </tr>
                                <tr>
                                    <td>{{CHECKBOX_REQUIRED}}</td>
                                    <td>Adds a checkbox that must be checked in order to submit the form</td>
                                </tr>
                                <tr>
                                    <td>{{CHECKBOX_OPTIONAL}}</td>
                                    <td>Adds an optional checkbox</td>
                                </tr>
                               
                                <tr>
                                    <td colspan="2"><strong>Display Fields</strong><br />
                                        The following fields will be displayed in-line within your document. Entry for them happens below the agreement text on the signing screen to make for easier completion on mobile devices. </td>
                                </tr>
                               
                                <tr>
                                    <td>{{FIRST_NAME}}</td>
                                    <td>First name of the signee</td>
                                </tr>
                               
                                <tr>
                                    <td>{{LAST_NAME}}</td>
                                    <td>Last name of the signee</td>
                                </tr>
                                <tr>
                                    <td>{{EMAIL}}</td>
                                    <td>Email address</td>
                                </tr>
                                <tr>
                                    <td>{{DATE}}</td>
                                    <td>Date signed, displayed in the date format specified in your account settings. E.g. MM/DD/YYYY or DD/MM/YYYY</td>
                                </tr>
                                <tr>
                                    <td>{{DATE_LONG}}</td>
                                    <td>Date signed, long date format. E.g. Thursday, November 7, 2019</td>
                                </tr>
                                 <tr>
                                    <td>{{ADDRESS}}</td>
                                    <td>Complete address, including city, state and postal code. </td>
                                </tr>
                                <tr>
                                    <td>{{PHONE}}</td>
                                    <td>Phone number</td>
                                </tr>

                                <tr>
                                    <td>{{EVENT_NAME}}</td>
                                    <td>Event Name</td>
                                </tr>
                                 <tr>
                                    <td>{{EVENT_LOCATION}}</td>
                                    <td>Event Location</td>
                                </tr>
                                <tr>
                                    <td>{{EVENT_DATE}}</td>
                                    <td>Event Date/time</td>
                                </tr>


                            
                            <tr>
                                <td>{{WORKFLOW_STEP_NAME}}</td>
                                <td>Workflow Step</td>
                            </tr>
                                      <tr>
                                <td>{{WORKFLOW_PATH}}</td>
                                <td>Workflow Path</td>
                            </tr>

                                
                            
                                
                                 <tr>
                                <td>{{PARTICIPANT_NAMES}}</td>
                                <td>Participant names, separated by commas</td>
                            </tr>
                            <tr>
                                <td>{{PART_1_FIRST}}</td>
                                <td>Participant first name. Swap with numbers 1-5 to use for multiple participants</td>
                            </tr>
                            <tr>
                                <td>{{PART_1_LAST}}</td>
                                <td>Participant last name. Swap with numbers 1-5 to use for multiple participants</td>
                            </tr>

                                  <tr>
                                    <td colspan="2"><strong>Custom Fields</strong><br />
                                        Custom field names can also be added by using codes with the following naming convention. </td>
                                </tr>
                                

                                 <tr>
                                <td>{{CUSTOM:Field Name Here}}</td>
                                <td>Custom field. Use the exact field name as it appears on your form. Case sensitive.</td>
                            </tr>
                                 <tr>
                                <td>{{PART_CUSTOM_N:Field Name Here}}</td>
                                <td>Custom participant field. Replace "N" with the number of the participant, beginning from 1. Use the exact field name as it appears on your form. Case sensitive.</td>
                            </tr>

                            </tbody>
                        </table>
                        
                    </div>
                    
            
                </div>
            </div>
        </div>




      

      <div class="row">
          
          <div class="col-md-3 col-sm-6 col-md-offset-4 col-sm-offset-3">
              <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary btn-block" Text="Save" OnClientClick="return HandleSave()" OnClick="btnSave_Click" />
              <div style="display:none;"><asp:Button ID="btnSave2" runat="server" CssClass="btn btn-primary" Text="Save 2" OnClick="btnSave_Click" /></div>
          </div>
      </div>
    

      



        


    </div>
    <div class="col-sm-4" style="padding-top:75px;">
        <!-- sidebar -->
        <div id="alertFields" class="alert alert-info alert-dismissible" role="alert" style="display:none;">
              <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <strong>Heads up!</strong> It looks like you pasted in some form fields. These won't be fillable, and should be deleted from your agreement text and set up as questions using the form field options below the editor. If you need assistance, feel free to use one of the quick support options below.
            </div>

        
<asp:PlaceHolder ID="phSidebarErr" runat="server"></asp:PlaceHolder>
        
        <div id="aboutwaivertools" class="well" style="display:none;">
            <h4>About Waiver Tools</h4>
            <p>Adding elements listed in Waiver Tools will insert codes such as {{INITIAL}}.</p>
            <p><strong>Initial/Signature</strong><br />These will add initialing and signature boxes.</p>
            <p><strong>Other Fields</strong><br />These codes let you customize your agreement text for each person. The values will be filled in based on what the signee enters in the form below, or which event they select. </p>
            <p><strong>Checkboxes</strong><br />Add checkboxes that can be required or optional. </p>
        </div>

<asp:Panel ID="pnlSupport" runat="server">
<div class="well">
            <h4>Need Help?</h4>
            <p>We can help you get your form set up. </p>
            
            
    <div id="divOptions">
    <p>
        <asp:RadioButton runat="server" ID="rbSendForm" GroupName="rbSupportOption" /> I'd like to send you my form
    </p>
    <p>
        <asp:RadioButton runat="server" ID="rbWebDemo" GroupName="rbSupportOption" /> I'm interested in a Web Demo
    </p>
    <p>
        <asp:RadioButton runat="server" ID="rbCallMe" GroupName="rbSupportOption" /> I'd like someone to call me
    </p>
    <p>
        <asp:RadioButton runat="server" ID="rbEmail" GroupName="rbSupportOption" /> I'd like to email you
    </p>
   </div>

    <div id="divSendForm">
         <hr />
        <h4>Send us your form</h4>
        <p>We can help configure your form. Use the browse button below to upload a copy of your waiver, ideally in Word or PDF format. We'll work on configuring it and send you a notice once it is ready for review.</p>
        <p>
            <label>Upload your Waiver</label>
        </p>
        <p>
            <asp:FileUpload ID="fileWaiver" runat="server" />
        </p>
        <p>
            <label>Comments/Questions</label>
        </p>
        <p>
            <asp:TextBox runat="server" ID="txtUploadComments" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
        </p>
       
    </div>

    <div id="divWebDemo">
         <hr />
        <h4>Schedule a Web Demo</h4>
        <p>Let us know some times that work for you and we'll follow up to schedule a web demo with you!</p>
        <p>
            <asp:TextBox runat="server" ID="txtWebDemoTimes" placeholder="Some times that work for me..." CssClass="form-control"></asp:TextBox>
        </p>
        
    </div>
    <div id="divCallMe">
         <hr />
         <h4>Request a Callback</h4>
        <p>Let us know what number to reach you at and we'll get in touch as soon as we can!</p>
        <p>
            <asp:TextBox runat="server" ID="txtPhone" placeholder="Phone Number" CssClass="form-control"></asp:TextBox>
        </p>
        
    </div>
    <div id="divEmail">
         <hr />
        <h4>Submit request</h4>
        <p>Let us know any questions you have in the box below and we'll follow up as soon as we can!</p>
        <p>
            <asp:TextBox runat="server" ID="txtEmailComments" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
        </p>
        <p>
           


        </p>
    </div>
    
    <div id="divSidebarSubmit" style="display:none;">
        <p>
             <asp:Button ID="btnSubmitEmail" runat="server" CssClass="btn btn-primary" Text="Submit" OnClientClick="return HandleSaveSideBar()" OnClick="btnSubmitEmail_Click" />
              <span style="display:none;"><asp:Button ID="btnSubmitEmail2" runat="server" CssClass="btn btn-primary" Text="Save 2" OnClick="btnSubmitEmail_Click" /></span>
            </p>
        </div>

        </div></asp:Panel>


       
    </div>
</div>

