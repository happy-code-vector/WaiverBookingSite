<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Aff_ViewClient.ascx.cs" Inherits="WaiverFile.CRM.Controls.Aff_ViewClient" %>
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
<asp:PlaceHolder ID="ph0" runat="server"></asp:PlaceHolder>

<script type="text/javascript">
    $(document).ready(function(){
  $(".nav-tabs a").click(function(){
    $(this).tab('show');
 });
    });

        function resetForm() {
        var inputs = document.getElementsByTagName('input');
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].type == 'text')
                inputs[i].value = "";
        }
    }

</script>
<asp:Panel ID="pnlMain" runat="server">
    <asp:PlaceHolder ID="phOverview" runat="server"></asp:PlaceHolder>
</asp:Panel>


<div class="row">
    <div class="col-xs-12">
        <div class="panel with-nav-tabs panel-default">

      
            <ul class="nav nav-tabs" id="tablinks" role="tablist">
                <li id="li_search" runat="server"><a id="a_search" role="tab" aria-controls="<%=tab_search.ClientID %>" data-toggle="tab" href="#<%=tab_search.ClientID %>">Waiver Search</a></li>
                <li id="li_usage" runat="server"><a id="a_usage" data-toggle="tab" aria-controls="<%=tab_usage.ClientID %>" href="#<%=tab_usage.ClientID %>">Usage Data</a></li>
                <li id="li_commission" runat="server"><a id="a_commission" aria-controls="<%=tab_commission.ClientID %>" data-toggle="tab" href="#<%=tab_commission.ClientID %>">Commissions</a></li>
            </ul>
    
           <div class="panel-body">
            <div class="tab-content">
                <div class="tab-pane  show active" id="tab_search" runat="server" role="tabpanel"  aria-labelledby="a_search">

                    <asp:Panel ID="pnlFindWaiver" runat="server">
    
                    <h3>Waiver Search</h3>
                <p>Use any of the fields below to find specific waivers.</p>

            <div class="row" runat="server" id="div_subaccount">
                <div class="col-xs-12">
                    <div class="form-group">
                        <label>Sub-Account</label>
                        <asp:DropDownList runat="server" ID="cboSites"></asp:DropDownList>
                    </div>
                    <p class="help-block">This client has multiple sub-accounts. Select which one to search within.</p>
                </div>
            </div>
        <div class="row">
            <div class="col-md-4 col-sm-6">
                <div class="form-group">
                    <label>First Name</label>
                    <asp:TextBox CssClass="form-control" runat="server" ID="txtFirst"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="form-group">
                    <label>Last Name</label>
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
                <asp:Button runat="server" ID="Button1" CssClass="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />
                <input type="reset" value="Clear" class="btn btn-default" onclick="resetForm();return false;" />
            </div>
        </div>
        <asp:PlaceHolder ID="phResults" runat="server"></asp:PlaceHolder>

                    </asp:Panel>


                </div>
                <div class="tab-pane " id="tab_usage" runat="server" role="tabpanel">
                    
                    <asp:PlaceHolder ID="phUsage" runat="server"></asp:PlaceHolder>

                </div>

                <div class="tab-pane" id="tab_commission" runat="server" role="tabpanel">
                    
                    <asp:PlaceHolder ID="phCommission" runat="server"></asp:PlaceHolder>

                </div>
            </div>
  </div>

</div>



    </div>
</div>

   
