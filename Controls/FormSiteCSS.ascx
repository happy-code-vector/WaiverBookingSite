<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormSiteCSS.ascx.cs" Inherits="WaiverFile.Controls.FormSiteCSS" %>
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
<h3>Advanced Styles</h3>

<div class="row">
    <div class="col-sm-6">
        <p>Add CSS (Cascading Style Sheet) code below to customize the style of your web-based signing pages. <br />
                <a href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Help.aspx">Contact us</a> for assistance if you have any questions.
            </p>
    </div>
    <div class="col-sm-6">
        <div class="well">
        <em><strong>Note:</strong> Applies only to web-based signing pages. The WaiverFile mobile app (iOS/Android) will not be affected. <br />
            Use the basic <a href="Style.aspx">Style Settings</a> to adjust the style in both the web and mobile app versions.</em>
            </div>
    </div>
</div>



<h4>Main Styles (All versions)</h4>
<asp:TextBox runat="server" ID="txtAll" TextMode="multiline" Rows="50" ></asp:TextBox>

<h4>Device Version Only (waiverfile.com/<strong>d</strong>/<%=url %>)</h4>
<asp:TextBox runat="server" ID="txtDevice" TextMode="multiline" Rows="30"></asp:TextBox>

<h4>Embedded Version Only (When embedding on your own website)</h4>
<asp:TextBox runat="server" ID="txtIframe" TextMode="multiline" Rows="30"></asp:TextBox>

<h4>Public Version Only (waiverfile.com/<strong>b</strong>/<%=url %>)</h4>
<asp:TextBox runat="server" ID="txtPublic" TextMode="multiline" Rows="30"></asp:TextBox>

<asp:Button runat="server" CssClass="btn btn-primary" Text="Save" ID="btnSave" OnClick="btnSave_Click" />



<script src="/wp-content/Plugins/WaiverFile/Docs/CodeMirror/codemirror.js"></script>
<script src="/wp-content/Plugins/WaiverFile/Docs/CodeMirror/css.js"></script>
<link rel="stylesheet" href="/wp-content/Plugins/WaiverFile/Docs/CodeMirror/codemirror.css">

      <script type="text/javascript">
          CodeMirror.fromTextArea(
              document.getElementById("<%=txtAll.ClientID%>"),
              { lineNumbers: true, matchBrackets: true, mode: "css" }
          );

          CodeMirror.fromTextArea(
              document.getElementById("<%=txtDevice.ClientID%>"),
              { lineNumbers: true, matchBrackets: true, mode: "css" }
          );
          CodeMirror.fromTextArea(
              document.getElementById("<%=txtIframe.ClientID%>"),
              { lineNumbers: true, matchBrackets: true, mode: "css" }
          );

          CodeMirror.fromTextArea(
              document.getElementById("<%=txtPublic.ClientID%>"),
              { lineNumbers: true, matchBrackets: true, mode: "css" }
          );

      </script>

<br /><br />