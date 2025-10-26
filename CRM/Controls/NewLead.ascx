<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewLead.ascx.cs" Inherits="WaiverFile.CRM.Controls.NewLead" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


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
            <label>Status</label>
            <asp:DropDownList ID="cboStatus" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:DropDownList>
        </div>
         <div class="form-group">
            <label>Assign To</label>
            <asp:DropDownList ID="cboAssignTo" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:DropDownList>
        </div>
        <div class="form-group">
            <label>Source</label>
            <asp:DropDownList ID="cboCRMSource" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:DropDownList>
        </div>
        <div class="form-group">
             <label>Follow Up</label>
                <asp:DropDownList ID="cboSetFollowup" runat="server" CssClass="form-control cboSetFollowup">
                  <asp:ListItem Text="Tomorrow" Value="1DAY" Selected="True"></asp:ListItem>
                  <asp:ListItem Text="2 Days" Value="2DAYS"></asp:ListItem>
                  <asp:ListItem Text="3 Days" Value="3DAYS"></asp:ListItem>
                  <asp:ListItem Text="1 Week" Value="1WEEK"></asp:ListItem>
                  <asp:ListItem Text="2 Weeks" Value="2WEEKS"></asp:ListItem>
                  <asp:ListItem Text="Custom Date" Value="CUSTOM"></asp:ListItem>
                    <asp:ListItem Text="Never (no need to follow up)" Value="NEVER"></asp:ListItem>

                </asp:DropDownList>
                </div>
                <div class="form-group" id="divDatePickerNextFollowup">
                  <telerik:RadDatePicker runat="server" ID="dtNextFollowup"></telerik:RadDatePicker>
                </div>
        <div class="form-group">
            <label>Notes</label>
            <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
        </div>

        <diiv class="form-group">
            <asp:CheckBox runat="server" ID="chkJoinMailingList" Checked="true" Text="Put email on the New Customer Signup List Mailing List" />
        </diiv>

        
    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Submit" OnClick="btnSave_Click" />
    </div>
</div>
