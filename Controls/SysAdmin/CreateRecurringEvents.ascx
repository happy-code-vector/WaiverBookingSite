<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreateRecurringEvents.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.CreateRecurringEvents" %>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Create Recurring Event</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        <div class="form-group">
            <label>Waiver Site</label>
            <asp:DropDownList runat="server" ID="cboSite" CssClass="form-control"></asp:DropDownList>
        </div>

        start date and time
        end date or number of months?

        create every _N_ days, or months

        event name


        leaving off here, probably best to just build this the right way
        add a recurring event table, optionally tie waiverevent records to that. 
        then you can update them all or just the current event. 
        create them in advance on an automator, or as needed. 


        <div class="form-group">
            <label>File input</label>
            <asp:TextBox ID="txtSOMETHING2" runat="server" CssClass="form-control" placeholder="PLACEHOLDER_HERE"></asp:TextBox>
        </div>
    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Create Events" />
    </div>
</div>
