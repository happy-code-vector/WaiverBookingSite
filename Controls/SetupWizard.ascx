<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SetupWizard.ascx.cs" Inherits="WaiverFile.Controls.SetupWizard" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Waypoint" Namespace="Waypoint.Forms" TagPrefix="cc1" %>
<%@ Register Src="~/Controls/FormBuilder2.ascx" TagPrefix="uc1" TagName="FormBuilder2" %>
<asp:PlaceHolder runat="server" ID="phTop"></asp:PlaceHolder>

<script type="text/javascript">
    function showHideStorageNote() {
        if ($('.cboCapture').find('input:checked').length > 0) {
            $('#pAddon').show();
        }
        else {
            $('#pAddon').hide();
        }
    }
    
    $(function () {
        showHideStorageNote();
        $('.cboCapture').find('input').change(function () {

            showHideStorageNote();
      
        });
    });



   
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
    body{ background-color: #f8f8f8; }
    .login-panel{ margin-top: 10%; }
    .logo{ width: 200px; margin:12px auto 0; display:block; }
    .backbtn{ display:block; margin: -40px 0 0 0; position:absolute;}
    .btn-box-tool{ padding:2px 5px;}
.reToolbar .WaiverFileImage
{
  background-image: url(/wp-content/Common/images/WaypointImage.gif) !important;
}
.reToolbar .WaypointFile
{
  background-image: url(/wp-content/Common/images/WaypointFile.gif) !important;
}
</style>
<asp:PlaceHolder runat="server" ID="phStyles"></asp:PlaceHolder>

<asp:HiddenField runat="server" ID="hfIsTemplateInstall" />

<asp:Panel runat="server" ID="pnlOmitContainerScript">
    <script type="text/javascript">
        $(function () {
            $('#divSetupWizard .container').each(function () {
                $(this).removeClass('container');
            });
        });
    </script>
</asp:Panel>

<div id="divSetupWizard">

 <asp:Panel runat="server" ID="pnl1">

<div class="container">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3">
                <div class="login-panel panel panel-default">
                     <img src="/wp-content/images/waiverfile-logo-color.png" alt="WaiverFile Admin" class="logo" >
                    <div class="panel-body">
                      
                            <p class="text-center">Let's get your account setup:</p>

                        <div class="form-group text-center">
                            <strong>Do you have a waiver form to import?</strong>
                        </div>

                        <div class="row">
                            <div class="col-xs-6 text-right">
                                <asp:Button runat="server" ID="btnHaveWaiverYes" CssClass="btn btn-primary" Text="Yes" OnClick="btnHaveWaiverYes_Click" />
                            </div>
                             <div class="col-xs-6 text-left">
                                <asp:Button runat="server" ID="btnHaveWaiverNo" CssClass="btn btn-primary" Text="No" OnClick="btnHaveWaiverNo_Click" />
                            </div>
                        </div>
                    </div>
                </div>
               
            </div>
        </div>
    </div>

</asp:Panel>


 <asp:Panel runat="server" ID="pnl2">

<div class="container">
        <div class="row">
            <div class="col-xs-12">
                
                <div class="login-panel panel panel-default">
                     <div class="backbtn">
                            <asp:Button runat="server" ID="btnBack2" CssClass="btn btn-muted btn-sm" Text="&lt; Back" OnClick="btnBack_Click" />
                        </div>
                     <img src="/wp-content/images/waiverfile-logo-color.png" alt="WaiverFile Admin" class="logo">
                    <div class="panel-body">
                      
                        <asp:PlaceHolder runat="server" ID="phErr2"></asp:PlaceHolder>

                          <asp:Panel runat="server" ID="pnlFormName" Visible="true">
                             <div class="form-group">
                            <label for="<%=txtFormName.ClientID %>">Form Name </label>
                            <asp:TextBox runat="server" ID="txtFormName" CssClass="form-control"></asp:TextBox>
                        </div>
                        </asp:Panel>
                       

                        <div class="row">
                            <div class="col-md-8 col-sm-7">
                               <p>
                                <strong>Paste your form below</strong><br />
                                (Skip questions/inputs for now)
                                   </p>

                           


                            </div>
                            <div class="col-md-4 col-sm-5">
                              
                                
                                <div class="well text-center">
                                    Need help?<br />
                                    <asp:Button runat="server" CssClass="btn btn-default btn-sm btn-block" ID="btnSendUsYourForm" Text="Send us your form" OnClick="btnSendUsYourForm_Click" />
                                    <asp:Button runat="server" CssClass="btn btn-default btn-sm btn-block" ID="btnContactUs" Text="Contact Us" OnClick="btnContactUs_Click" />

                                </div>
                            </div>
                        </div>
                        

                      

                      
                        <script type="text/javascript">

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
                                var width = window.width;
                                console.log(width);
                                if (width > 640) {
                                    width -= 100;
                                    if (width > 1200) { width = 1200; }
                                } else {
                                    width -= 20;
                                }


                                editor.showExternalDialog('/b/<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.Url%>/admin/Dialogs/ImageSelect.aspx', "", width, 328, myCallbackFunction, null, 'Insert Image', true, Telerik.Web.UI.WindowBehaviors.Close + Telerik.Web.UI.WindowBehaviors.Move, false, true);

                                //leaving off here
                                //make the handler
                                //then look at some styles to control sizing

                            };


                        </script>
                        
                        

                          <div id="alertFields" class="alert alert-info alert-dismissible" role="alert" style="display:none;">
                          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                          <strong>Heads up!</strong> It looks like you pasted in some form fields. These won't be fillable, and should be deleted from your agreement text and added in the next step. If you need assistance, feel free to use one of the quick support options above.
                        </div>

        <telerik:RadEditor id="RadEditor1"  OnClientPasteHtml="OnClientPasteHtml"  StripFormattingOptions="All" EditModes="Design"
        width="100%" height="440px" runat="server" enableresize="True" allowscripts="True" OnClientCommandExecuting="OnClientCommandExecuting" 
        toolsfile="/wp-content/Plugins/WaiverFile/Docs/WaiverFileToolsSimple.xml" 
        spellchecksettings-dictionarypath="/wp-content/Common/radspell/" 
        imagemanager-viewpaths="/images"  
        imagemanager-uploadpaths="/images">
        <documentmanager viewpaths="/documents" uploadpaths="/documents" deletepaths="/documents" />

            <Tools>
       
    </Tools>


        </telerik:RadEditor>



                        <div class="row" style="margin-top:15px;">
                                 <div class="col-xs-6">
                                          <p>
                                <asp:CheckBox runat="server" ID="chkAdvancedTools" Text="Show advanced editor tools" AutoPostBack="true" OnCheckedChanged="chkAdvancedTools_CheckedChanged" />
                                    </p>
                                 </div>
                            <div class="col-xs-6 text-right">
                                <asp:Button runat="server" ID="btnSaveForm1" CssClass="btn btn-primary" Text="Save and Continue" OnClick="btnSaveForm1_Click" />
                            </div>
                        </div>
                      



                       
                    </div>
                </div>
               
            </div>
        </div>
    </div>

</asp:Panel>

 <asp:Panel runat="server" ID="pnl3">

     <script type="text/javascript">
         function ensureUnChecked(sender, target) {
             if (!$(sender).is(':checked') && $(target).is(':checked')) {
                 $(target).prop('checked', false);
             }
         }
         function ensureChecked(sender, target) {
             //SOME CHECKBOXES DEPEND ON OTHERS
             if ($(sender).is(':checked') && !$(target).is(':checked')) {
                 $(target).prop('checked', true);
             }
         }

         $(function () {

             $('#<%=chkFieldInclude_Email.ClientID%>').change(function () { ensureUnChecked($(this), $('#<%=chkFieldRequire_Email.ClientID%>'));  });
             $('#<%=chkFieldRequire_Email.ClientID%>').change(function () { ensureChecked($(this), $('#<%=chkFieldInclude_Email.ClientID%>')); });


             $('#<%=chkFieldInclude_Address.ClientID%>').change(function () { ensureUnChecked($(this), $('#<%=chkFieldRequire_Address.ClientID%>')); });
             $('#<%=chkFieldRequire_Address.ClientID%>').change(function () { ensureChecked($(this), $('#<%=chkFieldInclude_Address.ClientID%>')); });


        $('#<%=chkFieldInclude_DOB.ClientID%>').change(function(){ ensureUnChecked($(this), $('#<%=chkFieldRequire_DOB.ClientID%>')); });
        $('#<%=chkFieldRequire_DOB.ClientID%>').change(function(){ ensureChecked($(this), $('#<%=chkFieldInclude_DOB.ClientID%>')); });


           $('#<%=chkIncludeParticipantDOB.ClientID%>').change(function(){ ensureUnChecked($(this), $('#<%=chkRequireParticipantDOB.ClientID%>')); });
        $('#<%=chkRequireParticipantDOB.ClientID%>').change(function(){ ensureChecked($(this), $('#<%=chkIncludeParticipantDOB.ClientID%>')); });


        $('#<%=chkFieldIncludeSMSNumber.ClientID%>').change(function () { ensureUnChecked($(this), $('#<%=chkFieldRequireSMSNumber.ClientID%>')); });
             $('#<%=chkFieldRequireSMSNumber.ClientID%>').change(function () { ensureChecked($(this), $('#<%=chkFieldIncludeSMSNumber.ClientID%>')); });

         });
     </script>

<div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="login-panel panel panel-default">
                     <div class="backbtn">
                            <asp:Button runat="server" ID="btnBack3" CssClass="btn btn-muted btn-sm" Text="&lt; Back" OnClick="btnBack_Click" />
                        </div>

                     <img src="/wp-content/images/waiverfile-logo-color.png" alt="WaiverFile Admin" class="logo">
                    <div class="panel-body">
                      
                         
                         
                       
                        <div class="row">

                            <div class="col-xs-12">
                            <label class="col-sm-3  control-label" for="<%=chkSignOption_Adult.ClientID %>">Who can participate? <cc1:WPHelpIcon ID="WPHelpIcon1" runat="server" HelpText="Choose who can participate in this activity. This will help determine if adults can sign for children, and who counts as a participant."></cc1:WPHelpIcon></label>
                        <div class="col-sm-9">
                             <asp:CheckBox ID="chkSignOption_Adult" runat="server" Checked="true" /> Adults Only
                            &nbsp;&nbsp;&nbsp; <asp:CheckBox ID="chkSignOption_AdultChildren" runat="server" Checked="true" /> Adults and Children
                            &nbsp;&nbsp;&nbsp; <asp:CheckBox ID="chkSignOption_Children" runat="server" Checked="true" /> Children Only
                            </div>
                        </div> 
                            
                        
                        </div>
                        <div class="row">
                        <div class="col-xs-12">
                            <hr style="margin:10px 0;" />
                        </div>
                            </div>

                         <h4 style="padding-left:15px;margin-bottom:15px;"><strong>Standard Questions</strong></h4>


                    <div class="row">
                        <div class="col-md-6">
                               <div class="form-group checkrow">
                            <label class="col-sm-4 control-label" for="<%=chkFieldInclude_Email.ClientID %>">Name <cc1:WPHelpIcon ID="WPHelpIcon3" runat="server" HelpText="Name must always be included and required."></cc1:WPHelpIcon></label>
                                   <div class="col-sm-8"> 
                                <input type="checkbox" id="chkName" disabled="disabled" checked="checked" />
                                Include &nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" id="chkNameRequire" disabled="disabled" checked="checked" />  Require
                
                                                                                                                          </div>
                          </div>
                        <div class="form-group checkrow">
                                      <label class="col-sm-4 control-label" for="<%=chkFieldInclude_Email.ClientID %>">Email</label>
                            <div class="col-sm-8"> 
                                          <asp:CheckBox ID="chkFieldInclude_Email" runat="server" Checked="true"></asp:CheckBox> Include &nbsp;&nbsp;&nbsp;&nbsp; <asp:CheckBox ID="chkFieldRequire_Email" runat="server" Checked="true"></asp:CheckBox> Require
                                          
                                         

                                                                                                                                    </div>
                                </div>
               
                                
               
                               
                                <div class="form-group checkrow">
                                      <label class="col-sm-4 control-label" for="<%=chkFieldIncludeSMSNumber.ClientID %>">Mobile #<cc1:WPHelpIcon ID="helpIconMobileNum" runat="server" HelpText="Mobile number is configured to appear on all forms. To set on a form by form basis, go to Text Messaging, Settings."></cc1:WPHelpIcon></label>
                                    <div class="col-sm-8"> <asp:CheckBox ID="chkFieldIncludeSMSNumber" runat="server" Checked="true"></asp:CheckBox> Include &nbsp;&nbsp;&nbsp;&nbsp;  <asp:CheckBox ID="chkFieldRequireSMSNumber" runat="server" Checked="true"></asp:CheckBox> Require</div>
                                </div>

                        </div>
                        <div class="col-md-6">
                            
                     
                     <div class="form-group checkrow">
                                      <label class="col-sm-4 control-label" for="<%=chkFieldInclude_Address.ClientID %>">Address</label><div class="col-sm-8"> <asp:CheckBox ID="chkFieldInclude_Address" runat="server" Checked="true"></asp:CheckBox> Include &nbsp;&nbsp;&nbsp;&nbsp; <asp:CheckBox ID="chkFieldRequire_Address" runat="server" Checked="true"></asp:CheckBox> Require</div>
                                </div>
               
                                 <div class="form-group checkrow">
                                      <label class="col-sm-4 control-label" for="<%=chkFieldInclude_DOB.ClientID %>">Adult Birthdate</label><div class="col-sm-8"> <asp:CheckBox ID="chkFieldInclude_DOB" runat="server" Checked="true"></asp:CheckBox> Include &nbsp;&nbsp;&nbsp;&nbsp; <asp:CheckBox ID="chkFieldRequire_DOB" runat="server" Checked="true"></asp:CheckBox> Require</div>
                                </div>
                                  <div class="form-group checkrow">
                                <label class="col-sm-4 control-label" for="<%=chkIncludeParticipantDOB.ClientID %>">Child Birthdate</label>
                                    <div class="col-sm-8"> <asp:CheckBox ID="chkIncludeParticipantDOB" runat="server" Checked="true"/> Include &nbsp;&nbsp;&nbsp;&nbsp; 
                                       <asp:CheckBox ID="chkRequireParticipantDOB" runat="server" Checked="true"/>  Require</div>
                                </div>

                        </div>
                    </div>

        
                             
                      
                      <div class="row" style="margin-top:15px;">
                            <div class="col-xs-12 text-right">
                                 <asp:Button runat="server" ID="btnPnl3Save" Text="Save and Continue" CssClass="btn btn-primary" OnClick="btnPnl3Save_Click" />
                            </div>
                        </div>
                      

                        
                    </div>
                </div>
               </div>
            </div>
    </div>
    
</asp:Panel>



 <asp:Panel runat="server" ID="pnl4">

     <asp:Panel runat="server" ID="pnl4ScriptOnLoadOnceOnly" Visible="false">
         <script type="text/javascript">
             $(function () {
                 $('#dlgNeedCustomFields').modal('show');

                 $('#btnNeedCustomFieldsYes').click(function () {
                     $('#dlgNeedCustomFields').modal('hide');
                     $('#dlgSelectFieldType').modal('show');
                 });
             });
         </script>
     </asp:Panel>

<div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="login-panel panel panel-default">
                     <div class="backbtn">
                            <asp:Button runat="server" ID="Button1" CssClass="btn btn-muted btn-sm" Text="&lt; Back" OnClick="btnBack_Click" />
                        </div>

                     <img src="/wp-content/images/waiverfile-logo-color.png" alt="WaiverFile Admin" class="logo">
                    <div class="panel-body">
                      
                         
                         
                      

                      

                        
                        <uc1:FormBuilder2 runat="server" id="FormBuilder1" />

                           <hr />
                        <div class="pull-right">
                            <asp:Button runat="server" ID="btnPnl4Save" Text="Save and Continue" CssClass="btn btn-primary" OnClick="btnPnl4Save_Click" />
                        </div>
                    </div>
                </div>
               
            </div>
        </div>
    </div>



     <div class="modal fade" id="dlgNeedCustomFields" tabindex="-1" role="dialog" aria-labelledby="dltNeedCustomFieldsHeading">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="dltNeedCustomFieldsHeading">Custom Fields</h4>
      </div>
      <div class="modal-body">
        
                <p>
                    <label>
                       
                    </label>
                </p>


          <div class="form-group text-center">
                            <strong>Do you need to add any additional questions? </strong>
                        </div>

                        <div class="row">
                            <div class="col-xs-6 text-right">
                                <a href="javascript:void(0);" class="btn btn-primary" id="btnNeedCustomFieldsYes">Yes</a>
                            </div>
                             <div class="col-xs-6 text-left">
                                 <asp:Button runat="server" ID="btnNeedCustomFieldsNo" Text="No / Skip" CssClass="btn btn-primary" OnClick="btnPnl4Save_Click" />
                            </div>
                        </div>




          </div>    
       
    </div>
  </div>
</div>


</asp:Panel>



 <asp:Panel runat="server" ID="pnl5">

     <script type="text/javascript">
         function showHidePnl5() {
             
             if ($('#<%=rbFreeSample.ClientID%>').is(':checked')) {
                 $('#divPnl5Template').show();
                 $('#divPnl5Skip').hide();
             }
             else if ($('#<%=rbSkipTemplate.ClientID%>').is(':checked')) {
                 $('#divPnl5Template').hide();
                 $('#divPnl5Skip').show();
             }
             else {
                 $('#divPnl5Template').hide();
                 $('#divPnl5Skip').hide();
             }
         }
         $(function () {
             showHidePnl5();
             $('#<%=rbFreeSample.ClientID%>').click(function () { showHidePnl5(); });
             $('#<%=rbSkipTemplate.ClientID%>').click(function () { showHidePnl5(); });
         });
     </script>

<div class="container">
        <div class="row">
            <div class="col-xs-12">

                <div class="login-panel panel panel-default">    
                    <div class="backbtn">
                            <asp:Button runat="server" ID="btnBack4" CssClass="btn btn-muted btn-sm" Text="&lt; Back" OnClick="btnBack_Click" />
                        </div>

                     <img src="/wp-content/images/waiverfile-logo-color.png" alt="WaiverFile Admin" class="logo">
                    <div class="panel-body">
                      
                        <asp:PlaceHolder runat="server" ID="phErr4"></asp:PlaceHolder>
                       
                        <p><strong>Choose: </strong></p>
                       
                        <div class="form-group">
                            <asp:RadioButton runat="server" ID="rbFreeSample" GroupName="rbPnl5" Text="Start with a Free Sample Waiver" />
                        </div>

                           <div id="divPnl5Template">
                             <div class="form-group">
                            
                            <asp:DropDownList runat="server" ID="cboFreeTemplates" CssClass="form-control">
                            </asp:DropDownList>

                         </div>
                               <h3><small><span style="font-size: 12px;"><strong>Disclaimer</strong></span></small></h3>
                            <span style="font-size: 12px;" runat="server" id="spanDisclaimer">
                                Use of WaiverFile is subject to our <a href="/Policies/Terms-of-Use.aspx" target="_blank">Terms of Use <i class="fa fa-external-link"></i></a>. The content on this site and in the sample waiver forms is not legal advice. No attorney-client relationship is established. To ensure your online waiver form is legally binding based on your location, industry, and specific circumstances, consult a legal professional in your area.
                                </span>
                            <div class="form-group">
                                <small style="font-weight:700">
                                    <asp:CheckBox runat="server" ID="chkAgree" /> I agree
                    
                                </small>
                            </div>
                            
                               <div class="form-group">
                               <asp:Button runat="server" ID="btnSetupFreeTemplate" Text="Submit" CssClass="btn btn-primary" OnClick="btnSetupFreeTemplate_Click" />
                                   </div>
                               <div style="clear:both;"></div>
                               <hr />
                               
                        </div>

                         <div class="form-group">
                            <asp:RadioButton runat="server" ID="rbSkipTemplate" GroupName="rbPnl5" Text="Skip setup for now" />
                             <small>You can add waiver forms later.</small>
                        </div>
                          <div id="divPnl5Skip">
                              <asp:Button runat="server" ID="btnSkipTemplate" Text="Submit" CssClass="btn btn-primary" OnClick="btnSkipTemplate_Click" />
                          </div>
                     



                       
                    </div>
                </div>
               
            </div>
        </div>
    </div>

</asp:Panel>

<asp:Panel runat="server" ID="pnl6">

<div class="container">
        <div class="row">
            <div class="col-xs-12">

                <div class="login-panel panel panel-default">
                       

                     <img src="/wp-content/images/waiverfile-logo-color.png" alt="WaiverFile Admin" class="logo">
                    <div class="panel-body">
                      
                       
                       
                            <h3>Last Step</h3>
                        <p>Just a few questions to help configure things: </p>
                        <hr />
                       

                       
                        <telerik:RadAjaxPanel runat="server">
                            
                        
                        <div class="form-group">
                            <label for="rblEvents">1. Do you host Groups, Events, or Parties? </label>
                            <asp:RadioButtonList runat="server"  ClientIDMode="Static" ID="rblEvents" RepeatLayout="UnorderedList" CssClass="list-inline" AutoPostBack="true" OnSelectedIndexChanged="rblEvents_SelectedIndexChanged">
                                <asp:ListItem Value="YES">Yes</asp:ListItem>
                                <asp:ListItem Value="NO">No</asp:ListItem>
                                <asp:ListItem Value="NOTSURE">Not Sure</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                         <asp:Panel runat="server" ID="pnlEventsExclusive">
                         <div class="form-group">
                            <label for="rblEventsExclusive">1a. Do you operate exclusively using events? </label>
                            <asp:RadioButtonList runat="server"  ClientIDMode="Static" ID="rblEventsExclusive" RepeatLayout="UnorderedList" CssClass="list-inline">
                                <asp:ListItem Value="EXCLUSIVE">Yes, every customer will be part of an event.</asp:ListItem>
                                <asp:ListItem Value="WALKINS">No, we have general admission/walk-ins.</asp:ListItem>
                                <asp:ListItem Value="NOTSURE">Not Sure</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                             </asp:Panel>
                               
                            </telerik:RadAjaxPanel>
                        <hr />
                        
                        <div class="form-group">
                            <label for="cboVolume.">2. What is your typical volume on busy days?</label>
                            <asp:DropDownList runat="server" ID="cboVolume" CssClass="form-control">
                                <asp:ListItem Value="">Select...</asp:ListItem>
                                <asp:ListItem Value="FEW_PER_DAY">A few people per day</asp:ListItem>
                                <asp:ListItem Value="DOZENS">Dozens per day</asp:ListItem>
                                <asp:ListItem Value="HUNDREDS">Hundreds per day</asp:ListItem>
                                <asp:ListItem Value="THOUSANDS">Thousands per day</asp:ListItem>
                                <asp:ListItem Value="NOTSURE">Not sure</asp:ListItem>
                               
                            </asp:DropDownList>

                        </div>
                        <hr />
                        <div class="form-group">
                            <label>3. Do you want to capture...</label>
                            <asp:CheckBoxList runat="server" ID="cblCapture" CssClass="cboCapture list-unstyled" RepeatLayout="UnorderedList">
                                 <asp:ListItem Value="PHOTOS">Photo of the person signing</asp:ListItem>
                                 <asp:ListItem Value="LICENSE">Driver's License/ID</asp:ListItem>
                            </asp:CheckBoxList>
                        </div>
                         <p class="text-center" style="color: #696565; display:none;" id="pAddon">
                            <small>* Data storage fees apply for attachments/photos. <a href="https://www.waiverfile.com/Pricing.aspx#addons" target="_blank">Pricing</a></small>
                        </p>
                       

                        
                        <div class="text-right">
                            
                            <asp:Button runat="server" ID="btnSkip" Text="Skip" CssClass="btn btn-muted" OnClick="btnFinish_Click" /> &nbsp;
                            <asp:Button ID="btnFinish" runat="server" Text="Finish"  CssClass="btn btn-primary" OnClick="btnFinish_Click" />
                        </div>
 



                       
                    </div>
                </div>
               
            </div>
        </div>
    </div>

</asp:Panel>


<asp:Panel runat="server" ID="pnl7">

<div class="container">
        <div class="row">
            <div class="col-xs-12">

                <div class="login-panel panel panel-default">
                        
                      <div class="backbtn">
                            <asp:Button runat="server" ID="btnBack" CssClass="btn btn-muted btn-sm" Text="&lt; Back" OnClick="btnBack_Click" />
                        </div>
                         
                     <img src="/wp-content/images/waiverfile-logo-color.png" alt="WaiverFile Admin" class="logo">
                    <div class="panel-body">
                      
                   
                                    <h3>Send us your form</h3>


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
       

                        <asp:Button ID="btnUpload" runat="server" Text="Next"  CssClass="btn btn-primary" OnClick="btnUpload_Click" />
                       
 



                       
                    </div>
                </div>
               
            </div>
        </div>
    </div>

</asp:Panel>



 <asp:Panel runat="server" ID="pnl8">

     
<script type="text/javascript">
    function handleQuickForm() {
       var atleastonechecked = false;
        if ($('#rbWebDemo').is(':checked')) { $('#divWebDemo').show(); atleastonechecked=true; } else { $('#divWebDemo').hide(); }
        if ($('#rbCallMe').is(':checked')) { $('#divCallMe').show();  atleastonechecked=true;} else { $('#divCallMe').hide(); }
        if ($('#rbEmail').is(':checked')) { $('#divEmail').show();  atleastonechecked=true;} else { $('#divEmail').hide(); }
if(atleastonechecked){ $('#btnContactSubmitWrap').show(); } else{ $('#btnContactSubmitWrap').hide(); }
    }

    $(document).ready(function () {
        handleQuickForm();
       
        $('#rbWebDemo').click(function () { handleQuickForm(); });
        $('#rbCallMe').click(function () { handleQuickForm(); });
        $('#rbEmail').click(function () { handleQuickForm(); });


    });
</script>

<div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="login-panel panel panel-default">
                       <div class="backbtn">
                            <asp:Button runat="server" ID="btnBack7" CssClass="btn btn-muted btn-sm" Text="&lt; Back" OnClick="btnBack_Click" />
                        </div>
                     <img src="/wp-content/images/waiverfile-logo-color.png" alt="WaiverFile Admin" class="logo">
                    <div class="panel-body">
                        <asp:PlaceHolder runat="server" ID="phSidebarErr"></asp:PlaceHolder>

                        

                       
                                        <h4>Contact Us</h4>
            
            
                                <div id="divOptions">
                                <p>
                                    <asp:RadioButton runat="server" ClientIDMode="Static" ID="rbWebDemo" GroupName="rbSupportOption" /> I'm interested in a Web Demo
                                </p>
                                <p>
                                    <asp:RadioButton runat="server" ClientIDMode="Static" ID="rbCallMe" GroupName="rbSupportOption" /> I'd like someone to call me
                                </p>
                                <p>
                                    <asp:RadioButton runat="server" ClientIDMode="Static" ID="rbEmail" GroupName="rbSupportOption" /> I'd like to email you
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
    

                                

                        <div class="form-group" id="btnContactSubmitWrap">
                            <asp:Button runat="server" ID="btnContactSubmit" Text="Submit" CssClass="btn btn-primary" OnClick="btnContactSubmit_Click" />
                        </div>

                        </div>
                    </div>

            </div>
                
            </div>
    </div>
</asp:Panel>
    </div>


 


