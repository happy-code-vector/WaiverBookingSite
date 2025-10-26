<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="PageManager.aspx.cs" Inherits="WaiverFile.site.admin.CMS.PageManager" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        /* Page Header */
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

        .page-header-actions {
            margin-top: 10px;
        }

        /* List Container */
        .page-list-wrapper {
            background: #fff;
            border: 1px solid #e7e7e7;
            border-radius: 4px;
            box-shadow: 0 1px 1px rgba(0,0,0,0.05);
            margin-bottom: 20px;
        }

        .page-list-header {
            background-color: #f5f5f5;
            border-bottom: 2px solid #ddd;
            padding: 12px 15px;
            font-weight: 600;
            font-size: 12px;
            text-transform: uppercase;
            color: #777;
            letter-spacing: 0.5px;
            margin-left: 0 !important;
            margin-right: 0 !important;
        }

        /* Page Item Card */
        /* Page Item Card */
        .page-item-card {
            border-bottom: 1px solid #e7e7e7;
            padding: 15px;
            transition: background-color 0.2s ease;
            margin-left: 0 !important;
            margin-right: 0 !important;
        }

        .page-item-card:hover {
            background-color: #f9f9f9;
        }

        .page-item-card:last-child {
            border-bottom: none;
            border-radius: 0 0 4px 4px;
        }

        /* Status Icons */
        .status-icons {
            font-size: 18px;
            display: flex;
            gap: 10px;
            align-items: center;
            justify-content: center;
        }

        .status-icons i {
            cursor: help;
        }

        /* Page Title Styling */
        .page-title-section {
            line-height: 1.6;
        }

        .page-title-link {
            color: #337ab7;
            font-size: 15px;
            font-weight: 600;
            text-decoration: none;
            transition: color 0.2s ease;
        }

        .page-title-link:hover {
            color: #23527c;
            text-decoration: none;
        }

        .page-url-link {
            color: #999;
            font-size: 12px;
            text-decoration: none;
            display: inline-block;
            margin-top: 4px;
        }

        .page-url-link:hover {
            color: #666;
            text-decoration: underline;
        }

        /* Tree Depth Indentation */
        .depth-0 .page-title-link { margin-left: 0px; }
        .depth-1 .page-title-link { margin-left: 20px; }
        .depth-2 .page-title-link { margin-left: 40px; }
        .depth-3 .page-title-link { margin-left: 60px; }
        .depth-4 .page-title-link { margin-left: 80px; }
        .depth-5 .page-title-link { margin-left: 100px; }

        .depth-indicator {
            color: #ccc;
            margin-right: 8px;
            font-size: 13px;
        }

        /* Action Buttons */
        .action-buttons {
            white-space: nowrap;
        }

        .action-buttons .btn {
            padding: 6px 12px;
            margin-left: 3px;
        }

        .btn-icon {
            background: transparent;
            border: 1px solid #ddd;
            color: #666;
            transition: all 0.2s ease;
        }

        .btn-icon:hover {
            background: #f5f5f5;
            border-color: #adadad;
            color: #333;
        }

        .btn-icon.btn-danger {
            color: #d9534f;
        }

        .btn-icon.btn-danger:hover {
            background: #d9534f;
            border-color: #d43f3a;
            color: #fff;
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #999;
        }

        .empty-state i {
            font-size: 64px;
            margin-bottom: 20px;
            color: #ddd;
        }

        .empty-state h4 {
            color: #666;
            margin-bottom: 10px;
        }

        .empty-state p {
            margin-bottom: 20px;
        }

        /* Responsive adjustments */
        @media (max-width: 991px) {
            .page-header-actions {
                margin-top: 15px;
            }
            
            .page-list-header {
                font-size: 11px;

            }
        }

        @media (max-width: 767px) {
            .page-header-section h3 {
                display: block;
                margin-bottom: 15px;
            }

            .page-header-actions {
                text-align: left;
            }

            .page-header-actions .btn {
                display: block;
                width: 100%;
                margin-bottom: 5px;
            }
            
            .status-icons {
                justify-content: flex-start;
                margin-bottom: 10px;
            }

            .action-buttons {
                text-align: left !important;
                margin-top: 10px;
            }

            .page-list-header {
                display: none;
            }

            .page-item-card .col-sm-1,
            .page-item-card .col-sm-8,
            .page-item-card .col-sm-3 {
                padding-left: 15px;
                padding-right: 15px;
            }
         
        }

        /* Tooltip improvements */
        .tooltip-inner {
            max-width: 250px;
            padding: 8px 12px;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip({
                container: 'body',
                delay: { show: 500, hide: 100 }
            });
        });
    </script>

    <!-- Page Header -->
    <div class="page-header-section clearfix">
        <div class="pull-left">
            <h3><i class="fa fa-files-o"></i> Page Manager</h3>
        </div>
        <div class="pull-right page-header-actions">
            <a href="AddPage.aspx" class="btn btn-success">
                <i class="fa fa-plus"></i> Add Page
            </a>
            <a href="PageManagerReorder.aspx" class="btn btn-default">
                <i class="fa fa-sort"></i> Reorder Pages
            </a>
        </div>
    </div>

    <!-- Error Messages -->
    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>

    <!-- Page List -->
    <telerik:RadListView ID="lvPages" runat="server" DataKeyNames="ID" OnNeedDataSource="lvPages_NeedDataSource">

        <LayoutTemplate>
            <div class="page-list-wrapper">
                <!-- Column Headers -->
                <div class="page-list-header row">
                    <div class="col-sm-1 text-center">Status</div>
                    <div class="col-sm-8">Page</div>
                    <div class="col-sm-3 text-right">Actions</div>
                </div>

                <!-- Items -->
                <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
            </div>

            <!-- Empty State (only shows when no items) -->
            <div class="empty-state" id="emptyState" runat="server" visible="false">
                <i class="fa fa-file-o"></i>
                <h4>No Pages Found</h4>
                <p>Get started by creating your first page.</p>
                <a href="AddPage.aspx" class="btn btn-success">
                    <i class="fa fa-plus"></i> Add Your First Page
                </a>
            </div>
        </LayoutTemplate>

        <ItemTemplate>
            <div class="page-item-card row">

                <!-- STATUS ICONS -->
                <div class="col-sm-1">
                    <div class="status-icons">
                        <i class='<%# GetStatusIconClass(Eval("Status")) %>' 
                           data-toggle="tooltip" 
                           data-placement="top"
                           title='<%# GetStatusTooltip(Eval("Status")) %>'></i>
                        <i class='<%# GetNavbarIconClass(Eval("NavbarMode")) %>' 
                           data-toggle="tooltip" 
                           data-placement="top"
                           title='<%# GetNavbarTooltip(Eval("NavbarMode")) %>'></i>
                    </div>
                </div>

                <!-- PAGE TITLE + URL -->
                <div class="col-sm-8">
                    <div class="page-title-section depth-<%# Eval("TreeLevel") %>">
                        <%# Convert.ToInt32(Eval("TreeLevel")) > 0 ? "<i class='fa fa-level-up fa-rotate-90 depth-indicator'></i>" : "" %>
                        <a href='<%# GetPageUrl(Eval("Path"),Eval("Slug")) %>' 
                           target="_blank" 
                           class="page-title-link"
                           title="Click to view page">
                            <%# Eval("CurrentInstance.NavbarLinkOrDefaultForBlank") %>
                        </a>
                        <br />
                        <a href='<%# GetPageUrl(Eval("Path"),Eval("Slug")) %>' 
                           target="_blank" 
                           class="page-url-link">
                            <i class="fa fa-external-link"></i> <%# GetPageUrl(Eval("Path"),Eval("Slug")) %>
                        </a>
                    </div>
                </div>

                <!-- ACTION BUTTONS -->
                <div class="col-sm-3 text-right action-buttons">
                    <a href="PageSettings.aspx?id=<%# Eval("ID") %>" 
                       class="btn btn-sm btn-icon" 
                       data-toggle="tooltip"
                       title="Page Settings">
                        <i class="fa fa-cog"></i>
                    </a>
                    <asp:LinkButton runat="server" 
                        CommandName="Delete" 
                        CommandArgument='<%# Eval("ID") %>' 
                        CssClass="btn btn-sm btn-icon btn-danger" 
                        data-toggle="tooltip"
                        title="Delete Page"
                        OnClientClick="return confirm('Are you sure you want to delete this page? This action cannot be undone.');" 
                        OnClick="Delete_Clicked">
                        <i class="fa fa-trash-o"></i>
                    </asp:LinkButton>
                </div>

            </div>
        </ItemTemplate>

        <EmptyDataTemplate>
            <div class="empty-state">
                <i class="fa fa-file-o"></i>
                <h4>No Pages Found</h4>
                <p>Get started by creating your first page.</p>
                <a href="AddPage.aspx" class="btn btn-success">
                    <i class="fa fa-plus"></i> Add Your First Page
                </a>
            </div>
        </EmptyDataTemplate>

    </telerik:RadListView>

</asp:Content>