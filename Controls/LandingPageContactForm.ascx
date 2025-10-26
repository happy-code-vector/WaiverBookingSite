<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LandingPageContactForm.ascx.cs" Inherits="WaiverFile.Controls.LandingPageContactForm" %>

<asp:Panel ID="pnlMain" runat="server" CssClass="validate form">

<asp:PlaceHolder ID="phErr" runat="server"/>

	

    
									<div class="form-header">
										<h2 class="heading-secondary">Contact Us Today</h2>
									</div>

									<div class="form-section-0">
										<div class="form-group">
											 <asp:TextBox runat="server" ID="txtName" placeholder="Name *" data-labelname="Name" data-required="false" CssClass="form-control"></asp:TextBox>
											<div class="messages"></div>
										</div>
										<div class="form-group">
											  <asp:TextBox runat="server" ID="txtEmail" data-labelname="Email" data-required="true" CssClass="form-control" placeholder="Email *" AutoCompleteType="Email"></asp:TextBox>
											<div class="messages"></div>
										</div>
										<div class="form-group">
											<asp:TextBox runat="server" ID="txtCompany" data-labelname="Company" data-required="false" CssClass="form-control" placeholder="Company"></asp:TextBox>
											<div class="messages"></div>
										</div>
										<div class="form-group">
											<asp:TextBox runat="server" ID="txtPhone" data-labelname="Phone" data-required="false" CssClass="form-control" placeholder="Phone"></asp:TextBox>
											<div class="messages"></div>
										</div>
										<div class="form-group">
											 <asp:TextBox runat="server" ID="txtMessage" data-labelname="Comments" data-required="false" Columns="50" Rows="10" TextMode="MultiLine" CssClass="form-control" placeholder="Message"></asp:TextBox>
											<div class="messages"></div>
										</div>
									</div>
									<div class="form-footer">
										<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Submit" CssClass="submitButton btn btn-primary"></asp:Button>
									</div>
								



    </asp:Panel>
