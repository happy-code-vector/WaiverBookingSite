<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SignupCustom_WestBend.ascx.cs" Inherits="WaiverFile.Controls.SignupCustom_WestBend" %>
<script type="text/javascript">
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

    function showHideOtherBizType() {
        if ($('#<%=cboBusinessType.ClientID%>').val() == 'Other') {
            $('#biztype').show();
        } else {
            $('#biztype').hide();
        }
    }

    $(document).ready(function () {
        showHideOtherBizType();
        $('#<%=cboBusinessType.ClientID%>').change(function () {
            showHideOtherBizType();
        });
    });

    </script>


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
        if (RegExp( '[a-z]').test(password) &&
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
        
        var cssClass='text-success';
        if (score < minScore) {
            cssClass='text-danger';
        }
        else if (score == minScore && minScore != 5) {
            cssClass='text-warning';
        } else {
            cssClass='text-success';
        }
        var iconCode = '<i class="fa fa-times-circle"></i> ';

        if (score < minScore) {
        } else {
            iconCode = '<i class="fa fa-check-circle"></i> ';
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


<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
  <div id="messages"></div>
<div class="form"> 
    <div class="form-group">
        <label>Your Name *</label>
        <asp:TextBox id="txtName" runat="server" CssClass="form-control" data-fv-noempty="true" data-fv-notempty-message="Name is required" placeholder="First and Last Name"></asp:TextBox>
    </div>
    <div class="form-group">
        <label>Company *</label>
        <asp:TextBox id="txtCompany" runat="server" CssClass="form-control" data-fv-noempty="true" data-fv-notempty-message="Company is required"></asp:TextBox>
    </div>

      <div class="form-group">
        <label>Business Type *</label>
        <asp:DropDownList runat="server" ID="cboBusinessType" CssClass="form-control" data-fv-noempty="true" data-fv-notempty-message="Business type is required">
            <asp:ListItem Value="">-- Select --</asp:ListItem>
            <asp:ListItem Value="Bounce House">Bounce House</asp:ListItem>
            <asp:ListItem Value="Health Club">Health Club</asp:ListItem>
            <asp:ListItem Value="Swim Club">Swim Club</asp:ListItem>
            <asp:ListItem Value="Tennis Club">Tennis Club</asp:ListItem>
            <asp:ListItem Value="Camp Ground">Camp Ground</asp:ListItem>
            <asp:ListItem Value="YMCA">YMCA</asp:ListItem>
            <asp:ListItem Value="Climbing Gym">Climbing Gym</asp:ListItem>
            <asp:ListItem Value="Zip Line">Zip Line</asp:ListItem>
            <asp:ListItem Value="Other">Other</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="form-group" id="biztype" style="display:none;">
        <label>Other Business Type *</label>
        <asp:TextBox id="txtOtherBusinessType" runat="server" CssClass="form-control"></asp:TextBox>
    </div>

    <div class="form-group">
        <label>West Bend Policy #</label>
        <asp:TextBox id="txtWestBendPolicyNum" runat="server" CssClass="form-control" data-fv-noempty="true" data-fv-notempty-message="Policy number is required"></asp:TextBox>
    </div>
        
    <asp:Panel ID="pnlPackages" runat="server">
      <div class="form-group">
        <label><%=SetupOptionLabel %> *</label>
        <asp:DropDownList runat="server" ID="cboPackage" CssClass="form-control"></asp:DropDownList>
    </div>

    </asp:Panel>
<div class="form-group">
        <label>Email *</label>
        <asp:TextBox id="txtEmail" runat="server" CssClass="form-control" data-fv-noempty="true" data-fv-notempty-message="Email is required"></asp:TextBox>
    </div>
<div class="form-group">
        <label>Create a Password *</label>
        <asp:TextBox id="txtPassword" runat="server" CssClass="form-control" TextMode="Password" data-fv-noempty="true" data-fv-notempty-message="Password is required"></asp:TextBox>
    </div>
     <div id="pass_strength_wrap" style="display:none;">
            Password strength: <span id="pass_strength" style="font-weight:700;"></span><br />
            

        </div>

      <p class="help-block">
          By signing up you agree to the <a href="<%=_termsUrl %>" target="_blank">Terms of Use <i class="fa fa-external-link"></i></a>.
      </p>
    
    <!--<div class="form-group">
        
        <asp:CheckBox id="chkAgree" runat="server"></asp:CheckBox> I have read and agree to the <a href="/Policies/Terms-of-Use.aspx" target="_blank">Terms of Use</a>
    </div>-->

<div class="form-group">
    <asp:Button ID="btnSubmit" runat="server" Text="Setup My Account" CssClass="btn btn-primary trial-submit-btn" OnClientClick="return preventMultipleSubmissions('.trial-submit-btn');" OnClick="btnSubmit_Click" />
    </div>

</div>