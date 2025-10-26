<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventManagerSettings.ascx.cs" Inherits="WaiverFile.Controls.EventManagerSettings" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadCodeBlock runat="server" ID="RadCodeBlock1">
		<script type="text/javascript">
            //<![CDATA[
            Sys.Application.add_load(function () {
                demo.ListBoxID = "<%= RadListBox1.ClientID%>";
                demo.TreeViewID = "<%=RadTreeView1.ClientID %>";
                demo.initialize();
                collectFields();
            });
			//]]>
		</script>



<script type="text/javascript">
    function deleteSelected() {
        var listBox = $find("<%= RadListBox1.ClientID %>");
        var listview = $find("<%= RadListBox1.ClientID %>");
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

    function collectFields() {
        //clear
        $('#<%=hfSelectedValues.ClientID%>').val('');

                    var listBox = $find("<%= RadListBox1.ClientID %>");
                    var listItems = listBox.get_items();
                    var resultsArray = [];
                    for (var i = 0; i < listItems.get_count(); i++) {
                        resultsArray.push(listItems.getItem(i).get_value());
                    }

                    $('#<%=hfSelectedValues.ClientID%>').val(JSON.stringify(resultsArray));

        return true;
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
    $(function () {
        $('#btnRemoveSelected').click(function () {
            deleteSelected();
        });
        $('#btnAddSelected').click(function () {

            //leaving off here
            //add selected, gotta write the code. 
            var treeView = $find("<%= RadTreeView1.ClientID %>");
            var listBoxItem;
            var listBox = $find("<%= RadListBox1.ClientID %>");
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



    (function () {
        var demo = window.demo = window.demo || {};
        var ListBoxID;
        var TreeViewID;

        //indicates whether the user is currently dragging a listbox item
        var listBoxDragInProgress = false;

        //indicates whether the user is currently dragging a tree node
        var treeViewDragInProgress = false;

        demo.initialize = function () {
            ListBoxID = demo.ListBoxID;
            TreeViewID = demo.TreeViewID;
        };

        //chech if a given html element is a child of an element with the specified id
        function isOverElement(target, id) {
            while (target) {
                if (target.id == id)
                    break;

                target = target.parentNode;
            }
            return target;
        }

        function checkDropTargets(target) {
            if (isOverElement(target, ListBoxID) || isOverElement(target, TreeViewID)) {
                //if the mouse is over the treeview or listbox - set the cursor to default
                document.body.style.cursor = "";
            } else {
                //else set the cursor to "no-drop" to indicate that dropping over this html element is not supported
                document.body.style.cursor = "no-drop";
            }
        }

        //select the hovered listbox item if the user is dragging a node
        window.onListBoxMouseOver = function (sender, args) {
            if (treeViewDragInProgress) {
                args.get_item().set_selected(true);
            }
        }

        //select the hovered tree node if the user is dragging a listbox item
        window.onTreeViewMouseOver = function (sender, args) {
            if (listBoxDragInProgress) {
                args.get_node().set_selected(true);
            }
        }

        //unselect the item if the user is dragging a node
        window.onListBoxMouseOut = function (sender, args) {
            if (treeViewDragInProgress) {
                args.get_item().set_selected(false);
            }
        }

        //unselect the node if the user is dragging a listbox item
        window.onTreeViewMouseOut = function (sender, args) {
            if (listBoxDragInProgress) {
                args.get_node().set_selected(false);
            }
        }

        //indicate that the user started dragging a listbox item
        window.onListBoxDragStart = function (sender, args) {
            listBoxDragInProgress = true;
        }

        //indicate that the user started dragging a tree node
        window.onTreeViewDragStart = function (sender, args) {
            treeViewDragInProgress = true;
        }

        //handle the drop of the listbox item
        window.onListBoxDropping = function (sender, args) {
            //indicate that the user stopped dragging
            listBoxDragInProgress = false;
            document.body.style.cursor = "";
            //restore the cursor to the default state
            document.body.style.cursor = "";

            //get the html element on which the item is dropped
            var target = args.get_htmlElement();

            //if dropped on the listbox itself return.
            if (isOverElement(target, ListBoxID)) {
                return;
            }
            //check if dropped on the treeview
            target = isOverElement(target, TreeViewID);

            //if not cancel the dropping event so it does not postback
            if (!target) {
                args.set_cancel(true);
                return;
            }

            //the item was dropped on the treeview - set the htmlElement. 
            //it can be later accessed via the HtmlElementID property of the RadListBox
            args.set_htmlElement(target);

            collectFields();
        }

        //handle the drop of the tree node
        window.onTreeViewDropping = function (sender, args) {
            //indicate that the user stopped dragging
            treeViewDragInProgress = false;

            //restore the cursor to the default state
            document.body.style.cursor = "";

            //get the html element on which the node is dropped
            var target = args.get_htmlElement();

            //if dropped on the treeview itself return.
            if (isOverElement(target, TreeViewID)) {
                return;
            }
            //check if dropped on the listbox
            target = isOverElement(target, ListBoxID);

            //if not cancel the dropping event so it does not postback
            if (!target) {
                args.set_cancel(true);
                return;
            }

            //the node was dropped on the listbox - set the htmlElement. 
            //it can be later accessed via the HtmlElementID property of the RadTreeNodeDragDropEventArgs
            args.set_htmlElement(target);

            collectFields();
        }

        //update the cursor if the user is dragging the item over supported drop target - listbox or treeview
        window.onListBoxDragging = function (sender, args) {
            checkDropTargets(args.get_htmlElement());
        }

        //update the cursor if the user is dragging the node over supported drop target - listbox or treeview
        window.onTreeViewDragging = function (sender, args) {
            checkDropTargets(args.get_htmlElement());
        }

    }());

</script>
	</telerik:RadCodeBlock>
<asp:PlaceHolder id="phErr" runat="server"></asp:PlaceHolder>

<asp:HiddenField ID="hfSelectedValues" runat="server" />


	<telerik:RadAjaxManager runat="server" ID="RadAjaxManager1">
		<AjaxSettings>
			<telerik:AjaxSetting AjaxControlID="RadListBox1">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="RadListBox1" LoadingPanelID="RadAjaxLoadingPanel1" />
					<telerik:AjaxUpdatedControl ControlID="RadTreeView1" LoadingPanelID="RadAjaxLoadingPanel1" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="RadTreeView1">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="RadListBox1" LoadingPanelID="RadAjaxLoadingPanel1" />
					<telerik:AjaxUpdatedControl ControlID="RadTreeView1" LoadingPanelID="RadAjaxLoadingPanel1" />
				</UpdatedControls>
			</telerik:AjaxSetting>
		</AjaxSettings>
	</telerik:RadAjaxManager>

<asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary pull-right" Text="Save" OnClick="btnSave_Click" OnClientClick="return collectFields()" />
<h2>Event Manager Fields</h2>
<p>Choose the fields that event managers can view. When you grant manager access to an event, the selected fields will be displayed in the grid for those users.</p>

 <!-- fields -->
    <div class="row">
        <div class="col-sm-5">
            <h3>Selected Fields</h3>
             <telerik:RadListBox RenderMode="Lightweight" runat="server" 
                ID="RadListBox1" EnableDragAndDrop="True" AllowReorder="true"
			Height="300px"  Width="100%" OnClientDropping="onListBoxDropping" OnClientDragStart="onListBoxDragStart"
			OnClientMouseOver="onListBoxMouseOver" OnClientMouseOut="onListBoxMouseOut" OnClientDragging="onListBoxDragging"
			OnDropped="RadListBox1_ItemDropped" Skin="Office2010Blue">
			<ButtonSettings ShowReorder="false"></ButtonSettings>
			
		</telerik:RadListBox>
            
        </div>
        
        <div class="col-sm-2 text-center">
            <div class="hidden-xs" style="width:100%; height: 100px;"></div>
             <div style="display:none;"><!-- hide for now -->
            <a href="javascript:void(0);" id="btnAddSelected" class="btn btn-default btn-sm btn-block" style="margin-bottom:5px;">&lt; Add</a>
            <a href="javascript:void(0);" id="btnRemoveSelected" class="btn btn-default btn-sm btn-block">Remove &gt;</a><br />
                 </div>
            <p class="help-block small hidden-xs text-center">
                <br />
                <img src="/wp-content/Plugins/WaiverFile/Docs/media/dragdrop.gif" alt="Drag and Drop" class="img-responsive" />
                Drag and Drop
            </p>
            
        </div>
       <div class="col-sm-5"> <h3>All Fields</h3>
               <telerik:RadTreeView RenderMode="Lightweight" runat="server" 
               ID="RadTreeView1" 
               EnableDragAndDrop="True" 
               OnClientMouseOver="onTreeViewMouseOver"
			OnClientMouseOut="onTreeViewMouseOut" OnClientNodeDragStart="onTreeViewDragStart"
			OnClientNodeDropping="onTreeViewDropping" OnNodeDrop="RadTreeView1_NodeDrop"
			OnClientNodeDragging="onTreeViewDragging" Skin="Bootstrap">
			
		</telerik:RadTreeView>
    </div>

