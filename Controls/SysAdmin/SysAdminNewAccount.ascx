<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SysAdminNewAccount.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.SysAdminNewAccount" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>



<asp:Panel runat="server" ID="pnlMain">

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Create New WaiverFile Site/Account</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
       


        <asp:Panel runat="server" ID="pnlMainInner">




    <script type="text/javascript">
        function OnClientItemsRequesting(sender, eventArgs) {
            var context = eventArgs.get_context();
            context["FilterString"] = eventArgs.get_text();
        }
        function showHideCustomerSections() {
            if ($('#rbCustomerNew').is(':checked')) {
                $('#divCustomerNew').show();
                $('#divCustomerExisting').hide();
                $('#divBtnSaveWrap').show();
                $('#divacctsetup').show();
            }
            else if ($('#rbCustomerExisting').is(':checked')) {
                $('#divCustomerNew').hide();
                $('#divCustomerExisting').show();
                $('#divBtnSaveWrap').show();
                $('#divacctsetup').show();
            }
            else {
                //nothing checked yet, hide all
                $('#divCustomerNew').hide();
                $('#divCustomerExisting').hide();
                $('#divBtnSaveWrap').hide();
                $('#divacctsetup').hide();
            }


            if ($('#rbSetupBlank').is(':checked')) {
                $('#divCopySite').hide();
                $('#divTemplates').hide();

            } else if ($('#rbSetupTemplate').is(':checked')) {
                $('#divCopySite').hide();
                $('#divTemplates').show();
            }
            else if ($('#rbCopyASite').is(':checked')) {
                $('#divCopySite').show();
                $('#divTemplates').hide();
            } else {
                $('#divTemplates').hide();
                $('#divCopySite').hide();
            }

        }

        $(function () {
            showHideCustomerSections();
            $('#rbCustomerExisting').click(function () { showHideCustomerSections(); })
            $('#rbCustomerNew').click(function () { showHideCustomerSections(); })

            $('#rbCopyASite').click(function () { showHideCustomerSections(); })
            $('#rbSetupBlank').click(function () { showHideCustomerSections(); })
            $('#rbSetupTemplate').click(function () { showHideCustomerSections(); })

        });

    </script>

    <div class="form-group">
    <asp:RadioButton runat="server" ID="rbCustomerNew" GroupName="customer" ClientIDMode="Static" Text="New Customer" /> &nbsp;&nbsp; 
    <asp:RadioButton runat="server" ID="rbCustomerExisting" GroupName="customer" ClientIDMode="Static" Text="Existing Customer"/>
        </div>

    <div id="divCustomerNew">

        <div class="form-group">
            <label>Name</label>
            <asp:TextBox runat="server" ID="txtCustomerNewName" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Company</label>
            <asp:TextBox runat="server" ID="txtCompany" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Email</label>
            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>CRM Source</label>
            <asp:DropDownList runat="server" ID="cboCRMSource" CssClass="form-control"></asp:DropDownList>
        </div>

    </div>
    <div id="divCustomerExisting">

         <div class="form-group">
            <label>Select a Customer</label>
            <telerik:RadComboBox ID="cboCustomer" runat="server" EnableLoadOnDemand="true" OnClientItemsRequesting="OnClientItemsRequesting" OnSelectedIndexChanged="cboCustomer_SelectedIndexChanged" AutoPostBack="true">
            <WebServiceSettings Method="SearchCustomerForRadCombo"  Path="/Controls/SearchCustomersCRM.asmx" />
            </telerik:RadComboBox>
        </div>
         <div class="form-group">
            <label>Select a Subscription</label>
        <asp:DropDownList runat="server" id="cboSubscriptions" CssClass="form-control"></asp:DropDownList>
             </div>



    </div>

        <div id="divacctsetup">
            <hr />
            <div class="form-group">
                <label>Site URL Slug</label>
                <asp:TextBox runat="server" ID="txtSiteUrl" CssClass="form-control"></asp:TextBox>
                <p class="help-block">https://www.waiverfile.com/b/______ - may be changed if url not available</p>
            </div>
            <div class="form-group">
                <label>Site Title</label>
                <asp:TextBox runat="server" ID="txtSiteTitle" CssClass="form-control"></asp:TextBox>
            </div>
            <hr />
            <label>Account Setup Type</label>
    <div><asp:RadioButton runat="server" ID="rbSetupBlank" Text="Blank account" GroupName="accounttype" ClientIDMode="Static" /></div>
    <div><asp:RadioButton runat="server" ID="rbSetupTemplate" Text="Select a template/setup pack" GroupName="accounttype" ClientIDMode="Static" /></div>
    <div id="divTemplates">
        <asp:DropDownList runat="server" ID="cboTemplates" CssClass="form-control"></asp:DropDownList>
    </div>
    <div><asp:RadioButton runat="server" ID="rbCopyASite" Text="Copy a site (active forms only)" GroupName="accounttype" ClientIDMode="Static" /></div>
    <div id="divCopySite">
        <div class="form-group">
                      <label for="<%=cboSite.ClientID %>">Waiver Site / Customer</label>
                     <telerik:RadComboBox ID="cboSite" runat="server" EnableLoadOnDemand="true" OnClientItemsRequesting="OnClientItemsRequesting">
          <WebServiceSettings Method="SearchWaiverSitesForRadCombo" Path="/Controls/SysAdmin/WFSiteSearch.asmx" />
          </telerik:RadComboBox>
                </div>
    </div>
            <hr />
            <div class="form-group">
                <label>Securty Mode</label>
                <asp:RadioButtonList runat="server" ID="rblSecurityMode">
                    <asp:ListItem Value="200">HIPAA</asp:ListItem>
                    <asp:ListItem Value="100">Standard</asp:ListItem>
                </asp:RadioButtonList>
            </div>

            <div class="form-group">
                
                <label>Send email with details to</label>
                <asp:RadioButtonList runat="server" ID="rblEmailTarget">
                    <asp:ListItem Value="CUSTOMER" Selected="True">The Customer</asp:ListItem>
                    <asp:ListItem Value="ME">Me</asp:ListItem>
                </asp:RadioButtonList>
                <p class="help-block">If creating a new user account, this email will include the generated password</p>
            </div>

            <div class="form-group">
                <label>Message to include in email (optional)</label>
                <asp:TextBox runat="server" ID="txtEmailMessage" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:CheckBox runat="server" ID="chkJoinMailingList" Text="Join the main mailing list (skips if already opted out)" Checked="true" />
                </div>

            </div>
            </asp:Panel>
        
    </div><!-- /.box-body -->
    <div class="box-footer">
        <div id="divBtnSaveWrap">
        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Create Site" OnClick="btnSave_Click" />
            </div>
    </div>
    </div>
    



</asp:Panel>
