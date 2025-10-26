<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WaiverReportsV4.ascx.cs" Inherits="WaiverFile.Controls.WaiverReportsV4" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Waypoint" Namespace="Waypoint.Forms" TagPrefix="cc1" %>
<%@ register src="~/Controls/FieldSelector.ascx" tagprefix="uc1" tagname="FieldSelector" %>

<style type="text/css">
    .RadTreeView_Bootstrap .rtIn{ padding: 3px; margin:1px 0; }

</style>

<asp:PlaceHolder id="phErr" runat="server"></asp:PlaceHolder>

<asp:HiddenField ID="hfSelectedValues" runat="server" />

            <script type="text/javascript">


                var allFieldsJSON = <%=allFieldsJSON%>;
                function overrideFieldsByType() {
                    //leaving off here
                    //on load or when a field is selected in each tree dropdown...
                    //check the type from the json list above. if its bool, make it say checked or not checked... 
                    //bind changes to that control to update the textbox behind the scenes. 
                    //might need to render hidden fields along with it. 

                    $('.filterrow').each(function () {
                        //FIND THE DROPDOWNTREE
                        var ddt = $(this).find('.RadDropDownTree');
                        var tree = $find($(ddt).attr('id'));
                        var selectedVal = tree.get_embeddedTree().get_selectedNode().get_value();
                        

                        for (var i = 0; i < allFieldsJSON.length; i++) {
                            for (var j = 0; j < allFieldsJSON[i]["Items"].length; j++) {

                                //CHECK FOR A BOOLEAN TYPE, AND IF FOUND, SWAP THE END USER CONTROLS 
                                if (allFieldsJSON[i]["Items"][j]["FieldName"] == selectedVal) {
                                    if (allFieldsJSON[i]["Items"][j]["DataType"] == 3) {
                                        $(this).find('.filter_str').each(function () {
                                            $(this).hide();
                                        });
                                        $(this).find('.filter_bool').each(function () {
                                            $(this).show();
                                        });
                                    } else {
                                        $(this).find('.filter_str').each(function () {
                                            $(this).show();
                                        });
                                        $(this).find('.filter_bool').each(function () {
                                            $(this).hide();
                                        });
                                    }
                                    i = allFieldsJSON.length;
                                    break;
                                }
                                /*
                                str = 0,
                                dateTime,
                                number,
                                boolean*/
                            }
                        }
                        

                    });

                }
                
                function OnClientNodeClicked(sender, args) {
                    if (args.get_node().get_level() != 0) {
                        overrideFieldsByType();
                    }
                }
                function OnClientNodeClicking(sender, args) {
                    //root items, toggle, but don't select
                    if (args.get_node().get_level() == 0) {
                        var node = args.get_node();
                        node.toggle();
                        args.set_cancel(true);
                    } 
                }
                function deleteItem() {
                    if (listBox.get_items().get_count() < 1) {
                        alert("The listBox is empty.");
                        return false;
                    }

                    var selectedItem = listBox.get_selectedItem();
                    if (!selectedItem) {
                        alert("You need to select a item first.");
                        return false;
                    }

                    if (listBox.get_items().get_count().length == 1) {
                        if (!confirm("This is the last item in the listBox. Are you sure you want to delete it?"))
                            return false;
                    }

                    listBox.deleteItem(selectedItem);
                    return false;
                }
             
                function ClientNodeClicked(sender, eventArgs) {
                    var node = eventArgs.get_node();
                    node.toggle();
                }

              

                function addIfNotExists(listItems, index, listBoxItem) {
                    var found = false;
                    for (var i = 0; i < listItems.get_count(); i++) {
                        if (listItems.getItem(i).get_value() == listBoxItem.get_value()) {
                            found = true;
                            break;
                        }
                    }
                    if (found != true) {
                        if (index < 0) {
                            index = listItems.get_count();//ADD AT THE END
                        }
                        listItems.insert(index, listBoxItem);
                    }
                }
            



              

              
            </script>
    


<script type="text/javascript">
  
    function showHideDates() {
        if ($('#<%=cboDateRange.ClientID%>').val() == 'Custom_range') {
            $('.choosedates').each(function () { $(this).show(); });
        } else {
            $('.choosedates').each(function () { $(this).hide(); });
        }
    }

   

 

    $(document).ready(function () {

        
        

    $('#btnEditHeading').click(function () {
        $('#h1Main').hide();
        $('#div_editheading').show();
    });

    $('#btnEditDesc').click(function () {
        $('#divDesc').hide();
        $('#div_editdesc').show();
    });

    showHideDates();
    $('#<%=cboDateRange.ClientID%>').change(function () { showHideDates(); })

});

</script>


<div class="control-group form-inline">
    <h1 id="h1Main"><asp:Label ID="lblHeading" runat="server"></asp:Label> <small><a href="javascript:void(0);" id="btnEditHeading"><i class="fa fa-pencil"></i></a></small></h1>
    <div id="div_editheading" style="display:none;">
        <asp:TextBox runat="server" CssClass="form-control input-lg" ID="txtHeading"></asp:TextBox>
        <asp:Button runat="server" CssClass="btn btn-primary btn-lg" Text="Save" ID="btnSaveHeading" OnClick="btnSaveHeading_Click" />
    </div>
</div>
<div class="control-group form-inline">
    <div id="divDesc"><p class="help-block"><asp:Label ID="lblDesc" runat="server"></asp:Label> <a href="javascript:void(0);" id="btnEditDesc"><i class="fa fa-pencil"></i></a></p></div>
    <div id="div_editdesc" style="display:none;">
        <asp:TextBox runat="server" CssClass="form-control" ID="txtDesc" TextMode="MultiLine"></asp:TextBox><br />
        <asp:Button runat="server" CssClass="btn btn-primary" Text="Save" ID="btnSaveDesc" OnClick="btnSaveDesc_Click" />
    </div>
</div>

<div id="report_config">

    

    <div class="row">
        <div class="col-sm-6">
             <div class="form-group">
                <label for="<%=cboReportMode.ClientID %>">Report Mode </label>
                <asp:DropDownList runat="server" CssClass="form-control" ID="cboReportMode" AutoPostBack="true" OnSelectedIndexChanged="cboReportMode_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-sm-6">
             <div class="form-group">
                <label for="<%=cboReportMode.ClientID %>">Date Filter Mode</label>
                <asp:DropDownList runat="server" CssClass="form-control" ID="cboDateMode">
                </asp:DropDownList>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6"><div class="form-group">
        <label>Date Range</label>
        <asp:DropDownList runat="server" ID="cboDateRange" CssClass="form-control">
        </asp:DropDownList>
    </div></div>
        <div class="col-sm-6">
              
<div class="row">
 <div class="col-sm-6">
<div class="form-group choosedates">
    <label for="<%=dtStart.ClientID %>">Start Date</label><telerik:RadDatePicker ID="dtStart" DateInput-CssClass="form-control" runat="server" Skin="Bootstrap"  Calendar-CalendarCaption="" Width="100%">
              
                <Calendar runat="server" ShowRowHeaders="false" Skin="Bootstrap"></Calendar>
               
                <DateInput CssClass="form-control"   LabelWidth="40%">
                    <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                    <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                    <FocusedStyle Resize="None"></FocusedStyle>
                    <DisabledStyle Resize="None"></DisabledStyle>
                    <InvalidStyle Resize="None"></InvalidStyle>
                    <HoveredStyle Resize="None"></HoveredStyle>
                    <EnabledStyle Resize="None"></EnabledStyle>
                </DateInput>
                <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
               
            </telerik:RadDatePicker>
</div>
     </div>
     <div class="col-sm-6">
   <div class="form-group choosedates">
       <label for="<%=dtEnd.ClientID %>">End Date</label><telerik:RadDatePicker ID="dtEnd" DateInput-CssClass="form-control" runat="server" Skin="Bootstrap"  Calendar-CalendarCaption="" Width="100%">
              
                <Calendar runat="server" ShowRowHeaders="false" Skin="Bootstrap"></Calendar>
               
                <DateInput CssClass="form-control"   LabelWidth="40%">
                    <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                    <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                    <FocusedStyle Resize="None"></FocusedStyle>
                    <DisabledStyle Resize="None"></DisabledStyle>
                    <InvalidStyle Resize="None"></InvalidStyle>
                    <HoveredStyle Resize="None"></HoveredStyle>
                    <EnabledStyle Resize="None"></EnabledStyle>
                </DateInput>
                <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
        
            </telerik:RadDatePicker>
   </div>
    </div>
 </div>  
        </div>
    </div>

   

    <telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1">
	</telerik:RadAjaxLoadingPanel>

	
  
    <asp:Panel id="pnlTreeAndList" runat="server">
    <!-- fields -->
        <uc1:fieldselector runat="server" id="FieldSelector1" />
    

        </asp:Panel>

    <div class="form-inline" style="padding:20px 0 10px;">
    <h3 style="margin:0; display:inline-block;padding:0 15px 0 0;">Filters</h3><asp:DropDownList runat="server" CssClass="form-control input-sm" ID="cboFilterMatch">

        <asp:ListItem Value="All">Match All</asp:ListItem>
        <asp:ListItem Value="Any">Match Any</asp:ListItem>
                                                                     </asp:DropDownList>
        </div>
    <asp:PlaceHolder runat="server" ID="phFilters"></asp:PlaceHolder>
 
    <asp:Button runat="server" ID="btnAddFilter" CssClass="btn btn-default" Text="Add Filter" OnClick="btnAddFilter_Click"  />
   
    <br /><br />
    <asp:LinkButton runat="server" ID="btnSave" CssClass="btn btn-primary" OnClick="btnSave_Click" ><i class="fa fa-floppy-o"></i> Save and Return</asp:LinkButton>
    <asp:LinkButton runat="server" ID="btnSaveAndRun" CssClass="btn btn-primary" Text="Save and Run Report" OnClick="btnSaveAndRun_Click" ><i class="fa fa-play"></i> Save and Run</asp:LinkButton>
    

    <!-- filters -->


</div><!-- report_config -->

<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br /><br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />