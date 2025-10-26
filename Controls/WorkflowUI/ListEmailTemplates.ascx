<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListEmailTemplates.ascx.cs" Inherits="WaiverFile.Controls.WorkflowUI.ListEmailTemplates" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register assembly="Waypoint" namespace="Waypoint.Forms" tagprefix="cc1" %>

<script type="text/javascript">


    function setupCboChkThing(cboID, chkID) {
        $('#' + cboID).data('chkid', chkID);
        $('#' + cboID).change(function () {
            if ($(this).val() == '') {
                $('#' + $(this).data('chkid')).prop("checked", false);
                $('#' + $(this).data('chkid')).prop("disabled", true);
                
            } else {
                $('#' + $(this).data('chkid')).prop("disabled", false);
                
            }
        });
        if ($('#' + cboID).val() == '') {
            $('#' + $('#' + cboID).data('chkid')).prop("disabled", true);
        } else {
            $('#' + $('#' + cboID).data('chkid')).prop("disabled", false);
        }
    }

    function warnAdminCopy() {
       
        //just do for single, multiple doesnt happen much. this will solve most common issues. 
        if ($('#<%=txtAdminEmail.ClientID%>').val().trim() != '' && $('#<%=cboAdminSingle.ClientID%>').val() == 'NO_EMAIL') {
            $('#lblSingleWaiver').addClass('text-danger');
            $('#divAdminWarn').show();
        } else {
            $('#lblSingleWaiver').removeClass('text-danger');
            $('#divAdminWarn').hide();
        }
    }
    $(function () {
        warnAdminCopy();
        setupCboChkThing('<%=cboSingleWaiverPublic.ClientID%>', '<%=chkAutoSingleWaiverPublic.ClientID%>');

        setupCboChkThing('<%=cboSingleWaiverKiosk.ClientID%>', '<%=chkAutoSingleWaiverKiosk.ClientID%>');
        setupCboChkThing('<%=cboMultiWaiverPublic.ClientID%>', '<%=chkAutoMultiWaiverPublic.ClientID%>');
        setupCboChkThing('<%=cboMultiWaiverKiosk.ClientID%>', '<%=chkAutoMultiWaiverKiosk.ClientID%>');

        $('#<%=txtAdminEmail.ClientID%>').change(function () { warnAdminCopy(); });
        $('#<%=cboAdminSingle.ClientID%>').change(function () { warnAdminCopy(); });

    });
</script>

<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
<h3>Waiver Confirmation</h3>
<p>Choose what kind of confirmation email is sent to signees.</p>
 <table class="table">
     <thead>
         <tr>
             <th></th>
             <th>Public Signature Area</th>
             <th>
                 Kiosk (WaiverFile App)
             </th>
         </tr>
     </thead>
      <tbody>
        <tr>
          <td>
            <label>Single Waiver</label>
          </td>
          <td>
            <asp:DropDownList runat="server" ID="cboSingleWaiverPublic" class="form-control"></asp:DropDownList>
              <asp:CheckBox runat="server" ID="chkAutoSingleWaiverPublic" /> Auto Send
              <cc1:WPHelpIcon runat="server" HelpText="If not selected, a button will be added to the confirmation to request an email copy."></cc1:WPHelpIcon>
          </td>
          <td>
            <asp:DropDownList runat="server" ID="cboSingleWaiverKiosk" class="form-control"></asp:DropDownList>
              <asp:CheckBox runat="server" ID="chkAutoSingleWaiverKiosk" /> Auto Send
              <cc1:WPHelpIcon runat="server" HelpText="If not selected, a button will be added to the confirmation to request an email copy."></cc1:WPHelpIcon>
          </td>
        </tr>
          
           <tr>
          <td>
            <label>Multiple Waivers</label><br />
              <small>(Series of forms in a workflow)</small>
          </td>
          <td>
            <asp:DropDownList runat="server" ID="cboMultiWaiverPublic" class="form-control"></asp:DropDownList>
              <asp:CheckBox runat="server" ID="chkAutoMultiWaiverPublic" /> Auto Send
              <cc1:WPHelpIcon runat="server" HelpText="If not selected, a button will be added to the confirmation to request an email copy."></cc1:WPHelpIcon>
          </td>
          <td>
            <asp:DropDownList runat="server" ID="cboMultiWaiverKiosk" class="form-control"></asp:DropDownList>
              <asp:CheckBox runat="server" ID="chkAutoMultiWaiverKiosk" /> Auto Send
              <cc1:WPHelpIcon runat="server" HelpText="If not selected, a button will be added to the confirmation to request an email copy."></cc1:WPHelpIcon>
          </td>
        </tr>
      </tbody>
    </table>


<h3>Admin Copy</h3>
<p>Receive notifications of signed waivers via email. Each email must be listed as an admin user (any role)</p>
<div id="divAdminWarn" class="WPERR_Warning" style="display:none">Admin copy will not be sent without a template. Select a template below to ensure copies are sent.</div>
<label>Email Address(es)</label>
<asp:TextBox ID="txtAdminEmail" runat="server" CssClass="form-control" MaxLength="200"></asp:TextBox>
    <p class="help-block">Add email addresses separated by commas</p>

<div class="row"    >
    <div class="col-sm-6">
<div class="form-group">
<label id="lblSingleWaiver">Single Waiver Template</label>
 <asp:DropDownList ID="cboAdminSingle" runat="server" class="form-control"></asp:DropDownList>
    </div></div>
    <div class="col-sm-6">
<div class="form-group">
<label>Multiple Waiver Template</label>
 <asp:DropDownList ID="cboAdminMulti" runat="server" class="form-control"></asp:DropDownList>
    </div></div>
</div>





<asp:PlaceHolder runat="server" ID="phEmailTemplateDefaults"></asp:PlaceHolder>

<asp:Button runat="server" ID="btnSaveTemplateDefaults" Text="Save" CssClass="btn btn-primary" OnClick="btnSaveTemplateDefaults_Click" />

<hr />


 <div class="pull-right" style="margin-top:20px;">
                <a href="EditEmailTemplate.aspx" class="btn btn-primary" ><i class="fa fa-plus-circle"></i> New Template</a>
        </div>
<h3 style="display:inline-block;">Edit Email Templates</h3>
<telerik:RadGrid ID="RadGrid1" runat="server"   AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="False" AllowPaging="False" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        <GroupByExpressions>
                    <telerik:GridGroupByExpression>
                        <SelectFields>
                            <telerik:GridGroupByField FieldAlias="ActionType" HeaderText="Action" FieldName="ActionType" ></telerik:GridGroupByField>
                        </SelectFields>
                        <GroupByFields>
                            <telerik:GridGroupByField  FieldAlias="ActionType" FieldName="ActionType" SortOrder="Ascending"></telerik:GridGroupByField>
                        </GroupByFields>
                    </telerik:GridGroupByExpression>
            </GroupByExpressions>
        <Columns>

                         
            
                         
                         <telerik:GridBoundColumn DataField="name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="name" UniqueName="name"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="subject" FilterControlAltText="Filter Subject column" HeaderText="Subject" SortExpression="subject" UniqueName="subject"></telerik:GridBoundColumn>

                         
                         

                         
                         

                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="editcol" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>



<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFEmailTemplate  where siteid=@siteid order by actionType, name">
                  </asp:SqlDataSource>
                         