<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormBuilder2.ascx.cs" Inherits="WaiverFile.Controls.FormBuilder2" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<style type="text/css">
    .btnSelectNewFieldType{ margin-bottom: 10px; }
    /*modal bootstrap scroll fix:*/
    .modal-body {
    max-height: calc(100vh - 212px);
    overflow-y: auto;
}
     input[type='checkbox']{ margin-right: 5px !important; }
</style>


<asp:Panel runat="server" ID="scriptStuff">

  

<script type="text/javascript">

    //function showHideModalStuff() {
    //    var listbox1 = $find("<%=lbRadioButtonListItems.ClientID%>");
    //    if (listbox1 != null) {
    //        if (listbox1.get_checkedItems().length > 0) {
    //            $('#btnRemoveItemRadioButtonList').show();
    //        }
    //    }
    //}

    $(function () {

        //showHideModalStuff();
      

        $('.btnAddField').click(function () {
            $('#dlgSelectFieldType').modal('show');
        });
        
        $('.btnSelectNewFieldType').click(function () {
            $('#dlgSelectFieldType').modal('hide');
            var targetdlg = $(this).data('targetdlg');
            $('#' + targetdlg).modal('show');

            //showHideModalStuff();

        }); 

       

    });

    /*radlistbox stuff*/
    function lbRadioButtonListItems_CheckedHandler(sender, eventArgs) {
        $('#btnRemoveItemRadioButtonList').show();
    }
    function lbCheckBoxListItems_CheckedHandler(sender, eventArgs) {
        $('#btnRemoveItemCheckBoxList').show();
    }
    function lbDropDownListItems_CheckedHandler(sender, eventArgs) {
        $('#btnRemoveItemDropDownList').show();
    }
</script>
 
    </asp:Panel>
<asp:PlaceHolder runat="server" ID="phOnloadModals"></asp:PlaceHolder>


<a href="javascript:void(0);" class="btn btn-primary btn-sm btnAddField pull-right" style="margin-bottom:10px;"><i class="fa fa-plus-circle"></i> Add Field</a>
<h4>Custom Questions</h4>
<asp:Panel runat="server" ID="pnlMainWrap">
          <telerik:RadListBox RenderMode="Lightweight" runat="server" OnClientItemChecked="lbRadioButtonListItems_CheckedHandler" 
                ID="lbMain" EnableDragAndDrop="True" AllowReorder="true"
			 Width="100%"  Skin="Office2010Blue">
			<ItemTemplate>
                <div style="margin-bottom:5px">
                <strong><%# DataBinder.Eval(Container.DataItem, "Label") %> <%# DataBinder.Eval(Container.DataItem, "RequiredMarkerHtml") %></strong>
                <div class="pull-right">
                    
                    <asp:LinkButton runat="server" CssClass="btn btn-xs btn-default" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Cid").ToString() %>' OnClick="DUPLICATE_Click" ToolTip="Duplicate"><i class="fa fa-files-o"></i></asp:LinkButton>
                    <asp:LinkButton runat="server" CssClass="btn btn-xs btn-default" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Cid").ToString() %>' OnClick="EDIT_Click" ToolTip="Edit"><i class="fa fa-pencil"></i></asp:LinkButton>
                <asp:LinkButton runat="server" CssClass="btn btn-xs btn-danger" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Cid").ToString() %>' OnClick="DELETE_Click" ToolTip="Delete"><i class="fa fa-trash"></i></asp:LinkButton>
                
                    </div>
                    </div>
                <%# DataBinder.Eval(Container.DataItem, "PreviewHtml") %>
                <small><%# DataBinder.Eval(Container.DataItem, "Description") %></small>
                <hr style="margin:5px 0;" />
			</ItemTemplate>
			
		</telerik:RadListBox>


    </asp:Panel>





<!-- dialogs -->
<!-- dialog: add field select -->

<div class="modal fade" id="dlgSelectFieldType" tabindex="-1" role="dialog" aria-labelledby="dlgSelectFieldTypeHeading">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="dlgSelectFieldTypeHeading">Select field type</h4>
      </div>
      <div class="modal-body">
        
          <div class="row">
              <div class="col-sm-6">
                  <a href="javascript:void(0);" class="btnSelectNewFieldType btn btn-default btn-block" data-targetdlg="dlgTextBox">
                      <i class="fa fa-font"></i> Textbox
                  </a>
              </div>
              <div class="col-sm-6">
                  <a href="javascript:void(0);" class="btnSelectNewFieldType btn btn-default btn-block" data-targetdlg="dlgNumber">
                      <i class="fa fa-number"></i> Number
                  </a>
              </div>
          </div>

         <div class="row">
              <div class="col-sm-6">
                  <a href="javascript:void(0);" class="btnSelectNewFieldType btn btn-default btn-block" data-targetdlg="dlgRadioButtonList">
                      <i class="fa fa-circle-o"></i> Multiple Choice
                  </a>
              </div>
              <div class="col-sm-6">
                  <a href="javascript:void(0);" class="btnSelectNewFieldType btn btn-default btn-block" data-targetdlg="dlgCheckBoxList">
                      <i class="fa fa-square-o"></i> Check Boxes
                  </a>
              </div>
          </div>

          <div class="row">
              <div class="col-sm-6">
                  <a href="javascript:void(0);" class="btnSelectNewFieldType btn btn-default btn-block" data-targetdlg="dlgDropdownList">
                      <i class="fa fa-caret-down"></i> Dropdown
                  </a>
              </div>
              <div class="col-sm-6">
                  <a href="javascript:void(0);" class="btnSelectNewFieldType btn btn-default btn-block" data-targetdlg="dlgSectionBreak">
                      <i class="fa fa-minus"></i> Section Break
                  </a>
              </div>
          </div>

      </div>     
    </div>
  </div>
</div>


<!-- dialog:TextBox  -->
<asp:Panel runat="server" ID="pnlWrapTextBox">
<asp:HiddenField ID="hfTextBox" runat="server" />
<div class="modal fade" id="dlgTextBox" tabindex="-1" role="dialog" aria-labelledby="dlgTextBoxHeading">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="dlgTextBoxHeading">Textbox</h4>
      </div>
      <div class="modal-body">
        
          <asp:PlaceHolder ID="phErrTextbox" runat="server"></asp:PlaceHolder>

          <div class="form-group">
              <label>Label</label>
              <asp:TextBox runat="server" ID="txtTextboxLabel" CssClass="form-control"></asp:TextBox>
          </div>
          <div class="form-group">
              <label>Description</label>
              <asp:TextBox runat="server" ID="txtTextboxDescription" CssClass="form-control"></asp:TextBox>
          </div>
          <div class="form-group">
             <asp:CheckBox runat="server" ID="chkTextboxRequired" Text="Required" />
          </div>
          <hr />
          <div class="form-inline">
              <label>Minimum Length</label>
              <asp:TextBox runat="server" ID="txtTextboxMinLen" CssClass="form-control" Width="60px"></asp:TextBox>
              <label>Maximum Length</label>
              <asp:TextBox runat="server" ID="txtTextboxMaxLen" CssClass="form-control" Width="60px"></asp:TextBox>
          </div>
          <div class="form-group">
             <asp:CheckBox runat="server" ID="chkTextboxMultiline" Text="Multiline" />
          </div>

        </div>     
        <div class="modal-footer">
            <asp:Button runat="server" ID="btnSaveTextbox" CssClass="btn btn-primary" OnClick="btnSaveTextbox_Click" Text="Save" />
        </div>

      
    </div>
  </div>
</div>
    </asp:Panel>



<!-- dialog: Number  -->
<asp:Panel runat="server" ID="pnlWrapNumber">
<asp:HiddenField ID="hfNumber" runat="server" />
<div class="modal fade" id="dlgNumber" tabindex="-1" role="dialog" aria-labelledby="dlgNumberHeading">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="dlgNumberHeading">Number</h4>
      </div>
      <div class="modal-body">
        
           <asp:PlaceHolder ID="phErrNumber" runat="server"></asp:PlaceHolder>

          <div class="form-group">
              <label>Label</label>
              <asp:TextBox runat="server" ID="txtNumberLabel" CssClass="form-control"></asp:TextBox>
          </div>
          <div class="form-group">
              <label>Description</label>
              <asp:TextBox runat="server" ID="txtNumberDescription" CssClass="form-control"></asp:TextBox>
          </div>
           <div class="form-group">
              <label>Unit Name</label>
              <asp:TextBox runat="server" ID="txtNumberUnitName" CssClass="form-control"></asp:TextBox>
          </div>
          <div class="form-group">
             <asp:CheckBox runat="server" ID="chkNumberRequired" Text="Required" />
          </div>
          <hr />
          <div class="form-inline">
              <label>Minimum</label>
              <asp:TextBox runat="server" ID="txtNumberMin" CssClass="form-control"></asp:TextBox>
              <label>Maximum</label>
              <asp:TextBox runat="server" ID="txtNumberMax" CssClass="form-control"></asp:TextBox>
          </div>
          <div class="form-group">
             <asp:CheckBox runat="server" ID="chkNumberIntsOnly" Text="Only accept integers" />
          </div>



           </div>     
          <div class="modal-footer">
               <asp:Button runat="server" ID="btnSaveNumber" CssClass="btn btn-primary" OnClick="btnSaveNumber_Click" Text="Save" />
          </div>
     
    </div>
  </div>
</div>
    </asp:Panel>



<!-- dialog:RadioButtonList  -->
<asp:Panel runat="server" ID="pnlWrapRadioButtonList">
<asp:HiddenField ID="hfRadioButtonList" runat="server" />
<div class="modal fade" id="dlgRadioButtonList" tabindex="-1" role="dialog" aria-labelledby="dlgRadioButtonListHeading">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="dlgRadioButtonListHeading">Multiple Choice</h4>
      </div>
      <div class="modal-body">
        
           <asp:PlaceHolder ID="phErrRadioButtonList" runat="server"></asp:PlaceHolder>

          <div class="form-group">
              <label>Label</label>
              <asp:TextBox runat="server" ID="txtRadioButtonListLabel" CssClass="form-control"></asp:TextBox>
          </div>
          <div class="form-group">
              <label>Description</label>
              <asp:TextBox runat="server" ID="txtRadioButtonListDescription" CssClass="form-control"></asp:TextBox>
          </div>
          <div class="form-group">
             <asp:CheckBox runat="server" ID="chkRadioButtonListRequired" Text="Required" />
          </div>
          <hr />
          <telerik:RadAjaxPanel runat="server">
          <label>Items</label><div class="pull-right" id="btnRemoveItemRadioButtonList" style="display:none;">
              <asp:LinkButton runat="server" ID="btnRemoveItemsRadioButtonList" CssClass="btn btn-sm btn-danger" OnClick="btnRemoveItemsRadioButtonList_Click"><i class="fa fa-times-circle"></i> Remove Checked Items</asp:LinkButton>
              </div>
          <telerik:RadListBox RenderMode="Lightweight" runat="server" CheckBoxes="true" OnClientItemChecked="lbRadioButtonListItems_CheckedHandler" 
                ID="lbRadioButtonListItems" EnableDragAndDrop="True" AllowReorder="true"
			Height="250px"  Width="100%"  Skin="Office2010Blue">
			<ButtonSettings ShowReorder="false"></ButtonSettings>
			
		</telerik:RadListBox>

              <asp:Panel runat="server" DefaultButton="btnAddItemRadioButtonList">
                  <div class="row">
                      <div class="col-sm-10"><asp:TextBox runat="server" CssClass="form-control" ID="txtAddItemRadioButtonList" placeholder="Add Item"></asp:TextBox></div>
                      <div class="col-sm-2"><asp:Button runat="server" ID="btnAddItemRadioButtonList" CssClass="btn btn-sm btn-primary btn-block" OnClick="btnAddItemRadioButtonList_Click" Text="Add" /></div>
                  </div>
                  </asp:Panel>

              </telerik:RadAjaxPanel>

           <div class="form-group">
             <asp:CheckBox runat="server" ID="chkRadioButtonIncludeOther" Text="Include other" />
          </div>


           </div>   
          <div class="modal-footer">
               <asp:Button runat="server" ID="btnSaveRadioButtons" CssClass="btn btn-primary" Text="Save" OnClick="btnSaveRadioButtons_Click" />
          </div>
       
    </div>
  </div>
</div>
    </asp:Panel>



<!-- dialog: CheckBoxList -->
<asp:Panel runat="server" ID="pnlWrapCheckBoxList">
<asp:HiddenField ID="hfCheckBoxList" runat="server" />
<div class="modal fade" id="dlgCheckBoxList" tabindex="-1" role="dialog" aria-labelledby="dlgCheckBoxListHeading">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="dlgCheckBoxListHeading">Checkboxes</h4>
      </div>
      <div class="modal-body">
        
           <asp:PlaceHolder ID="phErrCheckBoxList" runat="server"></asp:PlaceHolder>

          <div class="form-group">
              <label>Label</label>
              <asp:TextBox runat="server" ID="txtCheckBoxListLabel" CssClass="form-control"></asp:TextBox>
          </div>
          <div class="form-group">
              <label>Description</label>
              <asp:TextBox runat="server" ID="txtCheckBoxListDescription" CssClass="form-control"></asp:TextBox>
          </div>
          <div class="form-group">
             <asp:CheckBox runat="server" ID="chkCheckBoxListRequired" Text="Required" />
          </div>
          <hr />
          <telerik:RadAjaxPanel runat="server">
          <label>Items</label><div class="pull-right" id="btnRemoveItemCheckBoxList" style="display:none;">
              <asp:LinkButton runat="server" ID="btnRemoveItemsCheckBoxList" CssClass="btn btn-sm btn-danger" OnClick="btnRemoveItemsCheckBoxList_Click"><i class="fa fa-times-circle"></i> Remove Checked Items</asp:LinkButton>
              </div>
          <telerik:RadListBox RenderMode="Lightweight" runat="server" CheckBoxes="true" OnClientItemChecked="lbCheckBoxListItems_CheckedHandler" 
                ID="lbChecBoxListItems" EnableDragAndDrop="True" AllowReorder="true"
			Height="250px"  Width="100%" Skin="Office2010Blue">
			<ButtonSettings ShowReorder="false"></ButtonSettings>
			
		</telerik:RadListBox>
      


              <asp:Panel runat="server" DefaultButton="btnAdditemCheckBoxList">
                  <div class="row">
                      <div class="col-sm-10"><asp:TextBox runat="server" CssClass="form-control" ID="txtAddItemCheckBoxList" placeholder="Add Item"></asp:TextBox></div>
                      <div class="col-sm-2"><asp:Button runat="server" ID="btnAdditemCheckBoxList" CssClass="btn btn-sm btn-primary btn-block" OnClick="btnAdditemCheckBoxList_Click" Text="Add" /></div>
                  </div>
                  </asp:Panel>

              </telerik:RadAjaxPanel>

            <div class="form-group">
             <asp:CheckBox runat="server" ID="chkCheckBoxListIncludeOther" Text="Include other" />
          </div>
           </div>     
          <div class="modal-footer">
               <asp:Button runat="server" ID="btnSaveCheckBoxList" CssClass="btn btn-primary" Text="Save" OnClick="btnSaveCheckBoxList_Click" />
          </div>
     
    </div>
  </div>
</div>
    </asp:Panel>



<!-- dialog: DropdownList -->
<asp:Panel runat="server" ID="pnlWrapDropDownList">
<asp:HiddenField ID="hfDropDownList" runat="server" />
<div class="modal fade" id="dlgDropdownList" tabindex="-1" role="dialog" aria-labelledby="dlgDropdownListHeading">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="dlgDropdownListHeading">Dropdown</h4>
      </div>
      <div class="modal-body">
        
                   <asp:PlaceHolder ID="phErrDropDownList" runat="server"></asp:PlaceHolder>

          <div class="form-group">
              <label>Label</label>
              <asp:TextBox runat="server" ID="txtDropDownListLabel" CssClass="form-control"></asp:TextBox>
          </div>
          <div class="form-group">
              <label>Description</label>
              <asp:TextBox runat="server" ID="txtDropDownListDescription" CssClass="form-control"></asp:TextBox>
          </div>
          <div class="form-group">
             <asp:CheckBox runat="server" ID="chkDropDownListRequired" Text="Required" />
          </div>
          <hr />
          <telerik:RadAjaxPanel runat="server">
          <label>Items</label><div class="pull-right" id="btnRemoveItemDropDownList" style="display:none;">
              <asp:LinkButton runat="server" ID="btnRemoveItemsDropDownList" CssClass="btn btn-sm btn-danger" OnClick="btnRemoveItemsDropDownList_Click"><i class="fa fa-times-circle"></i> Remove Checked Items</asp:LinkButton>
              </div>
          <telerik:RadListBox RenderMode="Lightweight" runat="server" CheckBoxes="true" OnClientItemChecked="lbDropDownListItems_CheckedHandler" 
                ID="lbDropDownListItems" EnableDragAndDrop="True" AllowReorder="true"
			Height="250px"  Width="100%" Skin="Office2010Blue">
			<ButtonSettings ShowReorder="false"></ButtonSettings>
			
		</telerik:RadListBox>
      
              <asp:Panel runat="server" DefaultButton="btnAddItemDropDownList">
                  <div class="row">
                      <div class="col-sm-10"><asp:TextBox runat="server" CssClass="form-control" ID="txtAdditemDropDownList" placeholder="Add Item"></asp:TextBox></div>
                      <div class="col-sm-2"><asp:Button runat="server" ID="btnAddItemDropDownList" CssClass="btn btn-sm btn-primary btn-block" OnClick="btnAddItemDropDownList_Click" Text="Add" /></div>
                  </div>
                  </asp:Panel>

              </telerik:RadAjaxPanel>

           <div class="form-group">
             <asp:CheckBox runat="server" ID="chkDropDownIncludeBlank" Text="Include blank" />
          </div>

          </div>    
          <div class="modal-footer">
               <asp:Button runat="server" ID="btnSaveDropDownList" CssClass="btn btn-primary" OnClick="btnSaveDropDownList_Click"  Text="Save"/>
          </div>
       
    </div>
  </div>
</div>
    </asp:Panel>



<!-- dialog: SectionBreak -->
<asp:Panel runat="server" ID="pnlWrapSectionBreak">
<asp:HiddenField ID="hfSectionBreak" runat="server" />
<div class="modal fade" id="dlgSectionBreak" tabindex="-1" role="dialog" aria-labelledby="dlgSectionBreakHeading">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="dlgSectionBreakHeading">Section Break</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
              <label>Label</label>
              <asp:TextBox runat="server" ID="txtSectionBreakLabel" CssClass="form-control"></asp:TextBox>
          </div>
          <div class="form-group">
              <label>Description</label>
              <asp:TextBox runat="server" ID="txtSectionBreakDescription" CssClass="form-control"></asp:TextBox>
          </div>
          </div>    
          <div class="modal-footer">
               <asp:Button runat="server" ID="btnSaveSectionBreak" CssClass="btn btn-primary" Text="Save" OnClick="btnSaveSectionBreak_Click" />
          </div>
       
    </div>
  </div>
</div>
    </asp:Panel>


