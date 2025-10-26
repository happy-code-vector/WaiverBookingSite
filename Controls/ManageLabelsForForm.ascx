<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageLabelsForForm.ascx.cs" Inherits="WaiverFile.Controls.ManageLabelsForForm" %>
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

    function SetRowActive(row) {
        var thecheckbox = $(row).find('input[type=checkbox]').first();
        var isactive = thecheckbox.is(':checked');
        if (isactive) {
            $(row).attr('style', 'opacity:1');
        } else {
            $(row).attr('style', 'opacity:.3');
        }
    }

    function showHideEditors() {
        if ($('#<%=chkOverrideThankYouDefault.ClientID %>').is(':checked')) {
            $('#thankbox_default').show();
        } else {
            $('#thankbox_default').hide();
        }


        if ($('#<%=chkOverrideThankYouDevice.ClientID %>').is(':checked')) {
            $('#thankbox_device').show();
        } else {
            $('#thankbox_device').hide();
        }

        if ($('#<%=chkOverrideThankYouEmbedded.ClientID %>').is(':checked')) {
            $('#thankbox_embedded').show();
        } else {
            $('#thankbox_embedded').hide();
        }
    }
    $(document).ready(function () {
        showHideEditors();
        $('.btnReset').click(function () {
            $('#' + $(this).data('btnid')).val($('#' + $(this).data('btnid')).data('default'));
        });
        $('.forminstancelabels tbody tr').each(function () {
            SetRowActive($(this));
            $(this).find('input[type=checkbox]').click(function () {
                
                SetRowActive($(this).parent().parent());
            });
        });
        $('.btnResetAll').click(function () {
            $('.btnReset').each(function () {
                $(this).click();
            });
        });
        $('#<%=chkOverrideThankYouDefault.ClientID %>').click(function () { showHideEditors(); })
        $('#<%=chkOverrideThankYouDevice.ClientID %>').click(function () { showHideEditors(); })
        $('#<%=chkOverrideThankYouEmbedded.ClientID %>').click(function () { showHideEditors(); })

       

    });

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

 <div class="widget">
    <h3><asp:Label ID="lblHeading" runat="server"></asp:Label></h3>
    <div class="widgetcontentgrid">
    
        <p>Use this screen to customize the wording on your WaiverFile signing screen. These changes will override the site label settings you may have already customized. <a href="../Customize-Labels.aspx">Review those settings here.</a></p>

        <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        
        <div class="panel with-nav-tabs panel-default" id="div_tabs">
            <div class="panel-heading">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a data-toggle="tab" href="#tab_labels">Labels</a></li>
                    <li><a data-toggle="tab" href="#tab_thankyou_main">Thank You - Default</a></li>
                     <li><a data-toggle="tab" href="#tab_thankyou_device">Thank You - Device</a></li>
                    <li><a data-toggle="tab" href="#tab_thankyou_embedded">Thank You - Embedded</a></li>
                </ul>
            </div>
            <div class="panel-body" style="padding:0;">
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="tab_labels">
        
                                <asp:PlaceHolder ID="phMain" runat="server"></asp:PlaceHolder>
                         <div class="text-right">
                             <a href="javascript:void(0);" class="btn btn-default btn-sm btnResetAll">Reset All</a>
                         </div>
                        
                    </div>
               
                    <div class="tab-pane fade in" id="tab_thankyou_main" style="padding:10px;">
        
                        <div class="form-group">
                                <asp:CheckBox runat="server" ID="chkOverrideThankYouDefault" Text="Customize the Thank-You Screen" />
                            </div>
                        <div class="form-group" id="thankbox_default">

                            <p>This will replace the thank you screen. Automatic redirect to the first screen will be disabled. Be sure to include any buttons you need using the codes below.</p>

                              <telerik:RadEditor id="reDefault" 
        width="100%" height="440px" runat="server" enableresize="True" allowscripts="True" 
        toolsfile="/wp-content/Plugins/WaiverFile/Docs/WaiverFileTools.xml" 
        spellchecksettings-dictionarypath="/wp-content/Common/radspell/" 
        imagemanager-viewpaths="/images"  
        imagemanager-uploadpaths="/images">
        <documentmanager viewpaths="/documents" uploadpaths="/documents" deletepaths="/documents" />
        </telerik:RadEditor>
        
                             <p class="help-block">
                            <strong>Button Codes</strong>
                            <br />Use these code snippets to add special action buttons
                        </p>
                        <p class="help-block">
                            {{PRINT_BUTTON}}<br />
                            {{PRINT_BUTTON_URL}}<br />
                            {{EMAIL_BUTTON}}<br />
                            {{CONTINUE_BUTTON}}<br />
                            {{EVENT_ID}}<br />
                            {{EVENT_NAME}}<br />
                            {{EVENT_CATEGORY_NAME}}<br />
                            {{REFID1}} (Reference ID)<br />
                            {{REFID2}}<br />
                            {{REFID3}}<br />
                            </p>

                        </div>
                       
                    </div>
               
                    <div class="tab-pane fade" id="tab_thankyou_device" style="padding:10px;">
        
                              <div class="form-group">
                                <asp:CheckBox runat="server" ID="chkOverrideThankYouDevice" Text="Customize the Thank-You Screen (Device Version)" />
                            </div>
                                <div class="form-group" id="thankbox_device">
                                    <p>This will replace the thank you screen on the device signing page. Automatic redirect to the first screen will be disabled. Be sure to include any buttons you need using the codes below.</p>
                                       <telerik:RadEditor id="reDevice" 
        width="100%" height="440px" runat="server" enableresize="True" allowscripts="True" 
        toolsfile="/wp-content/Plugins/WaiverFile/Docs/WaiverFileTools.xml" 
        spellchecksettings-dictionarypath="/wp-content/Common/radspell/" 
        imagemanager-viewpaths="/images"  
        imagemanager-uploadpaths="/images">
        <documentmanager viewpaths="/documents" uploadpaths="/documents" deletepaths="/documents" />
        </telerik:RadEditor>
        
                                     <p class="help-block">
                            <strong>Button Codes</strong>
                            <br />Use these code snippets to add special action buttons
                        </p>
                        <p class="help-block">
                             {{PRINT_BUTTON}}<br />
                            {{PRINT_BUTTON_URL}}<br />
                            {{EMAIL_BUTTON}}<br />
                            {{CONTINUE_BUTTON}}<br />
                            {{EVENT_ID}}<br />
                            {{EVENT_NAME}}<br />
                            {{EVENT_CATEGORY_NAME}}<br />
                            {{REFID1}} (Reference ID)<br />
                            {{REFID2}}<br />
                            {{REFID3}}<br />
                            </p>
                                </div>
                         

                    </div>
               
                    <div class="tab-pane fade" id="tab_thankyou_embedded" style="padding:10px;">
        
                                <div class="form-group">
                                <asp:CheckBox runat="server" ID="chkOverrideThankYouEmbedded" Text="Customize the Thank-You Screen (Embedded Version)" />
                            </div>
                                <div class="form-group" id="thankbox_embedded">

                                    <p>This will replace the thank you screen on the embedded signing page. Automatic redirect to the first screen will be disabled. Be sure to include any buttons you need using the codes below.</p>

                                      <telerik:RadEditor id="reEmbedded" 
        width="100%" height="440px" runat="server" enableresize="True" allowscripts="True" 
        toolsfile="/wp-content/Plugins/WaiverFile/Docs/WaiverFileTools.xml" 
        spellchecksettings-dictionarypath="/wp-content/Common/radspell/" 
        imagemanager-viewpaths="/images"  
        imagemanager-uploadpaths="/images">
        <documentmanager viewpaths="/documents" uploadpaths="/documents" deletepaths="/documents" />
        </telerik:RadEditor>
        
                                       <p class="help-block">
                            <strong>Button Codes</strong>
                            <br />Use these code snippets to add special action buttons
                        </p>
                        <p class="help-block">
                             {{PRINT_BUTTON}}<br />
                            {{PRINT_BUTTON_URL}}<br />
                            {{EMAIL_BUTTON}}<br />
                            {{CONTINUE_BUTTON}}<br />
                            {{EVENT_ID}}<br />
                            {{EVENT_NAME}}<br />
                            {{EVENT_CATEGORY_NAME}}<br />
                            {{REFID1}} (Reference ID)<br />
                            {{REFID2}}<br />
                            {{REFID3}}<br />

                            
                            </p>

                                </div>
                       
                    </div>
                </div>




                </div>
            </div>


        
        
        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click" />
       
</div></div>
