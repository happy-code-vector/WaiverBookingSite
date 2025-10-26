<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EasySignupV3Step1.ascx.cs" Inherits="WaiverFile.Controls.EasySignupV3Step1" %>

<asp:Panel runat="server" DefaultButton="btnSubmit">
<div class="form-header">
			<h2><span>Get Your Free Trial</span></h2>
		</div>
		<div class="form-section-0 form-row">
			<asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>
			<div class="form-group col-md-6">
				 <asp:TextBox id="txtName" runat="server" placeholder="Name *" CssClass="form-control" ></asp:TextBox>
				<div class="messages"></div>
			</div>
			<div class="form-group col-md-6">
				<asp:TextBox id="txtCompany" runat="server" placeholder="Company Name *" CssClass="form-control" ></asp:TextBox>
				<div class="messages"></div>
			</div>
			<div class="form-group col-md-6 offset-md-3">
				<asp:TextBox id="txtEmail" placeholder="Email *" runat="server" CssClass="form-control" AutoCompleteType="Email" ></asp:TextBox>
				<div class="messages"></div>
			</div>
		</div>
		<div class="form-footer">
			<asp:LinkButton runat="server" ID="btnSubmit" CssClass="submitButton btn btn-primary" OnClick="btnSubmit_Click">
				<span class="spinner-border spinner-border loader" aria-hidden="true" style="display: none"></span>
				Submit
			</asp:LinkButton>
		</div></asp:Panel>