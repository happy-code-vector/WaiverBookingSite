<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreateSubaccountEndUser.ascx.cs" Inherits="WaiverFile.Controls.CreateSubaccountEndUser" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:PlaceHolder ID="phErrOuter" runat="server"></asp:PlaceHolder>

<asp:Panel runat="server" ID="pnlMain">

<h3>Create Sub-Account</h3>
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
       




    <script type="text/javascript">
        function OnClientItemsRequesting(sender, eventArgs) {
            var context = eventArgs.get_context();
            context["FilterString"] = eventArgs.get_text();
        }
        function showHideCustomerSections() {
          


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
            
            $('#rbCopyASite').click(function () { showHideCustomerSections(); })
            $('#rbSetupBlank').click(function () { showHideCustomerSections(); })
            $('#rbSetupTemplate').click(function () { showHideCustomerSections(); })

        });

    </script>

    
    <div id="divCustomerExisting">

       
         <div class="form-group">
            <label>Select a Subscription</label>
        <asp:DropDownList runat="server" id="cboSubscriptions" CssClass="form-control" ></asp:DropDownList>
             <p class="help-block">The new sub-account will share this subscription</p>
             </div>
        



    </div>

        <div id="divacctsetup">
            <hr />
            <div class="form-group">
                <label>New Sub-Account URL Slug</label>
                <asp:TextBox runat="server" ID="txtSiteUrl" CssClass="form-control"></asp:TextBox>
                <p class="help-block">https://www.waiverfile.com/b/______ - may be changed if url not available</p>
            </div>
            <div class="form-group">
                <label>New Sub-Account Title</label>
                <asp:TextBox runat="server" ID="txtSiteTitle" CssClass="form-control"></asp:TextBox>
            </div>
            <hr />
            <label>Account Setup Type</label>
    <div><asp:RadioButton runat="server" ID="rbSetupBlank" Text="Blank subaccount" GroupName="accounttype" ClientIDMode="Static" /></div>
    <div><asp:RadioButton runat="server" ID="rbCopyASite" Text="Copy another subaccount (active forms only)" GroupName="accounttype" ClientIDMode="Static" /></div>
    <div id="divCopySite">
        <div class="form-group">
                      <label for="<%=cboSite.ClientID %>">Subaccount</label>
                  <asp:DropDownList runat="server" ID="cboSite" CssClass="form-control"></asp:DropDownList>
                </div>
        <p class="help-block">When copying from another subaccount, most account settings and all active waiver forms will be setup in the new subaccount. You must have administrator level access to be able to copy settings from a subaccount.</p>
        
         <div class="form-group">
             <asp:CheckBox runat="server" ID="chkCopyAdminUsers" Text="Copy admin user access to new sub-account" />
         </div>

        <h4>Swap out codes</h4>
        <p>If the codes below are on any of the waiver forms in the source subaccount, you can swap those values out when the new subaccount is created.</p>
        <div class="form-group">
            <label>{{COMPANY}}</label>
            <asp:TextBox runat="server" ID="txtCode_company" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>{{ADDRESS}}</label>
            <asp:TextBox runat="server" ID="txtCode_Address" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>{{STATE}}</label>
            <asp:TextBox runat="server" ID="txtCode_state" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>{{STATE_CODE}}</label>
            <asp:TextBox runat="server" ID="txtCode_statecode" CssClass="form-control"></asp:TextBox>
        </div>


    </div>
            <hr />
          

            </div>
            
        
        <div id="divBtnSaveWrap">
        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Create Sub-Account" OnClick="btnSave_Click" />
            </div>



</asp:Panel>
