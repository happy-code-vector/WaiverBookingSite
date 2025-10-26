<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WaiverFileFeedbackForm.ascx.cs" Inherits="WaiverFile.Controls.WaiverFileFeedbackForm" %>
 
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

        <div class="form-group">
            <label>Your Name</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder=""></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Your Company</label>
            <asp:TextBox ID="txtCompany" runat="server" CssClass="form-control" placeholder=""></asp:TextBox>
        </div>
        <div class="form-group">
            <label>What was an obstacle that would have prevented you from signing up for WaiverFile?</label>
            <asp:TextBox ID="txtQ1" runat="server" CssClass="form-control" placeholder="" TextMode="MultiLine"></asp:TextBox>
        </div>
  <div class="form-group">
            <label>How has using WaiverFile affected your business?</label>
            <asp:TextBox ID="txtQ2" runat="server" CssClass="form-control" placeholder="" TextMode="MultiLine"></asp:TextBox>
        </div>
  <div class="form-group">
            <label>What specific feature do you like?</label>
            <asp:TextBox ID="txtQ3" runat="server" CssClass="form-control" placeholder="" TextMode="MultiLine"></asp:TextBox>
        </div>
  <div class="form-group">
            <label>What are one or two benefits you have found? </label>
            <asp:TextBox ID="txtQ4" runat="server" CssClass="form-control" placeholder="" TextMode="MultiLine"></asp:TextBox>
        </div>
  <div class="form-group">
            <label>Would you recommend WaiverFile? If so, why?</label>
            <asp:TextBox ID="txtQ5" runat="server" CssClass="form-control" placeholder="" TextMode="MultiLine"></asp:TextBox>
        </div>
  <div class="form-group">
            <label>Is there anything you’d like to add?</label>
            <asp:TextBox ID="txtQ6" runat="server" CssClass="form-control" placeholder="" TextMode="MultiLine"></asp:TextBox>
        </div>

<div class="form-group">
            <label>May we share your comments on our website?</label>
            <asp:RadioButton runat="server" id="rbTestimonialYes" GroupName="comments"></asp:RadioButton> Sure!  &nbsp; &nbsp; <asp:RadioButton runat="server" id="rbTestimonialNo" GroupName="comments"></asp:RadioButton> No, I prefer to keep my comments private
        </div>

<%if(_includeLogoRequest){ %>
<div class="form-group">
            <label>May we include your logo on our website and/or marketing materials?</label>
            <asp:RadioButton runat="server" id="rbLogoYes" GroupName="logo"></asp:RadioButton> Yes  &nbsp; &nbsp; <asp:RadioButton runat="server" id="rbLogoNo" GroupName="logo"></asp:RadioButton> No
        </div>

<%} %>

<asp:Button runat="server" CssClass="btn btn-primary" Text="Submit" ID="btnSave" OnClick="btnSave_Click" />
