<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddWaiverSite.ascx.cs" Inherits="WaiverFile.Controls.AddWaiverSite" %>
 <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

            <div class="widget">
                <h3>WaiverSite</h3>
                <div class="widgetcontent">
    
                    <p class="note">Use this form to create a new waiver site for a new customer. If the customer already exists, go to their customer screen to add additional waiver sites.</p>
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
                    
                    <p><label>Site URL</label>WaiverFile.com/b/<asp:TextBox ID="txtUrl" runat="server" Text=""></asp:TextBox></p>
                    <p><label>Site Name</label><asp:TextBox ID="txtSiteName" runat="server"></asp:TextBox></p>
                    <p><label>Company Name</label><asp:TextBox ID="txtCompany" runat="server"></asp:TextBox></p>
                    <p><label>First Name</label><asp:TextBox ID="txtFirst" runat="server"></asp:TextBox></p>
                    <p><label>Last Name</label><asp:TextBox ID="txtLast" runat="server"></asp:TextBox></p>
                    <p><label>Email Name</label><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></p>

                    <p><label>Subscription Item</label><asp:DropDownList id="cboSubscriptionItem" runat="server"></asp:DropDownList></p>
                    <p><label>Mailing Lists</label></p>
                    <div class="checkboxlist">
                        <asp:CheckBoxList ID="cblMailingLists" runat="server" CssClass="entrycheckbox"></asp:CheckBoxList>
                    </div>
                    <p><label>Default Timezone</label><asp:DropDownList id="cboDefaultTimezone" runat="server"></asp:DropDownList></p>
                    <p><label>Send Welcome Email</label><asp:CheckBox ID="chkSendWelcomeEmail" runat="server" Checked="true" /></p>
              <p><label>Starting Question Set</label><asp:DropDownList ID="cboQuestionPreset" runat="server"></asp:DropDownList></p>
               
               
               <p><asp:Button ID="btnSave" runat="server" CssClass="btn" Text="Save" onclick="btnSave_Click" /></p>

            </div></div>