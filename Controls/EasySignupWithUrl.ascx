<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EasySignupWithUrl.ascx.cs" Inherits="WaiverFile.Controls.EasySignupWithUrl" %>

<script type="text/javascript">
    function updateUrlPreview() {
        var val = $('#<%=txtUrlPrefix.ClientID%>').val();

        if (val == "") {
            val = "waiverfile.com/b/______";
        } else {
            val = "waiverfile.com/b/" + val ;

            //CHECK AVAILABILITY 
            $.post("/Controls/UsernameCheck.ashx", { action: "checkurl", hostname: val },
                  function (data) {
                      //clear items from controlToUpdate
                      if (data == "AVAILABLE") {
                          $('#avail').html('<i class="fa fa-check" style="color:green;"></i> <span style="color: green; ">Available</span>');
                          //SAVED.
                      } else if (data == "IN_USE") {
                          $('#avail').html('<i class="fa fa-times" style="color:red;"></i>  <span style="color: red; ">IN USE</span>');
                      } else if(data=="INVALID_CHARS"){
                          $('#avail').html('<i class="fa fa-times" style="color:red;"></i>  <span style="color: red; ">INVALID CHARACTERS</span>');
                          $('#invalidcharsnote').show();
                      }
                  });
        }

        $('#urlpreview').html(val);
    }
    $(document).ready(function () {
        

        //TIMER
        var typingTimer;
        var doneTypingInterval = 1500;

        $('#<%=txtUrlPrefix.ClientID%>').keyup(function () {
            $('#avail').html('<img src="/wp-admin/images/loading.gif" style="width: 20px; height:20px; "/>');
            clearTimeout(typingTimer);
            typingTimer = setTimeout(updateUrlPreview, doneTypingInterval);
        });
        updateUrlPreview();
    });
</script>
<h2>Free 30 Day Trial</h2>
<p>Sign up below to get started. No credit card required, no obligation!</p>
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
<div class="form"> 
    <div class="form-group">
        <label>Name <span class="text-danger">*</span></label>
        <asp:TextBox id="txtName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label>Company <span class="text-danger">*</span></label>
        <asp:TextBox id="txtCompany" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
<div class="form-group">
        <label>Email <span class="text-danger">*</span></label>
        <asp:TextBox id="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
<div class="form-group">
        <label>Password <span class="text-danger">*</span></label>
        <asp:TextBox id="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:CheckBox ID="chkAgreeTerms" runat="server" /> I have read and agree to the <a href="/Policies/Terms-of-Use.aspx" target="_blank">Terms of Use <i class="fa fa-external-link"></i></a>. <span class="text-danger">*</span>
    </div>
<div class="form-group">
        <label>URL <span style="font-weight:300">(optional)</span></label><br />
        <asp:TextBox id="txtUrlPrefix" runat="server" CssClass="form-control" placeholder="" style="width:auto; display:inline-block;"></asp:TextBox>.waiverfile.com <span id="avail"></span><br />
    
    <small><em>Your account's address will be <span id="urlpreview"></span></em></small>
    <div id="invalidcharsnote" style="display:none;">
         <small><em>* Only letters and numbers may be used; no special characters or spaces are allowed.</em></small>
    </div>
    </div>
   <hr />
    <div class="form-group">
        <label>How did you hear about us? <span style="font-weight:300">(Optional)</span></label>
        <asp:RadioButtonList ID="rbHearAboutUs" runat="server">

        </asp:RadioButtonList>
    </div>

<div class="form-group">
<asp:Button ID="btnSubmit" runat="server" Text="Get Started" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
    </div>

</div>