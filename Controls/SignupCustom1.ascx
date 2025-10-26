<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SignupCustom1.ascx.cs" Inherits="WaiverFile.Controls.SignupCustom1" %>
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

    </script>

<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
  <div id="messages"></div>
<div class="form"> 
    <div class="form-group">
        <label>Your Name *</label>
        <asp:TextBox id="txtName" runat="server" CssClass="form-control" data-fv-noempty="true" data-fv-notempty-message="Name is required" placeholder="First and Last Name"></asp:TextBox>
    </div>
    <div class="form-group">
        <label>Chapter Name *</label>
        <asp:TextBox id="txtCompany" runat="server" CssClass="form-control" data-fv-noempty="true" data-fv-notempty-message="Company is required"></asp:TextBox>
    </div>
        <div class="form-group">
        <label>Your State *</label>
        <asp:DropDownList runat="server" ID="cboState" CssClass="form-control"></asp:DropDownList>
    </div>
      <div class="form-group">
        <label>County *</label>
        <asp:TextBox id="txtCounty" runat="server" CssClass="form-control" data-fv-noempty="true" data-fv-notempty-message="County"></asp:TextBox>
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

      <p class="help-block">
          By signing up you agree to the <a href="/Policies/Terms-of-Use.aspx" target="_blank">Terms of Use <i class="fa fa-external-link"></i></a>.
      </p>
    
    <!--<div class="form-group">
        
        <asp:CheckBox id="chkAgree" runat="server"></asp:CheckBox> I have read and agree to the <a href="/Policies/Terms-of-Use.aspx" target="_blank">Terms of Use</a>
    </div>-->

<div class="form-group">
    <asp:Button ID="btnSubmit" runat="server" Text="Start Your Free Trial" CssClass="btn btn-primary trial-submit-btn" OnClientClick="return preventMultipleSubmissions('.trial-submit-btn');" OnClick="btnSubmit_Click" />
    </div>

</div>