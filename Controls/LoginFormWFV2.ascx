<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginFormWFV2.ascx.cs" Inherits="WaiverFile.Controls.LoginFormWFV2" %>


<div class="row">

    <div class="col-sm-6">
        
       

        <%if (((Waypoint.Core.WPPageLite)Page).AuthenticatedUser!=null){ %>
         <h3>Logged In</h3>
             <p>
                 <% if (!string.IsNullOrWhiteSpace(((Waypoint.Core.WPPageLite)Page).AuthenticatedUser.First_Name)){ %>
                 Welcome, <%=((Waypoint.Core.WPPageLite)Page).AuthenticatedUser.First_Name %>!
                 <%}else{ %>
                 Welcome!
                 <%} %>
             </p>
            <p>
                <a href="/MyAccount" class="btn btn-primary">My Account</a>
                <a href="?action=logout" class="btn btn-default">Log Out</a>
            </p>

        You are logged in. 
        <%}else{ %>
         <h3>Log In</h3>
      
        <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
                <div class="form-group">
                    <label for="<%=txtLogin.ClientID %>"><asp:Label runat="server" ID="lblLogin"></asp:Label></label>
                    <asp:TextBox ID="txtLogin" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="<%=txtPassword.ClientID %>">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                </div>
                <div class="row">
                    <div class="col-sm-6"><asp:CheckBox runat="server" ID="chkRememberMe" /> Remember Me</div>
                    <div class="col-sm-6 text-right"><asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary btn-block" Text="Log In" onclick="btnSubmit_Click"  /></div>
                </div>
           
        <hr />
        <p class="text-center">
            <a href="<%=ForgotPasswordUrl %>">Forgot Password?</a>
        </p>

        <%} %>
    </div>
    <div class="col-sm-6">

          <%if (((Waypoint.Core.WPPageLite)Page).AuthenticatedUser == null)
              { %>

                <h3>Don't have an Account?</h3>
                <p>Start your 30 day free trial today and see how WaiverFile can help streamline your business!</p>
                <p class="text-center">
                    <a href="/FreeTrial.aspx" class="btn btn-primary">Free Trial</a>
                </p>

           <% } %>
    </div>

</div>

