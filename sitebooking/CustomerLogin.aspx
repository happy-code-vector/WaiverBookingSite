<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BookingStandardPage.Master" AutoEventWireup="true" CodeBehind="CustomerLogin.aspx.cs" Inherits="WaiverFile.sitebooking.CustomerLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
<h1 class="h2 mt-auto">Welcome back</h1>
    <asp:Panel runat="server" ID="pnlLoginForm">
   
    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>
    <div class="needs-validation" novalidate="">
            <div class="position-relative mb-4">
                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control form-control-lg" placeholder="Email" TextMode="Email" AutoCompleteType="Email"></asp:TextBox>
              <div class="invalid-tooltip bg-transparent py-0">Enter a valid email address!</div>
            </div>
            <div class="mb-4">
              <div class="password-toggle">
                  <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control form-control-lg" placeholder="Password"></asp:TextBox>
                <div class="invalid-tooltip bg-transparent py-0">Password is incorrect!</div>
                <label class="password-toggle-button fs-lg" aria-label="Show/hide password">
                  <input type="checkbox" class="btn-check">
                <span class="password-toggle-button-icon d-flex">
      <svg width="1em" height="1em" viewBox="0 0 24 24" fill="currentColor">
        <path d="M23.8 11.6c-.1-.1-.1-.3-.2-.4-.8-1.4-1.7-2.7-2.8-3.8-1.9-2.1-4.9-4.3-8.8-4.3S5.2 5.3 3.2 7.4c-1.1 1.2-2 2.4-2.8 3.8-.1.1-.1.2-.2.4s-.1.5 0 .8v.1c.2.4.5.8.7 1.2.7 1 1.4 2 2.2 2.9 1.9 2.1 4.9 4.3 8.8 4.3 3.9 0 6.8-2.2 8.8-4.3 1.1-1.2 2-2.4 2.8-3.8.1-.1.1-.2.2-.4.2-.3.2-.6.1-.8zm-4.3 3.8c-1.8 1.9-4.3 3.7-7.5 3.7s-5.7-1.8-7.5-3.7c-1-1-1.8-2.2-2.5-3.4.7-1.2 1.5-2.4 2.5-3.4C6.3 6.7 8.8 4.9 12 4.9s5.7 1.8 7.5 3.7c1 1 1.8 2.2 2.5 3.4-.7 1.2-1.5 2.4-2.5 3.4z"></path><path d="M12 8.1c-2.2 0-3.9 1.8-3.9 3.9s1.7 3.9 3.9 3.9 3.9-1.7 3.9-3.9-1.7-3.9-3.9-3.9zm0 6c-1.1 0-2.1-1-2.1-2.1s.9-2.1 2.1-2.1 2.1 1 2.1 2.1-1 2.1-2.1 2.1z"></path>
      </svg>
    </span></label>
              </div>
            </div>
            <div class="d-flex align-items-center justify-content-between mb-4">
              <div class="form-check me-2">
                  <asp:CheckBox runat="server" ID="chkRemember30" CssClass="form-check-input" />
                <label for="<%=chkRemember30.ClientID %>" class="form-check-label">Remember for 30 days</label>
              </div>
              <div class="nav">
                <a class="nav-link animate-underline p-0" href="ForgotPassword.aspx">
                  <span class="animate-target">Forgot password?</span>
                </a>
              </div>
            </div>
        <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-lg btn-primary w-100" Text="Sign In" OnClick="btnSubmit_Click" />
    </div>      
    </asp:Panel>
    
    <asp:Panel runat="server" ID="pnlLoggedIn" Visible="false">
        <div class="nav fs-sm mb-4">
        You are logged in. 
        <a class="nav-link text-decoration-underline p-0 ms-2" href="CustomerLogout.aspx">Log Out</a>
      </div>
    </asp:Panel>

        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
