<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BookingStandardPage.Master" AutoEventWireup="true" CodeBehind="CustomerVerify.aspx.cs" Inherits="WaiverFile.sitebooking.CustomerVerify" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container py-5">

    
            <asp:Panel ID="pnlProcess" runat="server" Visible="false">
                <h1 class="h2 mt-auto"><asp:Label ID="lblProcessHeading" runat="server"></asp:Label></h1>
                <asp:PlaceHolder runat="server" ID="phVerifyResult"></asp:PlaceHolder>
            </asp:Panel>
            
            

<asp:Panel ID="pnlCreatePassword" runat="server" CssClass="container py-5" Visible="false">

                  <script type="text/javascript">
                      var minScore = <%= (int)Waypoint.Security.PasswordAdvisor.GetRequiredPasswordScore() %>;

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

                     

                           var cssClass = 'text-success';
                       if (score < minScore) {
                           cssClass = 'text-danger';
                       } else {
                           cssClass = 'text-success';
                       }
                      var iconCode = '<i class="ci-close-circle"></i> ';
                      if (score < minScore) {
                          $('#<%=btnSubmitCreatePassword.ClientID %>').attr('disabled', 'disabled');
} else {
    iconCode = '<i class="ci-check-circle"></i> ';
    $('#<%=btnSubmitCreatePassword.ClientID %>').removeAttr('disabled');
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
    $('#<%=btnSubmitCreatePassword.ClientID %>').attr('disabled', 'disabled');
    $('#<%=txtPassword.ClientID%>').keyup(function () { checkStrength(); });
    $('#<%=txtPassword.ClientID%>').change(function () { checkStrength(); });
    $('input[type=radio]').change(function () { checkStrength(); });
});
                  </script>

    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="card shadow-sm rounded-3">
                <div class="card-body p-4">
                    <h4 class="card-title mb-3">Create Your Password</h4>

                    <asp:PlaceHolder runat="server" ID="phErrCreatePW"></asp:PlaceHolder>

                    <p class="text-muted mb-4">Secure your account by creating a password. You'll use this to manage your bookings and profile.</p>

                    <!-- Password -->
                    <div class="mb-3">
                        <label for="<%= txtPassword.ClientID %>" class="form-label">Password *</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"
                                     TextMode="Password" placeholder="Enter password"></asp:TextBox>
                    </div>

                    <!-- Strength Meter -->
                    <div id="pass_strength_wrap" class="mb-3" style="display:none;">
                        <small class="form-text text-muted">
                            Password strength: <span id="pass_strength" class="fw-bold"></span>
                        </small>
                    </div>

                    <!-- Confirm Password -->
                    <div class="mb-4">
                        <label for="<%= txtPassword2.ClientID %>" class="form-label">Confirm Password *</label>
                        <asp:TextBox ID="txtPassword2" runat="server" CssClass="form-control"
                                     TextMode="Password" placeholder="Re-enter password"></asp:TextBox>
                    </div>

                    <!-- Submit Button -->
                    <asp:Button ID="btnSubmitCreatePassword" runat="server" Text="Set Password"
                                CssClass="btn btn-primary w-100"
                                OnClick="btnSubmitCreatePassword_Click"
                                OnClientClick="return preventMultipleSubmissions('.btn-primary');" />
                </div>
            </div>
        </div>
    </div>
</asp:Panel>



            <asp:Panel runat="server" ID="pnlVerifyForm" Visible="false">

                <h1 class="h2 mt-auto">Verify your account</h1>

    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>
    <div class="needs-validation" novalidate="">
            <div class="position-relative mb-4">
                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control form-control-lg" placeholder="Email" TextMode="Email" AutoCompleteType="Email"></asp:TextBox>
              <div class="invalid-tooltip bg-transparent py-0">Enter a valid email address!</div>
            </div>
           
        <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-lg btn-primary w-100" Text="Submit" OnClick="btnSubmit_Click" />
    </div>      
    </asp:Panel>
  



        </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
