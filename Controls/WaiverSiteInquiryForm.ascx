<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WaiverSiteInquiryForm.ascx.cs" Inherits="WaiverFile.Controls.WaiverSiteInquiryForm" %>

<asp:PlaceHolder ID="phLinkIfNotDevice" runat="server"></asp:PlaceHolder>

<asp:Panel ID="pnlMain" runat="server">


<div class="panel panel-default alt">
                <div class="panel-body">
                    <asp:PlaceHolder ID="phErr" runat="server"/>

                    <div class="form-row">
                      <div class="col-xs-12 col-sm-6 form-group first-name required">
                        <label class="control-label">Name</label>
                          <asp:TextBox ID="txtName" runat="server" data-labelname="First Name" data-required="true" placeholder="Enter Your First Name" CssClass="form-control"></asp:TextBox>
                      </div>
                      <div class="col-xs-12 col-sm-6 form-group email required">
                        <label class="control-label">Email</label>
                          <asp:TextBox ID="txtEmail" runat="server" data-labelname="Email" data-required="true" data-from-email-field="true" placeholder="name@example.com" autocomplete="off" CssClass="form-control"></asp:TextBox>
                      </div>
                     
                    </div>

                    <div class="form-row">
                     <div class="col-xs-12 col-sm-6 form-group phone required">
                        <label class="control-label">Company/Organization</label>
                          <asp:TextBox ID="txtCompany" runat="server" data-labelname="Company/Organization" data-required="false" placeholder="Enter Company or Organization Name" CssClass="form-control"></asp:TextBox>
                      </div>
                     <div class="col-xs-12 col-sm-6 form-group phone required">
                        <label class="control-label">Phone</label>
                          <asp:TextBox ID="txtPhone" runat="server" data-labelname="Phone" data-required="true"  placeholder="Enter Phone Number" CssClass="form-control card-expiry-month"></asp:TextBox>
                      </div>
                    </div>

                    <div class="form-row">
                      <div class="col-xs-12 form-group message required">
                        <label class="control-label">Message/Comments</label>
                          <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="10" data-labelname="Message" data-required="true" placeholder="Enter any comments, feedback or questions." CssClass="form-control"></asp:TextBox>
                      </div>
                    </div>

                    <div class="form-row">
                        <div class="col-xs-12">
                            <p class="text-right">
                                <asp:LinkButton CssClass="btn btn-primary" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><span class="btn-label"><i class="fa fa-check"></i></span>Submit</asp:LinkButton>
                            </p>
                        </div>
                    </div>
                </div> <!--/.panel-body-->
            </div>

    </asp:Panel>
