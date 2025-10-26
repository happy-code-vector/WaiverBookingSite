<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MarkLeadAsSpam.ascx.cs" Inherits="WaiverFile.CRM.Controls.MarkLeadAsSpam" %>



<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Mark Lead As SPAM
</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
 <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>
       
        <p>PERMANENTLY DELETE:</p>
        <ul>
            <li>Lead record and lead status history</li>
            </ul>

        <p>MARK AS DELETED STATUS:</p>
        <ul>
            <asp:PlaceHolder runat="server" ID="phDeleteItems"></asp:PlaceHolder>
        </ul>
        
        <p>Are you sure you wish to delete this lead? </p>

        

    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button runat="server" ID="btnDeleteLead" CssClass="btn btn-primary" Text="DELETE LEAD" OnClick="btnLead_Click" />
    </div>
</div>
