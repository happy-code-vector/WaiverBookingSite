<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SliderView_edit.ascx.cs" Inherits="WaiverFile.Controls.CMSEndUserControls.SliderView_edit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>

<asp:HiddenField runat="server" ID="hfSliderID" />

<div class="form-group">
    <label>Template</label>
    <asp:DropDownList runat="server" ID="cboTemplate" CssClass="form-control"></asp:DropDownList>
</div>
<div class="form-group">
<asp:Button runat="server" ID="btnAddSlide" CssClass="btn btn-primary" Text="Add Slide" OnClick="btnAddSlide_Click" /> 
<telerik:RadListView ID="lvSlides" runat="server" DataKeyNames="ID" OnItemCommand="lvSlides_ItemCommand">
    <ItemTemplate>
        <div class="card mb-2 p-2 d-flex flex-row align-items-center">
            <img src='<%# Eval("Settings.BackgroundImageUrl") %>' style="width: 100px; height: auto; max-height: 80px;" class="me-3" />

            <div class="flex-grow-1">
                <h6><%# Eval("Settings.Title") %></h6>
            </div>

            <div class="btn-group">
                <asp:LinkButton runat="server" CommandName="MoveUp" CommandArgument='<%# Container.DisplayIndex %>' CssClass="btn btn-sm btn-secondary">↑</asp:LinkButton>
                <asp:LinkButton runat="server" CommandName="MoveDown" CommandArgument='<%# Container.DisplayIndex %>' CssClass="btn btn-sm btn-secondary">↓</asp:LinkButton>
                <asp:LinkButton runat="server" CommandName="Edit" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-sm btn-primary">Edit</asp:LinkButton>
                <asp:LinkButton runat="server" CommandName="Delete" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-sm btn-danger">🗑</asp:LinkButton>
            </div>
        </div>
    </ItemTemplate>
</telerik:RadListView>
    </div>

<asp:Panel ID="pnlEditor" runat="server" CssClass="card p-3 mb-4" Visible="false">
    <h5>Edit Slide</h5>
    
    <asp:HiddenField ID="hfEditingSlideID" runat="server" />

    <!-- Image URL -->
    <asp:Label runat="server" AssociatedControlID="txtImageUrl" Text="Image URL" CssClass="form-label d-block" />
    <asp:TextBox ID="txtImageUrl" ClientIDMode="Static" runat="server" CssClass="form-control mb-3" />
    <asp:Button ID="btnSelectImage" runat="server" Text="Select / Upload Image" CssClass="btn btn-outline-primary btn-sm mb-3" OnClientClick="openImageSelector('txtImageUrl'); return false;" />


    <!-- Heading -->
    <asp:Label runat="server" AssociatedControlID="txtHeading" Text="Heading" CssClass="form-label d-block mt-3" />
    <asp:TextBox ID="txtHeading" runat="server" CssClass="form-control mb-3" />

    <!-- Rich Text -->
    <telerik:RadEditor ID="radContentEditor" runat="server" Width="100%" Height="300px"
        EditModes="Design,Html" Skin="Bootstrap"
        OnClientLoad="onRadEditorLoad"
        OnClientPasteHtml="OnClientPasteHtml"
        ContentFilters="RemoveScripts,ConvertToXhtml,FixEnclosingP,ConvertFontToSpan"
        ContentAreaCssFile="/sitebooking/css/RadEditorMinimal.css"
        CssClass="radeditor-isolated" />

    <asp:Label runat="server" AssociatedControlID="txtButtonText" Text="Button Text" CssClass="form-label d-block" />
<asp:TextBox ID="txtButtonText" runat="server" CssClass="form-control mb-3" />

        <asp:Label runat="server" AssociatedControlID="txtButtonUrl" Text="Button URL" CssClass="form-label d-block" />
<asp:TextBox ID="txtButtonUrl" runat="server" CssClass="form-control mb-3" />

    <!-- Save/Cancel -->
    <div class="mt-3">
        <asp:Button ID="btnSaveSlide" runat="server" Text="Save Slide" CssClass="btn btn-success me-2" OnClick="btnSaveSlide_Click" />
        <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancelEdit_Click" />
    </div>
</asp:Panel>


