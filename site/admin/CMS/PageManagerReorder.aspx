<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="PageManagerReorder.aspx.cs" Inherits="WaiverFile.site.admin.CMS.PageManagerReorder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.15.0/Sortable.min.css" rel="stylesheet" />
    <style>
        .page-header-section {
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #e7e7e7;
        }

        .page-header-section h3 {
            margin-top: 10px;
            margin-bottom: 10px;
            color: #333;
            font-weight: 600;
            display: inline-block;
        }

        .reorder-container {
            background: #fff;
            border: 1px solid #e7e7e7;
            border-radius: 4px;
            box-shadow: 0 1px 1px rgba(0,0,0,0.05);
            padding: 20px;
            margin-bottom: 20px;
        }

        .alert-info-custom {
            background-color: #d9edf7;
            border-color: #bce8f1;
            color: #31708f;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
        }

        .sortable-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        

        .sortable-item {
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 12px 15px;
            margin-bottom: 8px;
            cursor: default !important;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .sortable-item:hover {
            background: #f9f9f9;
            border-color: #bbb;
        }

        .sortable-item.sortable-ghost {
            opacity: 0.4;
            background: #f0f0f0;
        }

        .sortable-item.sortable-drag {
            opacity: 1;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }

        .sortable-item.sortable-chosen {
            background: #f5f5f5;
        }

        .page-item-content {
            flex: 1;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        

        .drag-handle {
            color: #999;
            margin-right: 10px;
            font-size: 18px;
            cursor: move !important;
            
            padding: 5px;
            margin-left: -5px;
        }

        .drag-handle:active {
            cursor: grabbing;
        }

        .page-icons {
            display: flex;
            gap: 8px;
            margin-right: 10px;
        }

        .page-icons i {
            font-size: 16px;
        }

        .page-title {
            font-weight: 600;
            color: #333;
            flex: 1;
        }

        .page-url {
            color: #999;
            font-size: 12px;
            margin-left: 10px;
        }

        .nested-list {
            margin-left: 40px;
            margin-top: 8px;
            padding-left: 20px;
            border-left: 2px solid #e7e7e7;
        }

        .nested-indicator {
            color: #ccc;
            margin-right: 8px;
        }

        .save-section {
            position: sticky;
            bottom: 0;
            background: #fff;
            padding: 15px 20px;
            border-top: 2px solid #e7e7e7;
            margin: 0 -20px 0 -20px;
            border-radius: 0 0 4px 4px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .changes-indicator {
            color: #f0ad4e;
            font-weight: 600;
            display: none;
        }

        .changes-indicator.show {
            display: block;
        }

        .btn-save-order {
            min-width: 150px;
        }

        @media (max-width: 767px) {
            .page-url {
                display: none;
            }
            
            .nested-list {
                margin-left: 20px;
                padding-left: 15px;
            }

            .save-section {
                flex-direction: column;
                gap: 10px;
            }

            .btn-save-order {
                width: 100%;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    <!-- Page Header -->
    <div class="page-header-section clearfix">
        <div class="pull-left">
            <h3><i class="fa fa-sort"></i> Reorder Pages</h3>
        </div>
        <div class="pull-right" style="margin-top: 10px;">
            <a href="PageManager.aspx" class="btn btn-default">
                <i class="fa fa-arrow-left"></i> Back to Page Manager
            </a>
        </div>
    </div>

    <!-- Error Messages -->
    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>

    <!-- Instructions -->
    <div class="alert-info-custom">
        <i class="fa fa-info-circle"></i>
        <strong>How to reorder:</strong> Drag and drop pages to change their order. You can also nest pages by dragging them onto other pages to make them sub-pages. Click "Save Order" when you're done.
    </div>

    <!-- Reorder Container -->
    <div class="reorder-container">
        <asp:HiddenField ID="hdnPageOrder" runat="server" />
        
        <ul class="sortable-list" id="pageList">
            <asp:Repeater ID="rptPages" runat="server" OnItemDataBound="rptPages_ItemDataBound">
                <ItemTemplate>
                    <li class="sortable-item" data-id="<%# Eval("ID") %>" data-parent="<%# Eval("ParentID") %>">
                        <div class="page-item-content">
                            <i class="fa fa-bars drag-handle"></i>
                            <div class="page-icons">
                                <i class='<%# GetStatusIconClass(Eval("Status")) %>' 
                                   data-toggle="tooltip" 
                                   title='<%# GetStatusTooltip(Eval("Status")) %>'></i>
                                <i class='<%# GetNavbarIconClass(Eval("NavbarMode")) %>' 
                                   data-toggle="tooltip" 
                                   title='<%# GetNavbarTooltip(Eval("NavbarMode")) %>'></i>
                            </div>
                            <span class="page-title"><%# Eval("CurrentInstance.NavbarLinkOrDefaultForBlank") %></span>
                            <a href='<%# GetPageUrl(Eval("Path"), Eval("Slug")) %>' 
                               target="_blank" 
                               class="page-url"
                               onclick="event.stopPropagation();">
                                <i class="fa fa-external-link"></i> View
                            </a>
                        </div>
                    </li>
                    <asp:PlaceHolder ID="phChildren" runat="server"></asp:PlaceHolder>
                </ItemTemplate>
            </asp:Repeater>
        </ul>

        <!-- Save Section -->
        <div class="save-section">
            <div class="changes-indicator" id="changesIndicator">
                <i class="fa fa-exclamation-triangle"></i> You have unsaved changes
            </div>
            <div>
                <asp:Button ID="btnSaveOrder" runat="server" 
                    Text="Save Order" 
                    CssClass="btn btn-success btn-save-order" 
                    OnClick="btnSaveOrder_Click" 
                    OnClientClick="return saveOrderData();" 
                    data-no-warning="true" />
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.15.0/Sortable.min.js"></script>
    <script>
        var hasChanges = false;
        var sortableInstances = [];

        $(function () {
            $('[data-toggle="tooltip"]').tooltip({
                container: 'body',
                delay: { show: 500, hide: 100 }
            });

            initializeSortable();

            // Warn before leaving if there are unsaved changes
            window.addEventListener('beforeunload', function (e) {
                if (hasChanges) {
                    e.preventDefault();
                    e.returnValue = '';
                    return '';
                }
            });

            // Don't warn when clicking the save button
            $('#<%= btnSaveOrder.ClientID %>').on('click', function () {
                hasChanges = false;
            });
        });

        function initializeSortable() {
            var lists = document.querySelectorAll('.sortable-list');

            lists.forEach(function (list) {
                var sortable = new Sortable(list, {
                    animation: 150,
                    handle: '.drag-handle',
                    ghostClass: 'sortable-ghost',
                    chosenClass: 'sortable-chosen',
                    dragClass: 'sortable-drag',
                    group: 'nested',
                    fallbackOnBody: true,
                    swapThreshold: 0.65,

                    onEnd: function (evt) {
                        hasChanges = true;
                        $('#changesIndicator').addClass('show');

                        // Update parent ID when moving items
                        updateParentIds();
                    }
                });

                sortableInstances.push(sortable);
            });
        }

        function updateParentIds() {
            // Update parent IDs based on nesting
            $('.sortable-list').each(function () {
                var parentId = $(this).data('parent-id') || '';
                $(this).children('.sortable-item').each(function () {
                    $(this).attr('data-parent', parentId);
                });
            });
        }

        function saveOrderData() {
            var order = [];
            var position = 0;

            function traverseList($list, parentId) {
                $list.children('.sortable-item').each(function () {
                    var $item = $(this);
                    var itemId = $item.data('id');

                    order.push({
                        id: itemId,
                        parentId: parentId || null,
                        position: position++
                    });

                    // Check for nested list
                    var $nestedList = $item.next('.nested-list');
                    if ($nestedList.length > 0 && $nestedList.children('.sortable-list').length > 0) {
                        traverseList($nestedList.children('.sortable-list'), itemId);
                    }
                });
            }

            traverseList($('#pageList'), null);

            // Store in hidden field
            $('#<%= hdnPageOrder.ClientID %>').val(JSON.stringify(order));

            return true; // Allow postback
        }
    </script>

</asp:Content>