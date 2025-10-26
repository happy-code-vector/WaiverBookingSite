<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WaiverFormEntry3.ascx.cs" Inherits="WaiverFile.Controls.WaiverFormEntry3" %>
<%@ Register Assembly="WaiverFile" Namespace="WaiverFile.Core" TagPrefix="cc2" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Waypoint" Namespace="Waypoint.Forms" TagPrefix="cc1" %>



<asp:HiddenField ID="hfSignatureData" runat="server"/>
<asp:HiddenField ID="hfInitialData" runat="server"/>
<asp:HiddenField ID="hfSignatureIndexes" runat="server"/>
<asp:HiddenField ID="hfInitialIndexes" runat="server"/>


<!-- Keep these existing libraries -->
<link rel="stylesheet" href="/wp-content/Plugins/WaiverFile/Docs/FormValidation/fixes.css" />
<link rel="stylesheet" href="/site/includes/intlTelInput.css">
<script type="text/javascript" src="/wp-content/Plugins/WaiverFile/Docs/jSignature/jSignature.js?v=5"></script>
<script type="text/javascript" src="/wp-content/Plugins/WaiverFile/Docs/jSignature/jSignature.CompressorBase30.js?v=3"></script>
<script type="text/javascript" src="/wp-content/Plugins/WaiverFile/Docs/jSignature/jSignature.CompressorSVG.js?v=3"></script>
<script type="text/javascript" src="/wp-content/Plugins/WaiverFile/Docs/jSignature/jSignature.SignHere.js?v=3"></script>
<script src="/site/includes/intlTelInput.min.js"></script>
<script src="/site/includes/jquery.mask.min.js"></script>

<% if (!includeFirstNameFields) { %>
<style type="text/css"> .firstname { display: none; } </style>
<% } %>
<style type="text/css"> .signature{ -ms-touch-action:none; } </style>

<script type="text/javascript">
    // ---------- Bootstrap 5 modal helpers ----------
    function openModal(id) {
        var el = document.getElementById(id);
        new bootstrap.Modal(el).show();
    }
    function closeModal(id) {
        var el = document.getElementById(id);
        var inst = bootstrap.Modal.getInstance(el) || new bootstrap.Modal(el);
        inst.hide();
    }

    var success = false;
    var currentHFID = '';
    var currentIMGDIVID = '';
    var currentButtonToHide = '';
    var sigAdoptDisabled = <%=_sigAdoptDisabled.ToString().ToLower() %>;
    var currSelectedSigningOptionAdult = false;
    var currSelectedSigningOptionChildren = false;

    if (!String.prototype.startsWith) {
        String.prototype.startsWith = function (searchString, position) {
            position = position || 0;
            return this.substr(position, searchString.length) === searchString;
        };
    }

    function getScore(password) {
        var score = 0;
        if (password.length < 1) return 0;
        if (password.length < 4) return 1;
        if (password.length >= 8) score++;
        if (password.length >= 12) score++;
        if (/\d+/.test(password)) score++;
        if (/[a-z]/.test(password) && /[A-Z]/.test(password)) score++;
        if (/[!,@,#,$,%,^,&,*,?,_,~,\-,£,(,)]/.test(password)) score++;
        return score;
    }
   
    function dateCompare(date1, date2) { return Math.round((date1 - date2) / (1000 * 60 * 60 * 24)); }
    function convertToISODate(telerikDate) {
        var dateFormat = '<%=WaiverFile.Core.WFDatePicker.GetDateFormat(site, false)%>';
        if (dateFormat == 'dd/MM/yyyy') {
            return telerikDate.substring(6, 10) + "-" + telerikDate.substring(3, 5) + '-' + telerikDate.substring(0, 2);
        } else if (dateFormat == 'yyyy/MM/dd') {
            return telerikDate.substring(0, 4) + "-" + telerikDate.substring(5, 7) + "-" + telerikDate.substring(8, 10);
        } else if (dateFormat == 'MM/dd/yyyy' || dateFormat == 'M/d/yyyy') {
            return telerikDate.substring(6, 10) + '-' + telerikDate.substring(0, 2) + "-" + telerikDate.substring(3, 5);
        } else { return telerikDate; }
    }
    function dateAttendingCheck(sender, eventArgs) {
        var isoDate = convertToISODate(eventArgs.get_newValue());
        var newDate = new Date(isoDate);
        var strWarnDays = '<%=strWarnDays %>';
        var warnDays = Number(strWarnDays);
        var d = new Date();
        var diffDays = dateCompare(newDate, d);
        if (diffDays > strWarnDays) { $('#lbl_dateatt_warn').show(); } else { $('#lbl_dateatt_warn').hide(); }
    }

    function detectPartDupes() {
        var arrFirst = [], arrLast = [], arrFirstIDs = [], arrLastIDs = [];
        $('.partbox').each(function () {
            $(this).find('input[type=text]').each(function () {
                var attr = $(this).attr('id');
                if (typeof attr !== typeof undefined && attr !== false) {
                    if ($(this).attr('id').indexOf('txtFirst') != -1) { arrFirst.push($(this).val()); arrFirstIDs.push($(this).attr('id')); }
                    if ($(this).attr('id').indexOf('txtLast') != -1) { arrLast.push($(this).val()); arrLastIDs.push($(this).attr('id')); }
                }
            });
        });
        var dupesCleared = false;
        for (var i = 1; i < arrLast.length; i++) {
            if (arrLast[i] != '' && (arrFirst.length == 0 || arrFirst[i] != '')) {
                for (var j = 0; j < i; j++) {
                    if (arrFirst.length == 0) {
                        if (arrLast[i] == arrLast[j]) { dupesCleared = true; $('#' + arrLastIDs[i]).val(''); }
                    } else {
                        if (arrLast[i] == arrLast[j] && arrFirst[i] == arrFirst[j]) {
                            dupesCleared = true; $('#' + arrLastIDs[i]).val(''); $('#' + arrFirstIDs[i]).val('');
                        }
                    }
                }
            }
        }
        if (dupesCleared) { alert('Duplicate participants were detected and removed. Please review the names listed and try again. '); return false; }
        else { return true; }
    }

    function handleTypeToSign() {
        <% if( _signatureMode == SignatureModeEnum.Type_only) { %>
        $('#typename').show(); $('#signature_wrap').hide();
        $('#typeinit').show(); $('#init_wrap').hide();
        <% } else { %>
        if ($('#<%=chkTypeSignature.ClientID%>').is(':checked')) { $('#typename').show(); $('#signature_wrap').hide(); } else { $('#typename').hide(); $('#signature_wrap').show(); }
        if ($('#<%=chkTypeInitials.ClientID%>').is(':checked')) { $('#typeinit').show(); $('#init_wrap').hide(); } else { $('#typeinit').hide(); $('#init_wrap').show(); }
        <% } %>
    }

    function setupBtnSignHandlers() {
        $('.btnsign').click(function () {
            var currVal = $('#' + $(this).data('hfid')).val();
            if (!currVal.startsWith('__TYPED__')) {
                var svgRaw = base64_decode(currVal);
                if (svgRaw.indexOf('width="0"') != -1 || svgRaw.indexOf('height="0"') != -1) { $('#' + $(this).data('hfid')).val(''); }
            }
            if (sigAdoptDisabled || $('#' + $(this).data('hfid')).val() == '') {
                currentHFID = $(this).data('hfid'); currentIMGDIVID = $(this).data('imgdiv'); currentButtonToHide = $(this);
                openModal('modalSign');
                setupSigBox();
                <% if (site.IsIFrameMode) { %>
                var top = $(this).offset().top; top += $(this).height() / 2; if (top < 0) { top = 0; }
                $("#modalSign").css({ top: top + "px", left: '50%', 'margin-left': '-' + ($('#modalSign').width() / 2) + 'px', 'margin-top': '0', 'margin-right': '0', 'margin-bottom': '0' });
                <% } %>
            } else {
                if ($('#<%=hfSignatureData.ClientID%>').val().startsWith('__TYPED__')) {
                    $(this).replaceWith('<span class="sigtyped">' + $('#<%=hfSignatureData.ClientID%>').val().substring(9) + '</span>');
                } else {
                    $(this).replaceWith('<img src="data:image/svg+xml;base64,' + $('#<%=hfSignatureData.ClientID%>').val() + '" class="img-signature img-fluid" />');
                }
            }
            <% if (!_sigAdoptDisabled) { %>
            if ($(this).data('isnoadopt') != 'true' && $(this).data('isnoadopt') != true) {
                $('#<%=hfSignatureIndexes.ClientID%>').val($('#<%=hfSignatureIndexes.ClientID%>').val() + $(this).data('idx') + ',');
            }
            <% } %>
        });

        $('.btninitial').click(function () {
            var currVal = $('#' + $(this).data('hfid')).val();
            if (!currVal.startsWith('__TYPED__')) {
                var svgRaw = base64_decode(currVal);
                if (svgRaw.indexOf('width="0"') != -1 || svgRaw.indexOf('height="0"') != -1) { $('#' + $(this).data('hfid')).val(''); }
            }
            if (sigAdoptDisabled || $('#' + $(this).data('hfid')).val() == '' || $('#' + $(this).data('hfid')).val() == '__TYPED__' || $('#<%=hfInitialData.ClientID%>').val() == '') {
                currentHFID = $(this).data('hfid'); currentIMGDIVID = $(this).data('imgdiv'); currentButtonToHide = $(this);
                openModal('modalInitial');
                setupInitBox();
                <% if (site.IsIFrameMode) { %>
                var top = $(this).offset().top; top += $(this).height() / 2; if (top < 0) { top = 0; }
                $("#modalInitial").css({ top: top + "px", left: '50%', 'margin-left': '-' + ($('#modalInitial').width() / 2) + 'px', 'margin-top': '0', 'margin-right': '0', 'margin-bottom': '0' });
                <% } %>
            } else {
                if ($('#<%=hfInitialData.ClientID%>').val().startsWith('__TYPED__')) {
                    var typedVal = $('#<%=hfInitialData.ClientID%>').val().substring(9);
                    if (typedVal == '') { return; }
                    $(this).replaceWith('<span class="initialtyped">' + typedVal + '</span>');
                } else {
                    $(this).replaceWith('<img src="data:image/svg+xml;base64,' + $('#<%=hfInitialData.ClientID%>').val() + '" class="img-initial img-fluid" />');
                }
            }
            <% if (!_sigAdoptDisabled) { %>
            if ($(this).data('isnoadopt') != 'true' && $(this).data('isnoadopt') != true) {
                $('#<%=hfInitialIndexes.ClientID%>').val($('#<%=hfInitialIndexes.ClientID%>').val() + $(this).data('idx') + ',');
            }
            <% } %>
        });
    }

    function handleMaxParts() {
        <% if (_maxBoxesToPrep > 0) { %>
        var maxBoxes = <%=_maxBoxesToPrep%>;
        if (currSelectedSigningOptionAdult && currSelectedSigningOptionChildren) { maxBoxes--; }
        var numVisible = 0;
        $('.partbox').each(function (idx) {
            if ($(this).css('display') != 'none') {
                numVisible++;
                if (idx >= maxBoxes) {
                    $(this).find('input[type=text]').each(function () { $(this).val(''); });
                    $(this).hide();
                }
            }
        });
        if (numVisible < maxBoxes) { $('.btnAddName').show(); } else { $('.btnAddName').hide(); }
        <% } %>
    }

    var mobileNumLateValidatePending = false;
    function mobleNumLateValidate() {
        if (mobileNumLateValidatePending == true) return;
        mobileNumLateValidatePending = true;
        setTimeout(() => {
            if ($('#Form1').length) {
                // Revalidate with FV (Bootstrap5 plugin)
                // Lookup by element rather than name to be robust:
                var el = document.getElementById('<%=txtMobileNum.ClientID%>');
                if (window._fvInstance && el) {
                    _fvInstance.revalidateField(el);
                }
            }
            mobileNumLateValidatePending = false;
        }, 500);
    }

    $(function () {
        setupBtnSignHandlers();

        $('#btnSmsSignupTerms').click(function () { openModal('modalSmsTerms'); });
        $('#<%=txtMobileNum.ClientID%>').on('input', function (e) { mobleNumLateValidate(); });

        var sigIndexesPrePop = $('#<%=hfSignatureIndexes.ClientID%>').val().split(',');
        var initIndexesPrePop = $('#<%=hfInitialIndexes.ClientID%>').val().split(',');

        // Pre-pop signature after postback
        $('.btnsign').each(function () {
            var loadVal = $('#' + $(this).data('hfid')).val();
            if (loadVal != '' && loadVal != '__TYPED__') {
                var svgRaw = base64_decode(loadVal);
                if (svgRaw.indexOf('width="0"') != -1 || svgRaw.indexOf('height="0"') != -1) { loadVal = ''; }
            }
            if (loadVal != '' && loadVal != '__TYPED__' <% if(!_sigAdoptDisabled) { %> && sigIndexesPrePop.indexOf($(this).data('idx').toString()) != -1 <% } %>) {
                if (loadVal.startsWith('__TYPED__')) {
                    var typedVal = loadVal.substr(9); if (typedVal == '') { return; }
                    $('#' + $(this).data('imgdiv')).html('<a href="javascript:void(0);" class="btnsign" data-hfid="' + $(this).data('hfid') + '" data-imgdiv="' + $(this).data('imgdiv') + '"><span class="sigtyped">' + typedVal + '</span></a>');
                } else {
                    var htmlImg = '<img src="data:image/svg+xml;base64,' + loadVal + '" class="img-signature img-fluid" />';
                    $('#' + $(this).data('imgdiv')).html(htmlImg);
                }
                $(this).hide();
            }
        });

        $('.btninitial').each(function () {
            var loadVal = $('#' + $(this).data('hfid')).val();
            if (loadVal != '' && loadVal != '__TYPED__') {
                var svgRaw = base64_decode(loadVal);
                if (svgRaw.indexOf('width="0"') != -1 || svgRaw.indexOf('height="0"') != -1) { loadVal = ''; }
            }
            if (loadVal != '' && loadVal != '__TYPED__' && initIndexesPrePop.indexOf($(this).data('idx').toString()) != -1) {
                if (loadVal.startsWith('__TYPED__')) {
                    var typedVal = loadVal.substr(9); if (typedVal == '') { return; }
                    $('#' + $(this).data('imgdiv')).html('<a href="javascript:void(0);" class="btninitial" data-hfid="' + $(this).data('hfid') + '" data-imgdiv="' + $(this).data('imgdiv') + '"><span class="sigtyped">' + typedVal + '</span></a>');
                } else {
                    var htmlImg = '<img src="data:image/svg+xml;base64,' + loadVal + '" class="img-initial img-fluid" />';
                    $('#' + $(this).data('imgdiv')).html(htmlImg);
                }
                $(this).hide();
            }
        });

        $('.btnremovepart').each(function () {
            $(this).click(function () {
                $(this).parents('.partbox').find('input[type=text]').each(function () { $(this).val(''); });
                $(this).parents('.partbox').hide();
                handleMaxParts();
            });
        });

        $('#<%=btnSigAdopt.ClientID%>').click(function () {
            if ($('#typename').is(':visible')) {
                var typedVal = $('#<%=txtFullNameTypeToSign.ClientID%>').val();
                if (typedVal == '') {
                    $('#modalSignErr').show().addClass('WPERR_Validation').html('Signature cannot be blank');
                } else {
                    $('#' + currentHFID).val('__TYPED__' + typedVal);
                    $('#modalSignErr').hide(); currentButtonToHide.hide();
                    $('#' + currentIMGDIVID).html('<a href="javascript:void(0);" class="btnsign" data-hfid="' + currentHFID + '" data-imgdiv="' + currentIMGDIVID + '"><span class="sigtyped">' + typedVal + '</span></a>');
                    closeModal('modalSign');
                    setupBtnSignHandlers();
                }
            } else {
                if ($('#' + currentHFID).val().length <= 476) {
                    $('#modalSignErr').show().addClass('WPERR_Validation').html('Signature cannot be blank');
                } else {
                    $('#modalSignErr').hide(); currentButtonToHide.hide();
                    var htmlImg = '<img src="data:image/svg+xml;base64,' + $('#' + currentHFID).val() + '" class="img-signature img-fluid" />';
                    if (sigAdoptDisabled) {
                        htmlImg = '<a href="javascript:void(0);" class="btnsign" data-hfid="' + currentHFID + '" data-imgdiv="' + currentIMGDIVID + '">' + htmlImg + '</a>';
                    }
                    $('#' + currentIMGDIVID).html(htmlImg);
                    closeModal('modalSign');
                    setupBtnSignHandlers();
                }
            }
            if (currentIMGDIVID == 'div_sig_main') { window.scrollTo({ top: document.body.scrollHeight, behavior: 'smooth' }); }
        });

        $('#<%=btnInitAdopt.ClientID%>').click(function () {
            if ($('#typeinit').is(':visible')) {
                var typedVal = $('#<%=txtTypeInitials.ClientID%>').val();
                $('#' + currentHFID).val('__TYPED__' + typedVal);
                if (typedVal == '') {
                    $('#modalInitialErr').show().addClass('WPERR_Validation').html('Initials cannot be blank');
                } else {
                    $('#modalInitialErr').hide(); currentButtonToHide.hide();
                    $('#' + currentIMGDIVID).html('<a href="javascript:void(0);" class="btninitial" data-hfid="' + currentHFID + '" data-imgdiv="' + currentIMGDIVID + '"><span class="initialtyped">' + typedVal + '</span></a>');
                    closeModal('modalInitial');
                    setupBtnSignHandlers();
                }
            } else {
                if ($('#' + currentHFID).val().length <= 476) {
                    $('#modalInitialErr').show().addClass('WPERR_Validation').html('Initials cannot be blank');
                } else {
                    $('#modalInitialErr').hide(); currentButtonToHide.hide();
                    $('#' + currentIMGDIVID).html('<a href="javascript:void(0);" class="btninitial" data-hfid="' + currentHFID + '" data-imgdiv="' + currentIMGDIVID + '"><img src="data:image/svg+xml;base64,' + $('#' + currentHFID).val() + '" class="img-initial img-fluid" /></a>');
                    closeModal('modalInitial');
                    setupBtnSignHandlers();
                }
            }
        });

        $('.riTextBox').attr('placeholder', 'MM/DD/YYYY');
        handleTypeToSign();
        $('#<%=chkTypeSignature.ClientID%>').change(handleTypeToSign);
        $('#<%=chkTypeInitials.ClientID%>').change(handleTypeToSign);

      

        $('.move_attribs_to_child_input').each(function () {
            var target = $(this).find('input'); var source = $(this);
            $.each($(this).prop('attributes'), function () { if (this.name.substring(0, 4) == 'data') { $(target).attr(this.name, this.value); } });
            $.each($(this).prop('attributes'), function () { if (this.name.substring(0, 4) == 'data') { $(source).removeAttr(this.name); } });
        });

        $("input[data-ensuretrigger='true']").change(function () {
            var master = $("input[data-fieldcidmaster='" + $(this).data('fieldcidalt') + "']");
            if (window._fvInstance && master.length) { _fvInstance.revalidateField(master[0]); }
        });

        <% if(!((Waypoint.Core.WPPageLite)Page).IsEditMode){ %>
        // ---------- FormValidation.io (Bootstrap 5) init ----------
        window._fvInstance = FormValidation.formValidation(
            document.getElementById('Form1'),
            {
                fields: {
                    '<%=txtEmail.ClientID %>': {
                        validators: {
                            emailAddress: { message: 'Please enter a valid email' }
                        }
                    },
                    '<%=txtEmailConfirm.ClientID %>': {
                        validators: {
                            identical: {
                                compare: function () { return document.getElementById('<%=txtEmail.ClientID %>').value; },
                                message: 'Email address confirmation does not match'
                            }
                        }
                    }
                },
                plugins: {
                    trigger: new FormValidation.plugins.Trigger(),
                    submitButton: new FormValidation.plugins.SubmitButton(),
                    bootstrap5: new FormValidation.plugins.Bootstrap5({
                        rowSelector: '.mb-3'
                    }),
                    defaultSubmit: new FormValidation.plugins.DefaultSubmit()
                }
            }
        );

        <% if(IsPostBack){ %>
        // Re-validate after postback like before
        window._fvInstance.validate().then(function (status) {
            $('#<%=btnSubmit.ClientID%>').prop('disabled', false).removeClass('disabled');
        });
        <% } %>
        <% } %>
    });
</script>

<asp:Panel ID="pnlMobileNumScript" runat="server">
    <script type="text/javascript">
        $(function () {
            var phoneInputID = "#txtMobileNum";
            if ($(phoneInputID).length) {
                var input = document.querySelector("#txtMobileNum");
                var iti = window.intlTelInput(input, {
                    formatOnDisplay: true,
                    hiddenInput: "rawNum",
                    initialCountry: "<%=_defaultCountryCode.ToLower()%>",
                    onlyCountries: ['us', 'ca'],
                    utilsScript: "/site/includes/utils.js",
                });
                $(phoneInputID).on('countrychange', function (e) {
                    $('#<%=hfCountry.ClientID%>').val(iti.getSelectedCountryData().iso2);
                    var selectedCountryData = iti.getSelectedCountryData();
                    newPlaceholder = intlTelInputUtils.getExampleNumber(selectedCountryData.iso2, true, intlTelInputUtils.numberFormat.INTERNATIONAL),
                        mask = newPlaceholder.replace(/[1-9]/g, "0");
                    $(this).mask(mask);
                });
                iti.promise.then(function () { $(phoneInputID).trigger("countrychange"); });
            }
        });
    </script>
</asp:Panel>

<asp:HiddenField runat="server" id="hfPartSelection"></asp:HiddenField>

<!-- ========================= Modals (Bootstrap 5 structure) ========================= -->
<div id="modalSign" class="modal fade footer-to-bottom" tabindex="-1" aria-hidden="true">
   <div class="modal-dialog modal-fullscreen modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title"><asp:Label runat="server" ID="lblDialogHeadingInitialSignature">Signature</asp:Label></h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div id="modalSignErr"></div>

        <% if (_signatureMode == SignatureModeEnum.Signature_or_type || _signatureMode == SignatureModeEnum.Type_only) { %>
          <% if (_signatureMode == SignatureModeEnum.Signature_or_type) { %>
            <div class="mb-3">
              <asp:CheckBox runat="server" ID="chkTypeSignature" />
              <asp:Label ID="lblTypeSignature" runat="server"></asp:Label>
            </div>
          <% } %>
          <div id="typename" style="display:none;">
            <div class="mb-3">
              <label for="<%=txtFullNameTypeToSign.ClientID %>" class="form-label"><%=instance.GetLabel("YOUR_FULL_NAME", conn, site) %></label>
              <asp:TextBox runat="server" CssClass="form-control" ID="txtFullNameTypeToSign" AutoCompleteType="Disabled" autocomplete="off"></asp:TextBox>
            </div>
            <p class="form-text">Signature Preview:</p>
            <div id="signpreview"></div>
          </div>
        <% } %>

        <div id="signature_wrap">
          <div class="mb-3">
            <asp:Label ID="lblSignatureDesc" runat="server"></asp:Label>
            <div class="float-end"></div>
          </div>
          <div id="signature_main" class="signature fixer" data-region="main" data-mode="signature"></div>
        </div>
      </div>
      <div class="modal-footer">
        <div class="row w-100 g-2">
          <div class="col-sm-4 col-3" style="padding-right:7px;"><a href="javascript:void(0);" data-region="main" runat="server" id="btnSigClear" class="btn btn-secondary w-100 btnClearSig"><%=instance.GetLabel("BTN_CLEAR", conn, site) %></a></div>
          <div class="col-sm-4 col-3" style="padding-right:7px;padding-left:7px;"><a href="javascript:void(0);" data-region="main" runat="server" id="btnSigCancel" class="btn btn-secondary w-100 btnClearSig closesignmodal" data-bs-dismiss="modal"><%=instance.GetLabel("BTN_CANCEL", conn, site) %></a></div>
          <div class="col-sm-4 col-6" style="padding-left:7px;"><a href="javascript:void(0);" runat="server" id="btnSigAdopt" class="btn btn-primary w-100">Adopt Signature</a></div>
        </div>
      </div>
    </div>
  </div>
</div>

<div id="modalInitial" class="modal fade footer-to-bottom" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title"><asp:Label runat="server" ID="lblDialogHeadingInitialInitial">Initial</asp:Label></h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div id="modalInitialErr"></div>

        <% if (_signatureMode == SignatureModeEnum.Signature_or_type || _signatureMode == SignatureModeEnum.Type_only) { %>
          <% if (_signatureMode == SignatureModeEnum.Signature_or_type) { %>
            <div class="mb-3">
              <asp:CheckBox runat="server" ID="chkTypeInitials" />
              <asp:Label ID="lblTypeInitials" runat="server"></asp:Label>
            </div>
          <% } %>
          <div id="typeinit" style="display:none;">
            <div class="mb-3">
              <label for="<%=txtTypeInitials.ClientID %>" class="form-label"><%=instance.GetLabel("YOUR_INITIALS", conn, site) %></label>
              <asp:TextBox runat="server" CssClass="form-control" ID="txtTypeInitials" AutoCompleteType="Disabled" autocomplete="off"></asp:TextBox>
            </div>
            <p class="form-text">Initials Preview:</p>
            <div id="initialpreview"></div>
          </div>
        <% } %>

        <div id="init_wrap">
          <div id="initial_main" class="signature fixer" data-region="initmain" data-mode="initial"></div>
        </div>
      </div>
      <div class="modal-footer">
        <div class="row w-100 g-2">
          <div class="col-4"><a href="javascript:void(0);" runat="server" data-region="initmain" id="A1" class="btn btn-secondary w-100 btnClearSig"><%=instance.GetLabel("BTN_CLEAR", conn, site) %></a></div>
          <div class="col-4"><a href="javascript:void(0);" runat="server" data-region="initmain" id="A2" class="btn btn-secondary w-100 btnClearSig closeinitmodal" data-bs-dismiss="modal"><%=instance.GetLabel("BTN_CANCEL", conn, site) %></a></div>
          <div class="col-4"><a href="javascript:void(0);" runat="server" id="btnInitAdopt" class="btn btn-primary w-100">Adopt Initials</a></div>
        </div>
      </div>
    </div>
  </div>
</div>

<div id="modalSmsTerms" class="modal fade footer-to-bottom" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="btn-close ms-auto" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <asp:PlaceHolder ID="phSmsSignupTerms" runat="server"></asp:PlaceHolder>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- ========================= /Modals ========================= -->

<div class="login-button-wrap float-end" <%=_hideAllCode %>>
    <asp:LinkButton runat="server" ID="btnSkip" CssClass="btn btn-secondary novalidate ms-2" Text="Skip This Form" OnClick="btnSkip_Click" CausesValidation="false" ValidationGroup="disable" />
    <% if(!IsBookingMode && !_directEventMode && !string.IsNullOrWhiteSpace(instance.GetLabel("GO_BACK", conn, site))){ %>
      <a href="<%=_backUrl %>" class="btn btn-secondary ms-2"><%=instance.GetLabel("GO_BACK", conn, site) %></a>
    <% } %>
    
</div>

<asp:Panel runat="server" ID="pnlEventDescriptionPage">
   <h3><asp:PlaceHolder ID="phRegisteringFor1" runat="server"></asp:PlaceHolder></h3>
   <asp:PlaceHolder ID="phEvtDescription" runat="server"></asp:PlaceHolder>
   <p class="text-center">
     <a href="#" runat="server" id="btnDescriptionContinue" class="btn btn-lg btn-primary"><%=instance.GetLabel("BTN_EVT_DESC_CONTINUE", conn, site) %></a>
   </p>
</asp:Panel>

<asp:PlaceHolder ID="phHideAllMessage" runat="server"></asp:PlaceHolder>
<style>
    #signature_main canvas{ border:1px solid #cecece !important; }
    modal-footer{ padding-bottom:30px; }
</style>
<asp:Panel ID="pnlWaiver" runat="server" DefaultButton="">
    <script type="text/javascript">
        var lastHiddenIdx = 0;
        function touchEnabled() { return 'ontouchstart' in window || navigator.maxTouchPoints; }

        function setupSigBox() {
           
            $('#signature_main').empty();
            $(window).unbind('.jSignature');
            $("#signature_main").each(function () {
                var $sig = $('#signature_main');
                var $body = $sig.closest('.modal-body');
                var w = $(window).width();
                var targetw = Math.floor($body.width());
                if (targetw < 101) { targetw = w - 50; }
                //$(this).jSignature({ height: '280px', width: targetw + 'px' });
                $(this).jSignature({ height: '380px', width: targetw + 'px' });
                console.log('set to ' + targetw);
                $(this).bind('change', function () {
                    var datapair = $(this).jSignature("getData", "svgbase64");
                    $('#' + currentHFID).val(datapair[1]);
                });
            });
        }
        function setupInitBox() {
            $('#initial_main').empty();
            $(window).unbind('.jSignature');
            $("#initial_main").each(function () {
                var $sig = $('#signature_main');
                var $body = $sig.closest('.modal-body');
                var w = $(window).width();
                var targetw = Math.floor($body.width());
                if (targetw < 101) { targetw = w - 50; }
                //$(this).jSignature({ height: '280px', width: targetw + 'px' });
                $(this).jSignature({ height: '380px', width: targetw + 'px' });
                $(this).bind('change', function () {
                    var datapair = $(this).jSignature("getData", "svgbase64");
                    $('#' + currentHFID).val(datapair[1]);
                });
            });
        }
        function stopRKey(evt) {
            var evt = (evt) ? evt : ((event) ? event : null);
            var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
            if ((evt.keyCode == 13) && (node.type == "text")) { return false; }
        }
        document.onkeypress = stopRKey;

        $.fn.enterKey = function (fnc) {
            return this.each(function () {
                $(this).keypress(function (ev) {
                    var keycode = (ev.keyCode ? ev.keyCode : ev.which);
                    if (keycode == '13') { fnc.call(this, ev); }
                })
            })
        }

        function hidePart2() { $('#<%=part2.ClientID%>').hide(); }
        function showPart2() {
            $(".signature").each(function (i, o) { $(o).resize() });
            $('#<%=part2.ClientID%>').show();
        }

        $(function () {
            $("#<%=txtTypeInitials.ClientID%>").enterKey(function () { $('#<%=btnInitAdopt.ClientID%>').click(); });
            $("#<%=txtFullNameTypeToSign.ClientID%>").enterKey(function () { $('#<%=btnSigAdopt.ClientID%>').click(); });

            var w = 0;
            $(window).on('load', function () { w = $(window).width(); });
            $(window).resize(function () {
                if (w != $(window).width()) {
                    if (document.getElementById('modalSign').classList.contains('show')) { setupSigBox(); }
                    if (document.getElementById('modalInitial').classList.contains('show')) { setupInitBox(); }
                    w = $(window).width();
                }
            });

            <% if (hideFormPart2OnLoad) { %> hidePart2(); <% } %>

            $('.btnClearSig').each(function () {
                $(this).click(function () {
                    $('#<%=txtFullNameTypeToSign.ClientID%>').val('');
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
                if ($(this).css('display') == 'none') { firstHiddenIdx = idx; return false; }
            });
            $('.partbox').each(function (idx) {
                if (idx >= firstHiddenIdx && idx < firstHiddenIdx + 1) {
                    $(this).css('display', 'block');
                    $(this).find('input[type=text]').each(function () { setupFieldUpdater('#' + $(this).attr('id'), $(this).data('codename')); });
                    lastHiddenIdx = idx + 1;
                }
            });
            if (lastHiddenIdx == $('.partbox').length || firstHiddenIdx == 0) { $('.btnAddName').hide(); }
            handleMaxParts();
        }

        function setSigningOption(sender, adult, children) {
            currSelectedSigningOptionAdult = adult;
            currSelectedSigningOptionChildren = children;
            handleMaxParts();
            $('.partButton').each(function () { $(this).removeClass('active'); })
            $(sender).addClass('active');
            showPart2();
            if (children) { $('#onlinewaiverform<%=ClientID %> .waivermultiple').show(); } else { $('#onlinewaiverform<%=ClientID %> .waivermultiple').hide(); }
            $('#text_adult_and_children').hide(); $('#text_adult').hide(); $('#text_children').hide();

            if (adult && children) {
                $('#<%=hfPartSelection.ClientID%>').val('BOTH'); $('#text_adult_and_children').show();
            } else if (adult) {
                $('#<%=hfPartSelection.ClientID%>').val('ADULT'); $('#text_adult').show();
            } else if (children) {
                $('#<%=hfPartSelection.ClientID%>').val('CHILDREN'); $('#text_children').show();
            } else {
                $('#<%=hfPartSelection.ClientID%>').val('');
            }

            $(".signoptionshow").each(function () {
                var option = $(this).data('signoptionshow');
                if (option == "BOTH" || (option == "ADULT" && adult) || (option == "CHILDREN" && children)) {
                    $(this).show(); $('#' + $(this).data('hfvisibleid')).val('visible');
                } else {
                    $(this).hide(); $('#' + $(this).data('hfvisibleid')).val('hidden');
                }
            });
        }
        function GoToToday() {
            var datepicker = $find("<%=rdpDateAttending.ClientID%>");
            var dt = new Date();
            datepicker.set_selectedDate(dt);
            datepicker.hidePopup();
        }
        function setSpan(fieldID, val) { $('span[data-field="' + fieldID + '"]').html(val); }
        function setInitPreview() { var typedVal = $('#<%=txtTypeInitials.ClientID%>').val(); $('#initialpreview').html(typedVal); $('#' + currentHFID).val('__TYPED__' + typedVal); }
        function setSignPreview() { var typedVal = $('#<%=txtFullNameTypeToSign.ClientID%>').val(); $('#signpreview').html(typedVal); $('#' + currentHFID).val('__TYPED__' + typedVal); }
        function setupFieldUpdater(clientID, spanID) {
            $(clientID).keyup(function () { setSpan(spanID, $(this).val()); });
            $(clientID).change(function () { setSpan(spanID, $(this).val()); });
            if ($(clientID).val() != '') { setSpan(spanID, $(clientID).val()); }
        }
        function setAddressInlineUpdate() {
            var addr = $('#<%=txtAddress.ClientID%>').val()
            if ($('#<%=txtAddress2.ClientID%>').val() != '') { addr += ', ' + $('#<%=txtAddress2.ClientID%>').val(); }
            if ($('#<%=txtCity.ClientID%>').val() != '') { addr += ', ' + $('#<%=txtCity.ClientID%>').val(); }
            if ($('#<%=txtState.ClientID%>').val() != '') { addr += ', ' + $('#<%=txtState.ClientID%>').val(); }
            if ($('#<%=txtZip.ClientID%>').val() != '') { addr += ', ' + $('#<%=txtZip.ClientID%>').val(); }
            setSpan('ADDRESS', addr);
        }
        function setPartNames() {
            var theNames = '';
            $('.partnameupdate').each(function () {
                if ($(this).val() != '') {
                    if (theNames != '') { theNames += ($(this).hasClass('partlast') ? ' ' : ', '); }
                    theNames += $(this).val();
                }
            });
            setSpan('PARTICIPANT_NAMES', theNames);
        }
        $(function () {
            $('#<%=txtTypeInitials.ClientID%>').on('keyup change', setInitPreview);
            $('#<%=txtFullNameTypeToSign.ClientID%>').on('keyup change', setSignPreview);

            <%=_docReadyJS%>;

            setupFieldUpdater('#<%=txtSignedNameFirst.ClientID%>', 'FIRST_NAME');
            setupFieldUpdater('#<%=txtSignedName.ClientID%>', 'LAST_NAME');
            setupFieldUpdater('#<%=txtEmail.ClientID%>', 'EMAIL');
            setupFieldUpdater('#<%=txtTelephone.ClientID%>', 'PHONE');

            $('#<%=txtAddress.ClientID%>,#<%=txtAddress2.ClientID%>,#<%=txtCity.ClientID%>,#<%=txtState.ClientID%>,#<%=txtZip.ClientID%>')
                .on('keyup change', setAddressInlineUpdate);

            $('.partnameupdate').each(function () {
                $(this).on('keyup change', setPartNames);
            });

            $('#<%=btnAdult.ClientID%>').click(function () { setSigningOption(this, true, false); });
            $('#<%=btnAdultAndChildren.ClientID%>').click(function () { setSigningOption(this, true, true); });
            $('#<%=btnChildren.ClientID%>').click(function () { setSigningOption(this, false, true); });

            <% if (_numButtons <= 1) { %>
            var incAdult = <%= ((bool)(_includeButtonAdult || _includeButtonAdultChildren)).ToString().ToLower() %>;
            var incChild = <%= ((bool)(_includeButtonChildren || _includeButtonAdultChildren)).ToString().ToLower()%>;
            setSigningOption(this, incAdult, incChild);
            <% } %>

            $('*[data-addclass]').each(function () {
                $(this).parentsUntil('div').parent().addClass($(this).data('addclass'));
                $(this).parent().addClass($(this).data('addclass'));
            });

            $('.partbox input[type=text]').each(function () {
                if ($(this).val() != '') {
                    showPart2(); $('#onlinewaiverform<%=ClientID %> .waivermultiple').show();
                    setupFieldUpdater('#' + $(this).attr('id'), $(this).data('codename'));
                }
            });

            $('.partbox').each(function (idx) {
                if (idx < 1) {
                    $(this).css('display', 'block'); lastHiddenIdx = idx + 1;
                    $(this).find('input[type=text]').each(function () { setupFieldUpdater('#' + $(this).attr('id'), $(this).data('codename')); });
                } else {
                    var hasVal = false;
                    $(this).find('input[type=text]').each(function () {
                        if ($(this).val() != '') { hasVal = true; setupFieldUpdater('#' + $(this).attr('id'), $(this).data('codename')); }
                    });
                    if (hasVal == true) { $(this).css('display', 'block'); lastHiddenIdx = idx + 1; }
                }
            });
            if (lastHiddenIdx == $('.partbox').length) { $('.btnAddName').hide(); }

            $('.btnAddName').click(addMorePartBoxes);

            $('input[type="text"]').focus(function () { $(this).addClass("activeinput"); });
            $('input[type="text"]').blur(function () { $(this).removeClass("activeinput"); });

   
        });
    </script>

    <div id="onlinewaiverform<%=ClientID %>">
        <asp:PlaceHolder ID="phTop" runat="server"></asp:PlaceHolder>

        <h1><%=form.Name %></h1>

        <% if (phEventName.Controls.Count > 0) { %>
        <h3><asp:PlaceHolder ID="phEventName" runat="server"></asp:PlaceHolder></h3>
        <% } %>

        <% if (phLeadInText.Controls.Count > 0) { %>
        <p><asp:PlaceHolder ID="phLeadInText" runat="server"></asp:PlaceHolder></p>
        <% } %>

        <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

        <!-- WAIVER TEXT -->
        <div class="ipa_waiver_text">
            <asp:PlaceHolder ID="phWaiverText" runat="server"></asp:PlaceHolder>
        </div>

        <a name="form"></a>

        <% if (_numButtons > 1) { %>
        <div class="row">
            <div class="col-12">
                <div class="text-center" runat="server" id="participationSelection">
                    <h3><%=instance.GetLabel("WHO_WILL_BE_PARTICIPATING", conn, site) %></h3>
                    <% if (_includeButtonAdult) { %><a href="javascript:void(0);" runat="server" id="btnAdult" class="btn btn-primary partButton"><%=instance.GetLabel("BUTTON_ADULT", conn, site) %></a> &nbsp;<% } %>
                    <% if (_includeButtonAdultChildren) { %><a href="javascript:void(0);" runat="server" id="btnAdultAndChildren" class="btn btn-primary partButton"><%=instance.GetLabel("BUTTON_ADULT_AND_CHILDREN", conn, site) %></a> &nbsp;<% } %>
                    <% if (_includeButtonChildren) { %><a href="javascript:void(0);" runat="server" id="btnChildren" class="btn btn-primary partButton"><%=instance.GetLabel("BUTTON_CHILDREN", conn, site) %></a><% } %>

                    <div class="text-center signing-for">
                        <span style="display:none;" class="WPERR_Information" id="text_adult"><%=instance.GetLabel("SIGNING_FOR_ADULT", conn, site) %></span>
                        <span style="display:none;" class="WPERR_Information" id="text_adult_and_children"><%=instance.GetLabel("SIGNING_FOR_ADULT_AND_CHILDREN", conn, site) %></span>
                        <span style="display:none;" class="WPERR_Information" id="text_children"><%=instance.GetLabel("SIGNING_FOR_CHILDREN", conn, site) %></span>
                    </div>
                </div>
            </div>
        </div>
        <% } %>

        <hr />

        <div id="part2" runat="server">
            <asp:Panel runat="server" ID="pnlRefIDWrap" Visible="false">
                <div class="row">
                    <asp:Panel runat="server" ID="pnlRefID1" Visible="false">
                        <div class="col-sm-4">
                            <label for="<%=txtRefID1.ClientID %>"><%=instance.GetLabel("LBL_REFID_FIELD1", conn, site) %> <span runat="server" id="spanReqRefID1" class="text-danger">*</span></label>
                            <asp:TextBox runat="server" ID="txtRefID1" CssClass="form-control"></asp:TextBox>
                        </div>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="pnlRefID2" Visible="false">
                        <div class="col-sm-4">
                            <label for="<%=txtRefID2.ClientID %>"><%=instance.GetLabel("LBL_REFID_FIELD2", conn, site) %> <span runat="server" id="spanReqRefID2" class="text-danger">*</span></label>
                            <asp:TextBox runat="server" ID="txtRefID2" CssClass="form-control"></asp:TextBox>
                        </div>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="pnlRefID3" Visible="false">
                        <div class="col-sm-4">
                            <label for="<%=txtRefID3.ClientID %>"><%=instance.GetLabel("LBL_REFID_FIELD3", conn, site) %> <span runat="server" id="spanReqRefID3" class="text-danger">*</span></label>
                            <asp:TextBox runat="server" ID="txtRefID3" CssClass="form-control"></asp:TextBox>
                        </div>
                    </asp:Panel>
                </div>
            </asp:Panel>

            <% if (form.AllowSigningForSomeoneElse) { %>
              <h3><%=instance.GetLabel("PARENT_GUARDIAN_INFO", conn, site) %></h3>
            <% } %>

            <div class="row">
                <% if (includeFirstNameFields) { %>
                <div class="<%=_colClassFields1 %>">
                    <div class="mb-3">
                        <label for="<%=txtSignedNameFirst.ClientID %>" class="form-label"><%=instance.GetLabel("LBL_FIRSTNAME", conn, site) %> <span class="text-danger">*</span></label>
                        <asp:TextBox CssClass="form-control" ID="txtSignedNameFirst" runat="server" MaxLength="50"></asp:TextBox>
                    </div>
                </div>
                <% } %>

                <div class="<%=_colClassFields1 %>">
                    <div class="mb-3">
                        <label for="<%=txtSignedName.ClientID %>" class="form-label">
                            <% if (includeFirstNameFields) { %>
                                <%=instance.GetLabel("LBL_LASTNAME", conn, site) %>
                            <% } else { %>
                                <%=instance.GetLabel("YOUR_FULL_NAME", conn, site) %>
                            <% } %>
                            <span class="text-danger">*</span>
                        </label>
                        <asp:TextBox CssClass="form-control" ID="txtSignedName" runat="server" MaxLength="50"></asp:TextBox>
                    </div>
                </div>

                <div id="dobfield" runat="server">
                    <div class="mb-3">
                        <label class="form-label"><%=instance.GetLabel("YOUR_DATE_OF_BIRTH", conn, site) %> <span class="text-danger" id="reqStar_DOB" runat="server">*</span></label>
                        <cc2:WFDatePicker runat="server" ID="dpDOB" />
                    </div>
                </div>

                <div runat="server" id="div_phone">
                    <div class="mb-3">
                        <label for="<%=txtTelephone.ClientID %>" class="form-label"><%=instance.GetLabel("STD_FIELD_LABEL_PHONE", conn, site) %> <span class="text-danger" id="reqStart_phone" runat="server">*</span></label>
                        <asp:TextBox CssClass="form-control" ID="txtTelephone" runat="server" type="tel" MaxLength="20"></asp:TextBox>
                    </div>
                </div>

                <div runat="server" id="div_mobilenum" class="mb-3">
                    <div class="mb-3">
                        <label for="txtMobileNum" class="form-label">
                            <asp:Label runat="server" ID="lblSmsFieldLabel"></asp:Label>
                            <span class="text-danger" id="req_mobilenum" runat="server">*</span>
                        </label>
                        <div>
                            <asp:TextBox runat="server" ID="txtMobileNum" CssClass="form-control" type="tel" ClientIDMode="Static"></asp:TextBox>
                            <asp:HiddenField runat="server" ID="hfCountry" />
                        </div>
                    </div>
                    <div runat="server" id="div_mobile_confirm">
                        <asp:CheckBox runat="server" ID="chkSMSOptIn" /> <asp:Label runat="server" ID="lblSMSOptIn"></asp:Label>
                    </div>
                    <asp:Label runat="server" ID="lblSMSOptInHelpBlock" CssClass="form-text d-block"></asp:Label>
                    <asp:PlaceHolder runat="server" ID="phTermsLink"></asp:PlaceHolder>
                </div>

                <div runat="server" id="div_email">
                    <div class="mb-3">
                        <label for="<%=txtEmail.ClientID %>" class="form-label"><%=instance.GetLabel("LBL_EMAILADDRESS", conn, site) %> <span class="text-danger" id="reqStar_email" runat="server">*</span></label>
                        <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" type="email" MaxLength="500"></asp:TextBox>
                    </div>
                </div>

                <div runat="server" id="div_email_confirm">
                    <div class="mb-3">
                        <label for="<%=txtEmailConfirm.ClientID %>" class="form-label"><%=instance.GetLabel("LBL_EMAILADDRESS_CONFIRM", conn, site) %> <span class="text-danger" id="Span1" runat="server">*</span></label>
                        <asp:TextBox CssClass="form-control" ID="txtEmailConfirm" runat="server" type="email" MaxLength="500"
                                     data-fv-identical="true"
                                     data-fv-identical-field="<%=txtEmail.ClientID %>"
                                     data-fv-identical-message="Email address confirmation does not match"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div runat="server" id="div_address">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="mb-3">
                            <label for="<%=txtAddress.ClientID %>" class="form-label"><%=instance.GetLabel("LBL_ADDRESS", conn, site) %> <span class="text-danger" id="reqStart_addr1" runat="server">*</span></label>
                            <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" MaxLength="500"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="mb-3">
                            <label for="<%=txtAddress2.ClientID %>" class="form-label"><%=instance.GetLabel("LBL_ADDRESSLINE2", conn, site) %></label>
                            <asp:TextBox CssClass="form-control" ID="txtAddress2" runat="server" MaxLength="500"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-4">
                        <div class="mb-3">
                            <label for="<%=txtCity.ClientID %>" class="form-label"><%=instance.GetLabel("LBL_CITY", conn, site) %> <span class="text-danger" id="reqStart_addr2" runat="server">*</span></label>
                            <asp:TextBox CssClass="form-control" ID="txtCity" runat="server" MaxLength="255"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="mb-3">
                            <label for="<%=txtState.ClientID %>" class="form-label"><%=instance.GetLabel("LBL_STATE", conn, site) %> <span class="text-danger" id="reqStart_addr3" runat="server">*</span></label>
                            <asp:TextBox CssClass="form-control" ID="txtState" runat="server" MaxLength="2"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="mb-3">
                            <label for="<%=txtZip.ClientID %>" class="form-label"><%=instance.GetLabel("LBL_ZIP", conn, site) %> <span class="text-danger" id="reqStart_addr4" runat="server">*</span></label>
                            <asp:TextBox CssClass="form-control" ID="txtZip" runat="server" MaxLength="6"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row"><asp:PlaceHolder ID="phAfterStandardFields" runat="server"></asp:PlaceHolder></div>

            <!-- CUSTOM QUESTION -->
            <asp:PlaceHolder ID="phQuestions" runat="server"></asp:PlaceHolder>

            <% if (_includeDateAttending) { %>
            <div class="row">
                <div class="col-sm-6 col-12">
                    <div class="mb-3">
                        <label for="<%=rdpDateAttending.ClientID %>" class="form-label"><%=instance.GetLabel("DATE_ATTENDING", conn, site) %></label>
                        <telerik:RadDatePicker ID="rdpDateAttending" runat="server" Skin="Bootstrap" Width="100%" TodayButtonVisibility="Visible">
                            <Calendar runat="server" ShowRowHeaders="false" Skin="Bootstrap">
                                <FastNavigationSettings EnableTodayButtonSelection="true" />
                                <FooterTemplate>
                                    <div style="text-align:center;">
                                        <input id="btnDateAttendingToday" class="btn btn-warning w-100" type="button" value="Today" onclick="GoToToday()" />
                                    </div>
                                </FooterTemplate>
                            </Calendar>
                        </telerik:RadDatePicker>
                    </div>
                    <span style="display:none;" class="WPERR_Information" id="lbl_dateatt_warn">Date attending cannot be more than <%=strWarnDays %> days away.</span>
                </div>
            </div>
            <% } %>

            <div class="row"><asp:PlaceHolder ID="phAfterCustomQuestions" runat="server"></asp:PlaceHolder></div>

            <% if (form.AllowSigningForSomeoneElse) { %>
            <!-- MULTIPLE PARTICIPANTS -->
            <div class="waivermultiple" style="display:none;">
                <h3><%=instance.GetLabel("ENTER_PARTICIPANTS_NAMES", conn, site) %></h3>
                <asp:PlaceHolder runat="server" ID="phPartLimitWarning"></asp:PlaceHolder>
                <div id="nameboxes"><asp:PlaceHolder ID="phParticipantsPreLoad" runat="server"></asp:PlaceHolder></div>
                <div class="clear"></div>
                <% if(!IsBookingMode){ %>
                <div class="mb-3 text-center">
                    <a href="javascript:void(0);" class="btnAddName btn btn-secondary"><i class="fa fa-plus"></i> <%=instance.GetLabel("LBL_ADDANOTHERNAME", conn, site) %></a>
                </div>
                <div class="clear"></div>
                <% } %>
            </div>
            <% } %>

            <div class="row"><asp:PlaceHolder ID="phAfterParticipantFields" runat="server"></asp:PlaceHolder></div>



            

            <asp:Panel ID="pnlJoinMailingList" runat="server">
                <div class="row">
                    <div class="col-12">
                        <div class="mb-3">
                            <asp:CheckBox runat="server" ID="chkJoinMailingList" Text="Join the Mailing List"></asp:CheckBox>
                            <asp:PlaceHolder runat="server" ID="phJoinMailingListHelpBlock"></asp:PlaceHolder>
                        </div>
                    </div>
                </div>
            </asp:Panel>

            <div class="row"><asp:PlaceHolder ID="phAfterJoinMailingList" runat="server"></asp:PlaceHolder></div>
            <asp:PlaceHolder ID="phAttachFiles" runat="server"></asp:PlaceHolder>

            <% if (_signatureMode == SignatureModeEnum.Signature || _signatureMode == SignatureModeEnum.Signature_or_type || _signatureMode == SignatureModeEnum.Type_only) { %>
            <div class="row">
                <div class="col-sm-6 col-md-4 offset-sm-3 offset-md-4">
                    <div id="div_sig_main"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-md-4 offset-sm-3 offset-md-4">
                    <a href="javascript:void(0);" class="btnsign btn btn-primary btn-lg w-100" data-idx="-1" data-hfid="<%=hfSignatureData.ClientID %>" data-imgdiv="div_sig_main">
                        <i class="fa fa-pencil"></i> <%=instance.GetLabel("BTN_SIGN_HERE_MAIN", Page, site) %>
                    </a>
                </div>
            </div>
            <% } %>

            <% if (_includeCaptcha) { %>
            <div class="row">
                <div class="col-sm-6 col-12">
                    <div class="mb-3">
                        <label for="<%=RadCaptcha1.ClientID %>" class="form-label"><%=instance.GetLabel("CAPTCHA", conn, site) %></label>
                        <telerik:RadCaptcha ID="RadCaptcha1" runat="server" InvisibleTextBoxLabel="true" CaptchaTextBoxLabel="" CaptchaTextBoxCssClass="form-control"></telerik:RadCaptcha>
                    </div>
                </div>
            </div>
            <% } %>

            <div class="row"><asp:PlaceHolder ID="phJustBeforeSubmit" runat="server"></asp:PlaceHolder></div>

            <!-- AGREE -->
            <p class="form-text"><%=instance.GetLabel("AGREEMENT_TEXT", conn, site) %></p>

            <div id="messages"></div>

            <asp:PlaceHolder ID="phSigHiddenFields" runat="server"></asp:PlaceHolder>

            <div class="row">
                <div class="col-sm-6 col-md-4 offset-sm-3 offset-md-4">
                    <cc1:recaptcha runat="server" id="reCaptcha1"></cc1:recaptcha>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6 col-md-4 offset-sm-3 offset-md-4">
                    <asp:Button ID="btnSubmit" runat="server" Text="I Agree" OnClientClick="return detectPartDupes();" OnClick="btnSubmit_Click" CssClass="btn btn-primary btn-lg w-100" />
                </div>
            </div>
            <!-- /AGREE -->
        </div><!-- part2 -->
    </div><!-- #onlinewaiverform -->
</asp:Panel>
