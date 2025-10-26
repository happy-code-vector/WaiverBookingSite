<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormLead.ascx.cs" Inherits="WaiverFile.CRM.Controls.FormLead" %>

 <script type="text/javascript">

      function handleSetFollowup(){
      if($('.cboSetFollowup').val()=='CUSTOM'){
      $('#divDatePickerNextFollowup').show();
      }else{
      $('#divDatePickerNextFollowup').hide();
      }
     }
     $(document).ready(function () {
         $('.cboSetFollowup').change(function () { handleSetFollowup(); });
         handleSetFollowup();
     });

     </script>

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">New Lead
</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
         <div class="form-group">
            <label>Company</label>
            <asp:TextBox ID="txtCompany" runat="server" CssClass="form-control" placeholder="Company"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Name</label>
            <div class="row">
                <div class="col-sm-6"><asp:TextBox ID="txtFirst" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox></div>
                <div class="col-sm-6"><asp:TextBox ID="txtLast" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox></div>
            </div>
            
        </div>
        <div class="form-group">
            <label>Email address</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email Address"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Phone</label>
            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Phone"></asp:TextBox>
        </div>
        
        <div class="form-group">
            <label>Source</label>
            <asp:DropDownList ID="cboCRMSource" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:DropDownList>
        </div>
       

        
    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Submit" OnClick="btnSave_Click" />
    </div>
</div>
