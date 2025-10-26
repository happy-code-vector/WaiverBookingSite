<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyAccountArea.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="WaiverFile.MyAccount.ChangePassword" %>

 

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    
    
<script type="text/javascript">

    var minScore = <%= (int)Waypoint.Security.PasswordAdvisor.GetRequiredPasswordScore() %>;

    function getScore(password) {
        var score = 0;
        var detail = '';
        if (password.length < 1) {
            return 0;
        }
        if (password.length < 6) {
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
        
        var password = $('#<%=txtPassword1.ClientID%>').val();
        var score = getScore(password);

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
             $('#<%=btnApply.ClientID %>').attr('disabled', 'disabled');
        } else {
            iconCode = '<i class="fa fa-check-circle"></i> ';
            $('#<%=btnApply.ClientID %>').removeAttr('disabled');
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
        $('#pass_strength_wrap').show();
        $('#pass_strength').attr('class', cssClass);
        $('#pass_strength').html(iconCode + scoreName);

        
    }

    $(document).ready(function () {
        $('#<%=btnApply.ClientID %>').attr('disabled', 'disabled');
        $('#<%=txtPassword1.ClientID%>').keyup(function () { checkStrength(); });
        $('#<%=txtPassword1.ClientID%>').change(function () { checkStrength(); });
    });

</script>

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Set New Password
</h3>
    </div><!-- /.box-header -->
    <div class="box-body">

         <asp:PlaceHolder ID="phResult" runat="server" />

    <asp:Panel ID="pnlForm" runat="server">
    <%if(showVerificationCodeBox){ %><div class="form-group"><label for="<%=txtVerify.ClientID %>">Verification Code</label><asp:TextBox ID="txtVerify" runat="server" CssClass="form-control"></asp:TextBox></div><%}else { %>
        <div class="form-group"><label for="<%=txtCurrentPassword.ClientID %>">Current Password</label><asp:TextBox id="txtCurrentPassword" runat="server" MaxLength="50" TextMode="Password" CssClass="form-control"></asp:TextBox></div>
        <%} %>
   <div class="form-group"><label for="<%=txtPassword1.ClientID %>">New Password </label><asp:TextBox id="txtPassword1" runat="server" MaxLength="50" TextMode="Password" CssClass="form-control"></asp:TextBox></div>
        <div id="pass_strength_wrap" style="display:none;">
            Password strength: <span id="pass_strength" style="font-weight:700;"></span><br />
            <span class="help-block"><em>Add capital letters, numbers and symbols to make a stronger password.</em></span>

        </div>
   <div class="form-group"><label for="<%=txtPassword2.ClientID %>">Confirm Password</label><asp:TextBox id="txtPassword2" runat="server" MaxLength="50" TextMode="Password" CssClass="form-control"></asp:TextBox></div>
   <div class="form-group"><asp:CheckBox id="chkSendEmail" runat="server"></asp:CheckBox> Email me the new password</div>
   </asp:Panel>

    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button ID="btnApply" runat="server" Text="Set password" OnClick="btnApply_Click" CssClass="btn btn-primary"/>
    </div>
</div>


</asp:Content>
