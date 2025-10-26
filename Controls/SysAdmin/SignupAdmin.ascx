<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SignupAdmin.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.SignupAdmin" %>

<script type="text/javascript">
    function updateUrlPreview() {
        var val = $('#<%=txtUrlPrefix.ClientID%>').val();

        if (val == "") {
            val = "waiverfile.com/b/___";
        } else {
            val = 'waiverfile.com/b/' + val;

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

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Create Trial Account</h3>
    </div><!-- /.box-header -->
    <div class="box-body">

<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
<div class="form"> 
    <div class="form-group">
        <label>Name</label>
        <asp:TextBox id="txtName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label>Company</label>
        <asp:TextBox id="txtCompany" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
<div class="form-group">
        <label>Email</label>
        <asp:TextBox id="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
<div class="form-group">
        <label>Password</label>
        <asp:TextBox id="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
     <p class="help-block">* Leave blank and a random password will be generated.</p>
    </div>
<div class="form-group">
        <label>URL</label><br />
        <asp:TextBox id="txtUrlPrefix" runat="server" CssClass="form-control" placeholder="yoursite" style="width:auto; display:inline-block;"></asp:TextBox>.waiverfile <span id="avail"></span><br />
    
    <small><em>Your site's address will be <span id="urlpreview"></span></em></small>
    <div id="invalidcharsnote" style="display:none;">
          <p class="help-block">* Only letters and numbers may be used; no special characters or spaces are allowed.</p>
    </div>
    </div>
    
    <!--
    <div class="form-group">
        
        <asp:CheckBox id="chkAgree" runat="server"></asp:CheckBox> I have read and agree to the <a href="/Policies/Terms-of-Use.aspx" target="_blank">Terms of Use</a>
    </div>-->
     <div class="form-group">
            <p class="help-block">The welcome email will be sent to info@waiverfile.com with all the details of this new site. Notification to the customer must be sent manually.</p>
        </div>


</div>


            </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button ID="btnSubmit" runat="server" Text="Create Trial" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
    </div>
</div>


<asp:PlaceHolder ID="phResult" runat="server"></asp:PlaceHolder>