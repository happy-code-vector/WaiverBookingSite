<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyAccountArea.Master" AutoEventWireup="true" CodeBehind="ViewAccount.aspx.cs" Inherits="WaiverFile.MyAccount.ViewAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">

        <h3 class="box-title">Account Details</h3>

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
                    <td><a href="ChangePassword.aspx" class="btn btn-primary btn-sm">Change Password</a></td>
                </tr>
                <tr>
                    <td colspan="2"><a href="EditAccount.aspx" class="btn btn-primary">Edit Name</a></td>
                </tr>
                <tr>
                    <td colspan="2"><a href="Change-Email-Address.aspx" class="btn btn-primary">Change Email Address</a></td>
                </tr>

                
            </tbody>
        </table>


</asp:Content>
