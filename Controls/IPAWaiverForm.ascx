<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="IPAWaiverForm.ascx.cs" Inherits="WaiverFile.Controls.IPAWaiverForm" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%if(form.IncludeSignature){ %>


<!--[if lt IE 9]>
	<script type="text/javascript" src="/wp-content/Plugins/WaiverFile/Docs/flashcanvas.js"></script>
	<![endif]-->

<script type="text/javascript" src="/wp-content/Plugins/WaiverFile/Docs/jSignature.min.js"></script>
<script type="text/javascript" src="/wp-content/Plugins/WaiverFile/Docs/jSignature.SignHere.js"></script>


<script>
    $(document).ready(function () {
        $("#signature").jSignature();

        $('#btnClearSig').click(function () {
            $("#signature").jSignature("reset");
        });
        $("#signature").bind('change', function (e) {
            var datapair = $("#signature").jSignature("getData", "svgbase64");//returns an array of form ["image/svg+xml","svg xml here"]
            $('#<%=hfSignatureData.ClientID%>').val(datapair[1]);
        })
    })
	</script>

<%} %>

<% if (!includeFirstNameFields)
   { %>
<style type="text/css">
    .firstname {
        display: none;
    }
</style>
<%} %>

<div class="ipa_small_button2 abstopleft" <%=_hideAllCode %>>

    <a href="<%=_backUrl %>" class="btn btn-default pull-right" style="margin-left: 10px;">Go Back</a>

    <span runat="server" id="ipa_login_button" class="pull-right"><strong>Have an account? </strong><a href="Login.aspx<%=_loginQueryString %>" class="btn btn-md btn-primary">Log In Here</a></span>
</div>

<asp:PlaceHolder ID="phHideAllMessage" runat="server"></asp:PlaceHolder>

<asp:Panel ID="pnlWaiver" runat="server" DefaultButton="btnDisableEnter">
    <asp:Button ID="btnDisableEnter" runat="server" Text="" OnClientClick="return false;" Style="display: none;" />


    <script type="text/javascript">

        var lastHiddenIdx = 0;

        function addMorePartBoxes() {
            var firstHiddenIdx = 0;
            
            $('.partbox').each(function (idx) {
                if ($(this).css('display') == 'none') {
                    firstHiddenIdx = idx;
                    return false; //BREAK
                }
            });
            $('.partbox').each(function (idx) {
                if (idx >= firstHiddenIdx && idx < firstHiddenIdx + 10) {
                    $(this).css('display', 'block');
                    lastHiddenIdx = idx + 1;
                }
            });
            if (lastHiddenIdx == $('.partbox').length || firstHiddenIdx == 0) {
                //LAST ONE. HIDE THE SHOW MORE BUTTON. 
                $('.btnAddName').hide();
            }

        }

        function showHideParticipantName() {
            if ($('#<%=rbSigningForAChild.ClientID%>').is(':checked')) {
                $('#participantname').show();
            } else {
                $('#participantname').hide();
            }
        }
        $(document).ready(function () {

            showHideParticipantName();
            $('#<%=rbSigningForAChild.ClientID%>').click(showHideParticipantName);
            $('#<%=rbSigningForMyself.ClientID%>').click(showHideParticipantName);


            $('*[data-addclass]').each(function () {
                $(this).parentsUntil('div').parent().addClass($(this).data('addclass'));
            });
            //if any partbox inputs have a value, show it on load
            $('.partbox input[type=text]').each(function (idx) {
                if ($(this).val() != '') {
                    $('#onlinewaiverform<%=ClientID %> .waivermultiple').show();
                $('#onlinewaiverform<%=ClientID %> .waivermultipletoggle').hide();
            }
        });

           
            $('.partbox').each(function (idx) {
               
            //SHOW FIRST 10 BOXES OR ANY WITH VALUES
            if (idx < 10) {
                $(this).css('display', 'block');
                lastHiddenIdx = idx + 1;
            } else {
                var hasVal = false;
                $(this).find('input[type=text]').each(function () {
                    if ($(this).val() != '') {
                        hasVal = true;
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
        $('#onlinewaiverform<%=ClientID %> .waivermultipletoggle').click(function () {
            $('#onlinewaiverform<%=ClientID %> .waivermultiple').show();
            $('#onlinewaiverform<%=ClientID %> .waivermultipletoggle').hide();
            //$('#<%=dobfield.ClientID%>').hide();

        });



        $('input[type="text"]').focus(function () {
            $(this).addClass("activeinput");
        });
        $('input[type="text"]').blur(function () {
            $(this).removeClass("activeinput");
        });
        <%if (_showOnDefault)
          { %>
        $('#onlinewaiverform<%=ClientID %> .waivermultiple').show();
        $('#onlinewaiverform<%=ClientID %> .waivermultipletoggle').hide();
        //$('#<%=dobfield.ClientID%>').hide();
        <%} %>

        //TIMER
        var typingTimer;
        var doneTypingInterval = 1500;


        //PASSWORD
        $('#<%=txtPassword.ClientID %>').keyup(function () {
            typingTimer = setTimeout(checkPassword, doneTypingInterval);
            $('#password_icon').html('<img src="/wp-content/images/loading.gif" alt="Checking Password" />');
        });
        $('#<%=txtPassword.ClientID %>').keydown(function () {
            clearTimeout(typingTimer);
        });


        //user is "finished typing," do something
        function checkPassword() {
            if ($('#<%=txtPassword.ClientID %>').val() == '') {
                $('#password_icon').html('');
                $('#password_reason').html('');
            } else {
                var emailVal = '';
                <% if(div_email_alt.Visible){ %>
                    emailVal = $('#<%=txtEmailAlt.ClientID %>').val();
                <%}else{%>
                emailVal = $('#<%=txtEmail.ClientID %>').val();
                <%}%>
                
                $.ajax({
                    type: "POST",
                    url: "/Controls/UsernameCheck.ashx",
                    data: { action: "checkpassword", password: $('#<%=txtPassword.ClientID %>').val(), email: emailVal },
                    success: function (data) {
                        if (data == 'OK') {
                            $('#password_icon').html('<img src="/wp-content/images/ico-ok.png" alt="Password OK" />');
                            $('#password_reason').html('');
                        } else if (data == 'SPACE') {
                            $('#password_icon').html('<img src="/wp-content/images/ico-x.png" alt="Password error" />');
                            $('#password_reason').html('Passwords should not contain spaces.');
                        }
                        else if (data == 'LENGTH') {
                            $('#password_icon').html('<img src="/wp-content/images/ico-x.png" alt="Password error" />');
                            $('#password_reason').html('Passwords must be at least 5 characters.');
                        }
                        else if (data == 'ALREADY_ACCOUNT') {
                            $('#password_icon').html('<img src="/wp-content/images/ico-x.png" alt="Password error" />');
                            $('#password_reason').html('An account with this email address already exists. Use the forgot password feature to reset your password.');
                        }
                    }
                });
            }
        }

    });
    </script>

    <div class="form-horizontal" id="onlinewaiverform<%=ClientID %>">

        <h1><%=form.Name %></h1>
        <h4>
            <asp:PlaceHolder ID="phEventName" runat="server"></asp:PlaceHolder>
        </h4>
        <p>
            <asp:PlaceHolder ID="phLeadInText" runat="server"></asp:PlaceHolder>
        </p>

        <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>



        <!-- STANDARD FIELDS -->
        <div class="form-group form-inline">
            <label class="col-xs-12 col-sm-3"><%=site.GetLabel("YOUR_FULL_NAME", conn) %></label><div class="col-xs-12 col-sm-9"><% if (includeFirstNameFields)
                                                                                                                                    { %><asp:TextBox CssClass="form-control" ID="txtSignedNameFirst" runat="server" MaxLength="500"></asp:TextBox>
                <% } %><asp:TextBox CssClass="form-control" ID="txtSignedName" runat="server" MaxLength="500"></asp:TextBox></div>
        </div>
        <div class="form-group form-inline" id="dobfield" runat="server">
            <label class="col-xs-12 col-sm-3"><%=site.GetLabel("YOUR_DATE_OF_BIRTH", conn) %><asp:PlaceHolder ID="phReqDOB" runat="server" />
            </label>
            <div class="col-xs-12 col-sm-9">
                <telerik:RadDateInput runat="server" CssClass="form-control" ID="rdiDOB" MinDate=""></telerik:RadDateInput>
            </div>
        </div>
        <div class="form-group" runat="server" id="div_email">
            <label class="col-xs-12 col-sm-3">Email Address<asp:PlaceHolder ID="phReqEmail" runat="server" />
            </label>
            <div class="col-xs-12 col-sm-9">
                <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" type="email" MaxLength="500"></asp:TextBox><asp:PlaceHolder ID="phEmailStar" runat="server" />
            </div>
        </div>
        <div class="form-group" runat="server" id="div_phone">
            <label class="col-xs-12 col-sm-3">Telephone<asp:PlaceHolder ID="phReqPhone" runat="server" />
            </label>
            <div class="col-xs-12 col-sm-9">
                <asp:TextBox CssClass="form-control" ID="txtTelephone" runat="server" type="tel" MaxLength="20"></asp:TextBox></div>
        </div>
        <div runat="server" id="div_address">
            <div class="form-group">
                <label class="col-xs-12 col-sm-3">Address<asp:PlaceHolder ID="phReqAddr1" runat="server" />
                </label>
                <div class="col-xs-12 col-sm-9">
                    <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" MaxLength="500"></asp:TextBox></div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3">City<asp:PlaceHolder ID="phReqAddr2" runat="server" />
                    <asp:PlaceHolder ID="PlaceHolder2" runat="server" />
                </label>
                <div class="col-xs-12 col-sm-9">
                    <asp:TextBox CssClass="form-control" ID="txtCity" runat="server" MaxLength="255"></asp:TextBox></div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3">State<asp:PlaceHolder ID="phReqAddr3" runat="server" />
                </label>
                <div class="col-xs-12 col-sm-9">
                    <asp:TextBox CssClass="form-control" ID="txtState" runat="server" MaxLength="2"></asp:TextBox></div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3">Zip<asp:PlaceHolder ID="phReqAddr4" runat="server" />
                </label>
                <div class="col-xs-12 col-sm-9">
                    <asp:TextBox CssClass="form-control" ID="txtZip" runat="server" pattern="[0-9]*" MaxLength="5"></asp:TextBox></div>
            </div>

        </div>
         <% if (_includeDateAttending)
           { %>
        <div class="form-group form-inline">
            <label class="col-xs-12 col-sm-3"><%=site.GetLabel("DATE_ATTENDING", conn) %></label><div class="col-xs-12 col-sm-9">
                <telerik:RadDatePicker ID="rdpDateAttending" runat="server" DateInput-CssClass="form-control"></telerik:RadDatePicker>
            </div>
        </div>
        <%} %>

        <% if (_includeCaptcha)
           { %>
        <div class="form-group form-inline">
            <label class="col-xs-12 col-sm-3"><%=site.GetLabel("CAPTCHA", conn) %></label><div class="col-xs-12 col-sm-9">
                <telerik:RadCaptcha ID="RadCaptcha1" runat="server" InvisibleTextBoxLabel="true" CaptchaTextBoxLabel="" CaptchaTextBoxCssClass="form-control">
                </telerik:RadCaptcha>
            </div>
        </div>
        <%} %>
            <!--/ STANDARD FIELDS -->


        <!-- CUSTOM QUESTION -->
        <asp:PlaceHolder ID="phQuestions" runat="server"></asp:PlaceHolder>
        <!--/ CUSTOM QUESTION -->

        <hr />


        <!-- EMAIL SIGNUP MESSAGE -->
        <asp:PlaceHolder ID="phEmailMessage" runat="server"></asp:PlaceHolder>
        <!--/ EMAIL SIGNUP MESSAGE -->

        <%if(_allowMultipleNames){ %>
        <!-- MULTIPLE PARTICIPANTS -->
        <div class="form-group text-center">
            <a href="javascript:void(0);" class="btn btn-primary btn-lg waivermultipletoggle"><%=site.GetLabel("SIGNING_FOR_MULTIPLE_PARTICIPANTS", conn) %></a>
        </div>
        <div class="waivermultiple" style="display: none;">
            <div class="form-group">
                <label class="col-xs-12 col-sm-3"><%=site.GetLabel("ARE_YOU_PARTICIPATING", conn) %></label>
                <div class="col-xs-12 col-sm-9">
                    <asp:RadioButton runat="server" ID="rbParticipatingYes" GroupName="youParticipating" Checked="true" /> Yes
                    &nbsp; &nbsp; &nbsp;<asp:RadioButton runat="server" ID="rbParticipatingNo" GroupName="youParticipating"/> No
                </div>
            </div>

            <h4><%=site.GetLabel("ENTER_PARTICIPANTS_NAMES", conn) %></h4>

            <!-- start with 10? -->
            <div id="nameboxes" class="form-inline">
                <asp:PlaceHolder ID="phParticipantsPreLoad" runat="server"></asp:PlaceHolder>
            </div>
            

            <div class="clear"></div>

            <a href="javascript:void(0);" class="btnAddName btn btn-lg btn-default">Add More</a>

            <div class="clear"></div>
            <hr />
        </div>
        <!--/ MULTIPLE PARTICIPANTS -->
        <% }else if(form.AllowSigningForSomeoneElse){ %>

            <div class="form-group">
                    <label class="col-xs-12 col-sm-3"><%=site.GetLabel("I_AM_SIGNING_FOR", conn) %></label>
                    <div class="col-xs-12 col-sm-9">
                        <asp:RadioButton runat="server" ID="rbSigningForMyself" GroupName="youParticipating" Checked="true" /> <%=site.GetLabel("I_AM_SIGNING_FOR_MYSELF", conn) %>
                        &nbsp; &nbsp; &nbsp;<asp:RadioButton runat="server" ID="rbSigningForAChild" GroupName="youParticipating"/> <%=site.GetLabel("I_AM_SIGNING_FOR_A_CHILD", conn) %>
                    </div>
                </div>
         
        <div id="participantname" style="display:none;">
         <h4><%=site.GetLabel("ENTER_PARTICIPANTS_NAMES", conn) %></h4>
            <div id="nameboxessingle" class="form-inline">
                <asp:PlaceHolder ID="phParticipantSinglePreLoad" runat="server"></asp:PlaceHolder>
            </div>
             <div class="clear"></div>
            </div>
        <hr />
        <%} %>

        <!-- CREATE PASSWORD -->
        <div class="ipa_createaccount" runat="server" id="ipa_createaccount">
            
            <div class="form-group"><strong>Optional:</strong> Create a password to save time and auto-fill your information on your next visit!</div>

            <div class="col-xs-10">
            <div class="form-group" runat="server" id="div_email_alt">
                <label class="col-xs-12 col-sm-3">Email Address
                </label>
                <div class="col-xs-12 col-sm-9">
                    <asp:TextBox CssClass="form-control" ID="txtEmailAlt" runat="server" type="email" MaxLength="500"></asp:TextBox><asp:PlaceHolder ID="PlaceHolder3" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3">Password</label><div class="col-xs-12 col-sm-9">
                    <asp:TextBox CssClass="form-control" ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    <div id="password_reason"></div>
                </div>
            </div>
                </div>
            <div class="col-xs-2">
                <div id="password_icon"></div>
            </div>
            <div class="clear"></div>
        </div>
        <!--/ CREATE PASSWORD -->

         <hr />
        <!-- WAIVER TEXT -->
        <div class="ipa_waiver_text">
            <asp:PlaceHolder ID="phWaiverText" runat="server"></asp:PlaceHolder>
        </div>
        <!--/ WAIVER TEXT -->

    

        <%if(form.IncludeSignature){ %>

        <div class="form-group">
            <asp:Label ID="lblSignatureDesc" runat="server"></asp:Label>
            <div class="pull-right">
                <a href="javascript:void(0);" class="btn btn-sm btn-default" id="btnClearSig">Clear Signature</a>
            </div>
        </div>

        <div id="signature"></div>

        <asp:HiddenField ID="hfSignatureData" runat="server" />

        <% } %>

            <hr />

        <!-- AGREE -->
        <p class="help-block"><%=site.GetLabel("AGREEMENT_TEXT", conn) %> </p>
        <asp:Button ID="btnSubmit" runat="server" Text="I Agree" OnClick="btnSubmit_Click" CssClass="btn btn-primary btn-lg" />
        <!--/ AGREE -->

    </div>

</asp:Panel>
