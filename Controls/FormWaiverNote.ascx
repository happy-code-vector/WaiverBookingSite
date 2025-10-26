<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWaiverNote.ascx.cs" Inherits="WaiverFile.Controls.FormWaiverNote" %>

            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

           
                <h3>Note</h3>
                

                <asp:PlaceHolder ID="phWaiverInfo"     runat="server"></asp:PlaceHolder>
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>


<div class="form-group">
    <asp:TextBox ID="txtNote" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
    </div>           
               
               <p><asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" /></p>

            






            