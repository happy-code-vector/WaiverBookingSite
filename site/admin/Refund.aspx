<%@ Page Title="" Language="C#"  MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Refund.aspx.cs" Inherits="WaiverFile.site.admin.Refund" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>

   

  
                    <div class="page-header">
                        <h2>
                            <i class="fa fa-undo"></i>
                            Process Refund
                        </h2>
                        <p class="text-muted">Review transaction details and process refund</p>
                    </div>

                    <!-- Alert Panel -->
                    <asp:Panel ID="pnlAlert" runat="server" Visible="false" CssClass="alert" role="alert">
                        <asp:Literal ID="litAlert" runat="server"></asp:Literal>
                    </asp:Panel>

                    <!-- Transaction Details Panel -->
                    <asp:Panel ID="pnlTransactionDetails" runat="server">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">Transaction Details</h4>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <dl class="dl-horizontal">
                                             <dt>Charge ID:</dt>
 <dd><asp:Literal ID="litStripeChargeId" runat="server"></asp:Literal></dd>
                                            
                                            <dt>Order Number:</dt>
                                            <dd><asp:Literal ID="litOrderNumber" runat="server"></asp:Literal></dd>
                                            
                                            <dt>Amount:</dt>
                                            <dd><asp:Literal ID="litAmount" runat="server"></asp:Literal></dd>
                                            
                                            <dt>Date:</dt>
                                            <dd><asp:Literal ID="litDate" runat="server"></asp:Literal></dd>
                                        </dl>
                                    </div>
                                    <div class="col-sm-6">
                                        <dl class="dl-horizontal">
                                            <dt>Customer:</dt>
                                            <dd><asp:Literal ID="litCustomerName" runat="server"></asp:Literal></dd>
                                            
                                            <dt>Email:</dt>
                                            <dd><asp:Literal ID="litCustomerEmail" runat="server"></asp:Literal></dd>
                                            
                                            <dt>Card:</dt>
                                            <dd><asp:Literal ID="litCardInfo" runat="server"></asp:Literal></dd>
                                            
                                           
                                        </dl>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Refund Form -->
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">Refund Options</h4>
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label for="ddlRefundType" class="control-label">Refund Type:</label>
                                    <asp:DropDownList ID="ddlRefundType" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlRefundType_SelectedIndexChanged">
                                        <asp:ListItem Value="full" Text="Full Refund" Selected="True"></asp:ListItem>
                                        <asp:ListItem Value="partial" Text="Partial Refund"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <asp:Panel ID="pnlPartialAmount" runat="server" Visible="false">
                                    <div class="form-group">
                                        <label for="txtPartialAmount" class="control-label">Partial Refund Amount:</label>
                                        <div class="input-group">
                                            <span class="input-group-addon">$</span>
                                            <asp:TextBox ID="txtPartialAmount" runat="server" CssClass="form-control" placeholder="0.00" TextMode="Number" step="0.01"></asp:TextBox>
                                        </div>
                                        <asp:RangeValidator ID="rvPartialAmount" runat="server" 
                                            ControlToValidate="txtPartialAmount" 
                                            Type="Double" 
                                            MinimumValue="0.01" 
                                            ErrorMessage="Amount must be less than the order total and greater than $0.00" 
                                            CssClass="text-danger" 
                                            Display="Dynamic">
                                        </asp:RangeValidator>
                                    </div>
                                </asp:Panel>

                                <div class="form-group">
                                    <label for="txtReason" class="control-label">Reason for Refund:</label>
                                    <asp:TextBox ID="txtReason" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Enter reason for refund (optional)"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:CheckBox ID="chkNotifyCustomer" runat="server" Text="Send refund notification email to customer" Checked="true" />
                                </div>

                                <div class="alert alert-warning" role="alert">
                                    <i class="fa fa-exclamation-triangle"></i>
                                    <strong>Warning:</strong> This action cannot be undone. The refund will be processed immediately.
                                </div>

                                <div class="form-group">
                                    <asp:Button ID="btnProcessRefund" runat="server" Text="Process Refund" CssClass="btn btn-danger" OnClick="btnProcessRefund_Click" OnClientClick="return confirm('Are you sure you want to process this refund? This action cannot be undone.');" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-default" OnClick="btnCancel_Click" CausesValidation="false" />
                                </div>
                            </div>
                        </div>
                    </asp:Panel>

                    <!-- Loading Panel -->
                    <asp:Panel ID="pnlLoading" runat="server" Visible="false" CssClass="text-center">
                        <i class="fa fa-spinner fa-spin fa-3x"></i>
                        <p class="text-muted">Processing refund...</p>
                    </asp:Panel>
              


</asp:Content>
