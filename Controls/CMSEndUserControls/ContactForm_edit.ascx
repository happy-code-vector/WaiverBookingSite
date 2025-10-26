<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactForm_edit.ascx.cs" Inherits="WaiverFile.Controls.CMSEndUserControls.ContactForm_edit" %>

<script type="text/javascript">
    function toggleAll(className, checked) {
        document.querySelectorAll(`.${className}`).forEach(cb => cb.checked = checked);
    }
</script>

<div class="mb-3">
    <label class="form-label">Form Header</label>
    <asp:TextBox runat="server" ID="txtHeader" CssClass="form-control" />
</div>

<div class="mb-3">
    <label class="form-label">Intro Paragraph</label>
    <asp:TextBox runat="server" ID="txtParagraph" CssClass="form-control" TextMode="MultiLine" Rows="2" />
</div>

<div class="mb-3">
    <label class="form-label">Send Button Text</label>
    <asp:TextBox runat="server" ID="txtButtonText" CssClass="form-control" />
</div>

<hr />

<div class="mb-3">
    <label class="form-label">Fields to Include / Require</label>
    <div class="table-responsive">
        <table class="table table-sm table-bordered align-middle">
            <thead class="table-light">
                <tr>
                    <th>Field</th>
                    <th style="text-align:center;">Include</th>
                    <th style="text-align:center;">Required</th>
                </tr>
            </thead>
            <tbody>
                <%-- Email Address: always included and required --%>
                <tr>
                    <td>Email Address</td>
                    <td style="text-align:center;"><input type="checkbox" checked disabled /></td>
                    <td style="text-align:center;"><input type="checkbox" checked disabled /></td>
                </tr>
              <tr>
    <td>First Name</td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkIncludeFirstName" runat="server" CssClass="include-checkbox" />
    </td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkRequireFirstName" runat="server" CssClass="require-checkbox" />
    </td>
</tr>
<tr>
    <td>Middle Name</td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkIncludeMiddleName" runat="server" CssClass="include-checkbox" />
    </td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkRequireMiddleName" runat="server" CssClass="require-checkbox" />
    </td>
</tr>
<tr>
    <td>Last Name</td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkIncludeLastName" runat="server" CssClass="include-checkbox" />
    </td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkRequireLastName" runat="server" CssClass="require-checkbox" />
    </td>
</tr>
<tr>
    <td>Name</td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkIncludeName" runat="server" CssClass="include-checkbox" />
    </td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkRequireName" runat="server" CssClass="require-checkbox" />
    </td>
</tr>
<tr>
    <td>Title</td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkIncludeTitle" runat="server" CssClass="include-checkbox" />
    </td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkRequireTitle" runat="server" CssClass="require-checkbox" />
    </td>
</tr>
<tr>
    <td>Company</td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkIncludeCompany" runat="server" CssClass="include-checkbox" />
    </td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkRequireCompany" runat="server" CssClass="require-checkbox" />
    </td>
</tr>
<tr>
    <td>Address</td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkIncludeAddress" runat="server" CssClass="include-checkbox" />
    </td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkRequireAddress" runat="server" CssClass="require-checkbox" />
    </td>
</tr>
<tr>
    <td>City</td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkIncludeCity" runat="server" CssClass="include-checkbox" />
    </td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkRequireCity" runat="server" CssClass="require-checkbox" />
    </td>
</tr>
<tr>
    <td>State</td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkIncludeState" runat="server" CssClass="include-checkbox" />
    </td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkRequireState" runat="server" CssClass="require-checkbox" />
    </td>
</tr>
<tr>
    <td>Zip</td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkIncludeZip" runat="server" CssClass="include-checkbox" />
    </td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkRequireZip" runat="server" CssClass="require-checkbox" />
    </td>
</tr>
<tr>
    <td>Phone</td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkIncludePhone" runat="server" CssClass="include-checkbox" />
    </td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkRequirePhone" runat="server" CssClass="require-checkbox" />
    </td>
</tr>
<tr>
    <td>Fax</td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkIncludeFax" runat="server" CssClass="include-checkbox" />
    </td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkRequireFax" runat="server" CssClass="require-checkbox" />
    </td>
</tr>
<tr>
    <td>Message</td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkIncludeMessage" runat="server" CssClass="include-checkbox" />
    </td>
    <td style="text-align:center;">
        <asp:CheckBox ID="chkRequireMessage" runat="server" CssClass="require-checkbox" />
    </td>
</tr>

            </tbody>
        </table>
    </div>

    <div class="mb-2">
        <button type="button" class="btn btn-outline-primary btn-sm me-1" onclick="toggleAll('include-checkbox', true)">Include All</button>
        <button type="button" class="btn btn-outline-secondary btn-sm me-3" onclick="toggleAll('include-checkbox', false)">Uninclude All</button>

        <button type="button" class="btn btn-outline-primary btn-sm me-1" onclick="toggleAll('require-checkbox', true)">Require All</button>
        <button type="button" class="btn btn-outline-secondary btn-sm" onclick="toggleAll('require-checkbox', false)">Unrequire All</button>
    </div>
</div>

<hr />

<div class="mb-3">
    <label class="form-label">TO Email Address</label>
    <asp:TextBox runat="server" ID="txtToEmail" CssClass="form-control" />
</div>

<div class="mb-3">
    <label class="form-label">CC</label>
    <asp:TextBox runat="server" ID="txtCC" CssClass="form-control" />
</div>

<div class="mb-3">
    <label class="form-label">BCC</label>
    <asp:TextBox runat="server" ID="txtBCC" CssClass="form-control" />
</div>

<div class="mb-3">
    <label class="form-label">Subject Line</label>
    <asp:TextBox runat="server" ID="txtSubject" CssClass="form-control" />
</div>

<hr />

<div class="mb-3">
    <label class="form-label">Thank You Message</label>
    <asp:TextBox runat="server" ID="txtThankYouMessage" CssClass="form-control" TextMode="MultiLine" Rows="3" />
</div>

<div class="mb-3">
    <label class="form-label">Thank You Behavior</label>
    <asp:DropDownList runat="server" ID="ddlThankYouUrl" CssClass="form-select">
        <asp:ListItem Text="Show message and stay on this page" Value="inline" />
        <asp:ListItem Text="Redirect to: /thank-you" Value="/thank-you" />
        <asp:ListItem Text="Redirect to: /success" Value="/success" />
        <asp:ListItem Text="Redirect to custom URL..." Value="custom" />
    </asp:DropDownList>
</div>
