<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyAccountArea.Master" AutoEventWireup="true" CodeBehind="Change-Email-Address.aspx.cs" Inherits="WaiverFile.MyAccount.ChangeEmail" %>





<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    
    
<asp:PlaceHolder ID="phOuter" runat="server"></asp:PlaceHolder>

<asp:Panel runat="server" ID="pnlMain">
<h3>Change Email Address</h3>
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

    <div class="form-group">
    <label>Current Email Address</label>
        <asp:TextBox runat="server" ID="txtCurrEmail" CssClass="form-control" Enabled ="false"></asp:TextBox>
</div>

<div class="form-group">
    <label for="<%=txtCurrentPassword.ClientID %>">Enter Your Password</label><asp:TextBox id="txtCurrentPassword" runat="server" MaxLength="50" TextMode="Password" CssClass="form-control"></asp:TextBox>
</div>


        <div class="form-group">
            <label for="<%=txtNewEmailAddress.ClientID %>">New Email Address</label>
            <asp:TextBox ID="txtNewEmailAddress" runat="server" CssClass="form-control" placeholder="email@sample.com"></asp:TextBox>
        </div>
<div class="form-group">
            <label for="<%=txtNewEmailConfirm.ClientID %>">Confirm Email Address</label>
            <asp:TextBox ID="txtNewEmailConfirm" runat="server" CssClass="form-control" placeholder="email@sample.com"></asp:TextBox>
        </div>
        
    <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Submit" OnClick="btnSave_Click" />

    </asp:Panel>

<asp:Panel runat="server" ID="pnlPart2">
    <h3>Change Email Address</h3>
    <p>An email has been sent to your new email address. Click the link in the email or copy the code below to confirm.</p>
    <div class="form-group">
            <label>Confirmation Code</label>
            <asp:TextBox ID="txtConfirmCode" runat="server" CssClass="form-control" placeholder="Confirmation Code"></asp:TextBox>
        </div>
        
    <asp:Button runat="server" ID="btnConfirm" CssClass="btn btn-primary" Text="Confirm" OnClick="btnConfirm_Click" />

    </asp:Panel>


</asp:Content>
