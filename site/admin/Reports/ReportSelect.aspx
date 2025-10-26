<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ReportSelect.aspx.cs" Inherits="WaiverFile.site.admin.Reports.ReportSelect" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style>
        .report-item { display:flex; align-items:center; padding:8px 0; border-bottom:1px solid #eee; }
        .report-body { flex:1; }
        .report-title { font-weight:600; }
        .report-desc  { color:#777; font-size:12px; }
        .fav-btn { width:32px; text-align:center; }
        .section-title { margin:15px 0 8px; font-size:16px; font-weight:700; text-transform:uppercase; color:#555; }
        .category-header { font-weight:700; margin-top:10px; }
        .search-input { margin-bottom:12px; }
        .report-row { /* for client-side filter */ }
        .muted { color:#999; }
        .btn-link { padding:0; }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

      <asp:UpdatePanel runat="server" ID="up" UpdateMode="Conditional">
            <ContentTemplate>

                <!-- Favorites -->
                <asp:Panel runat="server" ID="pnlFavorites" Visible="false">
                    <div class="section-title"><i class="fa fa-star"></i> Favorites</div>
                    <asp:Repeater runat="server" ID="repFavorites" OnItemCommand="Report_ItemCommand">
                        <ItemTemplate>
                            <div class="report-item report-row" data-name='<%# Eval("Name") %>' data-desc='<%# Eval("Description") %>'>
                                <div class="report-body">
                                    <a class="report-title" href='<%# Eval("Url") %>'><%# Eval("Name") %></a>
                                    <div class="report-desc"><%# Eval("Description") %></div>
                                </div>
                                <div class="fav-btn">
                                    <asp:LinkButton runat="server"
                                        CommandName="ToggleFavorite"
                                        CommandArgument='<%# Eval("Url") %>'
                                        CssClass="btn btn-link"
                                        ToolTip="Unfavorite">
                                        <i class="fa fa-star"></i>
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </asp:Panel>

                <!-- Featured Reports (group by name exactly "Featured Reports") -->
                <asp:Panel runat="server" ID="pnlFeatured" Visible="false">
                    <div class="section-title"><i class="fa fa-thumb-tack"></i> Featured Reports</div>
                    <asp:Repeater runat="server" ID="repFeatured" OnItemCommand="Report_ItemCommand">
                        <ItemTemplate>
                            <div class="report-item report-row" data-name='<%# Eval("Name") %>' data-desc='<%# Eval("Description") %>'>
                                <div class="report-body">
                                    <a class="report-title" href='<%# Eval("Url") %>'><%# Eval("Name") %></a>
                                    <div class="report-desc"><%# Eval("Description") %></div>
                                </div>
                                <div class="fav-btn">
                                    <asp:LinkButton runat="server"
                                        CommandName="ToggleFavorite"
                                        CommandArgument='<%# Eval("Url") %>'
                                        CssClass="btn btn-link"
                                        ToolTip="Toggle favorite">
                                        <i class='<%# (bool)Eval("IsFavorite") ? "fa fa-star" : "fa fa-star-o" %>'></i>
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </asp:Panel>

                <!-- Other grouped categories (excluding Featured Reports) -->
                <asp:Repeater runat="server" ID="repGroups">
                    <ItemTemplate>
                        <div class="category-header">
                            <i class="fa fa-folder-open"></i> <%# Eval("GroupName") %>
                        </div>
                        <asp:Repeater runat="server" ID="repGroupItems" DataSource='<%# Eval("Items") %>' OnItemCommand="Report_ItemCommand">
                            <ItemTemplate>
                                <div class="report-item report-row" data-name='<%# Eval("Name") %>' data-desc='<%# Eval("Description") %>'>
                                    <div class="report-body">
                                        <a class="report-title" href='<%# Eval("Url") %>'><%# Eval("Name") %></a>
                                        <div class="report-desc"><%# Eval("Description") %></div>
                                    </div>
                                    <div class="fav-btn">
                                        <asp:LinkButton runat="server"
                                            CommandName="ToggleFavorite"
                                            CommandArgument='<%# Eval("Url") %>'
                                            CssClass="btn btn-link"
                                            ToolTip="Toggle favorite">
                                            <i class='<%# (bool)Eval("IsFavorite") ? "fa fa-star" : "fa fa-star-o" %>'></i>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ItemTemplate>
                </asp:Repeater>

                <!-- Ungrouped -->
                <asp:Panel runat="server" ID="pnlUngrouped" Visible="false">
                    <div class="section-title"><i class="fa fa-list"></i> Other Reports</div>
                    <asp:Repeater runat="server" ID="repUngrouped" OnItemCommand="Report_ItemCommand">
                        <ItemTemplate>
                            <div class="report-item report-row" data-name='<%# Eval("Name") %>' data-desc='<%# Eval("Description") %>'>
                                <div class="report-body">
                                    <a class="report-title" href='<%# Eval("Url") %>'><%# Eval("Name") %></a>
                                    <div class="report-desc"><%# Eval("Description") %></div>
                                </div>
                                <div class="fav-btn">
                                    <asp:LinkButton runat="server"
                                        CommandName="ToggleFavorite"
                                        CommandArgument='<%# Eval("Url") %>'
                                        CssClass="btn btn-link"
                                        ToolTip="Toggle favorite">
                                        <i class='<%# (bool)Eval("IsFavorite") ? "fa fa-star" : "fa fa-star-o" %>'></i>
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </asp:Panel>

            </ContentTemplate>
        </asp:UpdatePanel>


</asp:Content>
