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

  <!-- EXSLT format strings (strftime-style if using libexslt) -->
  <!-- If your engine accepts .NET-like strings here, keep using those. -->
  <xsl:param name="fmtDate" select="'%b %e, %Y'"/>
  <xsl:param name="fmtDateTime" select="'%b %e, %Y %l:%M %p'"/>

  <!--============== KEYS / LOOKUPS ==============-->
  <xsl:key name="ptById" match="/Booking/PersonTypes/PricingGridPersonType" use="ID"/>

  <!--============== SIMPLE HELPERS STILL NEEDED ==============-->
  <!-- Only these two tiny templates remain: waiver flag + status badge class -->
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

  <xsl:template name="status-badge-class">
    <xsl:param name="status"/>
    <xsl:variable name="s" select="translate(normalize-space($status),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
    <xsl:choose>
      <xsl:when test="$s='ACTIVE'">text-bg-success</xsl:when>
      <xsl:when test="$s='PENDING' or $s='HOLD'">text-bg-warning</xsl:when>
      <xsl:when test="$s='CANCELLED' or $s='CANCELED' or $s='VOID'">text-bg-danger</xsl:when>
      <xsl:otherwise>text-bg-secondary</xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!--============== CONSOLIDATED DATE (EXSLT ONLY) ==============-->
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

        <!-- choose pattern once -->
        <xsl:variable name="patternToUse">
          <xsl:choose>
            <xsl:when test="$includeTime"><xsl:value-of select="$fmtDateTime"/></xsl:when>
            <xsl:otherwise><xsl:value-of select="$fmtDate"/></xsl:otherwise>
          </xsl:choose>
        </xsl:variable>

        <xsl:choose>
          <!-- single date if identical or (all-day same calendar day) -->
          <xsl:when test="$sameInstant or (not($includeTime) and $sameDay)">
            <xsl:value-of select="dt:format-date($s, $patternToUse)"/>
          </xsl:when>
          <!-- otherwise range -->
          <xsl:otherwise>
            <xsl:value-of select="dt:format-date($s, $patternToUse)"/>
            <xsl:text> – </xsl:text>
            <xsl:value-of select="dt:format-date($e, $patternToUse)"/>
          </xsl:otherwise>
        </xsl:choose>

        <xsl:if test="$first/IsAllDay='true'">
          <span class="badge text-bg-secondary ms-2">All day</span>
        </xsl:if>
      </xsl:if>
    </xsl:if>
  </xsl:template>

  <!--============== ROOT ==============-->
  <xsl:template match="/">

	  <xsl:choose>
		  <xsl:when test="/Booking/Status='Cancelled'">

			  <div class="bg-body-tertiary rounded-5 p-4">
				  <div class="d-flex align-items-center gap-2 mb-2">
					  <span class="badge text-bg-danger">Cancelled</span>
					  <code>
						  Booking #<xsl:value-of select="/Booking/BookingNumber"/>
					  </code>
				  </div>
				 
				  <p class="mb-0">
					  This booking has been cancelled. If you have questions about refunds or next steps,
					  please <a href="contact">contact support</a>.
				  </p>
			  </div>
			  <br/>
			  <br/>
			  <a href="CustomerBookings.aspx" class="btn btn-outline-primary rounded-pill">
				  <i class="ci-chevron-left me-1"></i>Back to bookings
			  </a>
			  <br/>
			  <br/>
			  <br/>
		  </xsl:when>
		  <xsl:otherwise>
			  <section class="container py-4 py-lg-5">
				  <!-- Header -->
				  <div class="d-flex align-items-center justify-content-between mb-3">
					  <h1 class="h4 mb-0 text-gradient">
						  <xsl:choose>
							  <xsl:when test="normalize-space(/Booking/AdmissionItems/BookingAdmissionItem/Item/Name)">
								  <xsl:value-of select="/Booking/AdmissionItems/BookingAdmissionItem/Item/Name"/>
							  </xsl:when>
							  <xsl:otherwise>Booking</xsl:otherwise>
						  </xsl:choose>
					  </h1>
					  <a href="CustomerBookings.aspx" class="btn btn-outline-primary rounded-pill">
						  <i class="ci-chevron-left me-1"></i>Back to bookings
					  </a>
				  </div>

				  <div class="row g-4">
					  <!-- LEFT -->
					  <div class="col-lg-8 d-flex flex-column gap-3">

						  <!-- Summary -->
						  <div class="bg-body-tertiary rounded-5 p-4">
							  <div class="d-flex flex-wrap align-items-center gap-2 mb-2">
								  <xsl:variable name="status" select="/Booking/Status"/>
								  <span class="badge">
									  <xsl:attribute name="class">
										  <xsl:text>badge </xsl:text>
										  <xsl:call-template name="status-badge-class">
											  <xsl:with-param name="status" select="$status"/>
										  </xsl:call-template>
									  </xsl:attribute>
									  <xsl:value-of select="$status"/>
								  </span>

								  <span class="fs-sm text-body-secondary">
									  <i class="ci-users me-1"></i>
									  <xsl:value-of select="count(/Booking/Persons/BookingPerson)"/> participant(s)
								  </span>
							  </div>

							  <!-- Consolidated date area: render only when all items share dates -->
							  <xsl:variable name="items" select="/Booking/AdmissionItems/BookingAdmissionItem"/>
							  <xsl:variable name="first" select="$items[1]"/>
							  <xsl:variable name="allSame" select="count($items) &gt; 0 and not($items[DateStart != $first/DateStart or DateEnd != $first/DateEnd])"/>
							  <xsl:if test="$allSame">
								  <div class="text-body-emphasis">
									  <i class="ci-calendar me-1"></i>
									  <xsl:call-template name="render-booking-dates"/>
								  </div>
							  </xsl:if>
						  </div>

						  <!-- iterate admission items first -->
						  <xsl:for-each select="/Booking/AdmissionItems/BookingAdmissionItem">
							  <xsl:variable name="admissionItemID">
								  <xsl:value-of select="ID"/>
							  </xsl:variable>
							  <div class="fw-medium">
								  <xsl:value-of select="Item/Name"/>
							  </div>
							  <div class="fs-sm text-body">
								  <i class="ci-calendar me-1"></i>

								  <!-- Per-activity display using dt:format-date only -->
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
									  <span class="badge text-bg-secondary ms-2">All day</span>
								  </xsl:if>
							  </div>


							  <!-- Participants -->
							  <div class="bg-body-tertiary rounded-5 p-4">
								  <div class="d-flex align-items-center justify-content-between mb-2">
									  <h5 class="mb-0 text-gradient">Participants</h5>

								  </div>

								  <xsl:variable name="waiverNeeded">
									  <xsl:call-template name="waiver-required"/>
								  </xsl:variable>

								  <!-- =================== Desktop (md+) TABLE =================== -->
								  <div class="table-responsive d-none d-md-block">
									  <table class="table table-sm align-middle">
										  <thead class="table-light">
											  <tr>
												  <th scope="col">Name</th>
												  <th scope="col" class="d-none d-lg-table-cell">Invite Sent To</th>
												  <th scope="col">Type</th>
												  <th scope="col">Waiver</th>
												  <th scope="col" class="text-end">Action</th>
											  </tr>
										  </thead>
										  <tbody>
											  <xsl:for-each select="/Booking/Persons/BookingPerson[/Booking/PersonAdmissionItemLinks/BookingPersonAdmissionItem[BookingAdmissionItemID=$admissionItemID]/BookingPersonID=ID]">
												  <xsl:variable name="personID" select="ID"></xsl:variable>
												  <xsl:variable name="isAdult" select="key('ptById', PersonTypeID)/IsChild='false'"/>
												  <xsl:variable name="isFirstAdult"
																select="$isAdult and count(preceding-sibling::BookingPerson[key('ptById', PersonTypeID)/IsChild='false'])=0"/>
												  <xsl:variable name="ws" select="WaiverStatus"/>
												  <xsl:variable name="isChild" select="not($isAdult)"/>
												  <xsl:variable name="adultInvitePhase" select="$isAdult and ($ws='Invite_Sent' or $ws='Partially_Completed')"/>

												  <!-- Actions logic (same as you’re using now) -->
												  <xsl:variable name="canSignNow"
													select="$waiverNeeded='true'
                    and ( $isChild or ($isAdult and $isFirstAdult) )
                    and not($adultInvitePhase)
                    and not($ws='Fully_Completed')
                    and not($ws='No_Waiver_Required')"/>
												  <xsl:variable name="canSendInvite"
													select="$waiverNeeded='true'
                    and not($isFirstAdult)
                    and not($adultInvitePhase)
                    and not($ws='Fully_Completed')
                    and not($ws='No_Waiver_Required')
                    and ($ws='Required_Not_Started' or $ws='Unknown')"/>
												  <xsl:variable name="canResend" select="$ws='Invite_Sent' or $ws='Partially_Completed'"/>
												  <xsl:variable name="canCancel" select="$ws='Invite_Sent' or $ws='Partially_Completed'"/>
												  <xsl:variable name="canClear" select="$ws='Fully_Completed'"/>
												  <xsl:variable name="actionCount"
													select="($canSignNow * 1)
                  + ($canSendInvite * 1)
                  + ($canResend * 1)
                  + ($canCancel * 1)
                  + ($canClear * 1)"/>

												  <tr>
													  <td>
														  <xsl:choose>
															  <xsl:when test="normalize-space(FirstName) or normalize-space(LastName)">
																  <span class="fw-medium">
																	  <xsl:value-of select="normalize-space(concat(FirstName,' ',LastName))"/>
																  </span>
															  </xsl:when>
															  <xsl:otherwise>
																  <span class="text-body-secondary">Unnamed participant</span>
															  </xsl:otherwise>
														  </xsl:choose>
													  </td>
													  <td class="d-none d-lg-table-cell">
														  <xsl:variable name="invite" select="/Booking/Invites/BookingWaiverInvite[PersonIDsToAttach/guid=$personID]"></xsl:variable>
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
																		  <span class="badge text-bg-warning-subtle text-warning-emphasis">Unknown</span>
																	  </xsl:when>
																	  <xsl:when test="$ws='No_Waiver_Required'">
																		  <span class="badge text-bg-secondary">No waiver required</span>
																	  </xsl:when>
																	  <xsl:when test="$ws='Required_Not_Started'">
																		  <span class="badge text-bg-warning-subtle text-warning-emphasis">Required - Not Complete</span>
																	  </xsl:when>
																	  <xsl:when test="$ws='Invite_Sent'">
																		  <span class="badge text-bg-secondary">Invite Sent</span>
																	  </xsl:when>
																	  <xsl:when test="$ws='Partially_Completed'">
																		  <span class="badge text-bg-secondary">Partially Completed</span>
																	  </xsl:when>
																	  <xsl:when test="$ws='Fully_Completed'">
																		  <span class="badge text-bg-success">Completed</span>
																	  </xsl:when>
																  </xsl:choose>
															  </xsl:when>
															  <xsl:otherwise>
																  <span class="badge text-bg-secondary">Not required</span>
															  </xsl:otherwise>
														  </xsl:choose>
													  </td>

													  <td class="text-end">
														  <xsl:choose>
															  <xsl:when test="$actionCount = 0">
																  <span class="text-body-secondary fs-sm">—</span>
															  </xsl:when>

															  <xsl:when test="$actionCount = 1">
																  <xsl:choose>
																	  <xsl:when test="$canSignNow">
																		  <a class="btn btn-sm btn-primary rounded-pill"
																			 href="PrepareWaiver.aspx?mode=self&amp;pid={ID}&amp;aiid={$admissionItemID}">Sign Now</a>

																		  <!-- when there is just the sign now button, that is the first adult. we might want to allow them to send this as an invite ratehr than signing themselves, so this is a dropdown after it with an invite button. -->
																		  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																		  <button class="btn btn-sm btn-outline-secondary rounded-pill" data-bs-toggle="dropdown" aria-expanded="false" aria-label="More actions">&#8942;</button>
																		  <ul class="dropdown-menu dropdown-menu-end">
																			  <li>
																				  <a class="dropdown-item" href="PrepareWaiver.aspx?pid={ID}&amp;aiid={$admissionItemID}">Send Invite</a>
																			  </li>
																		  </ul>
																	  </xsl:when>
																	  <xsl:when test="$canSendInvite">
																		  <a class="btn btn-sm btn-primary rounded-pill"
																			 href="PrepareWaiver.aspx?pid={ID}&amp;aiid={$admissionItemID}">Send Invite</a>

																		  <!-- we may want to allow them to sign right now becuase they could hand their phone to someone else.  -->
																		  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																		  <button class="btn btn-sm btn-outline-secondary rounded-pill" data-bs-toggle="dropdown" aria-expanded="false" aria-label="More actions">&#8942;</button>
																		  <ul class="dropdown-menu dropdown-menu-end">
																			  <li>
																				  <a class="dropdown-item" href="PrepareWaiver.aspx?mode=self&amp;pid={ID}&amp;aiid={$admissionItemID}">Sign Now</a>
																			  </li>
																		  </ul>

																	  </xsl:when>
																	  <xsl:when test="$canResend">
																		  <asp:LinkButton runat="server" CommandName="RESEND_INVITE" CommandArgument="{ID}" CssClass="btn btn-sm btn-outline-secondary rounded-pill">Resend invite</asp:LinkButton>
																	  </xsl:when>
																	  <xsl:when test="$canCancel">
																		  <asp:LinkButton runat="server" CommandName="CANCEL_INVITE" CommandArgument="{ID}" CssClass="btn btn-sm btn-outline-secondary rounded-pill">Cancel invite</asp:LinkButton>
																	  </xsl:when>
																	  <xsl:when test="$canClear">
																		  <asp:LinkButton runat="server" CommandName="CLEAR_WAIVER" CommandArgument="{ID}"
																						  CssClass="btn btn-sm btn-outline-danger rounded-pill"
																						  OnClientClick="return confirm('This will revoke the signed waiver(s) for this person and require re-signing a new waiver. Continue? ');">Re-sign</asp:LinkButton>
																	  </xsl:when>
																  </xsl:choose>
															  </xsl:when>

															  <xsl:otherwise>
																  <div class="dropdown">
																	  <button class="btn btn-sm btn-outline-secondary rounded-pill" data-bs-toggle="dropdown" aria-expanded="false" aria-label="More actions">&#8942;</button>
																	  <ul class="dropdown-menu dropdown-menu-end">
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
																				  <asp:LinkButton runat="server" CommandName="RESEND_INVITE" CommandArgument="{ID}"  CssClass="dropdown-item">Resend invite</asp:LinkButton>
																			  </li>
																		  </xsl:if>
																		  <xsl:if test="$canCancel">
																			  <li>
																				  <asp:LinkButton runat="server" CommandName="CANCEL_INVITE" CommandArgument="{ID}"  CssClass="dropdown-item">Cancel invite</asp:LinkButton>
																			  </li>
																		  </xsl:if>
																		  <xsl:if test="$canClear">
																			  <li>
																				  <hr class="dropdown-divider"/>
																			  </li>
																			  <li>
																				  <asp:LinkButton runat="server" CommandName="CLEAR_WAIVER" CommandArgument="{ID}"
																								  CssClass="dropdown-item text-danger"
																								  OnClientClick="return confirm('This will revoke the signed waiver(s) for this person and require re-signing a new waiver. Continue? ');">
																					  Re-sign
																				  </asp:LinkButton>
																			  </li>
																		  </xsl:if>
																	  </ul>
																  </div>
															  </xsl:otherwise>
														  </xsl:choose>
													  </td>
												  </tr>
											  </xsl:for-each>
										  </tbody>
									  </table>
								  </div>

								  <!-- =================== Mobile (xs/sm) CARDS =================== -->
								  <div class="d-md-none">
									  <div class="list-group list-group-flush">
										  <xsl:for-each select="/Booking/Persons/BookingPerson[/Booking/PersonAdmissionItemLinks/BookingPersonAdmissionItem[BookingAdmissionItemID=$admissionItemID]/BookingPersonID=ID]">
											  <xsl:variable name="personID" select="ID"></xsl:variable>
											  <xsl:variable name="isAdult" select="key('ptById', PersonTypeID)/IsChild='false'"/>
											  <xsl:variable name="isFirstAdult"
															select="$isAdult and count(preceding-sibling::BookingPerson[key('ptById', PersonTypeID)/IsChild='false'])=0"/>
											  <xsl:variable name="ws" select="WaiverStatus"/>
											  <xsl:variable name="isChild" select="not($isAdult)"/>
											  <xsl:variable name="adultInvitePhase" select="$isAdult and ($ws='Invite_Sent' or $ws='Partially_Completed')"/>

											  <!-- Actions -->
											  <xsl:variable name="canSignNow"
												select="$waiverNeeded='true'
                  and ( $isChild or ($isAdult and $isFirstAdult) )
                  and not($adultInvitePhase)
                  and not($ws='Fully_Completed')
                  and not($ws='No_Waiver_Required')"/>
											  <xsl:variable name="canSendInvite"
												select="$waiverNeeded='true'
                  and not($isFirstAdult)
                  and not($adultInvitePhase)
                  and not($ws='Fully_Completed')
                  and not($ws='No_Waiver_Required')
                  and ($ws='Required_Not_Started' or $ws='Unknown')"/>
											  <xsl:variable name="canResend" select="$ws='Invite_Sent' or $ws='Partially_Completed'"/>
											  <xsl:variable name="canCancel" select="$ws='Invite_Sent' or $ws='Partially_Completed'"/>
											  <xsl:variable name="canClear" select="$ws='Fully_Completed'"/>
											  <xsl:variable name="actionCount"
												select="($canSignNow * 1)
                + ($canSendInvite * 1)
                + ($canResend * 1)
                + ($canCancel * 1)
                + ($canClear * 1)"/>

											  <div class="list-group-item">
												  <div class="d-flex justify-content-between">
													  <div class="pe-3">
														  <div class="fw-medium">
															  <xsl:choose>
																  <xsl:when test="normalize-space(FirstName) or normalize-space(LastName)">
																	  <xsl:value-of select="normalize-space(concat(FirstName,' ',LastName))"/>
																  </xsl:when>
																  <xsl:otherwise>Unnamed participant</xsl:otherwise>
															  </xsl:choose>
														  </div>
														  <div class="small text-body-secondary">
															  <xsl:variable name="invite" select="/Booking/Invites/BookingWaiverInvite[PersonIDsToAttach/guid=$personID]"></xsl:variable>
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
														  </div>
														  <div class="small mt-1">
															  <span class="me-2">
																  <strong>
																	  <xsl:value-of select="key('ptById', PersonTypeID)/Name"/>
																  </strong>
															  </span>
															  <xsl:text> </xsl:text>
															  <xsl:choose>
																  <xsl:when test="$waiverNeeded='true'">
																	  <xsl:choose>
																		  <xsl:when test="$ws='No_Waiver_Required'">
																			  <span class="badge text-bg-secondary">No waiver required</span>
																		  </xsl:when>
																		  <xsl:when test="$ws='Required_Not_Started'">
																			  <span class="badge text-bg-warning-subtle text-warning-emphasis">Required</span>
																		  </xsl:when>
																		  <xsl:when test="$ws='Invite_Sent'">
																			  <span class="badge text-bg-secondary">Invite Sent</span>
																		  </xsl:when>
																		  <xsl:when test="$ws='Partially_Completed'">
																			  <span class="badge text-bg-secondary">Partially Completed</span>
																		  </xsl:when>
																		  <xsl:when test="$ws='Fully_Completed'">
																			  <span class="badge text-bg-success">Completed</span>
																		  </xsl:when>
																		  <xsl:otherwise>
																			  <span class="badge text-bg-warning-subtle text-warning-emphasis">Unknown</span>
																		  </xsl:otherwise>
																	  </xsl:choose>
																  </xsl:when>
																  <xsl:otherwise>
																	  <span class="badge text-bg-secondary">Not required</span>
																  </xsl:otherwise>
															  </xsl:choose>
														  </div>
													  </div>

													  <!-- Actions area -->
													  <div class="text-end" style="min-width: 9rem">
														  <xsl:choose>
															  <xsl:when test="$actionCount = 0">
																  <span class="text-body-secondary small">—</span>
															  </xsl:when>

															  <!-- ONE action: full-width primary -->
															  <xsl:when test="$actionCount = 1">
																  <xsl:choose>
																	  <xsl:when test="$canSignNow">
																		  <a class="btn btn-sm btn-primary rounded-pill w-100" style="margin-bottom:5px;"
																			 href="PrepareWaiver.aspx?mode=self&amp;pid={ID}&amp;aiid={$admissionItemID}">Sign Now</a>
																		  <br/>

																		  <!-- when there is just the sign now button, that is the first adult. we might want to allow them to send this as an invite ratehr than signing themselves, so this is a dropdown after it with an invite button. -->
																		  <a class="btn btn-sm btn-outline-secondary rounded-pill" href="PrepareWaiver.aspx?pid={ID}&amp;aiid={$admissionItemID}">Send Invite</a>
																	  </xsl:when>
																	  <xsl:when test="$canSendInvite">
																		  <a class="btn btn-sm btn-primary rounded-pill w-100" style="margin-bottom:5px;"
																			 href="PrepareWaiver.aspx?pid={ID}&amp;aiid={$admissionItemID}">Send Invite</a>

																		  <br/>

																		  <!-- when there is just the sign now button, that is the first adult. we might want to allow them to send this as an invite ratehr than signing themselves, so this is a dropdown after it with an invite button. -->
																		  <a class="btn btn-sm btn-outline-secondary rounded-pill" href="PrepareWaiver.aspx?mode=self&amp;pid={ID}&amp;aiid={$admissionItemID}">Sign Now</a>
																	  </xsl:when>
																	  <xsl:when test="$canResend">
																		  <asp:LinkButton runat="server" CommandName="RESEND_INVITE" CommandArgument="{ID}"  CssClass="btn btn-sm btn-outline-secondary rounded-pill w-100">Resend invite</asp:LinkButton>
																	  </xsl:when>
																	  <xsl:when test="$canCancel">
																		  <asp:LinkButton runat="server" CommandName="CANCEL_INVITE" CommandArgument="{ID}"  CssClass="btn btn-sm btn-outline-secondary rounded-pill w-100">Cancel invite</asp:LinkButton>
																	  </xsl:when>
																	  <xsl:when test="$canClear">
																		  <asp:LinkButton runat="server" CommandName="CLEAR_WAIVER" CommandArgument="{ID}"
																						  CssClass="btn btn-sm btn-outline-danger rounded-pill w-100"
																						  OnClientClick="return confirm('This will revoke the signed waiver(s) for this person and require re-signing a new waiver. Continue? ');">Re-sign</asp:LinkButton>
																	  </xsl:when>
																  </xsl:choose>
															  </xsl:when>

															  <!-- MULTIPLE actions: single full-width dropdown labeled 'Actions' -->
															  <xsl:otherwise>
																  <div class="dropdown">
																	  <button class="btn btn-sm btn-outline-secondary rounded-pill w-100" data-bs-toggle="dropdown" aria-expanded="false">
																		  Actions
																	  </button>
																	  <ul class="dropdown-menu dropdown-menu-end">
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
																				  <asp:LinkButton runat="server" CommandName="RESEND_INVITE" CommandArgument="{ID}"  CssClass="dropdown-item">Resend invite</asp:LinkButton>
																			  </li>
																		  </xsl:if>
																		  <xsl:if test="$canCancel">
																			  <li>
																				  <asp:LinkButton runat="server" CommandName="CANCEL_INVITE" CommandArgument="{ID}"  CssClass="dropdown-item">Cancel invite</asp:LinkButton>
																			  </li>
																		  </xsl:if>
																		  <xsl:if test="$canClear">
																			  <li>
																				  <hr class="dropdown-divider"/>
																			  </li>
																			  <li>
																				  <asp:LinkButton runat="server" CommandName="CLEAR_WAIVER" CommandArgument="{ID}"
																								  CssClass="dropdown-item text-danger"
																								  OnClientClick="return confirm('This will revoke the signed waiver(s) for this person and require re-signing a new waiver. Continue? ');">
																					  Re-sign
																				  </asp:LinkButton>
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


						  </xsl:for-each>




						  <!-- Activities -->
						  <div class="bg-body-tertiary rounded-5 p-4">
							  <h5 class="mb-3">Activities</h5>
							  <xsl:for-each select="/Booking/AdmissionItems/BookingAdmissionItem">
								  <div class="border rounded-4 p-3 mb-2">
									  <div class="d-flex justify-content-between">
										  <div>
											  <div class="fw-medium">
												  <xsl:value-of select="Item/Name"/>
											  </div>
											  <div class="fs-sm text-body">
												  <i class="ci-calendar me-1"></i>

												  <!-- Per-activity display using dt:format-date only -->
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
													  <span class="badge text-bg-secondary ms-2">All day</span>
												  </xsl:if>
											  </div>
										  </div>
										  <div class="fs-sm text-body-secondary">
											  Status: <span class="text-body">
												  <xsl:value-of select="Status"/>
											  </span>
										  </div>
									  </div>
									  <xsl:if test="normalize-space(Item/Description)">
										  <div class="fs-sm mt-2 text-body-secondary">
											  <xsl:value-of select="Item/Description"/>
										  </div>
									  </xsl:if>
								  </div>
							  </xsl:for-each>
						  </div>

					  </div>

					  <!-- RIGHT: Details / Payment / Actions -->
					  <aside class="col-lg-4">
						  <div class="position-sticky top-0" style="padding-top: 1rem">

							  <!-- Booking details -->
							  <div class="bg-body-tertiary rounded-5 p-4 mb-3">
								  <h5 class="mb-3">Booking details</h5>
								  <dl class="row small mb-0">
									  <dt class="col-5 text-body-secondary">Booking ID</dt>
									  <dd class="col-7">
										  <code>
											  <xsl:value-of select="/Booking/BookingNumber"/>
										  </code>
									  </dd>

									  <dt class="col-5 text-body-secondary">Created</dt>
									  <dd class="col-7">
										  <xsl:value-of select="dt:format-date(/Booking/DateCreated, $fmtDate)"/>
									  </dd>

									  <dt class="col-5 text-body-secondary">Status</dt>
									  <dd class="col-7">
										  <xsl:value-of select="/Booking/StatusHistory/BookingStatus[IsCurrent='true']/Status"/>
									  </dd>


								  </dl>
							  </div>

							  <!-- Payment: list of orders as payments -->
							  <div class="bg-body-tertiary rounded-5 p-4 mb-3">
								  <h5 class="mb-3">Payment</h5>

								  <xsl:variable name="ordersXml" select="/Booking/Orders/Order"/>

								  <xsl:choose>

									  <!-- Canonical nested Orders -->
									  <xsl:when test="$ordersXml">
										  <div class="list-group list-group-flush">
											  <xsl:for-each select="$ordersXml">
												  <!-- compute total from line items -->
												  <xsl:variable name="total" select="sum(Items/OrderItem/LineTotal)"/>
												  <!-- pick current status (fallback to last) -->
												  <xsl:variable name="statusNode"
																select="(Statuses/OrderStatus[IsCurrentStatus='true'][1] |
                                 Statuses/OrderStatus[last()])[1]"/>
												  <xsl:variable name="statusText" select="$statusNode/Status"/>

												  <!-- status badge class -->
												  <xsl:variable name="statusClass">
													  <xsl:choose>
														  <xsl:when test="translate($statusText,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')
                               = 'paid' or
                               contains(translate($statusText,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'complete') or
                               contains(translate($statusText,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'authoriz')">
															  <xsl:text>text-bg-success</xsl:text>
														  </xsl:when>
														  <xsl:when test="contains(translate($statusText,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'pending') or
                              contains(translate($statusText,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'unpaid') or
                              contains(translate($statusText,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'open')">
															  <xsl:text>text-bg-warning-subtle text-warning-emphasis</xsl:text>
														  </xsl:when>
														  <xsl:when test="contains(translate($statusText,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'refund') or
                              contains(translate($statusText,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'void') or
                              contains(translate($statusText,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'cancel')">
															  <xsl:text>text-bg-secondary</xsl:text>
														  </xsl:when>
														  <xsl:otherwise>text-bg-secondary</xsl:otherwise>
													  </xsl:choose>
												  </xsl:variable>

												  <a class="list-group-item list-group-item-action d-flex justify-content-between align-items-center"
													 href="ViewOrder.aspx?id={ID}">
													  <div class="me-3">
														  <div class="fw-medium">
															  Payment #<xsl:value-of select="OrderNumber"/>
														  </div>
														  <div class="small text-body-secondary">
															  <xsl:value-of select="dt:format-date((DateCreated | Date | CreatedOn)[1], $fmtDate)"/>
															  <xsl:text> • </xsl:text>
															  <span class="badge">
																  <xsl:attribute name="class">
																	  <xsl:text>badge </xsl:text>
																	  <xsl:value-of select="$statusClass"/>
																  </xsl:attribute>
																  <xsl:value-of select="$statusText"/>
															  </span>
														  </div>
													  </div>

													  <div class="text-nowrap">
														  <xsl:value-of select="format-number($total,'#,##0.00')"/>
													  </div>
												  </a>
											  </xsl:for-each>
										  </div>
									  </xsl:when>


									  <xsl:otherwise>
										  <div class="text-body-secondary small">No payments yet.</div>
									  </xsl:otherwise>
								  </xsl:choose>
							  </div>


							  <!-- Actions -->
							  <div class="bg-body-tertiary rounded-5 p-4">
								  <h5 class="mb-3">Actions</h5>
								  <div class="d-grid gap-2">

									  <asp:LinkButton runat="server" id="btnResendConfirmation" CssClass="btn btn-outline-secondary rounded-pill">Resend Confirmation</asp:LinkButton>

									  <a href="javascript:void(0);" id="btnRequestCancel"
								   class="btn btn-outline-secondary rounded-pill">Request Cancellation</a>


									  <a href="javascript:void(0);" id="btnRequestDateTimeChange"
								   class="btn btn-outline-secondary rounded-pill">Request Date/time change</a>

									  <asp:LinkButton runat="server" id="btnAddToCalendar" CssClass="btn btn-outline-secondary rounded-pill">Add to calendar (.ics)</asp:LinkButton>

									  <a href="directions"
									 class="btn btn-outline-secondary rounded-pill">Get Directions</a>

									  <a href="contact"
									  class="btn btn-outline-secondary rounded-pill">Contact support</a>

									  <!-- other items we might add in the future -->
									  <!--
				  
				  -->


								  </div>
							  </div>

						  </div>
					  </aside>
				  </div>
			  </section>

			  <!-- end check for cancelled -->
		  </xsl:otherwise>
	  </xsl:choose>
	  
  </xsl:template>
</xsl:stylesheet>
