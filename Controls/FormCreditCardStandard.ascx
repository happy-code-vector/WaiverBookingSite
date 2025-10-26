<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormCreditCardStandard.ascx.cs" Inherits="WaiverFile.Controls.FormCreditCardStandard" %>
<%@ Register Assembly="Waypoint" Namespace="Waypoint.Forms" TagPrefix="cc1" %>



<div class="form-group"><label>Card Type</label><asp:DropDownList ID="cboCCType" runat="server" CssClass="form-control">
                                           
                                        </asp:DropDownList></div>

<div class="form-group"><label>Card Number</label><asp:TextBox ID="txtCCNum" runat="server" MaxLength="16" CssClass="form-control"></asp:TextBox></div>
<div class="form-group"><label>Expiration Date</label>
    <div class="form-inline"><div class="form-group"><asp:DropDownList ID="cboCCMonth" runat="server" CssClass="form-control">
                                            <asp:ListItem>--Month--</asp:ListItem>
                                            <asp:ListItem Value="01">(01) January</asp:ListItem>
                                            <asp:ListItem Value="02">(02) February</asp:ListItem>
                                            <asp:ListItem Value="03">(03) March</asp:ListItem>
                                            <asp:ListItem Value="04">(04) April</asp:ListItem>
                                            <asp:ListItem Value="05">(05) May</asp:ListItem>
                                            <asp:ListItem Value="06">(06) June</asp:ListItem>
                                            <asp:ListItem Value="07">(07) July</asp:ListItem>
                                            <asp:ListItem Value="08">(08) August</asp:ListItem>
                                            <asp:ListItem Value="09">(09) September</asp:ListItem>
                                            <asp:ListItem Value="10">(10) October</asp:ListItem>
                                            <asp:ListItem Value="11">(11) November</asp:ListItem>
                                            <asp:ListItem Value="12">(12) December</asp:ListItem>
                                        </asp:DropDownList>
                                        &nbsp;<asp:DropDownList ID="cboCCYear" runat="server" CssClass="form-control">
                                        </asp:DropDownList></div></div></div>


<div class="form-group"><label>Card Verification Number</label>
    <div class="form-inline"><asp:TextBox ID="txtCCVerification" runat="server" CssClass="form-control"></asp:TextBox>
                                        <cc1:WPHelpIcon ID="WPHelpIcon4" runat="server" HelpText="The CVV code is a 3 to 4 digit code printed on the back of your credit card within the signature line. It is the last 3 to 4 digits. This verification code is obtained to help prevent fraudulent use of a credit card number.  Note: On American Express cards the 4 digit code is on the front.">
                                        </cc1:WPHelpIcon></div></div>
<% if(SaveCCProfileMode == SaveCCProfileModeEnum.Show_checkbox){ %>
<div class="form-group">
    <asp:CheckBox ID="chkSaveAsCCProfile" runat="server" />
    <label><%=_saveCCProfileLabelText %></label>
</div>
<% } %>
