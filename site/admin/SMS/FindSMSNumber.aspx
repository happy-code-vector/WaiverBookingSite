<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="FindSMSNumber.aspx.cs" Inherits="WaiverFile.site.admin.SMS.FindSMSNumber" %>
<%@ Register assembly="Waypoint" namespace="Waypoint.Forms" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <script src="/site/includes/jquery.mask.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

     <script type="text/javascript">


         //leaving off here
         //show a modal
         //hidden field with the selected number
         //textbox for business phone (to direct people to if they call the sending number)
         //best phone number input with nice formatting?
         //submit - buy. 
         //no more js confirm



         function ShowHideSMSNumberFields() {
             var selectedvalue = $('#<%= rblSearchType.ClientID %> input:checked').val();
             if (selectedvalue == 'AREA') {
                 $('#searchFree').hide();
                 $('#searchAreaCode').show();
             } else {//free
                 $('#searchFree').show();
                 $('#searchAreaCode').hide();
            }
        }
        $(function () {
            $('#<%= rblSearchType.ClientID %> input').each(function () {
                $(this).change(function () { ShowHideSMSNumberFields(); });
                $(this).click(function () { ShowHideSMSNumberFields(); });
            });
            ShowHideSMSNumberFields();
            $('#<%=txtBusinessPhone.ClientID%>').mask('(000) 000-0000'); //US/CANADA ONLY FOR NOW

            $('.btnSelectNum').each(function () {
                $(this).click(function () {
                    $('<%=hfSelectedNumber.ClientID%>').val($(this).data('num'));
                    $('<%=txtNewSMS.ClientID%>').val($(this).data('friendlyname'));
                    $('#modalClaimNumber').modal('show');
                });
            });
            /*
             $('.phone').mask('0000-0000');
  $('.phone_with_ddd').mask('(00) 0000-0000');
  $('.phone_us').mask('(000) 000-0000');
             */
        });
     </script>

      <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>



    <asp:Panel ID="pnlMain" runat="server" CssClass="promoarea">

        <!-- Modal -->
<div class="modal fade" id="modalClaimNumber" tabindex="-1" role="dialog" aria-labelledby="lblClaimNum">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="lblClaimNum">Claim Number</h4>
      </div>
      <div class="modal-body">
    
          <asp:HiddenField ID="hfSelectedNumber" runat="server" />
          <div class="form-group">
              <label>New SMS Number</label>
              <asp:TextBox runat="server" ID="txtNewSMS" CssClass="form-control" Enabled="false"></asp:TextBox>
          </div>
          <div class="form-group">
              <label>Your Business Phone</label>
              <asp:TextBox runat="server" ID="txtBusinessPhone" CssClass="form-control"></asp:TextBox>
              <p class="help-block">Direct customers if they dial your SMS number.</p>
          </div>
          


      </div>
      <div class="modal-footer">
          <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-primary" Text="Claim Number" OnClick="btnSubmit_Click" />
      </div>
    </div>
  </div>
</div>

        
    <h1>Find a Sending Phone Number</h1>


        <div class="form-group">
            <asp:RadioButtonList runat="server" ID="rblCountry" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="radiobuttonlist">
                <asp:ListItem Value="US" Selected="True">United States</asp:ListItem>
                <asp:ListItem Value="CA">Canada</asp:ListItem>
            </asp:RadioButtonList>
            <cc1:WPHelpIcon ID="WPHelpIcon1" runat="server" HelpText="Text messaging is only available in the US and Canada at this time. Contact us if you have interest in texting service in other countries. ">
        </cc1:WPHelpIcon>
        </div>

        

<div class="row" id="searchFree">
    <asp:Panel runat="server" DefaultButton="btnSearch">
    <div class="col-sm-3">
        <label>Number</label>
        <asp:TextBox runat="server" ID="txtNumber" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="col-sm-3">
         <label>Match</label>
        <asp:DropDownList runat="server" ID="cboMatchMode" CssClass="form-control">
            <asp:ListItem Value="STARTSWITH">First part of number</asp:ListItem>
            <asp:ListItem Value="ENDSWITH">Last Part of Number</asp:ListItem>
            <asp:ListItem Value="ANY">Anywhere in Number</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="col-sm-3">
        <label> </label>
        <asp:Button runat="server" ID="btnSearch" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
    </div>
        </asp:Panel>
</div>



<div class="row" id="searchAreaCode">
    <div class="col-sm-12 form-inline">
        <asp:Panel runat="server" DefaultButton="btnSearchAreaCode">
        <label>Area Code</label>
        <asp:TextBox runat="server" ID="txtAreaCode" CssClass="form-control"></asp:TextBox>
   
        <asp:Button runat="server" ID="btnSearchAreaCode" Text="Search" CssClass="btn btn-primary" OnClick="btnSearchAreaCode_Click" />
            </asp:Panel>
    </div>
</div>
        <br />
        <p>
        <strong>Search By:</strong><br />
            
            <asp:RadioButtonList ID="rblSearchType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="radiobuttonlist">
                <asp:ListItem Value="AREA" Selected="True">Area Code</asp:ListItem>
                <asp:ListItem Value="FREE">Free Search</asp:ListItem>
            </asp:RadioButtonList>
       
        </p>
<asp:PlaceHolder runat="server" ID="phResults"></asp:PlaceHolder>

        </asp:Panel>
</asp:Content>
