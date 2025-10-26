<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="IPALoginAdmin.ascx.cs" Inherits="WaiverFile.Controls.IPALoginAdmin" %>


    <h2><%=HeadingText %></h2>
                      <div class="well">
                          
                          <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
                          

                              <div class="form-group">
                                  <label for="<%=txtLogin.ClientID %>" class="control-label">Email</label>
                                  <asp:TextBox runat="server" ID="txtLogin" CssClass="form-control" title="Please enter you username" placeholder="example@domain.com" autocomplete="off"></asp:TextBox>
                              </div>
                              <div class="form-group">
                                  <label for="<%=txtPassword.ClientID %>" class="control-label">Password</label>
                                  <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" title="Please enter your password" autocomplete="off"></asp:TextBox>
                              </div>
                          <asp:Panel runat="server" ID="pnlRememberMe">
                          <div class="form-group">
                              <label>Keep me logged in</label>
                              <asp:CheckBox runat="server" ID="chkRememberMe" />
                              </div>
                              </asp:Panel>
                              <asp:Button ID="btnSubmit" runat="server" Text="Log In" CssClass="btn btn-success" 
                    onclick="btnSubmit_Click" />
                           
                <a href="<%=_redirectUrl %>" class="btn btn-default"><%=site.GetLabel("GO_BACK", conn) %></a>
                            
                      </div>
                  

