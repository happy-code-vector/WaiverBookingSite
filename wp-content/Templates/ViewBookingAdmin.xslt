<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:math="http://exslt.org/math"
                xmlns:telerik="remove"
                xmlns:asp="remove"
                xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgram-v1"
                xmlns:msdata="urn:schemas-microsoft-com:xml-msdata"
                xmlns:dt="http://exslt.org/dates-and-times"
                version="1.0"
                exclude-result-prefixes="math diffgr msdata dt">

	<xsl:output method="html" omit-xml-declaration="yes" indent="yes" />


	<xsl:param name="Source"></xsl:param>
	<!-- EXSLT format strings (strftime-style if using libexslt) -->
	<xsl:param name="fmtDate" select="'%b %e, %Y'"/>
	<xsl:param name="fmtDateTime" select="'%b %e, %Y %l:%M %p'"/>

	

	<!--============== KEYS / LOOKUPS ==============-->
	<xsl:key name="ptById" match="/Booking/PersonTypes/PricingGridPersonType" use="ID"/>

	<!--============== HELPERS ==============-->
	<xsl:template name="waiver-required">
		<xsl:choose>
			<xsl:when test="/Booking/AdmissionItems/BookingAdmissionItem/Item/Settings/WaiverFormID
                      [normalize-space(.)!='' and .!='00000000-0000-0000-0000-000000000000']">true</xsl:when>
			<xsl:when test="/Booking/AdmissionItems/BookingAdmissionItem/Item/Settings/WorkflowID
                      [normalize-space(.)!='' and .!='00000000-0000-0000-0000-000000000000']">true</xsl:when>
			<xsl:when test="count(/Booking/AdmissionItems/BookingAdmissionItem/Item/Settings/WaiverForms/WaiverFormRequirement[Required='true'])>0">true</xsl:when>
			<xsl:otherwise>false</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Map status to a Bootstrap 3 label class -->
	<xsl:template name="status-label-class">
		<xsl:param name="status"/>
		<xsl:variable name="s" select="translate(normalize-space($status),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
		<xsl:choose>
			<xsl:when test="$s='ACTIVE'">label label-success</xsl:when>
			<xsl:when test="$s='PENDING' or $s='HOLD'">label label-warning</xsl:when>
			<xsl:when test="$s='CANCELLED' or $s='CANCELED' or $s='VOID'">label label-danger</xsl:when>
			<xsl:otherwise>label label-default</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Consolidated date (EXSLT only) -->
	<xsl:template name="render-booking-dates">
		<xsl:variable name="items" select="/Booking/AdmissionItems/BookingAdmissionItem"/>
		<xsl:if test="count($items) &gt; 0">
			<xsl:variable name="first" select="$items[1]"/>
			<xsl:variable name="s" select="$first/DateStart"/>
			<xsl:variable name="e" select="$first/DateEnd"/>
			<xsl:variable name="allSame" select="not($items[DateStart != $s or DateEnd != $e])"/>
			<xsl:if test="$allSame">
				<xsl:variable name="includeTime" select="not($first/IsAllDay='true')"/>
				<xsl:variable name="sameInstant" select="normalize-space($s)=normalize-space($e)"/>
				<xsl:variable name="sameDay" select="substring($s,1,10)=substring($e,1,10)"/>
				<xsl:variable name="patternToUse">
					<xsl:choose>
						<xsl:when test="$includeTime">
							<xsl:value-of select="$fmtDateTime"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$fmtDate"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="$sameInstant or (not($includeTime) and $sameDay)">
						<xsl:value-of select="dt:format-date($s, $patternToUse)"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="dt:format-date($s, $patternToUse)"/>
						<xsl:text> – </xsl:text>
						<xsl:value-of select="dt:format-date($e, $patternToUse)"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="$first/IsAllDay='true'">
					<span class="label label-default" style="margin-left:6px;">All day</span>
				</xsl:if>
			</xsl:if>
		</xsl:if>
	</xsl:template>

	<!--============== ROOT ==============-->
	<xsl:template match="/">

			

			<div class="row">
				<!-- LEFT -->
				<div class="col-lg-8">

					<!-- Summary -->
				<!--	<div class="panel panel-default">
						<div class="panel-body">
							<div class="clearfix" style="margin-bottom:8px;">
								<xsl:variable name="status" select="/Booking/Status"/>
								<span>
									<xsl:attribute name="class">
										<xsl:text></xsl:text>
										<xsl:call-template name="status-label-class">
											<xsl:with-param name="status" select="$status"/>
										</xsl:call-template>
									</xsl:attribute>
									<xsl:value-of select="$status"/>
								</span>
								<span class="text-muted" style="margin-left:10px;">
									<i class="fa fa-users"></i>
									<xsl:text> </xsl:text>
									<xsl:value-of select="count(/Booking/Persons/BookingPerson)"/> participant(s)
								</span>
							</div>

							<xsl:variable name="items" select="/Booking/AdmissionItems/BookingAdmissionItem"/>
							<xsl:variable name="first" select="$items[1]"/>
							<xsl:variable name="allSame" select="count($items) &gt; 0 and not($items[DateStart != $first/DateStart or DateEnd != $first/DateEnd])"/>
							<xsl:if test="$allSame">
								<div>
									<i class="fa fa-calendar"></i>
									<xsl:text> </xsl:text>
									<xsl:call-template name="render-booking-dates"/>
								</div>
							</xsl:if>
						</div>
					</div>-->

					<!-- Iterate admission items -->
					<xsl:for-each select="/Booking/AdmissionItems/BookingAdmissionItem">
						<xsl:variable name="admissionItemID" select="ID"/>

						
						<h3 style="margin-top:0;">
							<xsl:value-of select="Item/Name"/>
						</h3>
						<div class="">
							<i class="fa fa-calendar">
								<xsl:text> </xsl:text>
							</i>
							<xsl:text> </xsl:text>
							<xsl:variable name="includeTime" select="not(IsAllDay='true')"/>
							<xsl:variable name="patternToUse">
								<xsl:choose>
									<xsl:when test="$includeTime">
										<xsl:value-of select="$fmtDateTime"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$fmtDate"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="sameInstant" select="normalize-space(DateStart)=normalize-space(DateEnd)"/>
							<xsl:variable name="sameDay" select="substring(DateStart,1,10)=substring(DateEnd,1,10)"/>
							<xsl:choose>
								<xsl:when test="$sameInstant or (not($includeTime) and $sameDay)">
									<xsl:value-of select="dt:format-date(DateStart, $patternToUse)"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="dt:format-date(DateStart, $patternToUse)"/>
									<xsl:text> – </xsl:text>
									<xsl:value-of select="dt:format-date(DateEnd, $patternToUse)"/>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:if test="IsAllDay='true'">
								<span class="label label-default" style="margin-left:6px;">All day</span>
							</xsl:if>
							<xsl:text> </xsl:text>
							<a href="ChangeBookingTime.aspx?baiid={ID}&amp;bid={/Booking/ID}" class="btn btn-xs btn-default">Change</a>
							
						</div>

						<!-- Participants panel -->
						<div class="panel panel-default" style="margin-top:10px;">
							<div class="panel-heading">
								<h5 class="panel-title" style="font-size:14px;">
									Participants
									
								</h5>
							</div>
							<div class="panel-body nopadding">
								<xsl:variable name="waiverNeeded">
									<xsl:call-template name="waiver-required"/>
								</xsl:variable>

								<!-- Desktop table (md+): visible on md/lg -->
								<div class="hidden-xs hidden-sm">
									<div class="">
										<table class="table" style="margin-bottom:0;">
											<thead>
												<tr>
													<th>Name</th>
													<th class="hidden-lg hidden-md" style="display:none;">Invite</th>
													
													<th class="hidden-sm hidden-xs">Invite Sent To</th>
													<th>Type</th>
													<th>Waiver</th>
													<th class="text-right">Action</th>
												</tr>
											</thead>
											<tbody>
												<xsl:for-each select="/Booking/Persons/BookingPerson[/Booking/PersonAdmissionItemLinks/BookingPersonAdmissionItem[BookingAdmissionItemID=$admissionItemID]/BookingPersonID=ID]">
													<xsl:variable name="personID" select="ID"/>
													<xsl:variable name="isAdult" select="key('ptById', PersonTypeID)/IsChild='false'"/>
													<xsl:variable name="isFirstAdult" select="$isAdult and count(preceding-sibling::BookingPerson[key('ptById', PersonTypeID)/IsChild='false'])=0"/>
													<xsl:variable name="ws" select="WaiverStatus"/>
													<xsl:variable name="isChild" select="not($isAdult)"/>
													<xsl:variable name="adultInvitePhase" select="$isAdult and ($ws='Invite_Sent' or $ws='Partially_Completed')"/>

													<xsl:variable name="canSignNow"
													  select="$waiverNeeded='true' and ( $isChild or ($isAdult and $isFirstAdult) ) and not($adultInvitePhase) and not($ws='Fully_Completed') and not($ws='No_Waiver_Required')"/>
													<xsl:variable name="canSendInvite"
													  select="$waiverNeeded='true' and not($isFirstAdult) and not($adultInvitePhase) and not($ws='Fully_Completed') and not($ws='No_Waiver_Required') and ($ws='Required_Not_Started' or $ws='Unknown')"/>
													<xsl:variable name="canResend" select="$ws='Invite_Sent' or $ws='Partially_Completed'"/>
													<xsl:variable name="canCancel" select="$ws='Invite_Sent' or $ws='Partially_Completed'"/>
													<xsl:variable name="canClear" select="$ws='Fully_Completed'"/>

													<tr>
														<td>
															<xsl:choose>
																<xsl:when test="normalize-space(FirstName) or normalize-space(LastName)">
																	<strong>
																		<xsl:value-of select="normalize-space(concat(FirstName,' ',LastName))"/>
																	</strong>
																</xsl:when>
																<xsl:otherwise>
																	<span class="text-muted">Unnamed participant</span>
																</xsl:otherwise>
															</xsl:choose>
														</td>
														<td class="hidden-xs hidden-sm">
															<xsl:variable name="invite" select="/Booking/Invites/BookingWaiverInvite[PersonIDsToAttach/guid=$personID]"/>
															<xsl:value-of select="$invite/FirstName"/>
															<xsl:text> </xsl:text>
															<xsl:value-of select="$invite/LastName"/>
															<xsl:if test="$invite/FirstName!='' or $invite/LastName!=''">
																<xsl:text> (</xsl:text>
															</xsl:if>
															<a href="mailto:{$invite/Email}">
																<xsl:value-of select="$invite/Email"/>
															</a>
															<xsl:if test="$invite/FirstName!='' or $invite/LastName!=''">
																<xsl:text>)</xsl:text>
															</xsl:if>
														</td>
														<td>
															<xsl:value-of select="key('ptById', PersonTypeID)/Name"/>
														</td>
														<td>
															<xsl:choose>
																<xsl:when test="$waiverNeeded='true'">
																	<xsl:choose>
																		<xsl:when test="$ws='Unknown'">
																			<span class="label label-warning">Unknown</span>
																		</xsl:when>
																		<xsl:when test="$ws='No_Waiver_Required'">
																			<span class="label label-default">No waiver required</span>
																		</xsl:when>
																		<xsl:when test="$ws='Required_Not_Started'">
																			<span class="label label-warning">Required - Not Received</span>
																		</xsl:when>
																		<xsl:when test="$ws='Invite_Sent'">
																			<span class="label label-default">Invite Sent</span>
																		</xsl:when>
																		<xsl:when test="$ws='Partially_Completed'">
																			<span class="label label-default">Partially Completed</span>
																		</xsl:when>
																		<xsl:when test="$ws='Fully_Completed'">
																			<span class="label label-success">Completed</span>
																		</xsl:when>
																	</xsl:choose>
																</xsl:when>
																<xsl:otherwise>
																	<span class="label label-default">Not required</span>
																</xsl:otherwise>
															</xsl:choose>
														</td>
														<td class="text-right" style="    padding: 2px 2px 0 0;">

															<div class="btn-group">
																<button class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false" title="More actions">
																	<i class="fa fa-ellipsis-h"></i>
																</button>
																<ul class="dropdown-menu dropdown-menu-right">
																	<xsl:if test="$canSignNow">
																		<li>
																			<a class="dropdown-item" href="PrepareWaiver.aspx?mode=self&amp;pid={ID}&amp;aiid={$admissionItemID}&amp;Src={$Source}">Sign Waiver</a>
																		</li>
																	</xsl:if>
																	<xsl:if test="$canSendInvite">
																		<li>
																			<a class="dropdown-item" href="PrepareWaiver.aspx?pid={ID}&amp;aiid={$admissionItemID}&amp;Src={$Source}">Send Invite</a>
																		</li>
																	</xsl:if>
																	<xsl:if test="$canResend">
																		<li>
																			<asp:LinkButton runat="server" CommandName="RESEND_INVITE" CommandArgument="{ID}" CssClass="dropdown-item">Resend invite</asp:LinkButton>
																		</li>
																	</xsl:if>
																	<xsl:if test="$canCancel">
																		<li>
																			<asp:LinkButton runat="server" CommandName="CANCEL_INVITE" CommandArgument="{ID}" CssClass="dropdown-item">Cancel invite</asp:LinkButton>
																		</li>
																	</xsl:if>
																	
																	<!-- add this later - have to allow it to select multiple people and attach them. 
																	<li>
																		<a href="javascript:void(0);" class="dropdown-item btnFindWaiver" data-personid="{$personID}">Find and Attach Waiver</a>
																	</li>-->
																	
																	<xsl:if test="$canClear">
																		<!--<li class="divider"></li>-->
																		<li>
																			<asp:LinkButton runat="server" CommandName="CLEAR_WAIVER" CommandArgument="{ID}" CssClass="dropdown-item text-danger" OnClientClick="return confirm('This will revoke the signed waiver(s) for this person and require re-signing a new waiver. Continue? ');">Revoke Waiver</asp:LinkButton>
																		</li>
																	</xsl:if>
																	<li>
																		<asp:LinkButton runat="server" CommandName="REMOVE_PERSON" CommandArgument="{ID}" CssClass="dropdown-item text-danger">Remove Person from Booking</asp:LinkButton>
																	</li>
																</ul>
															</div>
															
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
									</div>
								</div>

								<!-- Mobile cards (xs/sm) -->
								<div class="visible-xs visible-sm">
									<div class="list-group">
										<xsl:for-each select="/Booking/Persons/BookingPerson[/Booking/PersonAdmissionItemLinks/BookingPersonAdmissionItem[BookingAdmissionItemID=$admissionItemID]/BookingPersonID=ID]">
											<xsl:variable name="personID" select="ID"/>
											<xsl:variable name="isAdult" select="key('ptById', PersonTypeID)/IsChild='false'"/>
											<xsl:variable name="isFirstAdult" select="$isAdult and count(preceding-sibling::BookingPerson[key('ptById', PersonTypeID)/IsChild='false'])=0"/>
											<xsl:variable name="ws" select="WaiverStatus"/>
											<xsl:variable name="isChild" select="not($isAdult)"/>
											<xsl:variable name="adultInvitePhase" select="$isAdult and ($ws='Invite_Sent' or $ws='Partially_Completed')"/>

											<xsl:variable name="canSignNow" select="$waiverNeeded='true' and ( $isChild or ($isAdult and $isFirstAdult) ) and not($adultInvitePhase) and not($ws='Fully_Completed') and not($ws='No_Waiver_Required')"/>
											<xsl:variable name="canSendInvite" select="$waiverNeeded='true' and not($isFirstAdult) and not($adultInvitePhase) and not($ws='Fully_Completed') and not($ws='No_Waiver_Required') and ($ws='Required_Not_Started' or $ws='Unknown')"/>
											<xsl:variable name="canResend" select="$ws='Invite_Sent' or $ws='Partially_Completed'"/>
											<xsl:variable name="canCancel" select="$ws='Invite_Sent' or $ws='Partially_Completed'"/>
											<xsl:variable name="canClear" select="$ws='Fully_Completed'"/>
											<xsl:variable name="actionCount" select="($canSignNow * 1) + ($canSendInvite * 1) + ($canResend * 1) + ($canCancel * 1) + ($canClear * 1)"/>

											<div class="list-group-item">
												<div class="clearfix">
													<div class="pull-left" style="padding-right:10px;max-width:70%;">
														<div>
															<strong>
																<xsl:choose>
																	<xsl:when test="normalize-space(FirstName) or normalize-space(LastName)">
																		<xsl:value-of select="normalize-space(concat(FirstName,' ',LastName))"/>
																	</xsl:when>
																	<xsl:otherwise>Unnamed participant</xsl:otherwise>
																</xsl:choose>
															</strong>
														</div>
														<div class="text-muted small">
															<xsl:variable name="invite" select="/Booking/Invites/BookingWaiverInvite[PersonIDsToAttach/guid=$personID]"/>
															<xsl:value-of select="$invite/FirstName"/>
															<xsl:text> </xsl:text>
															<xsl:value-of select="$invite/LastName"/>
															<xsl:if test="$invite/FirstName!='' or $invite/LastName!=''">
																<xsl:text> (</xsl:text>
															</xsl:if>
															<a href="mailto:{$invite/Email}">
																<xsl:value-of select="$invite/Email"/>
															</a>
															<xsl:if test="$invite/FirstName!='' or $invite/LastName!=''">)</xsl:if>
														</div>
														<div class="small" style="margin-top:4px;">
															<strong>
																<xsl:value-of select="key('ptById', PersonTypeID)/Name"/>
															</strong>
															<xsl:text> </xsl:text>
															<xsl:choose>
																<xsl:when test="$waiverNeeded='true'">
																	<xsl:choose>
																		<xsl:when test="$ws='No_Waiver_Required'">
																			<span class="label label-default">No waiver required</span>
																		</xsl:when>
																		<xsl:when test="$ws='Required_Not_Started'">
																			<span class="label label-warning">Required</span>
																		</xsl:when>
																		<xsl:when test="$ws='Invite_Sent'">
																			<span class="label label-default">Invite Sent</span>
																		</xsl:when>
																		<xsl:when test="$ws='Partially_Completed'">
																			<span class="label label-default">Partially Completed</span>
																		</xsl:when>
																		<xsl:when test="$ws='Fully_Completed'">
																			<span class="label label-success">Completed</span>
																		</xsl:when>
																		<xsl:otherwise>
																			<span class="label label-warning">Unknown</span>
																		</xsl:otherwise>
																	</xsl:choose>
																</xsl:when>
																<xsl:otherwise>
																	<span class="label label-default">Not required</span>
																</xsl:otherwise>
															</xsl:choose>
														</div>
													</div>

													<div class="text-right" style="min-width: 9rem;">
														<xsl:choose>
															<xsl:when test="$actionCount = 0">
																<span class="text-muted small">—</span>
															</xsl:when>
															<xsl:when test="$actionCount = 1">
																<xsl:choose>
																	<xsl:when test="$canSignNow">
																		<a class="btn btn-primary btn-xs" style="margin-bottom:5px;margin-right:5px;" href="PrepareWaiver.aspx?mode=self&amp;pid={ID}&amp;aiid={$admissionItemID}&amp;Src={$Source}">Sign Now</a>
																		<a class="btn btn-default btn-xs" style="margin-bottom:5px;margin-right:5px;" href="PrepareWaiver.aspx?pid={ID}&amp;aiid={$admissionItemID}&amp;Src={$Source}">Send Invite</a>
																	</xsl:when>
																	<xsl:when test="$canSendInvite">
																		<a class="btn btn-primary btn-xs" style="margin-bottom:5px;margin-right:5px;" href="PrepareWaiver.aspx?pid={ID}&amp;aiid={$admissionItemID}&amp;Src={$Source}">Send Invite</a>
																		<a class="btn btn-default btn-xs" style="margin-bottom:5px;margin-right:5px;" href="PrepareWaiver.aspx?mode=self&amp;pid={ID}&amp;aiid={$admissionItemID}&amp;Src={$Source}">Sign Now</a>
																	</xsl:when>
																	<xsl:when test="$canResend">
																		<asp:LinkButton runat="server" CommandName="RESEND_INVITE" CommandArgument="{ID}" CssClass="btn btn-default btn-xs">Resend invite</asp:LinkButton>
																	</xsl:when>
																	<xsl:when test="$canCancel">
																		<asp:LinkButton runat="server" CommandName="CANCEL_INVITE" CommandArgument="{ID}" CssClass="btn btn-default btn-xs">Cancel invite</asp:LinkButton>
																	</xsl:when>
																	<xsl:when test="$canClear">
																		<asp:LinkButton runat="server" CommandName="CLEAR_WAIVER" CommandArgument="{ID}" CssClass="btn btn-danger btn-xs" OnClientClick="return confirm('This will revoke the signed waiver(s) for this person and require re-signing a new waiver. Continue? ');">Re-sign</asp:LinkButton>
																	</xsl:when>
																</xsl:choose>
															</xsl:when>
															<xsl:otherwise>
																<div class="btn-group">
																	<button class="btn btn-default btn-xs dropdown-toggle btn-block" data-toggle="dropdown">
																		Actions <span class="caret"></span>
																	</button>
																	<ul class="dropdown-menu dropdown-menu-right">
																		<xsl:if test="$canSignNow">
																			<li>
																				<a class="dropdown-item" href="PrepareWaiver.aspx?mode=self&amp;pid={ID}&amp;aiid={$admissionItemID}">Sign Now</a>
																			</li>
																		</xsl:if>
																		<xsl:if test="$canSendInvite">
																			<li>
																				<a class="dropdown-item" href="PrepareWaiver.aspx?pid={ID}&amp;aiid={$admissionItemID}">Send Invite</a>
																			</li>
																		</xsl:if>
																		<xsl:if test="$canResend">
																			<li>
																				<asp:LinkButton runat="server" CommandName="RESEND_INVITE" CommandArgument="{ID}" CssClass="dropdown-item">Resend invite</asp:LinkButton>
																			</li>
																		</xsl:if>
																		<xsl:if test="$canCancel">
																			<li>
																				<asp:LinkButton runat="server" CommandName="CANCEL_INVITE" CommandArgument="{ID}" CssClass="dropdown-item">Cancel invite</asp:LinkButton>
																			</li>
																		</xsl:if>
																		<xsl:if test="$canClear">
																			<!--<li class="divider"></li>-->
																			<li>
																				<asp:LinkButton runat="server" CommandName="CLEAR_WAIVER" CommandArgument="{ID}" CssClass="dropdown-item text-danger" OnClientClick="return confirm('This will revoke the signed waiver(s) for this person and require re-signing a new waiver. Continue? ');">Re-sign</asp:LinkButton>
																			</li>
																		</xsl:if>
																	</ul>
																</div>
															</xsl:otherwise>
														</xsl:choose>
													</div>
												</div>
											</div>
										</xsl:for-each>
									</div>
								</div>

							</div>
						</div>

						<!-- Activity card -->
						<!--
						<div class="panel panel-default">
							<div class="panel-heading">
								<h5 class="panel-title" style="font-size:14px;">Activities</h5>
							</div>
							<div class="panel-body">
								<xsl:for-each select="/Booking/AdmissionItems/BookingAdmissionItem">
									<div class="well well-sm" style="margin-bottom:10px;">
										<div class="clearfix">
											<div class="pull-left">
												<div>
													<strong>
														<xsl:value-of select="Item/Name"/>
													</strong>
												</div>
												<div class="text-muted">
													<i class="fa fa-calendar"></i>
													<xsl:text> </xsl:text>
													<xsl:variable name="includeTime" select="not(IsAllDay='true')"/>
													<xsl:variable name="patternToUse">
														<xsl:choose>
															<xsl:when test="$includeTime">
																<xsl:value-of select="$fmtDateTime"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:value-of select="$fmtDate"/>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:variable>
													<xsl:variable name="sameInstant" select="normalize-space(DateStart)=normalize-space(DateEnd)"/>
													<xsl:variable name="sameDay" select="substring(DateStart,1,10)=substring(DateEnd,1,10)"/>
													<xsl:choose>
														<xsl:when test="$sameInstant or (not($includeTime) and $sameDay)">
															<xsl:value-of select="dt:format-date(DateStart, $patternToUse)"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="dt:format-date(DateStart, $patternToUse)"/>
															<xsl:text> – </xsl:text>
															<xsl:value-of select="dt:format-date(DateEnd, $patternToUse)"/>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:if test="IsAllDay='true'">
														<span class="label label-default" style="margin-left:6px;">All day</span>
													</xsl:if>
												</div>
											</div>
											<div class="pull-right text-muted">
												Status: <span class="text-primary">
													<xsl:value-of select="Status"/>
												</span>
											</div>
										</div>
										<xsl:if test="normalize-space(Item/Description)">
											<div class="small" style="margin-top:6px;">
												<xsl:value-of select="Item/Description"/>
											</div>
										</xsl:if>
									</div>
								</xsl:for-each>
							</div>
						</div>
-->
					</xsl:for-each>


					<!-- Payment -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h5 class="panel-title" style="font-size:14px;">Payments</h5>
						</div>
						<div class="panel-body">
							<xsl:variable name="ordersXml" select="/Booking/Orders/Order"/>
							<xsl:choose>
								<xsl:when test="$ordersXml">
									<div class="list-group">
										<xsl:for-each select="$ordersXml">
											<xsl:variable name="total" select="sum(Items/OrderItem/LineTotal)"/>
											<xsl:variable name="statusNode" select="(Statuses/OrderStatus[IsCurrentStatus='true'][1] | Statuses/OrderStatus[last()])[1]"/>
											<xsl:variable name="statusText" select="$statusNode/Status"/>
											<xsl:variable name="statusClass">
												<xsl:choose>
													<xsl:when test="translate($statusText,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='paid' or contains(translate($statusText,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'complete') or contains(translate($statusText,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'authoriz')">label label-success</xsl:when>
													<xsl:when test="contains(translate($statusText,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'pending') or contains(translate($statusText,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'unpaid') or contains(translate($statusText,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'open')">label label-warning</xsl:when>
													<xsl:when test="contains(translate($statusText,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'refund') or contains(translate($statusText,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'void') or contains(translate($statusText,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'cancel')">label label-default</xsl:when>
													<xsl:otherwise>label label-default</xsl:otherwise>
												</xsl:choose>
											</xsl:variable>
											<a class="list-group-item" href="ViewOrder.aspx?id={ID}">
												<div class="pull-left" style="margin-right:10px;">
													<div>
														<strong>
															Payment #<xsl:value-of select="OrderNumber"/>
														</strong>
													</div>
													<div class="text-muted small">
														<xsl:value-of select="dt:format-date((DateCreated | Date | CreatedOn)[1], $fmtDate)"/>
														<xsl:text> • </xsl:text>
														<span>
															<xsl:attribute name="class">
																<xsl:value-of select="$statusClass"/>
															</xsl:attribute>
															<xsl:value-of select="$statusText"/>
														</span>
													</div>
												</div>
												<div class="pull-right text-nowrap">
													<xsl:value-of select="format-number($total,'#,##0.00')"/>
												</div>
												<div class="clearfix"></div>
											</a>
										</xsl:for-each>
									</div>
								</xsl:when>
								<xsl:otherwise>
									<div class="text-muted small">No payments yet.</div>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					
					
				</div>

				<!-- RIGHT -->
				<aside class="col-lg-4">
					<!-- Booking details -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h5 class="panel-title" style="font-size:14px;">Booking Details</h5>
						</div>
						<div class="panel-body nopadding" style="">
							<table class="table" style="margin-bottom:0;">

									<tr>
										<td style="border-top:0;">
											<strong>Booking #</strong>
								</td>
										<td style="border-top:0;">
											<xsl:value-of select="/Booking/BookingNumber"/>
										</td>
									</tr>
								
								
								<tr>
									<td>
										<strong>Customer</strong>
									</td>
									<td>
										<a href="ViewCustomer.aspx?id={/Booking/Customer/ID}" title="View Customer">
										<xsl:value-of select="/Booking/Customer/First_Name"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="/Booking/Customer/Middle_Name"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="/Booking/Customer/Last_Name"/>
										</a>
									</td>
								</tr>
								<tr>
									<td>
										<strong>
											Email
										</strong>
									</td>
									<td>
										<a href="mailto:{/Booking/Customer/Email}">
										<xsl:value-of select="/Booking/Customer/Email"/>
										</a>
									</td>
								</tr>
								<tr>
									<td>
										<strong>Created</strong>
									</td>
									<td>
										<xsl:value-of select="dt:format-date(/Booking/DateCreated, $fmtDate)"/>
									</td>
								</tr>
								<!-- Replace your existing row with this -->
								<tr>
									<td>
										<strong>Status</strong>
									</td>
									<td>
										<dd class="col-7">
											<xsl:variable name="status"
											  select="normalize-space(/Booking/StatusHistory/BookingStatus[IsCurrent='true']/Status)"/>
											<xsl:call-template name="render-status-label">
												<xsl:with-param name="status" select="$status"/>
											</xsl:call-template>
										</dd>
									</td>
								</tr>



							</table>
							
						</div>
					</div>

					<div class="panel panel-default">
						<div class="panel-heading">
							<h5 class="panel-title" style="font-size:14px;">Status History</h5>
						</div>
						<div class="panel-body" style="padding-bottom:5px;">
							<table class="table table-condensed">
								<thead>
									<tr>
										<th>Date</th>
										<th>Status</th>
										<th>Notes</th>
										<th>Updated By</th>
										<th>
											<xsl:text> </xsl:text>
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="/Booking/StatusHistory/BookingStatus">
										<tr>
											<td>
												<xsl:value-of select="dt:format-date(SavedOn, $fmtDateTime)"/>
											</td>
											<td>
												
												<xsl:variable name="status"
										  select="normalize-space(Status)"/>
												<xsl:call-template name="render-status-label">
													<xsl:with-param name="status" select="$status"/>
												</xsl:call-template>
												
											</td>
											<td>
												<xsl:value-of select="Notes"/>
											</td>
											<td>
												<xsl:choose>
													<xsl:when test="SavedByEmail!=''">
														<a href="mailto:{SavedByEmail}">
															<xsl:value-of select="SavedByName"/>
														</a>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="SavedByName"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td>
												<xsl:if test="position()!=1">
													<asp:LinkButton runat="server" CommandName="DELETE_STATUS" CssClass="btn btn-sm btn-default" CommandArgument="{ID}">
														<i class="fa fa-trash">
															<xsl:text> </xsl:text>
														</i>
													</asp:LinkButton>
												</xsl:if>
											</td>
										</tr>
									</xsl:for-each>
									
									
									
								</tbody>
							</table>

							<h4>Change Status</h4>
							
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<asp:DropDownList runat="server" CssClass="form-control" id="cboNewStatus"></asp:DropDownList>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<asp:TextBox runat="server"	 CssClass="form-control" id="txtNewStatusNotes" placeholder="Notes"></asp:TextBox>
									</div>
								</div>
							</div>
							<asp:Button runat="server" id="btnSaveNewStatus" CssClass="btn btn-primary" text="Save Status" ></asp:Button>
						</div>
					</div>
			

					<!-- Actions -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h5 class="panel-title" style="font-size:14px;">Actions</h5>
						</div>
						<div class="panel-body">
							<div>
								
								<asp:LinkButton runat="server" id="btnResendConfirmation" CssClass="btn btn-default btn-block" Text="Resend Confirmation"></asp:LinkButton>


								
								
								<a href="CancelBooking.aspx?id={/Booking/ID}" class="btn btn-danger btn-block">Cancel Booking</a>
								
								
							</div>
						</div>
					</div>

				</aside>
			</div>
	</xsl:template>

	<!-- Add this template once in your stylesheet -->
	<xsl:template name="render-status-label">
		<xsl:param name="status"/>
		<!-- make a lowercase copy for comparisons -->
		<xsl:variable name="s"
		  select="translate($status,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>

		<!-- Map status to Bootstrap 3 label class -->
		<xsl:variable name="labelClass">
			<xsl:choose>
				<!-- ✅ Success (green) -->
				<xsl:when test="$s='confirmed' or $s='approved' or $s='completed' or $s='active'">
					<xsl:text>label label-success</xsl:text>
				</xsl:when>

				<!-- 🔵 Primary (blue) – active/in-flight -->
				<xsl:when test="$s='inprogress' or $s='in progress' or $s='booked' or $s='scheduled' or $s='checked in' or $s='checkedin'">
					<xsl:text>label label-primary</xsl:text>
				</xsl:when>

				<!-- 🔶 Warning (amber) – needs attention, incl. waiver pending/incomplete -->
				<xsl:when test="$s='pending' or $s='awaiting payment' or contains($s,'awaiting')
                      or contains($s,'waiver') or contains($s,'incomplete')">
					<xsl:text>label label-warning</xsl:text>
				</xsl:when>

				<!-- 🔴 Danger (red) – hard stop / failures -->
				<xsl:when test="$s='cancelled' or $s='canceled' or $s='rejected' or $s='declined'
                      or $s='no show' or $s='noshow' or contains($s,'overdue')
                      or $s='waiver required – not received' or $s='waiver required - not received'">
					<xsl:text>label label-danger</xsl:text>
				</xsl:when>

				<!-- 🔷 Info (light blue) – neutral changes -->
				<xsl:when test="$s='rescheduled' or $s='amended' or $s='updated'">
					<xsl:text>label label-info</xsl:text>
				</xsl:when>

				<!-- ⚪ Default (gray) – unknown/placeholder/draft -->
				<xsl:otherwise>
					<xsl:text>label label-default</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<!-- Output the label -->
		<span>
			<xsl:attribute name="class">
				<xsl:value-of select="$labelClass"/>
			</xsl:attribute>
			<xsl:value-of select="translate($status,'_',' ')"/>
		</span>
	</xsl:template>

</xsl:stylesheet>
