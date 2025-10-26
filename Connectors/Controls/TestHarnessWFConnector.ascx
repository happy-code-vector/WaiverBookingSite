<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TestHarnessWFConnector.ascx.cs" Inherits="WaiverFile.Connectors.Controls.TestHarnessWFConnector" %>
test area for the Connectors! (jsut for use in dev)
<br />
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="TEST" />
<br /><br />
<asp:PlaceHolder ID="phOut" runat="server"></asp:PlaceHolder>

<asp:Button runat="server" ID="btnUSLAX" Text="US Lacrosse Test" OnClick="btnUSLAX_Click" />