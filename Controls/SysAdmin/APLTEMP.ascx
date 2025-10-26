<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="APLTEMP.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.APLTEMP" %>

<asp:Button runat="server" ID="btnAPLFix" Text="Test Process Webhook Queue" OnClick="btnAPLFix_Click" />

<asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>
<br />
<asp:Button runat="server" ID="btnException" Text="Test page fix" OnClick="btnTestPageFix_Click" />