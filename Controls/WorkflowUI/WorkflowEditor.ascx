<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WorkflowEditor.ascx.cs" Inherits="WaiverFile.Controls.WorkflowUI.WorkflowEditor" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register assembly="Waypoint" namespace="Waypoint.Forms" tagprefix="cc1" %>


<script type="text/javascript">

    function showButtonForTab() {
        $('#btnAddNewStep').hide();
        $('#btnInvite').hide();
        $('#btnAddForm').hide();
        
        switch ($('.nav-tabs .active a').attr('href')) {
            case "#tab_choices":
                $('#btnAddNewStep').show();
                break;
            case "#tab_forms":
                $('#btnAddForm').show();
                break;
            case "#tab_managers":
                $('#btnInvite').show();
                break;
        }

       

    }
    function popResendDialog(email) {

        $('#<%=txtResendInviteEmail.ClientID%>').val(email);
        $('#dlgResend').modal('show');
    }
    function AutoPopulateNewPageFields(obj) {
        
        var newval = $(obj).val();
        if ($('#<%=txtNewStepTitle.ClientID %>').val() == '') {
        
            $('#<%=txtNewStepTitle.ClientID %>').val(newval);
        }
    }

    function showHideAltStepLabel() {
        if ($('#<%=chkAltStepLabelInherit.ClientID%>').is(':checked')) {
            $('#<%=txtAltStepLabel.ClientID%>').prop('disabled', true);
        } else {
            $('#<%=txtAltStepLabel.ClientID%>').prop('disabled', false);
        }
        //divAltStepLabel
    }
    $(function () {
        showHideAltStepLabel();
        $('#<%=chkAltStepLabelInherit.ClientID%>').change(function () {
            showHideAltStepLabel();
        });
        $('#btnAddForm').click(function () {
            $('#dlgAddForm').modal('show');
        });
        $('#btnInvite').click(function () {
            $('#dlgInvite').modal('show');
        });
       
        $('#btnFormSettings').click(function () {
            $('#dlgFormSettings').modal('show');
        });

        $('#btnAddNewStep').click(function () {
            $('#dlgAddStep').modal('show');
        });
      
        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            showButtonForTab();
        });

        $('.btncheckall').click(function () {
            $('#<%=cblFormSelections.ClientID%> input[type="checkbox"]').each(function () {
                $(this).prop('checked', true);
            });
        });
        $('.btnchecknone').click(function () {
            $('#<%=cblFormSelections.ClientID%> input[type="checkbox"]').each(function () {
                $(this).prop('checked', false);
            });
        });

        <% if(PreloadForm!= PreLoadFormEnum.None){%>
        $('#<%=PreloadForm.ToString()%>').removeClass('fade');
        $('#<%=PreloadForm.ToString()%>').modal('show');
        <%}%>

        <%if (PreloadTab != "") { %>
        //$('#<%=PreloadTab.ToString()%>').addClass('active');
        //$('a [href="#<%=PreloadTab.ToString()%>"]').parent('li').addClass('active');
        $('.nav-tabs a[href="#<%=PreloadTab.ToString()%>"]').tab('show');
      
        <%}else{%>
        $('.nav-tabs a[href="#tab_choices"]').tab('show');
        $('#btn').show();
    <%}%>
        showButtonForTab();
    });


    function movePart(partid) {
        $('#<%=hfMoveID.ClientID%>').val(partid);
        $('#pop_move').modal('show');
    }
    function moveSelected() {

        var idList = '';
        var selList = $find("<%= RadGrid1.ClientID %>").get_masterTableView().get_selectedItems();
        for (var i = 0; i < selList.length; i++) {
            var id = selList[i].getDataKeyValue("ID");
            if (idList != '') { idList += ','; }
            idList += id;
        }
        movePart(idList);

    }
    function RowSelected(sender, eventArgs) {
        var idList = '';
        var selList = $find("<%= RadGrid1.ClientID %>").get_masterTableView().get_selectedItems();
         if (selList.length == 0) {
             $('#btnMoveSelected').hide();
             $('.btnDeleteSelected').hide();
        } else {
             $('#btnMoveSelected').show();
             $('.btnDeleteSelected').show();
         }
     }

</script>
<asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>
<asp:PlaceHolder runat="server" ID="phMain"></asp:PlaceHolder>





<div class="panel with-nav-tabs panel-default">
            <div class="panel-heading">
                <ul class="nav nav-tabs">
                    <li><a data-toggle="tab" href="#tab_choices">Next Steps</a></li>
                    <li><a data-toggle="tab" href="#tab_settings">Settings</a></li>
                    <li><a data-toggle="tab" href="#tab_forms">Forms<% if(numForms>0){ %> (<%=numForms%>)<%} %></a></li>
                    <li><a data-toggle="tab" href="#tab_managers">Managers<% if(numManagers>0){ %> (<%=numManagers%>)<%} %></a></li>
                        <li style="float:right;">
                            <div>
                                <a href="javascript:void(0);" id="btnAddNewStep" class="btn btn-primary" style="display:none;"><i class="fa fa-plus"></i> Add Step</a>
                                <a href="javascript:void(0);" id="btnInvite" class="btn btn-primary" style="display:none;"><i class="fa fa-user-plus"></i> Invite Managers</a>
                                <a href="javascript:void(0);" id="btnAddForm" class="btn btn-primary" style="display:none;"><i class="fa fa-files-o"></i> Add Forms</a>
                            </div>

                        </li>
                </ul>
            </div>
            <div class="panel-body nopadding">
                <div class="tab-content">
                    <div class="tab-pane fade in " id="tab_choices">
                        
                        <asp:Panel ID="pnlBinder" runat="server">
                            <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" AllowMultiRowSelection="true" OnRowDrop="RadGrid1_RowDrop" OnNeedDataSource="RadGrid1_NeedDataSource"  OnDeleteCommand="RadGrid1_DeleteCommand" >
                            <MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">
                                <Columns>
                                    <telerik:GridClientSelectColumn UniqueName="colselect"></telerik:GridClientSelectColumn>
                                     

                                     <telerik:GridHyperLinkColumn  DataNavigateUrlFields="ID" DataTextField="ButtonText"  Text="Name" DataNavigateUrlFormatString=""
                                        HeaderText="Name" SortExpression="ButtonText" UniqueName="ButtonText">
                                    </telerik:GridHyperLinkColumn>

                                   
                                      <telerik:GridBoundColumn DataField="Title" 
                                        FilterControlAltText="Filter Title column" HeaderText="Title" 
                                        SortExpression="Title" UniqueName="Title">
                                    </telerik:GridBoundColumn>
                                     <telerik:GridBoundColumn DataField="Status" 
                                        FilterControlAltText="Filter Status column" HeaderText="Status" 
                                        SortExpression="Status" UniqueName="Status">
                                    </telerik:GridBoundColumn>
                                      <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:movePart('{0}');" FilterControlAltText="Filter column2 column" HeaderText="Move" Text="Move" UniqueName="colfixed_move"></telerik:GridHyperLinkColumn>
                                    
                                    
                                   



                                    
                                    <telerik:GridButtonColumn CommandName="DELETE" 
                                        FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" ConfirmText="Are you sure you wish to delete this?" 
                                        UniqueName="deletecol">
                                    </telerik:GridButtonColumn>
                                     <telerik:GridDragDropColumn HeaderStyle-Width="18px" Visible="true">
                            <HeaderStyle Width="18px"></HeaderStyle>
                                                        </telerik:GridDragDropColumn>
                                </Columns>
                            </MasterTableView>
                                <ClientSettings AllowRowsDragDrop="True">
                                      <Selecting AllowRowSelect="True" EnableDragToSelectRows="false"></Selecting>
                                     <ClientEvents OnRowSelected="RowSelected" OnRowDeselected="RowSelected"  />
                                </ClientSettings>
                            </telerik:RadGrid>
                        
                            </asp:Panel>

                    </div>
                    <div class="tab-pane fade in panel-body" id="tab_settings">
                        
                              
                        <asp:Panel runat="server" ID="pnlRootStepOptions">
                            <h4>Main Workflow Settings</h4>
                        
                            <div class="form-group">
                                    <label for="<%=txtWorkflowName.ClientID %>">Workflow Name</label>
                                    <asp:TextBox runat="server" ID="txtWorkflowName" CssClass="form-control"></asp:TextBox>
                                </div>
                           <div class="form-group">
                                <label>Mode</label>
                                <asp:DropDownList runat="server" ID="cboMode" CssClass="form-control">
                                    <asp:ListItem Value="Events">Events</asp:ListItem>
                                    <asp:ListItem Value="General_Admission">General Admission</asp:ListItem>
                                    <asp:ListItem Value="Both">Both</asp:ListItem>
                
                                </asp:DropDownList>
                            </div>
                            <p class="help-block">General admission workflows will appear as a button on the main screen. Events will be available for selection when creating an event. </p>

                             <div class="form-group">
                                <label>Workflow Status</label>
                                <asp:DropDownList runat="server" ID="cboStatusWF" CssClass="form-control"></asp:DropDownList>
                            </div>
                            
                            <hr />
                            </asp:Panel>

                                <div class="form-group">
                                    <label for="<%=txtButtonText.ClientID %>">Name</label>
                                    <asp:TextBox runat="server" ID="txtButtonText" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="<%=txtTitle.ClientID %>">Title</label>
                                    <asp:TextBox runat="server" ID="txtTitle" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="<%=txtDescription.ClientID %>">Description</label>
                                    <asp:TextBox runat="server" ID="txtDescription" CssClass="form-control"></asp:TextBox>
                                </div>
                          <div class="form-group">
                                    <label for="<%=cboStatus.ClientID %>">Step Status</label>
                                    <asp:DropDownList runat="server" ID="cboStatus" CssClass="form-control"></asp:DropDownList>
                                </div>


                        
                                <div class="form-group">
                                    <label for="<%=cboEmailTemplate.ClientID %>">Email Template</label>
                                    <asp:DropDownList runat="server" ID="cboEmailTemplate" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="<%=cboEmailMode.ClientID %>">Email Mode</label>
                                    <asp:DropDownList runat="server" ID="cboEmailMode" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="<%=cboConfirmationMessage.ClientID %>">Confirmation Message</label>
                                    <asp:DropDownList runat="server" ID="cboConfirmationMessage" CssClass="form-control"></asp:DropDownList>
                                </div>

                         
                              <label>Where to Place Form(s)</label>
                        <div class="form-group">
                              <asp:RadioButtonList runat="server" ID="rblFormPlacement" RepeatLayout="Flow"></asp:RadioButtonList>

                          </div>
                         
                              <label>Form Selection Mode</label>
                         <div class="form-group">
                              <asp:RadioButtonList runat="server" ID="rblFormSelection" RepeatLayout="Flow"></asp:RadioButtonList>
                          </div>

                        <div class="form-group">
                                    <label for="<%=cboAltStepSelectMode.ClientID %>">Alternate Step Selection Mode</label>
                                    <asp:DropDownList runat="server" ID="cboAltStepSelectMode" CssClass="form-control"></asp:DropDownList>
                                    <p class="help-block">When enabled, adds a question for each child to select a different step. Often used to choose different teams when signing for multiple children.  </p>
                                </div>

                        
                        

                        <div id="divAltStepLabel" class="form-group">
                            <label for="<%=txtAltStepLabel.ClientID %>">Alternate Step Label  <asp:CheckBox runat="server" ID="chkAltStepLabelInherit" Text="Inherit" /></label>
                            <asp:TextBox runat="server" ID="txtAltStepLabel" CssClass="form-control"></asp:TextBox>
                        </div>


                               <asp:Button ID="btnSaveSettings" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="btnSaveSettings_Click" />
                          
                        
                    </div>
                    <div class="tab-pane fade in" id="tab_forms">

                      
                        <span id="spanFormFlow"></span>
                        <asp:PlaceHolder runat="server" ID="phErrGridForms"></asp:PlaceHolder>

                               <telerik:RadGrid ID="gridForms" runat="server" AutoGenerateColumns="False" OnRowDrop="gridForms_RowDrop" OnItemCommand="gridForms_ItemCommand" OnItemDataBound="gridForms_ItemDataBound"
                                    DataSourceID="sdsForms" CellSpacing="-1" GridLines="Both">
                            <MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">
                                <Columns>
                                      <telerik:GridDragDropColumn HeaderStyle-Width="18px" Visible="true">
                            <HeaderStyle Width="18px"></HeaderStyle>
                                                        </telerik:GridDragDropColumn>

                                     
                                   
                                      <telerik:GridBoundColumn DataField="Name" 
                                        FilterControlAltText="Filter Name column" HeaderText="Form Name" 
                                        SortExpression="Name" UniqueName="Name">
                                    </telerik:GridBoundColumn>

                                       <telerik:GridBoundColumn DataField="SIGNOPTION" 
                                        FilterControlAltText="Filter Adult-Child Mode column" HeaderText="Adult-Child Mode" 
                                        SortExpression="SIGNOPTION" UniqueName="SIGNOPTION">
                                    </telerik:GridBoundColumn>
                                  
                                    <telerik:GridButtonColumn CommandName="SWAPREQUIRED"  DataTextField="requiredText"
                                        FilterControlAltText="Filter Required column" HeaderText="Required" Text="Required" 
                                        UniqueName="RequiredCol">
                                    </telerik:GridButtonColumn>

                                    
                                    <telerik:GridButtonColumn CommandName="DELETE" 
                                        FilterControlAltText="Filter column1 column" HeaderText="Remove" Text="Remove" ConfirmText="Are you sure you wish to remove this form?" 
                                        UniqueName="deletecol">
                                    </telerik:GridButtonColumn>
                                </Columns>
                            </MasterTableView>
                                <ClientSettings AllowRowsDragDrop="True">
                                      <Selecting AllowRowSelect="True" EnableDragToSelectRows="false"></Selecting>
                                </ClientSettings>
                            </telerik:RadGrid>
                        <asp:SqlDataSource ID="sdsForms" runat="server" SelectCommand="select f.ID, name,   
case when i.options.value('(/Settings/setting[@key=&quot;SIGNING_OPTION_ADULT&quot;]/@value)[1]', 'nvarchar(20)')='true' then '1' else '0' end
+ case when i.options.value('(/Settings/setting[@key=&quot;SIGNING_OPTION_CHILDREN&quot;]/@value)[1]', 'nvarchar(20)')='true' then '1' else '0' end
+ case when i.options.value('(/Settings/setting[@key=&quot;SIGNING_OPTION_ADULT_CHILDREN&quot;]/@value)[1]', 'nvarchar(20)')='true' then '1' else '0' end
as SIGNOPTION, case when wf.IsRequired=1 then 'Required' else 'Optional' end as requiredText from tblWaiverForm f inner join 
tblWFWorkflowStepForm wf on wf.WaiverFormID=f.ID 
inner join tblWaiverFormInstance i on i.WaiverFormID=wf.WaiverFormID and i.IsCurrent=1
where f.SiteID=@siteid and wf.StepID=@stepid order by wf.orderNum, name
"   ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>">
                            <SelectParameters>
                                <asp:Parameter Name="siteid" />
                                <asp:Parameter Name="stepid" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>
                    <div class="tab-pane fade in" id="tab_managers">
                              <telerik:RadGrid ID="gridManagers" runat="server" AutoGenerateColumns="False" OnItemCommand="gridManagers_ItemCommand"  OnDeleteCommand="gridManagers_DeleteCommand"  DataSourceID="sdsManagers" OnItemDataBound="gridManagers_ItemDataBound"
                                  >
                            <MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">
                                <Columns>
                                      <telerik:GridDragDropColumn HeaderStyle-Width="18px" Visible="true">
                            <HeaderStyle Width="18px"></HeaderStyle>
                                                        </telerik:GridDragDropColumn>

                                   
                                   
                                      <telerik:GridBoundColumn DataField="displayname" 
                                        FilterControlAltText="Filter NAme column" HeaderText="Name" 
                                        SortExpression="displayname" UniqueName="displayname">
                                    </telerik:GridBoundColumn>
                                     <telerik:GridBoundColumn DataField="Email_Address" 
                                        FilterControlAltText="Filter Email column" HeaderText="Email" 
                                        SortExpression="Email_Address" UniqueName="Email_Address">
                                    </telerik:GridBoundColumn>

                                     <telerik:GridButtonColumn CommandName="RESEND" 
                                         HeaderText="Resend Invite" Text="Resend Invite" 
                                        UniqueName="resendcol" >
                                    </telerik:GridButtonColumn>
                                    
                                    <telerik:GridButtonColumn CommandName="DELETE" 
                                        FilterControlAltText="Filter column1 column" HeaderText="Remove" Text="Remove" 
                                        UniqueName="deletecol">
                                    </telerik:GridButtonColumn>
                                </Columns>
                            </MasterTableView>
                                <ClientSettings AllowRowsDragDrop="True">
                                      <Selecting AllowRowSelect="True" EnableDragToSelectRows="false"></Selecting>
                                </ClientSettings>
                            </telerik:RadGrid>

                            <asp:SqlDataSource ID="sdsManagers" runat="server" SelectCommand="select u.First_Name + ' ' + u.Last_Name as displayname, * from tblWFWorkflowStepAccess a inner join tblWPUser u on u.ID=a.WPUserID
where a.StepID=@stepid
order by u.First_Name + ' ' + u.Last_Name "  ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"></asp:SqlDataSource>

                    


                    </div>
                    </div>
                </div>
    </div>








<!-- Modal dialogs -->

<div class="modal fade" id="dlgResend" tabindex="-1" role="dialog" aria-labelledby="lblDlgAddStep">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Resend Invite</h4>
      </div>
      <div class="modal-body">
         
          <p>Resend the manager invite.</p>
         
          
          <div class="form-group">
              <label for="<%=txtResendInviteEmail.ClientID %>">Email</label>
              <asp:TextBox ID="txtResendInviteEmail" runat="server" CssClass="form-control" Enabled="false"  />
          </div>
           <div class="form-group">
              <label for="<%=cboResendInviteEvent.ClientID %>">Event Selection</label>
              <asp:DropDownList ID="cboResendInviteEvent" runat="server" CssClass="form-control" />
          </div>
           
      </div>
      <div class="modal-footer">
          <asp:Button runat="server" ID="btnResendInvite" CssClass="btn btn-primary" Text="Add" OnClick="btnResendInvite_Click" />
          <a href="javascript:void(0);" class="btn btn-muted" data-dismiss="modal">Cancel</a>
      </div>
    </div>
  </div>
</div>



<div class="modal fade" id="dlgAddStep" tabindex="-1" role="dialog" aria-labelledby="lblDlgAddStep">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="lblDlgAddStep">Add Step</h4>
      </div>
      <div class="modal-body">
          <asp:PlaceHolder runat="server" ID="phErrdlgAddStep"></asp:PlaceHolder>
          <p>Each step will appear as a button to select from at this step.</p>
         
          

           <div class="form-group">
              <label for="<%=txtNewStepButtonText.ClientID %>">Button Text <span class="text-danger">*</span></label>
              <asp:TextBox ID="txtNewStepButtonText" runat="server" CssClass="form-control"  onchange="AutoPopulateNewPageFields(this);" />
          </div>
           <div class="form-group">
              <label for="<%=txtNewStepTitle.ClientID %>">Title <span class="text-danger">*</span></label>
              <asp:TextBox ID="txtNewStepTitle" runat="server" CssClass="form-control"  />
          </div>
          <div class="form-group">
              <label for="<%=txtNewStepDescription.ClientID %>">Description</label>
              <asp:TextBox ID="txtNewStepDescription" runat="server" CssClass="form-control" TextMode="MultiLine"  />
          </div>

      </div>
      <div class="modal-footer">
          <asp:Button runat="server" ID="btnAddStep" CssClass="btn btn-primary" Text="Add" OnClick="btnAddStep_Click" />
          <a href="javascript:void(0);" class="btn btn-muted" data-dismiss="modal">Cancel</a>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="dlgAddForm" tabindex="-1" role="dialog" aria-labelledby="lblDlgAddForm">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="lblDlgAddForm">Add Waiver Forms</h4>
      </div>
      <div class="modal-body">
          <asp:PlaceHolder runat="server" ID="phErrdlgAddForm"></asp:PlaceHolder>
          <div id="formselections" class="form-group">
            <div><a href="javascript:void(0);" class="btn btn-sm btn-default btncheckall">Check All</a> <a href="javascript:void(0);" class="btn btn-sm  btn-default btnchecknone">Check None</a></div>
            <div class="checkboxlist">
            <asp:CheckBoxList ID="cblFormSelections" runat="server">

            </asp:CheckBoxList>
  
                </div>
        </div>

          

           <div class="form-group">
              <label>Form Required Mode</label>
              <asp:RadioButton ID="rbRequired" runat="server"  GroupName="requiredopt" Checked="true" /> Required &nbsp; &nbsp; <asp:RadioButton ID="rbOptional" runat="server" GroupName="requiredopt"  /> Optional
          </div>


      </div>
      <div class="modal-footer">
          <asp:Button runat="server" ID="btnAddForms" CssClass="btn btn-primary" Text="Add" OnClick="btnAddForms_Click" />
          <a href="javascript:void(0);" class="btn btn-muted" data-dismiss="modal">Cancel</a>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="dlgInvite" tabindex="-1" role="dialog" aria-labelledby="lblDlgInvite">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="lblDlgInvite">Invite Managers</h4>
      </div>
      <div class="modal-body">
          <asp:PlaceHolder runat="server" ID="phErrdlgInvite"></asp:PlaceHolder>
          <div class="form-group">
                
    <div class="form-group">
        <label>Invite New Managers:</label>
        <p class="help-block">Enter email addresses, one per line or separated by commas.<br />Each will be sent a login to view signee and participant names for this step and all child steps. Complete waiver details are not provided. </p>
        <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" ID="txtManagerEmails"></asp:TextBox>
    </div>


  <div class="form-group" id="divEventBox" runat="server">
        <label>Select an event:</label>
        <asp:DropDownList runat="server" ID="cboEvent" CssClass="form-control"></asp:DropDownList>
    </div>

      <div class="form-group">
        <label>Message:</label>
        <p class="help-block">Optional message to include in the invitation email.</p>
        <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" ID="txtManagerMessage"></asp:TextBox>
    </div>
          </div>
          

      </div>
      <div class="modal-footer">
          <asp:Button runat="server" ID="btnInviteManagers" CssClass="btn btn-primary" Text="Send Invites" OnClick="btnInviteManagers_Click" />
          <a href="javascript:void(0);" class="btn btn-muted" data-dismiss="modal">Cancel</a>
      </div>
    </div>
  </div>
</div>







<!-- Modal -->
<div class="modal fade" id="pop_move" tabindex="-1" role="dialog" aria-labelledby="lblPopMove">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="lblPopMove">Move Steps</h4>
      </div>
      <div class="modal-body">

          <div class="form-group">
              <label for="<%=cboTargetStep.ClientID %>">Select a Destination</label>
              <asp:DropDownList runat="server" ID="cboTargetStep" CssClass="form-control"></asp:DropDownList>
          </div>
          
          

      </div>
      <div class="modal-footer">

          <span id="move_part_dest_validation" class="text-danger" style="display:none;">Please select a destination</span>
           
          <asp:HiddenField runat="server" ID="hfMoveID" />
          <asp:Button runat="server" ID="btnMove" CssClass="btn btn-primary" Text="Move" OnClick="btnMove_Click" />
          <a href="javascript:void(0);" class="btn btn-muted" id="btnCancelMove" data-dismiss="modal">Cancel</a>
      </div>
    </div>
  </div>
</div>


