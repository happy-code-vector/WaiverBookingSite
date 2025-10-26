<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeadTracker.ascx.cs" Inherits="WaiverFile.CRM.Controls.LeadTracker" %>


<script type="text/javascript">

    
    $(document).ready(function () {

        //handle "any" options
        $('.checkboxlist input').on('change', function () {

            if ($(this).val() != 'ANY' && $(this).prop('checked') == true) {
                $(this).parent().parent().parent().find('input[value="ANY"]').prop('checked', false);
            } else if ($(this).val() == 'ANY' && $(this).prop('checked') == true) {
                $(this).parent().parent().parent().find('input[value!="ANY"]').prop('checked', false);
            }
        });

        
    });

</script>

   <!-- default bootstrap you can't hardly see that color -->
<style type="text/css">
      .table-striped > tbody > tr:nth-of-type(2n+1){ background-color: #eee; } 
    </style>

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">WaiverFile Lead Tracker
            <span class="addbuttons"><a href="?sc=WF_NEW_LEAD&c=1" class="ico_e">New Lead</a></span>
</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
        <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnUpdate">

     
        <div class="row">
            <div class="col-xs-6 col-sm-3">
                  <div class="form-group">
                    <label>Search Terms</label>
                    <asp:TextBox runat="server" ID="txtSearch" placeholder="Search terms..." CssClass="form-control"></asp:TextBox>
                 </div>
                 <div class="form-group">
                  <asp:Button runat="server" ID="btnUpdate" Text="Update" CssClass="btn btn-primary btn-block" OnClick="btnUpdate_Click" />
                     </div>
             </div>  
            <div class="col-xs-6 col-sm-3">
                <label>Assigned to</label>
                  <div class="checkboxlist">
                    <asp:CheckBoxList ID="cblAssignedTo" runat="server" RepeatLayout="Table" RepeatColumns="1" RepeatDirection="Vertical">
                      </asp:CheckBoxList>
                    </div>
            </div>
            <div class="col-xs-6 col-sm-3">
                  <label>Status</label>
                  <div class="checkboxlist">
                    <asp:CheckBoxList ID="cblStatus" runat="server" RepeatLayout="Table" RepeatColumns="1" RepeatDirection="Vertical">
                      </asp:CheckBoxList>
                    </div>
            </div>
            
               
        </div>
            </asp:Panel>
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
       
    </div><!-- /.box-body -->
</div>


<div class="box box-primary">
    <div class="box-body no-padding">
<asp:PlaceHolder ID="phResults" runat="server"></asp:PlaceHolder>

    </div><!-- /.box-body -->
</div>


