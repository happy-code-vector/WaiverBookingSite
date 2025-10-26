<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminSearchBox.ascx.cs" Inherits="WaiverFile.Controls.AdminSearchBox" %>






<asp:Panel ID="pnlSearch" DefaultButton="btnSearch" runat="server" CssClass="input-group">

    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Waiver Search..."></asp:TextBox>
    <div class="input-group-btn">
        <asp:LinkButton ID="btnSearch" runat="server" 
        CssClass="btn btn-orange" onclick="btnSearch_Click">
            <i class="glyphicon glyphicon-search"></i>
        </asp:LinkButton>
    </div>
        </asp:Panel>

