<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SignupNarrow.Master" AutoEventWireup="true" CodeBehind="DownloadTemplate.aspx.cs" Inherits="WaiverFile.DownloadTemplate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>

<asp:Panel runat="server" ID="pnlMain" CssClass="card shadow-sm my-4">
    <div class="card-body">
        <h4 class="card-title">Download File</h4>

          <!-- File details / name -->
        <asp:Panel runat="server" ID="pnlFileInfo" CssClass="alert alert-secondary d-flex align-items-center gap-2 mb-4" Visible="false">
            <span class="fw-semibold me-1">File:</span>
            <span class="text-truncate" style="max-width: 100%;">
                <asp:Literal runat="server" ID="litFileName" Mode="Encode" />
            </span>
        </asp:Panel>

        <asp:PlaceHolder id="phErrInner" runat="server"></asp:PlaceHolder>

        <p>
            Enter your email to get the sample waiver and learn more about how electronic waivers 
            can help streamline your business!
        </p>

        <div class="mb-3">
            <label for="txtEmail" class="form-label">Email Address</label>
            <asp:TextBox runat="server" ID="txtEmail" TextMode="Email"
                Placeholder="Email Address"
                CssClass="form-control"></asp:TextBox>
        </div>

        <asp:Button runat="server" ID="btnSubmit" 
            CssClass="btn btn-primary"
            Text="Submit"
            OnClick="btnSubmit_Click" />

        <hr />

        <p class="text-muted">
            I don't want to take advantage of online waiver forms.
            <a href="{$FilePath}" target="_blank" runat="server" id="hrefDownload">Download the form</a>.
        </p>
    </div>
</asp:Panel>

</asp:Content>
