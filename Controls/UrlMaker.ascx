<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UrlMaker.ascx.cs" Inherits="WaiverFile.Controls.UrlMaker" %>

<script runat="server">

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string url = txtUrl.Text.Trim();
        
        if (chkSkipConfirmationPage.Checked)
        {
            
            txtOut.Text = Waypoint.Core.MiscUtils.AppendQueryString(url, "Redir", txtAddonUrl.Text.Trim());
        }
        else
        {
            txtOut.Text = Waypoint.Core.MiscUtils.AppendQueryString(url, "Src", txtAddonUrl.Text.Trim());
            
        }

        
    }


</script>

<h3>Custom URL Maker</h3>
<p>Use this tool to create a custom link that will redirect to a different URL after signing a waiver. </p>

<div class="form-group">
    <label>Starting URL</label>
    <asp:TextBox runat="server" ID="txtUrl" CssClass="form-control" placeholder="https://www.waiverfile.com/b/mybusiness"></asp:TextBox>

</div>
<p class="help-block">Paste in the URL of the form or landing page that you want the link to start on.</p>
<p class="help-block"><em>e.g.: https://www.waiverfile.com/b/mybusiness</em></p>


<div class="form-group">
    <label>Redirect URL</label>
    <asp:TextBox runat="server" ID="txtAddonUrl" CssClass="form-control" placeholder="https://www.waiverfile.com/b/mybusiness"></asp:TextBox>
    <p class="help-block">Where the user should be redirected to after signing</p>
</div>
<p class="help-block">Add the URL of the page you want the user to redirect to after completing their waiver form.</p>

<asp:CheckBox runat="server" ID="chkSkipConfirmationPage" Text="Skip confirmation page (go directly to the second url)" />

<asp:Button runat="server" ID="btnSave" OnClick="btnSave_Click" Text="Create Link" CssClass="btn btn-primary" />

<hr />
<div class="form-group">
    <label>Result:</label>
    <asp:TextBox runat="server" ID="txtOut" CssClass="form-control"></asp:TextBox>
</div>
