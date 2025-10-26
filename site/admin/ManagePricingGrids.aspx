<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ManagePricingGrids.aspx.cs" Inherits="WaiverFile.site.admin.ManagePricingGrids" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
	<input type="hidden" id="panelStates" name="panelStates" value="" />
    <script type="text/javascript">


        function toggleChevron(e) {
            $(e.target)
                .prev('.panel-heading')
                .find("i.indicator")
                .toggleClass('fa-caret-down fa-caret-right');
        }
        $('#accordion').on('hidden.bs.collapse', toggleChevron);
        $('#accordion').on('shown.bs.collapse', toggleChevron);

		$(function () {
            $('#btnNewGrid').click(function () {
                $('#newgrid').modal('show');
            });
		});
		
    </script>

    <style type="text/css">
        	.behclick-panel  .list-group {
    		margin-bottom: 0px;
		}
		.behclick-panel .list-group-item:first-child {
			border-top-left-radius:0px;
			border-top-right-radius:0px;
		}
		.behclick-panel .list-group-item {
			border-right:0px;
			border-left:0px;
		}
		.behclick-panel .list-group-item:last-child{
			border-bottom-right-radius:0px;
			border-bottom-left-radius:0px;
		}
		.behclick-panel .list-group-item {
			padding: 5px;
		}
		.behclick-panel .panel-heading {
			/* 				padding: 10px 15px;
                            border-bottom: 1px solid transparent; */
			border-top-right-radius: 0px;
			border-top-left-radius: 0px;
			background-color: #ececec;
			margin-top: 10px;
			border-radius: 5px 5px 0 0;
		}
		.behclick-panel .panel-heading:last-child{
			/* border-bottom: 0px; */
		}
		.behclick-panel {
			border-radius: 0px;
			border-right: 0px;
			border-left: 0px;
			border-bottom: 0px;
			box-shadow: 0 0px 0px rgba(0, 0, 0, 0);
		}
		.behclick-panel .radio, .checkbox {
			margin: 0px;
			padding-left: 10px;
		}
		.behclick-panel .panel-title > a, .panel-title > small, .panel-title > .small, .panel-title > small > a, .panel-title > .small > a {
			outline: none;
		}
		.behclick-panel .panel-body > .panel-heading{
			padding:10px 10px;
		}
		.behclick-panel .panel-body {
			padding: 0px;
		}
		 /* unvisited link */
		.behclick-panel a:link {
		    text-decoration:none;
		}
		.behclick-panel .panel-collapse{ padding: 10px; border: 1px solid #ececec; }
		/* visited link */
		.behclick-panel a:visited {
		    text-decoration:none;
		}

		/* mouse over link */
		.behclick-panel a:hover {
		    text-decoration:none;
		}

		/* selected link */
		.behclick-panel a:active {
		    text-decoration:none;
		}
    </style>

    <h2>Pricing Grid Editor
		<div class="pull-right">
		<a href="javascript:void(0);" class="btn btn-primary" id="btnNewGrid"><i class="fa fa-plus-circle"></i> New Grid</a>
			</div>

    </h2>

    <div id="accordion" class="panel panel-primary behclick-panel">
   
    <div class="panel-body">
    <asp:PlaceHolder runat="server" ID="phGrid"></asp:PlaceHolder>

        </div>
        </div>

	<div class="modal fade" id="newgrid" tabindex="-1" role="dialog" aria-labelledby="notifLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="notifLabel">New Pricing Grid</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
			<label>Name</label>
			<asp:TextBox runat="server" ID="txtNewGridName" CssClass="form-control"></asp:TextBox>
        </div>
		  
      </div>
      <div class="modal-footer">
           <asp:Button runat="server" ID="btnPricingGridAdd" CssClass="btn btn-primary" Text="Save" OnClick="btnPricingGridAdd_Click" />

      </div>
    </div>
  </div>
</div>

</asp:Content>
