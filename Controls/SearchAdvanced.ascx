<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchAdvanced.ascx.cs" Inherits="WaiverFile.Controls.SearchAdvanced" %>

<script type="text/javascript">
    function resetForm() {
        var inputs = document.getElementsByTagName('input');
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].type == 'text')
                inputs[i].value = "";
        }
    }

</script>
<h3>Advanced Search</h3>
<p>Use any of the fields below to find specific waivers.</p>

<div class="row">
    <%if(includeFirstNameFields){ %>
    <div class="col-md-4 col-sm-6">
        <div class="form-group">
            <label>First Name</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtFirst"></asp:TextBox>
        </div>
    </div>
    <% } %>
    <div class="col-md-4 col-sm-6">
        <div class="form-group">
            <label><asp:Label ID="lblLastName" runat="server"></asp:Label></label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtLast"></asp:TextBox>
        </div>
    </div>
    <div class="col-md-4 col-sm-6">
        <div class="form-group">
            <label>Email Address</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtEmail"></asp:TextBox>
        </div>
    </div>
     <div class="col-md-4 col-sm-6">
        <div class="form-group">
            <label>Phone</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtPhone"></asp:TextBox>
        </div>
    </div>
    <div class="col-md-3 col-sm-6">
        <div class="form-group">
            <label>City</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtCity"></asp:TextBox>
        </div>
    </div>
    <div class="col-md-3 col-sm-6">
        <div class="form-group">
            <label>State/Province</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtState" MaxLength="2"></asp:TextBox>
        </div>
    </div>
    <div class="col-md-3 col-sm-6">
        <div class="form-group">
            <label>Zip</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtZip"></asp:TextBox>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-xs-12">
        <div class="form-group">
             <label>Match</label>
                <asp:RadioButton ID="rbAll" runat="server" GroupName="MATCH" Checked="true" /> All
                <asp:RadioButton ID="rbAny" runat="server" GroupName="MATCH"/> Any
        </div>
    </div>
    <div class="col-xs-12">
        <asp:Button runat="server" ID="btnSearch" CssClass="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />
        <input type="reset" value="Clear" class="btn btn-default" onclick="resetForm();return false;" />
    </div>
</div>
<asp:PlaceHolder ID="phResults" runat="server"></asp:PlaceHolder>
