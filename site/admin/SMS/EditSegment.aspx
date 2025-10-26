<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditSegment.aspx.cs" Inherits="WaiverFile.site.admin.SMS.EditSegment" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    
    <style type="text/css">
        .RadTreeView_Bootstrap .rtIn{ padding: 3px; margin:1px 0; }

    </style>

    <asp:HiddenField ID="hfSelectedValues" runat="server" />
    
    
    

    <script type="text/javascript">
  
    function showHideDates() {
        if ($('#<%=cboDateRange.ClientID%>').val() == 'Custom_range') {
            $('.choosedates').each(function () { $(this).show(); });
        } else {
            $('.choosedates').each(function () { $(this).hide(); });
        }
    }

    $(document).ready(function () {
        

    showHideDates();
    $('#<%=cboDateRange.ClientID%>').change(function () { showHideDates(); })

    });

</script>
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
    


                <h3>Segment</h3>
     <nav aria-label="breadcrumb" xmlns:cc1="remove"><ol class="breadcrumb">
    <li><a href="Subscribers.aspx?view=segments">Subscribers</a></li>
    <li class="breadcrumb-item active" aria-current="page">Edit Segment</li>
  </ol></nav>


                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
               
                 <div class="form-group">
                      <label for="<%=txtName.ClientID %>">Name</label><asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
    
    <div class="row">
  
  
        <div class="col-sm-6"><div class="form-group">
        <label>Date</label>
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
          <div class="col-sm-6">
        <div class="form-group">
            <label for="<%=cboDateMode.ClientID %>">Date Filter Mode</label>
            <asp:DropDownList runat="server" CssClass="form-control" ID="cboDateMode">
            </asp:DropDownList>
        </div>
    </div>
    </div>



    <div class="form-inline" style="padding:20px 0 10px;">
        <h3 style="margin:0; display:inline-block;padding:0 15px 0 0;">Filters</h3><asp:DropDownList runat="server" CssClass="form-control input-sm" ID="cboFilterMatch">

            <asp:ListItem Value="All">Match All</asp:ListItem>
            <asp:ListItem Value="Any">Match Any</asp:ListItem>
        </asp:DropDownList>
    </div>
    <asp:PlaceHolder runat="server" ID="phFilters"></asp:PlaceHolder>
 
    <asp:Button runat="server" ID="btnAddFilter" CssClass="btn btn-default" Text="Add Filter" OnClick="btnAddFilter_Click"  />


    <br /><br />
               
               <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />
            

            






</asp:Content>
