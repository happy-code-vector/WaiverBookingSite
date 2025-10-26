<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AccountDetails.ascx.cs" Inherits="WaiverFile.Controls.AccountDetails" %>

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Account Details</h3>
    </div><!-- /.box-header -->
    <div class="box-body">

        <table class="table">
            <tbody>
               
                <tr>
                    <td><label>First Name</label></td>
                    <td><asp:Label ID="lblFirstName" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td><label>Middle Name</label></td>
                    <td><asp:Label ID="lblMiddleName" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td><label>Last Name</label></td>
                    <td><asp:Label ID="lblLastName" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td><label>Email Address</label></td>
                    <td><asp:Label ID="lblEmailAddress" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td><label>Password</label></td>
                    <td><a href="<%=_changePasswordUrl %>" class="btn btn-primary btn-sm">Change Password</a></td>
                </tr>
                <tr>
                    <td colspan="2"><a href="<%=_editAccountUrl %>" class="btn btn-primary">Edit Name</a></td>
                </tr>
                <tr>
                    <td colspan="2"><a href="<%=_changeEmailUrl %>" class="btn btn-primary">Change Email Address</a></td>
                </tr>

                
            </tbody>
        </table>

</div></div>