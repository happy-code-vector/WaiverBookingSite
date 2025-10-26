<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="AddScheduledMessage.aspx.cs" Inherits="WaiverFile.site.admin.SMS.AddScheduledMessage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    
	<h3 class="text-center">Schedule Automatic Text Messages</h3>
	<p class="text-center">In WaiverFile, text messages can be sent automatically. <br />Choose a trigger below to get started.</p>
    <div class="row">
        <div class="col-md-3 col-sm-6">

            <div class="box">							
				<div class="icon">
					<div class="image"><i class="fa fa-pencil"></i></div>
					<div class="info">
						<h3 class="title">After Signing Waiver</h3>
						<p>
							Send a message confirming entry after signing a waiver. Send now, or delay by a period of time.
						</p>
						<div class="more">
							<asp:Button runat="server" ID="btnSelectAfterSigning" CssClass="btn btn-primary" Text="Select" OnClick="btnSelectAfterSigning_Click" />
						</div>
					</div>
				</div>
				<div class="space"></div>
			</div> 

        </div>
        <div class="col-md-3 col-sm-6">

              <div class="box">							
				<div class="icon">
					<div class="image"><i class="fa fa-calendar"></i></div>
					<div class="info">
						<h3 class="title">Before/After Event</h3>
						<p>
							Send event reminders before events or followups after an event.
						</p>
						<div class="more">
							<asp:Button runat="server" ID="btnSelectEvent" CssClass="btn btn-primary" Text="Select" OnClick="btnSelectEvent_Click" />
						</div>
					</div>
				</div>
				<div class="space"></div>
			</div> 

        </div>
		<div class="clear visible-sm" style="clear:both;">
			
		</div>
        <div class="col-md-3 col-sm-6">

			  <div class="box">							
				<div class="icon">
					<div class="image"><i class="fa fa-birthday-cake"></i></div>
					<div class="info">
						<h3 class="title">Birthdays</h3>
						<p>
							Send messages on birthdays or before them to promote party bookings!
						</p>
						<div class="more">
							<asp:Button runat="server" ID="btnSelectBirthdays" CssClass="btn btn-primary" Text="Select" OnClick="btnSelectBirthdays_Click" />
						</div>
					</div>
				</div>
				<div class="space"></div>
			</div> 

        </div>
   

	
        <div class="col-md-3 col-sm-6">

            <div class="box">							
				<div class="icon">
					<div class="image"><i class="fa fa-check-circle"></i></div>
					<div class="info">
						<h3 class="title">Check-Ins</h3>
						<p>
							Send messages upon checkin with an optional delay. 
						</p>
						<div class="more">
							<asp:Button runat="server" ID="btnSelectCheckin" CssClass="btn btn-primary" Text="Select" OnClick="btnSelectCheckin_Click" />
						</div>
					</div>
				</div>
				<div class="space"></div>
			</div> 

        </div>
        
    </div>
	<hr />
	<div class="row">
		<div class="col-xs-12">
			<h3 class="text-center">How it Works</h3>
			<p class="text-center">Watch the how-to video below to learn how to get started with texting!</p>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
	
			

<iframe width="560" height="315" style="margin:20px auto;display:block;" src="https://www.youtube.com/embed/B0UNm3izrPw" title="WaiverFile SMS Intro Video" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

		</div>
	</div>

	

</asp:Content>
