
<%@ Page Title="Admin Roles" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="AdminRoles.aspx.cs" Inherits="WaiverFile.site.admin.settings.AdminRoles" %> 
<%@ Register assembly="Waypoint" namespace="Waypoint.Forms" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<h1>Admin Access Levels</h1>
<p>The chart below describes what each level has access to. Back to <a href="Manage-Admin-Access.aspx">Manage Admin Access</a>.</p>
<p>&nbsp;</p>

   

    <table class="table rolegrid" cellspacing="0" cellpadding="0" border="0">
    <thead>
        <tr>
            <th class="info">Task</th>
            <th class="info">View Basic</th>
            <th class="info">View Full *</th>
            <th class="info">Moderator</th>
            <th class="info">Administrator</th>
            <th class="info">Owner</th>
        </tr>
    </thead>
    <tbody>
         <tr>
            <td>View Basic Waiver Data <cc1:WPHelpIcon ID="WPHelpIcon1" runat="server" HelpText="When your account is in high security mode, custom question data is not included. ">
        </cc1:WPHelpIcon></td>
           <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
        </tr>
        <tr>
            <td>View Complete Waiver Data <cc1:WPHelpIcon ID="WPHelpIcon2" runat="server" HelpText="When your account is in high security mode, this includes custom question data.">
        </cc1:WPHelpIcon></td>
            <td><em class="fa fa-times text-danger"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
        </tr>
        <tr>
            <td>Check-in on dashboard</td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
        </tr>
        <tr>
            <td>Dashboard</td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
        </tr>
        <tr>
            <td>Dashboard settings</td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
        </tr>
       <tr>
            <td>View Event Registrants</td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
        </tr>
        <tr>
            <td>Reports</td>
            <td><em class="fa fa-times text-danger"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
        </tr>
         <tr>
            <td>Edit Waivers/Notes</td>
            <td><em class="fa fa-times text-danger"></em> </td>
                  <td><em class="fa fa-times text-danger"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
        </tr>
        <tr>
            <td>Archive</td>
            <td><em class="fa fa-times text-danger"></em> </td>
                  <td><em class="fa fa-times text-danger"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
        </tr>
        <tr>
            <td>Create/Edit Events</td>
            <td><em class="fa fa-times text-danger"></em> </td>
                 <td><em class="fa fa-times text-danger"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
        </tr>
        <tr>
            <td>Share Buttons</td>
            <td><em class="fa fa-times text-danger"></em> </td>
                 <td><em class="fa fa-times text-danger"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
        </tr>
        <tr>
            <td>Edit Waiver Forms</td>
            <td><em class="fa fa-times text-danger"></em> </td>
                 <td><em class="fa fa-times text-danger"></em> </td>
            <td><em class="fa fa-times text-danger"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
        </tr>
        <tr>
            <td>
            General Settings
            </td>
            <td><em class="fa fa-times text-danger"></em> </td>
                 <td><em class="fa fa-times text-danger"></em> </td>
            <td><em class="fa fa-times text-danger"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
        </tr>
        <tr>
            <td>Manage Admins</td>
            <td><em class="fa fa-times text-danger"></em> </td>
                 <td><em class="fa fa-times text-danger"></em> </td>
            <td><em class="fa fa-times text-danger"></em> </td>
            <td><em class="fa fa-times text-danger"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
        </tr>
        <tr>
            <td>Subscription, payment methods</td>
            <td><em class="fa fa-times text-danger"></em> </td>
                 <td><em class="fa fa-times text-danger"></em> </td>
            <td><em class="fa fa-times text-danger"></em> </td>
            <td><em class="fa fa-times text-danger"></em> </td>
            <td><em class="fa fa-check text-success"></em> </td>
        </tr>
    </tbody>
</table>

<p class="help-block">    * When your account is in high security mode, custom questions have additional encryption applied and are stored separately. Only users with <strong>View Full</strong> access or greater can view this data. Use <strong>View Basic</strong> to enable users to work with data without seeing sensitive fields.
    </p>
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 