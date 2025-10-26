<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SetupBooking2.aspx.cs" Inherits="WaiverFile.site.admin.CMS.SetupBooking2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
     <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>
       <asp:Panel runat="server" ID="pnlMain">


          <h3>Let's Setup Your Site</h3>
           <p>We’ll guide you through a few quick steps to personalize your site.</p>

         
            <div class="form-group">
                <label for="ddlScheduleType">How will you schedule bookings?</label>
                <asp:RadioButtonList ID="rblScheduleType" runat="server" CssClass="form-inline">
                    <asp:ListItem Text="All Day Access" Value="AllDay" />
                    <asp:ListItem Text="Time Slots" Value="TimeSlots" />
                </asp:RadioButtonList>
                <p class="help-block">Choose whether visitors can come any time or select specific time windows.</p>
            </div>

            <div class="form-group">
                <label>Do you offer different pricing for adults and children?</label><br />
                <asp:RadioButtonList ID="rblPricingType" runat="server" CssClass="form-inline">
                    <asp:ListItem Text="Yes" Value="Yes" />
                    <asp:ListItem Text="No" Value="No" />
                </asp:RadioButtonList>
            </div>

             <div class="form-group">
                  <label>Is your business seasonal?</label><br />
                  <asp:RadioButtonList ID="rbSeasonal" runat="server" CssClass="form-inline">
                      <asp:ListItem Text="Yes" Value="Yes" />
                      <asp:ListItem Text="No" Value="No, we operate all year" />
                  </asp:RadioButtonList>
              </div>

            <asp:Panel runat="server" ID="pnlLogo">
            <div class="form-group">
                <label for="fuLogo">Upload your logo (optional)</label>
                <asp:FileUpload ID="fuLogo" runat="server" CssClass="form-control" />
                <small class="help-block">You can skip this for now if you don’t have one.</small>
            </div>
            </asp:Panel>

           <asp:Panel runat="server" ID="pnlTheme" Visible="false">
            <div class="form-group">
                <label for="ddlTheme">Choose a theme for your website</label>
                <asp:DropDownList ID="ddlTheme" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Modern" Value="Modern" />
                    <asp:ListItem Text="Classic" Value="Classic" />
                    <asp:ListItem Text="Bold" Value="Bold" />
                </asp:DropDownList>
            </div>
               </asp:Panel>


           <label>Select your color scheme</label>
            <div class="form-group">
                
                        <label for="colorPrimary">Primary Color</label>
                        <asp:TextBox ID="colorPrimary" runat="server" CssClass="" TextMode="Color"></asp:TextBox>
                <p class="help-block">Used for primary buttons and related elements</p>
                </div>
            <div class="form-group">
                        <label for="colorSecondary">Secondary Color</label>
                        <asp:TextBox ID="colorSecondary" runat="server" CssClass="" TextMode="Color"></asp:TextBox>
                <p class="help-block">Used for secondary buttons and related elements</p>
            </div>

            <hr />

            <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Continue" OnClick="btnSubmit_Click" />


           </asp:Panel>
</asp:Content>
