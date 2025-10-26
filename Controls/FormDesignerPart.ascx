<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormDesignerPart.ascx.cs" Inherits="WaiverFile.Controls.FormDesignerPart" %>

<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<asp:Panel ID="pnlMain" runat="server">

    
  <link rel="stylesheet" href="/wp-content/styles/formbuilder/formbuilder.css" />

  <script type="text/javascript" src="/wp-content/Scripts/vendor.js"></script>
  <script type="text/javascript" src="/wp-content/Scripts/formbuilder.custom.js"></script>

<script type="text/javascript">
    var fb2;
    var saveSuccess = true;
    $(function () {
     
        fb2 = new Formbuilder({
            selector: '.fb-main2',
            bootstrapData:
              <%=jsonText %>
            
            });


        fb2.on('save', function (payload) {
            //SAVE THE RESULTS. 
            $.post("/Controls/FormDesignerSave.ashx", { siteid: '<%=siteid%>', waiverformid: '<%=id.ToString()%>', isparticipant:'true', data: payload },
                function (data) {
                    //clear items from controlToUpdate
                    if (data == "SUCCESS") {
                        saveSuccess = true;
                        $('#<%=btnSave2.ClientID %>').click();
                        //SAVED.
                    } else {
                        saveSuccess = false;
                        alert(data);
                    }
                });

        });
        fb2.on('formSaved', function (payload) {
            //SAVE THE RESULTS. 
            $.post("/Controls/FormDesignerSave.ashx", { siteid: '<%=siteid%>', waiverformid: '<%=id.ToString()%>', isparticipant: 'true', data: payload },
                function (data) {
                    //clear items from controlToUpdate
                    if (data == "SUCCESS") {
                        saveSuccess = true;
                        $('#<%=btnSave2.ClientID %>').click();
                        //SAVED.
                    } else {
                        saveSuccess = false;
                        alert(data);
                    }
                });

        });

        $('#<%=chkIncludeParticipantDOB.ClientID%>').change(function(){ ensureUnChecked($(this), $('#<%=chkRequireParticipantDOB.ClientID%>')); });
        $('#<%=chkRequireParticipantDOB.ClientID%>').change(function(){ ensureChecked($(this), $('#<%=chkIncludeParticipantDOB.ClientID%>')); });

     
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
    function HandleSave(){
        //var result = fb.mainView.doAjaxSave(''); 
        //var result = fb.save();
        if(fb2.mainView.formSaved){
            return true;
        }
        fb2.mainView.saveForm.call(fb2.mainView);
        return false; 
    }
       
    </script>

           <div class="widget">
                <h3>Participant Form Fields</h3>
                <div class="widgetcontent">

<p>Choose the form fields that appear for each participant. These questions will repeat if you allow parents to sign for multiple children at once.</p>

                   
                    <div class="row">
<div class="form-group checkrow">
<div class="col-sm-3"><label for="<%=chkIncludeParticipantDOB.ClientID %>">Participant Date of Birth</label></div>
    <div class="col-sm-9"> Include: <asp:CheckBox ID="chkIncludeParticipantDOB" runat="server" /> Require: 
       <asp:CheckBox ID="chkRequireParticipantDOB" runat="server" /></div>
</div>
                        </div>

                     <div class="row">
<div class="form-group checkrow">
<div class="col-sm-3"><label for="<%=chkParticipantEventField.ClientID %>">Event Selection</label><br />
    <em><small>* This enables adults to sign participants up for different events at the same time</small></em>
</div>
    <div class="col-sm-9"> Include: <asp:CheckBox ID="chkParticipantEventField" runat="server" /> </div>
</div>
                        </div>

                    <div class="row"><div class="col-xs-12">
<h4>Additional Fields</h4>
<div class='fb-main2'></div>

 
    <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary " Text="Save" OnClientClick="return HandleSave()" OnClick="btnSave_Click" />
    <div style="display:none;"><asp:Button ID="btnSave2" runat="server" CssClass="btn btn-primary" Text="Save 2" OnClick="btnSave_Click" /></div>

                    </div></div>
                    </div>
               </div>
    </asp:Panel>