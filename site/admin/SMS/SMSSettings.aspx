<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SMSSettings.aspx.cs" Inherits="WaiverFile.site.admin.SMS.SMSSettings" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <asp:Panel runat="server" ID="pnlMain">


        <script type="text/javascript">

            function showHideStuff() {
                var mode = $('#<%=cboMode.ClientID%>').val();
                if (mode == "MANUAL") {
                    $('#div_allrequred').hide();
                    $('#div_forms').show();
                } else{
                    $('#div_allrequred').show();
                    $('#div_forms').hide();
                }
            }

            function handleChecks(formid, turnon) {
                if (turnon) {
                    

                    $('span[data-formid="' + formid + '"] input').each(function () {
                        if ( $(this).parent().data('mode') == 'require') {
                            $(this).removeAttr("disabled");
                        }
                    });
                } else {

                    $('span[data-formid="' + formid + '"] input').each(function () {
                        if ( $(this).parent().data('mode') == 'require') {
                            $(this).attr("disabled", true);
                        }
                    });


                }
            }

            $(function () {
                showHideStuff();

                $('span[data-mode="include"] input').each(function () {
                    handleChecks($(this).parent().data('formid'), $(this).is(':checked'));
                    $(this).change(function () {
                        handleChecks($(this).parent().data('formid'), $(this).is(':checked'));
                    });
                });

                $('#<%=cboMode.ClientID%>').change(function () { showHideStuff(); });
            });
        </script>

        <h3>Text Messaging Settings</h3>

        <div class="row">
            <div class="col-sm-6">
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

                <div class="well">
                    <div class="row">
                        <div class="col-xs-12">
                             <div class="form-group">
                        <label>Mobile Number Input</label>
                        <asp:DropDownList runat="server" ID="cboMode" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="cboMode_SelectedIndexChanged">
                            <asp:ListItem Value="ALL">Include on all waiver forms</asp:ListItem>
                            <asp:ListItem Value="MANUAL">Choose forms manually</asp:ListItem>
                            <asp:ListItem Value="DISABLE">Disable (don't collect mobile numbers on any forms)</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                        </div>
                    </div>
        
                    <div class="form-group" id="div_allrequred">
                        <asp:CheckBox runat="server" ID="chkRequireAll" Text="Make mobile number required" />
                    </div>


                     <div class="row">
                        <div class="col-xs-12">
                              <div class="form-group">
                                <label>Time of Day To Send Birthday Texts</label>
                                <asp:DropDownList runat="server" ID="cboBdayMessageTiming" CssClass="form-control" OnSelectedIndexChanged="cboMode_SelectedIndexChanged">
               
                                </asp:DropDownList>
                                   <p class="help-block">The hour of the day that automated birthday related messages should be sent.</p>
                            </div>
                            </div></div>
       
         


                    <div id="div_forms">
                    <div class="form-group">
                        <label>Waiver Forms</label>
                        </div>
                        <asp:Panel runat="server" ID="pnlFormsWrap">

                        
                   <asp:PlaceHolder runat="server" ID="phForms"></asp:PlaceHolder>
                            </asp:Panel>
                        </div>


                <asp:Button runat="server" ID="btnSave" OnClick="btnSave_Click" CssClass="btn btn-primary" Text="Save" />

                    </div>


            </div>
            <div class="col-sm-6">

            

                <asp:Panel runat="server" ID="pnlDemoSettings" Visible="false" CssClass="well">
                    <div class="pull-right">
                        <asp:Button runat="server" ID="btnEdit" CssClass="btn btn-default btn-sm" Text="Edit" OnClick="btnEdit_Click" />
                    </div>
                    <h4>SMS DEMO Settings</h4>


                 
                    
                    <asp:Panel runat="server" ID="pnlEditSettings">

                      
                    <div class="form-group">
                        <label for="<%=txtTestingNum.ClientID %>">Testing Mobile Number</label>
                        <asp:TextBox runat="server" ID="txtTestingNum" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="<%=txtBusinessNum.ClientID %>">Business Phone</label>
                        <asp:TextBox runat="server" ID="txtBusinessNum" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>

                         <div class="form-group">
                        <asp:CheckBox ID="chkDisableSending" runat="server" Text="Disable demo SMS sending" Enabled="false" />
                             <p class="help-block">When checked, turns off sending sample SMS text messages to the number above.</p>
                    </div>

                        <p>
                            <asp:Button runat="server" ID="btnSaveDemoSettings" CssClass="btn btn-primary" Visible="false" Text="Save" OnClick="btnSaveDemoSettings_Click" />
                            <asp:Button runat="server" ID="btnCancelDemoSettings" CssClass="btn btn-muted" Visible="false" Text="Cancel" OnClick="btnCancelDemoSettings_Click" />
                        </p>
                        </asp:Panel>








                </asp:Panel>

                    <asp:PlaceHolder runat="server" ID="phNumberDetails"></asp:PlaceHolder>

                <asp:Panel runat="server" ID="pnlProfileDetails" Visible="false">
                    <hr />
                    <h4>SMS Sending Profile Status</h4>
                    <p>
                        <asp:PlaceHolder runat="server" ID="phProfileStatus"></asp:PlaceHolder>
                        
                    </p>
                </asp:Panel>
            </div>
        </div>
        
<div class="row">
    <div class="col-xs-12">

        
                <div class="pull-right">
                <a href="SMSEditOptIn.aspx" class="btn btn-primary">Add</a>
                    </div>
                    <h4>Opt-In Configurations</h4>
                    <p>Manage how your customers will opt-in to your SMS list</p>


                            


<telerik:RadGrid ID="RadGrid1" runat="server"  AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="False" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         
                         

                         
                         <telerik:GridBoundColumn DataField="name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="name" UniqueName="name"></telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="optInType" FilterControlAltText="Filter OptInType column" HeaderText="Opt-In Type" SortExpression="optInType" UniqueName="optInType"></telerik:GridBoundColumn>

             
                         <telerik:GridBoundColumn DataField="isDefault" FilterControlAltText="Filter IsDefault column" HeaderText="Default" SortExpression="isDefault" UniqueName="isDefault"></telerik:GridBoundColumn>

                         
            
            
                        <telerik:GridBoundColumn DataField="status" FilterControlAltText="Filter status column" HeaderText="Status" SortExpression="status" UniqueName="status"></telerik:GridBoundColumn>

                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="SMSEditOptIn.aspx?id={0}" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="editcol" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
 




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFSMSOptInConfig where siteid=@siteID">
                  </asp:SqlDataSource>
                         

    </div>
</div>

    </asp:Panel>
</asp:Content>
