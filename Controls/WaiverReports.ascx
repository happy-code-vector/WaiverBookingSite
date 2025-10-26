<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WaiverFormEntry.ascx.cs" Inherits="WaiverFile.Controls.WaiverFormEntry" %>
<%@ Register Assembly="WaiverFile" Namespace="WaiverFile.Core" TagPrefix="cc2" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script runat="server">

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
    }
</script>

<!-- FORM VALIDATION ELEMENTS -->
<script type="text/javascript" src="/wp-content/Plugins/WaiverFile/Docs/FormValidation/formValidation.custom.min.js"></script>
<script type="text/javascript" src="/wp-content/Plugins/WaiverFile/Docs/FormValidation/bootstrap.min.js"></script><!-- different than the main bootstrap js -->
<link rel="stylesheet" href="/wp-content/Plugins/WaiverFile/Docs/FormValidation/formValidation.min.css" />
<link rel="stylesheet" href="/wp-content/Plugins/WaiverFile/Docs/FormValidation/fixes.css" />

<script type="text/javascript" src="/wp-content/Plugins/WaiverFile/Docs/jSignature/jSignature.js?v=3"></script>
<script type="text/javascript" src="/wp-content/Plugins/WaiverFile/Docs/jSignature/jSignature.CompressorBase30.js?v=3"></script>
<script type="text/javascript" src="/wp-content/Plugins/WaiverFile/Docs/jSignature/jSignature.CompressorSVG.js?v=3"></script>
<script type="text/javascript" src="/wp-content/Plugins/WaiverFile/Docs/jSignature/jSignature.SignHere.js?v=3"></script>


<% if (!includeFirstNameFields)
   { %>
<style type="text/css">
    .firstname {
        display: none;
    }
</style>
<%} %>
<style type="text/css">
    .signature{
    -ms-touch-action: none;
    } 
</style>


<script type="text/javascript">
    var success = false;

    function getScore(password) {
        var score = 0;
        var detail = '';
        if (password.length < 1) {
            return 0;
        }
        if (password.length < 4) {
            return 1;
        }

        if (password.length >= 8) {
            detail += 'len > 8 ';
            score++;
        }
        if (password.length >= 12) {
            detail += 'len > 12 ';
            score++;
        }

        if (RegExp(/\d+/).test(password)) {
            detail += ' decimal ';
            score++;
        }
        if (RegExp('[a-z]').test(password) &&
            RegExp('[A-Z]').test(password)) {
            detail += 'upperlower ';
            score++;
        }
        if (RegExp('.[!,@,#,$,%,^,&,*,?,_,~,-,£,(,)]').test(password)) {
            detail += 'char ';
            score++;
        }
        return score;
    }
    function checkStrength() {

        var password = $('#<%=txtPassword.ClientID%>').val();
        var score = getScore(password);
        var minScore = <%=_minPasswordScore%>;

        var cssClass = 'text-success';
        var iconCode = '<i class="fa fa-times-circle"></i> ';
        if (score < minScore) {
            cssClass = 'text-danger';
        } else {
            iconCode = '<i class="fa fa-check-circle"></i> ';
            cssClass = 'text-success';
        }




        var scoreName = 'Blank';
        switch (score) {
            case 0:
                scoreName = 'Very Weak'; //UNDER 4 CHARS DOES THIS, SO DON'T CALL IT BLANK
                break;
            case 1:
                scoreName = 'Very Weak';
                break;
            case 2:
                scoreName = 'Weak';
                break;
            case 3:
                scoreName = 'Medium';
                break;
            case 4:
                scoreName = 'Strong';
                break;
            default:
                scoreName = 'Very Strong';
                break;
        }

        if (password.length == 0) {
            $('#pass_strength_wrap').hide();
        } else {
            $('#pass_strength_wrap').show();
        }
        $('#pass_strength').attr('class', cssClass);
        $('#pass_strength').html(iconCode + scoreName);


    }

    function detectPartDupes() {

        var arrFirst = [];
        var arrLast = [];
        var arrFirstIDs = [];
        var arrLastIDs = [];
        //COLLECT VALUES
        $('.partbox').each(function () {
            $(this).find('input[type=text]').each(function () {
                var first = ''; var last = '';
                var attr = $(this).attr('id');
                if (typeof attr !== typeof undefined && attr !== false) {
                    if ($(this).attr('id').indexOf('txtFirst') != -1) {
                        arrFirst.push($(this).val());
                        arrFirstIDs.push($(this).attr('id'));
                    }
                    if ($(this).attr('id').indexOf('txtLast') != -1) {
                        arrLast.push($(this).val());
                        arrLastIDs.push($(this).attr('id'));
                    }
                }
            });
        });
        var dupesCleared = false;
        for (var i = 1; i < arrLast.length; i++) {
            if (arrLast[i] != '' && (arrFirst.length == 0 || arrFirst[i] != '')) {
                for (var j = 0; j < i; j++) {
                    if (arrFirst.length == 0) {
                        if (arrLast[i] == arrLast[j]) {
                            dupesCleared = true;
                            $('#' + arrLastIDs[i]).val('');
                        }
                    } else {
                        if (arrLast[i] == arrLast[j] && arrFirst[i] == arrFirst[j]) {
                            dupesCleared = true;
                            $('#' + arrLastIDs[i]).val('');
                            $('#' + arrFirstIDs[i]).val('');
                        }
                    }
                }
            }
        }
        if (dupesCleared) {
            alert('Duplicate participants were detected and removed. Please review the names listed and try again. ');
            return false;
        }
        else {
            return true;
        }
    }

    function handleTypeToSign() {
        if ($('#<%=chkTypeSignature.ClientID%>').is(':checked')) {
            $('#typename').show();
            $('#signature_wrap').hide();
        } else {
            $('#typename').hide();
            $('#signature_wrap').show();
        }
    }
    $(function () {
        $('.riTextBox').attr('placeholder', 'MM/DD/YYYY');
        handleTypeToSign();
        $('#<%=chkTypeSignature.ClientID%>').change(function () {
            handleTypeToSign();
        });

        $('#<%=txtPassword.ClientID%>').keyup(function () { checkStrength(); });
        $('#<%=txtPassword.ClientID%>').change(function () { checkStrength(); });

        //reset all signature items on load
        $('#<%=hfSignatureData.ClientID%>').val('');
        <%
    foreach(Control ctrl in phSigHiddenFields.Controls){
              if(ctrl is HiddenField){
                  %>
        $('#<%=((HiddenField)ctrl).ClientID%>').val('');
        <%
              }
          }%>

        $('.move_attribs_to_child_input').each(function () {
            var target = $(this).find('input');
            var source = $(this);
            $.each($(this).prop('attributes'), function () {
                if (this.name.substring(0, 4) == 'data') {
                    $(target).attr(this.name, this.value);
                }
            });
            $.each($(this).prop('attributes'), function () {
                if (this.name.substring(0, 4) == 'data') {
                    $(source).removeAttr(this.name);
                }
            });
        });

        $("input[data-ensuretrigger='true']").change(function () {
            var formValidation = $('#Form1').data('formValidation');
            formValidation.revalidateField($("input[data-fieldcidmaster='" + $(this).data('fieldcidalt') + "']").attr('name'));
        });

        <% if(!((Waypoint.Core.WPPageLite)Page).IsEditMode){ %>

        //SETUP VALIDATION
        $('#Form1').formValidation({
            framework: 'bootstrap',
            container: '#messages',
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            }
        })
            .on('err.field.fv', function (e, data) {
                data.fv.disableSubmitButtons(false);
            })
            .on('success.field.fv', function (e, data) {
                data.fv.disableSubmitButtons(false);
            });

        <% if(IsPostBack){ %>
        $('#Form1').formValidation().formValidation('validate');//THIS DISABLES BUTTONS EVEN THOUGH WE HAVE CODE TO PREVENT ABOVE.
        $('#<%=btnSubmit.ClientID%>').removeAttr('disabled');//SO RE-ENABLE THEM
        $('#<%=btnSubmit.ClientID%>').removeClass('disabled');

        <% } %>


        <% } %>
    });
</script>


<asp:HiddenField runat="server" id="hfPartSelection"></asp:HiddenField>


<div id="modalSign" class="modal fade modal-fullscreen  footer-to-bottom" tabindex="-1" role="dialog">
  <div class="modal-dialog " role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title"><asp:Label runat="server" ID="lblDialogHeadingInitialSignature">Signature</asp:Label></h4>
      </div>
      <div class="modal-body" >
         
          <%if (_signatureMode == SignatureModeEnum.Signature || _signatureMode == SignatureModeEnum.Signature_or_type) { %>

            <%if (_signatureMode == SignatureModeEnum.Signature_or_type) { %>

             <div class="form-group">
               <asp:CheckBox runat="server" ID="chkTypeSignature" />
                 <asp:Label ID="lblTypeSignature" runat="server"></asp:Label>
        </div>

              <div class="form-group" id="typename" style="display:none;">
                  <label for="<%=txtFullNameTypeToSign.ClientID %>"><%=instance.GetLabel("YOUR_FULL_NAME", conn, site) %></label>
                  <asp:TextBox runat="server" CssClass="form-control" ID="txtFullNameTypeToSign"></asp:TextBox>
              </div>
              
        


            <%} %>

            <div id="signature_wrap">
        <div class="form-group">
            <asp:Label ID="lblSignatureDesc" runat="server"></asp:Label>
            <div class="pull-right">
               
            </div>
        </div>

              <div id="signature_main" class="signature fixer" data-region="main" data-hfclientid="<%=hfSignatureData.ClientID %>" data-mode="signature"></div>
        
        <asp:HiddenField ID="hfSignatureData" runat="server"/>
              </div>      

        <% } %>


      </div>
        <div class="modal-footer">
            <div class="row">
                 
                <div class="col-xs-4"><a href="javascript:void(0);" data-region="main" runat="server" id="btnSigClear" class="btn btn-default btnClearSig"><%=instance.GetLabel("BTN_CLEAR", conn, site) %></a></div>
                <div class="col-xs-4"><a href="javascript:void(0);" data-region="main" runat="server" id="btnSigCancel" class="btn btn-default btnClearSig"><%=instance.GetLabel("BTN_CANCEL", conn, site) %></a></div>
                <div class="col-xs-4"><a href="javascript:void(0);" runat="server" id="btnSigAdopt" class="btn btn-primary"><%=instance.GetLabel("BTN_ADOPT_AND_SIGN", conn, site) %></a></div>
            </div>
        </div>
    
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div id="modalInitial" class="modal fade modal-fullscreen  footer-to-bottom" tabindex="-1" role="dialog">
  <div class="modal-dialog " role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title"><asp:Label runat="server" ID="lblDialogHeadingInitialInitial">Initial</asp:Label></h4>
      </div>
      <div class="modal-body" >
          <div class="initial_wrap"><div class="signature" data-region="maininit" data-mode="initial" data-hfclientid="<%=hvInitialData.ClientID %>"></div><div class="initial_clear"><a href="javascript:void(0);" class="btn btn-sm btn-default btnClearSig" data-region="{0}">Clear</a></div></div><div class="clear"></div>
           <asp:HiddenField ID="hvInitialData" runat="server"/>

      </div>
    <div class="modal-footer">
            <div class="row">
                <div class="col-xs-4"><a href="javascript:void(0);" runat="server" data-region="btnInitClear" id="A1" class="btn btn-default btnClearSig"><%=instance.GetLabel("BTN_CLEAR", conn, site) %></a></div>
                <div class="col-xs-4"><a href="javascript:void(0);" runat="server" data-region="btnInitCancel" id="A2" class="btn btn-default btnClearSig"><%=instance.GetLabel("BTN_CANCEL", conn, site) %></a></div>
                <div class="col-xs-4"><a href="javascript:void(0);" runat="server" id="btnInitAdopt" class="btn btn-primary"><%=instance.GetLabel("BTN_ADOPT_AND_SIGN", conn, site) %></a></div>
            </div>
        </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<%if(!_directEventMode){ %>
<div class="ipa_small_button2 abstopleft" <%=_hideAllCode %>>

    <a href="<%=_backUrl %>" class="btn btn-default pull-right" style="margin-left: 10px;"><%=instance.GetLabel("GO_BACK", conn, site) %></a>

</div>
<%} %>

<asp:PlaceHolder ID="phHideAllMessage" runat="server"></asp:PlaceHolder>

<asp:Panel ID="pnlWaiver" runat="server" DefaultButton="btnDisableEnter">
    <asp:Button ID="btnDisableEnter" runat="server" Text="" OnClientClick="return false;" Style="display: none;" />


    <script type="text/javascript">

        var lastHiddenIdx = 0;

        function touchEnabled() {
            return 'ontouchstart' in window || navigator.maxTouchPoints;
        };


        var signatureIsSetUp = false;
        function setupSignature() {
            if (signatureIsSetUp == false) {
                signatureIsSetUp = true;

                var numSigBoxes = 0;
                var numInitialized = 0;
                $(".signature").each(function () {
                    numSigBoxes++;
                });

                $(".signature").each(function () {
                    //var setProp = $(this).jSignature();
                    var setProp;
                    setProp = $(this).jSignature({ height: '100%', width: '100%' });


                    var hfclientid = $(this).data('hfclientid');

                    $(this).bind('change', function (e) {
                        var datapair = $(this).jSignature("getData", "svgbase64");//returns an array of form ["image/svg+xml","svg xml here"]
                        //$(this).next('input[type=hidden]').val(datapair[1]);
                        $('#' + hfclientid).val(datapair[1]);
                    });

                    //WRAP THE SIGNATURE IN A LINK THAT WILL BLOCK IT AND ALLOW IT TO BE
                    if (touchEnabled()) {
                        var wrapclass = 'sigwrap';
                        var coverclass = 'sigcover';
                        var label = 'Tap Here to Sign';
                        if ($(this).hasClass('initial')) {
                            wrapclass += ' initwrap';
                            coverclass += ' initcover';
                            label = 'Tap Here to Initial';
                        }
                        var sigwrap = $(this).wrap('<div class="' + wrapclass + '"></div>');
                        var sigcover = sigwrap.parent().append('<a href="javascript:void(0);" class="' + coverclass + '"><i class="fa fa-hand-o-up"></i> ' + label + '</a>');
                        $(sigcover).find('.sigcover').click(function () {
                            $(this).hide();
                        });
                    }
                });

            }
        }

        function hidePart2() {
            $('#<%=part2.ClientID%>').hide();
        }
        function showPart2() {

            $(".signature").each(function (i, o) { $(o).resize() });

            /*$('.signature').each(function(){
                $(this).jSignature("resize");
            });*/
            $('#<%=part2.ClientID%>').show();

        }
        $(function () {

            //setSigSizes();

            $(window).resize(function () {
                //setSigSizes();
            });

            setupSignature();

            <%if (hideFormPart2OnLoad) {%>
            //setTimeout(hidePart2, 10000)
            hidePart2();
              <% } %>

            $('.btnClearSig').each(function () {
                $(this).click(function () {
                    var regID = $(this).data('region');

                    if (regID != '') {
                        $('.signature[data-region="' + regID + '"]').jSignature("reset");
                        $('#' + $('.signature[data-region="' + regID + '"]').data('hfclientid')).val('');
                    }
                });
            });
        });

        function addMorePartBoxes() {
            var firstHiddenIdx = 0;

            $('.partbox').each(function (idx) {
                if ($(this).css('display') == 'none') {
                    firstHiddenIdx = idx;
                    return false; //BREAK
                }
            });
            $('.partbox').each(function (idx) {
                if (idx >= firstHiddenIdx && idx < firstHiddenIdx + 1) {
                    $(this).css('display', 'block');
                    $(this).find('input[type=text]').each(function () {
                        setupFieldUpdater('#' + $(this).attr('id'), $(this).data('codename'));
                    });
                    lastHiddenIdx = idx + 1;
                }
            });
            if (lastHiddenIdx == $('.partbox').length || firstHiddenIdx == 0) {
                //LAST ONE. HIDE THE SHOW MORE BUTTON. 
                $('.btnAddName').hide();
            }

        }



        function setSigningOption(sender, adult, children) {
            $('.partButton').each(function () { $(this).removeClass('active'); })
            $(sender).addClass('active');
            showPart2();
            setupSignature();
            if (children) {
                $('#onlinewaiverform<%=ClientID %> .waivermultiple').show();
            } else {
                $('#onlinewaiverform<%=ClientID %> .waivermultiple').hide();
            }
            $('#text_adult_and_children').hide();
            $('#text_adult').hide();
            $('#text_children').hide();

            if (adult && children) {
                $('#<%=hfPartSelection.ClientID%>').val('BOTH');
                $('#text_adult_and_children').show();
            } else if (adult) {
                $('#<%=hfPartSelection.ClientID%>').val('ADULT');
                $('#text_adult').show();
            } else if (children) {
                $('#<%=hfPartSelection.ClientID%>').val('CHILDREN');
                $('#text_children').show();
            } else {
                $('#<%=hfPartSelection.ClientID%>').val('');
            }

            $(".signoptionshow").each(function () {
                var option = $(this).data('signoptionshow');
                if (option == "BOTH") {
                    $(this).show();
                    $('#' + $(this).data('hfvisibleid')).val('visible');
                }
                else if (option == "ADULT" && adult) {
                    $(this).show();
                    $('#' + $(this).data('hfvisibleid')).val('visible');
                } else if (option == "CHILDREN" && children) {
                    $(this).show();
                    $('#' + $(this).data('hfvisibleid')).val('visible');
                } else {
                    $(this).hide();
                    $('#' + $(this).data('hfvisibleid')).val('hidden');
                }
            });

            /*
            $('.signature').each(function () {
                $(this).resize();
            });*/
        }
        function setSpan(fieldID, val) {
            $('span[data-field="' + fieldID + '"]').html(val);
        }
        function setupFieldUpdater(clientID, spanID) {
            $(clientID).keyup(function () { setSpan(spanID, $(this).val()); });
            $(clientID).change(function () { setSpan(spanID, $(this).val()); });
            if ($(clientID).val() != '') {
                setSpan(spanID, $(clientID).val());
            }
        }
        function setAddressInlineUpdate() {
            var addr = $('#<%=txtAddress.ClientID%>').val()
            if ($('#<%=txtAddress2.ClientID%>').val() != '') {
                addr += ', ' + $('#<%=txtAddress2.ClientID%>').val();
            }
            if ($('#<%=txtCity.ClientID%>').val() != '') {
                addr += ', ' + $('#<%=txtCity.ClientID%>').val();
            }
            if ($('#<%=txtState.ClientID%>').val() != '') {
                addr += ', ' + $('#<%=txtState.ClientID%>').val();
            }
            if ($('#<%=txtZip.ClientID%>').val() != '') {
                addr += ', ' + $('#<%=txtZip.ClientID%>').val();
            }
            setSpan('ADDRESS', addr);
        }
        $(function () {

            <%=_docReadyJS%>;

            setupFieldUpdater('#<%=txtSignedNameFirst.ClientID%>', 'FIRST_NAME');


            setupFieldUpdater('#<%=txtSignedName.ClientID%>', 'LAST_NAME');
            setupFieldUpdater('#<%=txtEmail.ClientID%>', 'EMAIL');
            setupFieldUpdater('#<%=txtTelephone.ClientID%>', 'PHONE');

            $('#<%=txtAddress.ClientID%>').keyup(function () { setAddressInlineUpdate(); });
            $('#<%=txtAddress.ClientID%>').change(function () { setAddressInlineUpdate(); });

            $('#<%=txtAddress2.ClientID%>').keyup(function () { setAddressInlineUpdate(); });
            $('#<%=txtAddress2.ClientID%>').change(function () { setAddressInlineUpdate(); });

            $('#<%=txtCity.ClientID%>').keyup(function () { setAddressInlineUpdate(); });
            $('#<%=txtCity.ClientID%>').change(function () { setAddressInlineUpdate(); });

            $('#<%=txtState.ClientID%>').keyup(function () { setAddressInlineUpdate(); });
            $('#<%=txtState.ClientID%>').change(function () { setAddressInlineUpdate(); });

            $('#<%=txtZip.ClientID%>').keyup(function () { setAddressInlineUpdate(); });
            $('#<%=txtZip.ClientID%>').change(function () { setAddressInlineUpdate(); });


            $('#<%=btnAdult.ClientID%>').click(function () { setSigningOption(this, true, false); });
            $('#<%=btnAdultAndChildren.ClientID%>').click(function () { setSigningOption(this, true, true); });
            $('#<%=btnChildren.ClientID%>').click(function () { setSigningOption(this, false, true); });

            <% if (_numButtons <= 1) {
                   %>
            var incAdult = <%= ((bool)(_includeButtonAdult || _includeButtonAdultChildren)).ToString().ToLower() %>;
            var incChild = <%= ((bool)(_includeButtonChildren || _includeButtonAdultChildren)).ToString().ToLower()%>;
            setSigningOption(this, incAdult, incChild);

              <% } %>

            $('*[data-addclass]').each(function () {
                $(this).parentsUntil('div').parent().addClass($(this).data('addclass'));
                $(this).parent().addClass($(this).data('addclass'));
            });
            //if any partbox inputs have a value, show it on load
            $('.partbox input[type=text]').each(function (idx) {
                if ($(this).val() != '') {
                    showPart2();
                    $('#onlinewaiverform<%=ClientID %> .waivermultiple').show();
                    setupFieldUpdater('#' + $(this).attr('id'), $(this).data('codename'));
                }
            });

            $('.partbox').each(function (idx) {

                //SHOW FIRST 3 BOXES OR ANY WITH VALUES
                if (idx < 1) {
                    $(this).css('display', 'block');
                    lastHiddenIdx = idx + 1;
                    $(this).find('input[type=text]').each(function () {
                        setupFieldUpdater('#' + $(this).attr('id'), $(this).data('codename'));
                    });
                } else {
                    var hasVal = false;
                    $(this).find('input[type=text]').each(function () {
                        if ($(this).val() != '') {
                            hasVal = true;
                            setupFieldUpdater('#' + $(this).attr('id'), $(this).data('codename'));
                        }

                    });
                    if (hasVal == true) {
                        $(this).css('display', 'block');
                        lastHiddenIdx = idx + 1;
                    }
                }
            });
            if (lastHiddenIdx == $('.partbox').length) {
                //LAST ONE. HIDE THE SHOW MORE BUTTON. 
                $('.btnAddName').hide();
            }

            $('.btnAddName').click(function () {
                addMorePartBoxes();
            });

            $('input[type="text"]').focus(function () {
                $(this).addClass("activeinput");
            });
            $('input[type="text"]').blur(function () {
                $(this).removeClass("activeinput");
            });

            //TIMER
            var typingTimer;
            var doneTypingInterval = 1500;

            //PASSWORD
            $('#<%=txtPassword.ClientID %>').keyup(function () {

                $('#password_icon').html('<img src="/wp-content/images/loading.gif" alt="Checking Password" />');
            });
            $('#<%=txtPassword.ClientID %>').keydown(function () {
                clearTimeout(typingTimer);
            });



        });



    </script>

    <div id="onlinewaiverform<%=ClientID %>">

         <asp:PlaceHolder ID="phTop" runat="server"></asp:PlaceHolder>

        <h1><%=form.Name %></h1>

        <% if (phEventName.Controls.Count > 0) { %>
        <h3>
            <asp:PlaceHolder ID="phEventName" runat="server"></asp:PlaceHolder>
        </h3>
        <% } %>
        <% if (phLeadInText.Controls.Count > 0) { %>
        <p>
            <asp:PlaceHolder ID="phLeadInText" runat="server"></asp:PlaceHolder>
        </p>
        <% } %>

        <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

         <!-- WAIVER TEXT -->
        <div class="ipa_waiver_text">
            <asp:PlaceHolder ID="phWaiverText" runat="server"></asp:PlaceHolder>
        </div>

        <%
            /*if the login button is hidden, render it in one column. */
            string firstColCssClass = "col-sm-6";
            string secondColCssClass = "col-sm-6";
            if (!ipa_login_button.Visible)
            {
                firstColCssClass = "col-xs-12";
            }
            else if (participationSelectionHidden)
            {
                secondColCssClass = "col-xs-12";
            }
            if (_numButtons <= 1)
            {
                //ONLY ONE OPTION. JUST LOAD IT NOW. 
                firstColCssClass = "hidden";
                hideFormPart2OnLoad = false;
                secondColCssClass = "col-xs-12";
            }
             %>

        <a name="form"></a>
        <div class="row">
            <div class="<%=firstColCssClass %>">
                <div class="text-center" runat="server" id="participationSelection">
                <h3><%=instance.GetLabel("WHO_WILL_BE_PARTICIPATING", conn, site) %></h3>

                <%if (_includeButtonAdult) { %><a href="javascript:void(0);" runat="server" id="btnAdult" class="btn btn-primary partButton"><%=instance.GetLabel("BUTTON_ADULT", conn, site) %></a> &nbsp;<% } %>
                <%if (_includeButtonAdultChildren) { %><a href="javascript:void(0);" runat="server" id="btnAdultAndChildren" class="btn btn-primary partButton"><%=instance.GetLabel("BUTTON_ADULT_AND_CHILDREN", conn, site) %></a> &nbsp;<% } %>
                <%if (_includeButtonChildren) { %><a href="javascript:void(0);" runat="server" id="btnChildren" class="btn btn-primary partButton"><%=instance.GetLabel("BUTTON_CHILDREN", conn, site) %></a><% } %>
            
                <div class="text-center signing-for">
                    <span style="display:none;" class="WPERR_Information" id="text_adult"><%=instance.GetLabel("SIGNING_FOR_ADULT", conn, site) %></span>
                    <span style="display:none;" class="WPERR_Information" id="text_adult_and_children"><%=instance.GetLabel("SIGNING_FOR_ADULT_AND_CHILDREN", conn, site) %></span>
                    <span style="display:none;" class="WPERR_Information" id="text_children"><%=instance.GetLabel("SIGNING_FOR_CHILDREN", conn, site) %></span>
                </div>
                
            </div>

            </div>
            <% if (ipa_login_button.Visible) { %>
            <div class="<%=secondColCssClass %> text-center">
                <span runat="server" id="ipa_login_button" class="login-button"><strong>Have an account? </strong><a href="Login.aspx<%=_loginQueryString %>" class="btn btn-md btn-info btn-sm">Log In Here</a></span>
            </div>
            <% } %>
        </div>
        <hr />
        

        


        
        
        <div id="part2" runat="server">

            
             <%if (form.AllowSigningForSomeoneElse) { %>
             <h3>
                  <%=instance.GetLabel("PARENT_GUARDIAN_INFO", conn, site) %>
             </h3>
            <% } %>
            
        <div class="row">
            <% if (includeFirstNameFields) { %>
            <div class="<%=_colClassFields1 %>">
                <div class="form-group">
                    <label for="<%=txtSignedNameFirst.ClientID %>"><%=instance.GetLabel("LBL_FIRSTNAME", conn, site) %> <span class="text-danger">*</span></label>
                    <asp:TextBox CssClass="form-control" ID="txtSignedNameFirst" runat="server" MaxLength="500"></asp:TextBox>
                </div>
            </div>
            <% } %>
            <div class="<%=_colClassFields1 %>">
                <div class="form-group">
                    <label for="<%=txtSignedName.ClientID %>">
                         <% if (includeFirstNameFields) { %>
                            <%=instance.GetLabel("LBL_LASTNAME", conn, site) %>
                        <% } else { %>
                        <%=instance.GetLabel("YOUR_FULL_NAME", conn, site) %>
                         <% } %>
                        <span class="text-danger">*</span>
                    </label>
                    <asp:TextBox CssClass="form-control" ID="txtSignedName" runat="server" MaxLength="500"></asp:TextBox>
                </div>
            </div>
        

            
            <div id="dobfield" runat="server">
                <div class="form-group">
                <label class="control-label"><%=instance.GetLabel("YOUR_DATE_OF_BIRTH", conn, site) %>
                    <span class="text-danger" id="reqStar_DOB" runat="server">*</span>
                </label>
                    <cc2:WFDatePicker runat="server" ID="dpDOB" />
                    
           </div>
            </div>
            <div runat="server" id="div_email">
                <div class="form-group">
                <label for="<%=txtEmail.ClientID %>" class="control-label"><%=instance.GetLabel("LBL_EMAILADDRESS", conn, site) %> <span class="text-danger" id="reqStar_email" runat="server">*</span>
                </label>
            
                    <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" type="email" MaxLength="500"></asp:TextBox>
                </div>
            </div>
            <div runat="server" id="div_phone">
                <div class="form-group">
                <label for="<%=txtTelephone.ClientID %>" class="control-label"><%=instance.GetLabel("STD_FIELD_LABEL_PHONE", conn, site) %> <span class="text-danger" id="reqStart_phone" runat="server">*</span>
                </label>
            
                    <asp:TextBox CssClass="form-control" ID="txtTelephone" runat="server" type="tel" MaxLength="20"></asp:TextBox>
              </div>
            </div>
        </div>




        <div runat="server" id="div_address">
            <div class="row">
            <div class="col-sm-6">
            <div class="form-group">
                <label for="<%=txtAddress.ClientID %>" class="control-label"><%=instance.GetLabel("LBL_ADDRESS", conn, site) %> <span class="text-danger" id="reqStart_addr1" runat="server">*</span></label>
                
                    <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" MaxLength="500"></asp:TextBox>
            </div>
                </div>
             <div class="col-sm-6">
            <div class="form-group">
                <label for="<%=txtAddress2.ClientID %>" class="control-label"><%=instance.GetLabel("LBL_ADDRESSLINE2", conn, site) %>
                </label>
                
                    <asp:TextBox CssClass="form-control" ID="txtAddress2" runat="server" MaxLength="500"></asp:TextBox>
            </div>
                </div>
</div>

            <div class="row">
                <div class="col-sm-4">
            <div class="form-group">
                <label  for="<%=txtCity.ClientID %>" class="control-label"><%=instance.GetLabel("LBL_CITY", conn, site) %> <span class="text-danger" id="reqStart_addr2" runat="server">*</span>
                   
                </label>
                
                    <asp:TextBox CssClass="form-control" ID="txtCity" runat="server" MaxLength="255"></asp:TextBox>
            </div>
                    </div>
                 <div class="col-sm-4">
            <div class="form-group">
                <label for="<%=txtState.ClientID %>"  class="control-label"><%=instance.GetLabel("LBL_STATE", conn, site) %> <span class="text-danger" id="reqStart_addr3" runat="server">*</span>
                </label>
                
                    <asp:TextBox CssClass="form-control" ID="txtState" runat="server" MaxLength="2"></asp:TextBox>
            </div>
                     </div>
                 <div class="col-sm-4">
            <div class="form-group">
                <label  for="<%=txtZip.ClientID %>" class="control-label"><%=instance.GetLabel("LBL_ZIP", conn, site) %> <span class="text-danger" id="reqStart_addr4" runat="server">*</span>
                </label>
                
                    <asp:TextBox CssClass="form-control" ID="txtZip" runat="server" MaxLength="6"></asp:TextBox>
            </div></div>
                </div>

        </div>
         
            <div class="row">
           <asp:PlaceHolder ID="phAfterStandardFields" runat="server"></asp:PlaceHolder>
        </div>


            <!--/ STANDARD FIELDS -->

                 <!-- CUSTOM QUESTION -->
        <asp:PlaceHolder ID="phQuestions" runat="server"></asp:PlaceHolder>
        <!--/ CUSTOM QUESTION -->

            
             <% if (_includeDateAttending)
                 { %>
               <div class="row">
                     <div class="col-sm-6 col-xs-12">
        <div class="form-group">
            <label  for="<%=rdpDateAttending.ClientID %>"  class="control-label"><%=instance.GetLabel("DATE_ATTENDING", conn, site) %></label>
                <telerik:RadDatePicker ID="rdpDateAttending" runat="server" DateInput-CssClass="form-control" Width="100%"></telerik:RadDatePicker>
            </div>
        </div>
                   </div>
        <%} %>

       <div class="row">
              <asp:PlaceHolder ID="phAfterCustomQuestions" runat="server"></asp:PlaceHolder>
           </div>
       


             <%if (form.AllowSigningForSomeoneElse) { %>
        <!-- MULTIPLE PARTICIPANTS -->
        <div class="waivermultiple" style="display: none;">
            <h3><%=instance.GetLabel("ENTER_PARTICIPANTS_NAMES", conn, site) %></h3>

            <!-- start with 10? -->
            <div id="nameboxes">
                <asp:PlaceHolder ID="phParticipantsPreLoad" runat="server"></asp:PlaceHolder>
            </div>
            

            <div class="clear"></div>
            <div class="form-group text-center">
            <a href="javascript:void(0);" class="btnAddName btn btn-default"><i class="fa fa-plus"></i> <%=instance.GetLabel("LBL_ADDANOTHERNAME", conn, site) %></a>
                </div>

            <div class="clear"></div>
        </div>
        <% } %>
            <div class="row">
            <asp:PlaceHolder ID="phAfterParticipantFields" runat="server"></asp:PlaceHolder>
                </div>

   


        <!-- CREATE PASSWORD -->
        <div class="ipa_createaccount" runat="server" id="ipa_createaccount">
            <div class="row">
                <div class="col-xs-12">
            <h3><strong>* Optional:</strong></h3>
            <p>Create a password to save time and auto-fill your information on your next visit!</p>
            <div class="row">
                    <div class="col-xs-12">
            <div class="form-group" runat="server" id="div_email_alt">
                <label  for="<%=txtEmailAlt.ClientID %>" class="control-label">Email Address
                </label>
                
                    <asp:TextBox CssClass="form-control" ID="txtEmailAlt" runat="server" type="email" MaxLength="500"></asp:TextBox>
                
            </div>
            </div>
                </div>
                     <div class="row">
                          <div class="col-sm-6">


            <div class="form-group">
                <label  for="<%=txtPassword.ClientID %>"  class="control-label">Password</label>
                    <asp:TextBox CssClass="form-control" ID="txtPassword" runat="server" TextMode="Password" AutoCompleteType="None" autocomplete="new-password"></asp:TextBox>
                    <div id="password_reason"></div>
            </div>
                         
                </div>
                      
                     <div class="col-sm-6">
           
            <div id="pass_strength_wrap" style="display:none;">
            Password strength: <span id="pass_strength" style="font-weight:700;"></span><br />
            

        </div>
                </div>
                </div>   </div>
                </div>
        </div>
        <!--/ CREATE PASSWORD -->
            <div class="row">
       <asp:PlaceHolder ID="phAfterCreatePassword" runat="server"></asp:PlaceHolder>
                </div>

       
        <!--/ WAIVER TEXT -->
             
            <asp:Panel ID="pnlJoinMailingList" runat="server">

                <div class="row">
                    <div class="col-xs-12">
                <div class="form-group">
                    <asp:CheckBox runat="server" ID="chkJoinMailingList"></asp:CheckBox>
                    <asp:PlaceHolder runat="server" ID="phJoinMailingListHelpBlock"></asp:PlaceHolder>
                </div></div>
                    </div>

            </asp:Panel>
    <div class="row">
               <asp:PlaceHolder ID="phAfterJoinMailingList" runat="server"></asp:PlaceHolder>
        </div>

            <div class="" id="div_sig_main"></div>
       <a href="javascript:void(0);" class="btnsign btn btn-primary btn-lg btn-block" data-sigdiv="div_sig_main">Sign Here</a>
          

             <% if (_includeCaptcha)
           { %>
            <div class="row">
                   <div class="col-sm-6 col-xs-12">
        <div class="form-group">
            <label  for="<%=RadCaptcha1.ClientID %>" class="control-label"><%=instance.GetLabel("CAPTCHA", conn, site) %></label>
                <telerik:RadCaptcha ID="RadCaptcha1" runat="server" InvisibleTextBoxLabel="true" CaptchaTextBoxLabel="" CaptchaTextBoxCssClass="form-control"></telerik:RadCaptcha>
            </div></div>
        </div>
        <%} %><div class="row">

                <asp:PlaceHolder ID="phJustBeforeSubmit" runat="server"></asp:PlaceHolder>
            </div>

        <!-- AGREE -->
        <p class="help-block"><%=instance.GetLabel("AGREEMENT_TEXT", conn, site) %> </p>

            <div id="messages"></div>

            <asp:PlaceHolder ID="phSigHiddenFields" runat="server"></asp:PlaceHolder>

        <asp:Button ID="btnSubmit" runat="server" Text="I Agree" OnClientClick="return detectPartDupes();"  OnClick="btnSubmit_Click" CssClass="btn btn-primary btn-lg" />
        <!--/ AGREE -->

    </div><!-- part2 -->

    </div>
</asp:Panel>
