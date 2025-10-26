<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SignupWide.Master" AutoEventWireup="true" CodeBehind="SampleWaiverSetup.aspx.cs" Inherits="WaiverFile.SampleWaiverSetup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .rbl label{ margin-right: 15px; }
        input[type=radio]{ margin-right: 5px; }
    </style>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentFullWidth" runat="server">

    <asp:HiddenField runat="server" ID="hfPackageID" />
<script type="text/javascript">


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
        var minScore = 3;
        var isSecureMode = false;

        if ($('#<%=rblMedicalInfo.ClientID%> input:checked').val() == 'YES') {
            isSecureMode = true;
            minScore = 4;
        } else {
            isSecureMode = false;
        }
        if ($('#<%=rblMedicalInfo.ClientID%> input:checked').val() == 'NOTSURE') {
            $('#hipnote').show();
        } else {
            $('#hipnote').hide();
        }
        //
        if (hipnote)

            var cssClass = 'text-success';
        if (score < minScore) {
            cssClass = 'text-danger';
        } else {
            cssClass = 'text-success';
        }
        var iconCode = '<i class="fa fa-times-circle"></i> ';

        if (score < minScore) {
            $('#<%=btnSubmit2.ClientID %>').attr('disabled', 'disabled');
        } else {
            iconCode = '<i class="fa fa-check-circle"></i> ';
            $('#<%=btnSubmit2.ClientID %>').removeAttr('disabled');
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

    $(document).ready(function () {
        $('#<%=btnSubmit2.ClientID %>').attr('disabled', 'disabled');
        $('#<%=txtPassword.ClientID%>').keyup(function () { checkStrength(); });
        $('#<%=txtPassword.ClientID%>').change(function () { checkStrength(); });
        $('input[type=radio]').change(function () { checkStrength(); });
    });


    //PREVENT DOUBLE SUBMIT
    var isSubmitted = false;
    function preventMultipleSubmissions(selClass) {
        if (!isSubmitted) {
            $(selClass).val('Submitting...');
            isSubmitted = true;
            return true;
        }
        else {
            return false;
        }
    }

</script>


  <div class="container" style="margin-top:40px;margin-bottom:40px;">

       <div class="panel panel-default">
   <div class="panel-body">
    
       
       <!-- Page Header / Hero -->
    <div class="row">
      <div class="col-lg-10 col-lg-offset-1 text-center">
        <h3 class="" style="margin-bottom:10px;"><asp:Label ID="lblHeading" runat="server"></asp:Label></h3>
        <p class="text-muted" style="margin-bottom:25px;">
          Free sample form — set it up online (recommended) or download a printable/Word version.
        </p>
      </div>
    </div>

    <!-- Choice Pills -->
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2 text-center">
        <ul class="nav nav-pills" id="modePills" style="display:inline-block;margin-bottom:25px;">
          <li id="pill-setup-li" class="active">
            <a id="pill-setup" href="<%: Request.Path %>?mode=setup#setup">
              <i class="fa fa-rocket" style="margin-right:4px;"></i> Set Up Online
              <span class="label label-warning" style="margin-left:6px;">Recommended</span>
            </a>
          </li>
          <li id="pill-file-li" style="margin-left:8px;">
            <a id="pill-file" href="<%: Request.Path %>?mode=file#download">
              <i class="fa fa-download" style="margin-right:4px;"></i> Download Paper Form
            </a>
          </li>
        </ul>
      </div>
    </div>
       <hr />
    <!-- Wrapper: two clear paths -->
    <div class="row">

      <!-- Setup Online (Recommended) -->
      <div class="col-xs-12 col-sm-8 col-sm-offset-2 " id="setup">
        <asp:Panel runat="server" ID="pnlSetup" CssClass="" >
          <div class="">
            <div class="media">
              <div class="media-body">
              

                
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

                  
<asp:Panel runat="server" ID="pnlStep1">
   
      <h3 class="" style="margin-top:0;">Set Up This Waiver Form Online</h3>
  <p>
    We’ll create a new WaiverFile account with this sample pre-installed so you can customize and start collecting waivers right away — no credit card required.
  </p>

    <div class="form"> 
    <div class="form-group">
        <label for="<%=txtName.ClientID %>">Your Name *</label>
        <asp:TextBox id="txtName" runat="server" CssClass="form-control" data-fv-noempty="true" data-fv-notempty-message="Name is required"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="<%=txtCompany.ClientID %>">Company Name *</label>
        <asp:TextBox id="txtCompany" runat="server" CssClass="form-control" data-fv-noempty="true" data-fv-notempty-message="Company is required"></asp:TextBox>
    </div>
    
<div class="form-group">
        <label for="<%=txtEmail.ClientID %>">Email *</label>
        <asp:TextBox id="txtEmail" runat="server" CssClass="form-control" data-fv-noempty="true" data-fv-notempty-message="Email is required"></asp:TextBox>
    </div>

      <h3><small><span style="font-size: 12px;"><strong>Disclaimer</strong></span></small></h3>
        <span style="font-size: 12px;" runat="server" id="spanDisclaimer">
            Use of WaiverFile is subject to our <a href="/Policies/Terms-of-Use.aspx" target="_blank">Terms of Use <i class="fa fa-external-link"></i></a>. The content on this site and in the sample waiver forms is not legal advice. No attorney-client relationship is established. To ensure your online waiver form is legally binding based on your location, industry, and specific circumstances, consult a legal professional in your area.
            </span>
        <p>
            <small style="font-weight:700">
                <asp:CheckBox runat="server" ID="chkAgree" /> I agree
                    
            </small>
        </p>
        

<div class="form-group">
<asp:Button ID="btnSubmit1" runat="server" Text="Setup Online Waiver" CssClass="btn btn-primary trial-submit-btn" OnClientClick="return preventMultipleSubmissions('.trial-submit-btn');" OnClick="btnSubmit1_Click" />

    </div>

</div>
</asp:Panel>

<!-- panel 2 -->
<asp:Panel runat="server" ID="pnlStep2">

    <h2>Next Step: </h2>
  

    

    <asp:PlaceHolder ID="phErr2" runat="server"></asp:PlaceHolder>
    <div class="form-group">
        <label for="<%=rblMedicalInfo.ClientID %>">Will you be requesting PHI (Protected Health Information) that must comply with the HIPAA Privacy Rule or HIPAA Security Rule?</label><br />
        <small><a href="javascript:void(0);" data-toggle="modal" data-target="#myModal">What's this? <i class="fa fa-external-link"></i></a></small>
    </div>
      <div class="form-group rbl">
    <asp:RadioButtonList runat="server" ID="rblMedicalInfo" RepeatLayout="Flow" RepeatDirection="Horizontal">
        <asp:ListItem Value="YES" >Yes</asp:ListItem>
        <asp:ListItem Value="NO" >No</asp:ListItem>
        <asp:ListItem Value="NOTSURE" >I'm not sure</asp:ListItem>
        </asp:RadioButtonList>
          </div>
    <div class="WPERR_Information" id="hipnote" style="display:none;">
        That's OK. We'll start you out with a regular account. If you find that you need a HIPAA-Compliant solution, just let us know and we can upgrade your account anytime. 
    </div>
    <div class="form-group">
        <label for="<%=txtPassword.ClientID %>">Create a Password *</label>
        <asp:TextBox id="txtPassword" runat="server" CssClass="form-control" TextMode="Password" data-fv-noempty="true" data-fv-notempty-message="Password is required"></asp:TextBox>
    </div>
      <div id="pass_strength_wrap" style="display:none;">
            Password strength: <span id="pass_strength" style="font-weight:700;"></span><br />
            

        </div>
    <div class="form-group">
        <label for="<%=txtPassword2.ClientID %>">Confirm your Password *</label>
        <asp:TextBox id="txtPassword2" runat="server" CssClass="form-control" TextMode="Password" data-fv-noempty="true" data-fv-notempty-message="Password confirmation 
            is required"></asp:TextBox>
    </div>
   
    <div class="form-group">
<asp:Button ID="btnSubmit2" runat="server" Text="Continue" CssClass="btn btn-primary trial-submit-btn2" OnClientClick="return preventMultipleSubmissions('.trial-submit-btn2');" OnClick="btnSubmit2_Click" />

    </div>
</asp:Panel>





<!-- Modal -->
<div id="myModal" class="modal fade model-lg" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">About PHI</h4>
      </div>
      <div class="modal-body">

          <p>"Protected Health Information" (PHI) under the US law is any information about health status, provision of health care, or payment for health care that is created or collected by a Covered Entity (or a Business Associate of a Covered Entity), and can be linked to a specific individual.</p>

           <p>"Privacy Rule" means the Standards for Privacy of Individually Identifiable Health Information at 45 C.F.R. Part 160 and Part 164, Subparts A and E.  </p>
            
          <p>"Security Rule" will mean the Security Standards at 45 C. F.R. Part 160 and Part 164, Subparts A and C. </p>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>


               
              </div>
            </div>
          </div>
        </asp:Panel>
      </div>

    

      <!-- Download File -->

      <div class="col-xs-12 col-sm-8 col-sm-offset-2 " id="download">
        <asp:Panel runat="server" ID="pnlMain" CssClass="">
          <div class="">
            <h3 class="" style="margin-top:0;">Download File</h3>

            <!-- File details / name -->
            <asp:Panel runat="server" ID="pnlFileInfo" CssClass="well well-sm" Visible="false">
              <div class="media" style="margin:0;">
                <div class="media-left">
                  <i class="fa fa-file-word-o" aria-hidden="true" style="font-size:20px;margin-right:6px;"></i>
                </div>
                <div class="media-body">
                  <strong>File:</strong>
                  <span style="display:inline-block;max-width:100%;vertical-align:middle;">
                    <asp:Literal runat="server" ID="litFileName" Mode="Encode" />
                  </span>
                </div>
              </div>
            </asp:Panel>

            <asp:PlaceHolder id="phErrInner" runat="server"></asp:PlaceHolder>

              <p>
                  Using online waiver forms is the fastest and easiest way to collect, but if you'd still like a Word version you can download it below.
              </p>
            <p>
              Enter your email to get the sample waiver and learn more about how electronic waivers can help streamline your business.
            </p>

            <div class="form-group">
              <label for="txtEmailDownload">Email Address</label>
              <asp:TextBox runat="server" ID="txtEmailDownload" TextMode="Email"
                Placeholder="you@example.com"
                CssClass="form-control"></asp:TextBox>
            </div>

            <asp:Button runat="server" ID="btnDownload"
              CssClass="btn btn-primary"
              Text="Download File"
              OnClick="btnDownload_Click" />

        

            <hr />

            <!-- “I don’t want online” bypass link -->
            <p class="text-muted" style="margin-bottom:0;">
                <small>
              I don’t want to take advantage of online waiver forms.
              <a href="#" target="_blank" runat="server" id="hrefDownload">Download the form</a>.
                    </small>
            </p>
          </div>
        </asp:Panel>
      </div>

    </div><!-- /row -->

  </div><!-- /container -->

           </div>
      </div>
  <!-- Tiny helper to activate correct pill & scroll based on ?mode= (Bootstrap 3 version) -->
  <script>
      (function () {
          function getQueryParam(name) {
              var m = new RegExp('[?&]' + name + '=([^&]*)').exec(window.location.search);
              return m && decodeURIComponent(m[1].replace(/\+/g, ' '));
          }
          var mode = (getQueryParam('mode') || '').toLowerCase();

          var liSetup = document.getElementById('pill-setup-li');
          var liFile = document.getElementById('pill-file-li');
          var setupSection = document.getElementById('setup');
          var downloadSection = document.getElementById('download');

          function hide(el) { if (el) el.style.display = 'none'; }
          function show(el) { if (el) el.style.display = ''; }

          if (mode === 'file') {
              if (liSetup) liSetup.className = liSetup.className.replace(/\bactive\b/, '');
              if (liFile && liFile.className.indexOf('active') === -1) liFile.className += ' active';

              hide(setupSection);
              show(downloadSection);

              if (downloadSection) {
                  setTimeout(function () { downloadSection.scrollIntoView(true); }, 100);
              }
          } else {
              if (liFile) liFile.className = liFile.className.replace(/\bactive\b/, '');
              if (liSetup && liSetup.className.indexOf('active') === -1) liSetup.className += ' active';

              show(setupSection);
              hide(downloadSection);

              if (setupSection && location.hash === '#setup') {
                  setTimeout(function () { setupSection.scrollIntoView(true); }, 100);
              }
          }
      })();
  </script>


</asp:Content>
