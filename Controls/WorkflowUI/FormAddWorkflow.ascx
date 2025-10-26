<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormAddWorkflow.ascx.cs" Inherits="WaiverFile.Controls.WorkflowUI.FormAddWorkflow" %>


<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $('#<%=txtName.ClientID %>').focus();

        $('#btnShowDivAdvanced').click(function () {
            $('#divAdvanced').show();
            $(this).hide();
        });
    });
function AutoPopulateNewPageFields(obj){
    var newval = $(obj).val();
    if ($('#<%=txtFirstStepTitle.ClientID %>').val() == '' && $('#<%=txtFirstStepButton.ClientID %>').val() == '') {
        $('#<%=txtFirstStepTitle.ClientID %>').val(newval);
        $('#<%=txtFirstStepButton.ClientID %>').val(newval);
    }
}

</script>


<div class="row">
   <div class="col-sm-6">
        <h3>New Workflow</h3>

        <p>Create a workflow that can consist of multiple steps and waiver forms to manage customer signing.</p>
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        <div class="form-group">
            <label>Workflow Name</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="" onchange="AutoPopulateNewPageFields(this);"></asp:TextBox>
        </div>
        
        <div class="form-group">
            <label>Status</label>
            <asp:DropDownList runat="server" ID="cboStatus" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group">
            <label>Mode</label>
            <asp:DropDownList runat="server" ID="cboMode" CssClass="form-control">
                <asp:ListItem Value="">Select...</asp:ListItem>
                <asp:ListItem Value="Events">Events</asp:ListItem>
                <asp:ListItem Value="General_Admission">General Admission</asp:ListItem>
                <asp:ListItem Value="Both">Both</asp:ListItem>
                
            </asp:DropDownList>
        </div>
       <p class="help-block">General admission workflows will appear as a button on the main screen. Events will be available for selection when creating an event. </p>

        <a href="javascript:void(0);" id="btnShowDivAdvanced">Advanced Settings</a><br /><br />
        <div id="divAdvanced" style="display:none;">
        <h4>First Step</h4>
        <p>The first step is the root button in this workflow. All workflows have a single root step.</p>
          <div class="form-group">
            <label>Name (Button Text)</label>
            <asp:TextBox ID="txtFirstStepButton" runat="server" CssClass="form-control" placeholder=""></asp:TextBox>
        </div> 
        <div class="form-group">
            <label>Title (Page title)</label>
            <asp:TextBox ID="txtFirstStepTitle" runat="server" CssClass="form-control" placeholder=""></asp:TextBox>
        </div>
            </div>
      
        
      
       <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Submit" OnClick="btnSave_Click"
             />
    </div>
    
</div>


