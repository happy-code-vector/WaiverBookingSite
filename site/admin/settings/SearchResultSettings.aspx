<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SearchResultSettings.aspx.cs" Inherits="WaiverFile.site.admin.settings.SearchResultSettings" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    
<script type="text/javascript">
    function deleteSelected() {
        var listBox = $find("<%= selectedFields.ClientID %>");
        var listview = $find("<%= selectedFields.ClientID %>");
        var items = listview.get_items();
        for (var i = 0; i < items.get_count(); i++) {
            if (items.getItem(i).get_selected() == true) {
                listBox.deleteItem(items.getItem(i));
                i--;
            }
        }
    }
    function collectFields() {
        //clear
        $('#<%=hfSelectedValues.ClientID%>').val('');

        var listBox = $find("<%= selectedFields.ClientID %>");
        var listItems = listBox.get_items();
        var resultsArray = [];
        for (var i = 0; i < listItems.get_count(); i++) {
            resultsArray.push(listItems.getItem(i).get_value());
        }

        $('#<%=hfSelectedValues.ClientID%>').val(JSON.stringify(resultsArray));

        return true;
    }
    function handleRadioCustom() {
        if ($('#<%=rbQuickSearchCustom.ClientID%>').is(':checked')) {
            $('#divQuickSearchFields').show();
        } else {
            $('#divQuickSearchFields').hide();
        }
    }
    $(function () {


        //leaving off here
        //delete this if i cant get it to work right now
        //this is not a major item
        //next thing to test is count - is it only looking at the visible checkboxes? 

        //if unchecking or checking a field, make sure we do the same to other fields with the same name
        

        $('.advbox').change(function () {
            var currFieldParam = $(this).data('fieldheadertext');
            var newCheckedVal = $(this).children('input').prop('checked');
            var numItems = 0;
            $('.advbox').each(function () {
                numItems++;
                if ($(this).data('fieldheadertext') == currFieldParam && $(this).children('input').prop('checked') != newCheckedVal) {
                    $(this).children('input').prop('checked', newCheckedVal);
                }
            });
        });


     

            $('.quickbox').change(function () {
                var currFieldParam = $(this).data('fieldheadertext');
            var newCheckedVal = $(this).children('input').prop('checked');
                var numItems = 0;
                $('.quickbox').each(function () {
                    numItems++;
                    if ($(this).data('fieldheadertext') == currFieldParam && $(this).children('input').prop('checked') != newCheckedVal) {
                        $(this).children('input').prop('checked', newCheckedVal);
                    }
                });
            });


        $('#btnRemoveSelected').click(function () {
            deleteSelected();
        });
        handleRadioCustom();
        $('#<%=rbQuickSearchStandard.ClientID%>').change(function () { handleRadioCustom(); })
        $('#<%=rbQuickSearchCustom.ClientID%>').change(function () { handleRadioCustom(); })

        $('#btnAddSelected').click(function () {

            //leaving off here
            //add selected, gotta write the code. 
            var treeView = $find("<%= treeFields.ClientID %>");
            var listBoxItem;
            var listBox = $find("<%= selectedFields.ClientID %>");
            var listItems = listBox.get_items();
            var nodes = treeView.get_selectedNodes();
            var index = listItems.get_count();
            for (var i = nodes.length - 1; i >= 0; i--) {

                if (nodes[i].get_level() == 0) {


                    //FIND ALL THE CHILDREN, AND ADD THOSE
                    var childNodes = nodes[i].get_allNodes();
                    for (var j = childNodes.length - 1; j >= 0; j--) {
                        listBoxItem = new Telerik.Web.UI.RadListBoxItem();
                        listBoxItem.set_text(childNodes[j].get_text());
                        listBoxItem.set_value(childNodes[j].get_value());
                        //listItems.insert(index + 1 + i, listBoxItem);
                        addIfNotExists(listItems, index, listBoxItem);
                    }

                }
                else {
                    listBoxItem = new Telerik.Web.UI.RadListBoxItem();
                    listBoxItem.set_text(nodes[i].get_text());
                    listBoxItem.set_value(nodes[i].get_value());
                    addIfNotExists(listItems, index, listBoxItem);


                }
            }

        });

        $('html').keyup(function (e) {
            if (e.keyCode == 46) {
                deleteSelected();
            }
        });

    });
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

    function deleteSelected() {
        var listBox = $find("<%= selectedFields.ClientID %>");
                    var listview = $find("<%= selectedFields.ClientID %>");
        var items = listview.get_items();
        for (var i = 0; i < items.get_count(); i++) {
            if (items.getItem(i).get_selected() == true) {
                listBox.deleteItem(items.getItem(i));
                i--;
            }
        }
    }
    function ClientNodeClicked(sender, eventArgs) {
        var node = eventArgs.get_node();
        node.toggle();
    }
    function onClientNodeDropped(sender, args) {
        var item = args.get_sourceNode();
        var listBox = $find("<%= selectedFields.ClientID %>");
         var listBoxElement = args.get_htmlElement();

         if (isOverElement(listBoxElement, "<%= selectedFields.ClientID %>")) {
             var innerVal = listBoxElement.innerHTML;
             innerVal = innerVal.replace('<span class="rlbText">', '');
             innerVal = innerVal.replace('</span>', '');
             var parent = listBox.findItemByText(innerVal);
             var listItems = listBox.get_items();
             var listBoxItem = new Telerik.Web.UI.RadListBoxItem();
             listBoxItem.set_text(item.get_text());
             listBoxItem.set_value(item.get_value());

             //insert at the end
             //var index = listItems.get_count();
             var index = listItems.indexOf(parent);



             //GET ALL SELECTED ITEMS TOO
             var treeView = $find("<%= treeFields.ClientID %>");

            var nodes = treeView.get_selectedNodes();
            for (var i = nodes.length - 1; i >= 0; i--) {

                if (item.get_level() == 0) {


                    //FIND ALL THE CHILDREN, AND ADD THOSE
                    var childNodes = nodes[i].get_allNodes();
                    for (var j = childNodes.length - 1; j >= 0; j--) {
                        listBoxItem = new Telerik.Web.UI.RadListBoxItem();
                        listBoxItem.set_text(childNodes[j].get_text());
                        listBoxItem.set_value(childNodes[j].get_value());
                        //listItems.insert(index + 1 + i, listBoxItem);
                        addIfNotExists(listItems, index, listBoxItem);
                    }

                }
                else {
                    addIfNotExists(listItems, index, listBoxItem);

                    if (item.get_value() != nodes[i].get_value()) {
                        listBoxItem = new Telerik.Web.UI.RadListBoxItem();
                        listBoxItem.set_text(nodes[i].get_text());
                        listBoxItem.set_value(nodes[i].get_value());
                        //listItems.insert(index + 1 + i, listBoxItem);
                        addIfNotExists(listItems, index, listBoxItem);
                    }
                }
            }

        }
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
    function onClientDroppedListBox(sender, args) {
        var item = args.get_sourceItem();
        var treeview = $find("<%= treeFields.ClientID %>");
                    var treeViewElement = args.get_htmlElement();
                    var listview = $find("<%= selectedFields.ClientID %>");
                    var listViewElement = args.get_htmlElement();
                    if (isOverElement(listViewElement, "<%= selectedFields.ClientID %>")) {

        }
        else {
            sender.deleteItem(item);
            //remove all the selected items when someone drags them
            var items = listview.get_items();
            for (var i = 0; i < items.get_count(); i++) {
                if (items.getItem(i).get_selected() == true) {
                    sender.deleteItem(items.getItem(i));
                    i--;
                }
            }

        }

    }

    function isOverElement(target, id) {

        while (target) {
            if (target.id == id)
                break;

            target = target.parentNode;
        }
        return target;
    }
</script>
    <asp:HiddenField ID="hfSelectedValues" runat="server" />
    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>

    <h2>Search Settings</h2>
    
    <h3>Quick Search Fields</h3>
     <p>Choose which fields are considered when using the quick search.</p>

    <asp:RadioButton runat="server" ID="rbQuickSearchStandard" GroupName="quicksearchfields" Text="Standard (name fields only)" />
    <asp:RadioButton runat="server" ID="rbQuickSearchCustom" GroupName="quicksearchfields" Text="Custom" />

    <div id="divQuickSearchFields">
  <asp:PlaceHolder runat="server" ID="phQuickSearch"></asp:PlaceHolder>
   </div>

    
    <h3>Advanced Search Fields</h3>
     <p>Choose which fields are shown on the advanced search form.</p>

  <asp:PlaceHolder runat="server" ID="phAdvancedSearch"></asp:PlaceHolder>
  

     <h3>Search Result Columns</h3>
    <p>Choose which columns are displayed on the search results screen.</p>

    <!-- fields -->
    <div class="row">
        <div class="col-sm-5">
            <h3>Columns to Show</h3>
             <telerik:RadListBox runat="server" Skin="Bootstrap" ID="selectedFields" SelectionMode="Multiple" EnableDragAndDrop="true" AllowReorder="true"  AutoPostBackOnReorder="false" OnClientDropped="onClientDroppedListBox" Height="300" Width="100%">
           
             </telerik:RadListBox>
            
        </div>
        
        <div class="col-sm-2 text-center">
            <div class="hidden-xs" style="width:100%; height: 100px;"></div>
            <a href="javascript:void(0);" id="btnAddSelected" class="btn btn-default btn-sm btn-block" style="margin-bottom:5px;">&lt; Add</a>
            <a href="javascript:void(0);" id="btnRemoveSelected" class="btn btn-default btn-sm btn-block">Remove &gt;</a><br />
            <p class="help-block small hidden-xs text-center">
                <br />
                <img src="/wp-content/Plugins/WaiverFile/Docs/media/dragdrop.gif" alt="Drag and Drop" class="img-responsive" />
                Drag and Drop
            </p>
            
        </div>
       <div class="col-sm-5"> <h3>All Available Columns</h3>
              <telerik:RadTreeView RenderMode="Lightweight" ShowLineImages="false" BorderWidth="1" BorderStyle="Solid" BorderColor="#dedede" Skin="Bootstrap" ID="treeFields" runat="server" EnableDragAndDrop="true" OnClientNodeDropping="onClientNodeDropped" OnClientNodeClicked="ClientNodeClicked"
                    MultipleSelect="true" >
                </telerik:RadTreeView>
        </div>
    </div>

        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click"  OnClientClick="return collectFields()" />

</asp:Content>
