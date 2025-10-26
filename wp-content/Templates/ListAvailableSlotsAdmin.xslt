<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:dt="http://exslt.org/dates-and-times"
	xmlns:asp="remove"
	exclude-result-prefixes="dt">

	<xsl:output method="html" omit-xml-declaration="yes" />

	<!-- =========================
       Parameters
       ========================= -->
	<xsl:param name="DateFormat" select="'MM/dd/yyyy'"/>
	<xsl:param name="DateTimeFormat" select="'MM/dd/yyyy h:mm tt'"/>
	<xsl:param name="SelectedPeople" select="1"/>

	<!-- =========================
       Keys (group by date)
       ========================= -->
	<xsl:key name="byDate" match="/ArrayOfAdmissionItemAvailabilityRow/AdmissionItemAvailabilityRow" use="DateLocal"/>

	<!-- =========================
       Helpers for ISO 8601 durations (PT#H#M)
       ========================= -->
	<xsl:template name="getHours">
		<xsl:param name="iso"/>
		<xsl:choose>
			<xsl:when test="contains($iso,'H')">
				<xsl:value-of select="number(substring-after(substring-before($iso,'H'),'PT'))"/>
			</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="getMinutes">
		<xsl:param name="iso"/>
		<xsl:choose>
			<xsl:when test="contains($iso,'M')">
				<xsl:choose>
					<xsl:when test="contains($iso,'H')">
						<xsl:value-of select="number(substring-after(substring-before($iso,'M'),'H'))"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="number(substring-after(substring-before($iso,'M'),'PT'))"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="formatTime">
		<xsl:param name="h"/>
		<xsl:param name="m"/>
		<xsl:variable name="H" select="number($h)"/>
		<xsl:variable name="M" select="number($m)"/>
		<xsl:variable name="ampm">
			<xsl:choose>
				<xsl:when test="$H &lt; 12">AM</xsl:when>
				<xsl:otherwise>PM</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="h12">
			<xsl:choose>
				<xsl:when test="$H mod 12 = 0">12</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$H mod 12"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:value-of select="format-number($h12,'00')"/>
		<xsl:text>:</xsl:text>
		<xsl:value-of select="format-number($M,'00')"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="$ampm"/>
	</xsl:template>

	<!-- Compose a local time range label from SlotStartLocal/SlotEndLocal -->
	<xsl:template name="slotLabel">
		<xsl:param name="startIso"/>
		<xsl:param name="endIso"/>
		<xsl:variable name="sh">
			<xsl:call-template name="getHours">
				<xsl:with-param name="iso" select="$startIso"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="sm">
			<xsl:call-template name="getMinutes">
				<xsl:with-param name="iso" select="$startIso"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="eh">
			<xsl:call-template name="getHours">
				<xsl:with-param name="iso" select="$endIso"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="em">
			<xsl:call-template name="getMinutes">
				<xsl:with-param name="iso" select="$endIso"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:call-template name="formatTime">
			<xsl:with-param name="h" select="$sh"/>
			<xsl:with-param name="m" select="$sm"/>
		</xsl:call-template>
		<xsl:text> – </xsl:text>
		<xsl:call-template name="formatTime">
			<xsl:with-param name="h" select="$eh"/>
			<xsl:with-param name="m" select="$em"/>
		</xsl:call-template>
	</xsl:template>

	<!-- =========================
       Root
       ========================= -->
	<xsl:template match="/">

		<div class="panel panel-default">
			<div class="panel-heading">
				<strong>Availability</strong>
			</div>
			<div class="panel-body">

				<!-- group by date -->
				<xsl:for-each select="/ArrayOfAdmissionItemAvailabilityRow/AdmissionItemAvailabilityRow[generate-id()=generate-id(key('byDate', DateLocal)[1])]">
					<xsl:variable name="groupDate" select="DateLocal"/>
					<xsl:variable name="slotID">
						<xsl:value-of select="SlotID"/>
					</xsl:variable>
					<div class="panel panel-info" style="margin-bottom:15px;">
						<div class="panel-heading">
							<strong>
								<xsl:value-of select="dt:format-date($groupDate,$DateFormat)"/>
							</strong>
						</div>

						<div class="table-responsive">
							<table class="table table-condensed table-hover">
								<thead>
									<tr>
										<th style="width:38%;">Slot</th>
										<th style="width:18%;">Remaining</th>
										<th style="width:18%;">Booked</th>
										<th style="width:16%;">Max</th>
										<th style="width:10%;"></th>
									</tr>
								</thead>
								<tbody>

									<!-- rows within this date -->
									<xsl:for-each select="key('byDate', $groupDate)">
										<!-- sort: all-day first, then by start -->
										<xsl:sort select="number(Mode='All_day' or Mode=0 or not(SlotStartLocal))" data-type="number" order="descending"/>
										<xsl:sort select="SlotUtcStart" data-type="text" order="ascending"/>

										<!-- compute flags -->
										<xsl:variable name="isAllDay" select="Mode='All_day' or Mode=0 or not(SlotStartLocal)"/>
										<xsl:variable name="hasSlotCap" select="string-length(normalize-space(MaxAllowedPerSlot)) &gt; 0"/>
										<xsl:variable name="hasDayCap"  select="string-length(normalize-space(MaxAllowedPerDay))  &gt; 0"/>

										<!-- choose effective remaining and max based on mode -->
										<xsl:variable name="effRemaining">
											<xsl:choose>
												<xsl:when test="$isAllDay">
													<xsl:value-of select="RemainingPerDay"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:choose>
														<xsl:when test="$hasSlotCap">
															<xsl:value-of select="RemainingPerSlot"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="RemainingPerDay"/>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:variable>

										<xsl:variable name="effMax">
											<xsl:choose>
												<xsl:when test="$isAllDay">
													<xsl:value-of select="MaxAllowedPerDay"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:choose>
														<xsl:when test="$hasSlotCap">
															<xsl:value-of select="MaxAllowedPerSlot"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="MaxAllowedPerDay"/>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:variable>

										<!-- numeric version of remaining (NaN safe) -->
										<xsl:variable name="remN" select="number($effRemaining)"/>
										<xsl:variable name="hasCap" select="string-length(normalize-space($effMax)) &gt; 0"/>

										<!-- row class -->
										<xsl:variable name="rowClass">
											<xsl:choose>
												<xsl:when test="$hasCap and (not($remN=$remN) or $remN &lt;= 0)">danger</xsl:when>
												<!-- NaN guarded -->
												<xsl:when test="$hasCap and $remN &lt; $SelectedPeople">warning</xsl:when>
												<xsl:otherwise></xsl:otherwise>
											</xsl:choose>
										</xsl:variable>

										<tr>
											<xsl:if test="string-length($rowClass) &gt; 0">
												<xsl:attribute name="class">
													<xsl:value-of select="$rowClass"/>
												</xsl:attribute>
											</xsl:if>

											<!-- Slot label -->
											<td>
												<xsl:choose>
													<xsl:when test="$isAllDay">
														<span class="label label-info" style="margin-right:6px;">All Day</span>
													</xsl:when>
													<xsl:otherwise>
														<span class="text-muted glyphicon glyphicon-time" style="margin-right:6px;"></span>
														<xsl:call-template name="slotLabel">
															<xsl:with-param name="startIso" select="SlotStartLocal"/>
															<xsl:with-param name="endIso"   select="SlotEndLocal"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>

											<!-- Remaining (with badges) -->
											<td>
												<xsl:choose>
													<xsl:when test="not($hasCap)">
														<span class="text-muted">No cap</span>
													</xsl:when>
													<xsl:otherwise>
														<xsl:variable name="badgeClass">
															<xsl:choose>
																<xsl:when test="not($remN=$remN) or $remN &lt;= 0">label-danger</xsl:when>
																<xsl:when test="$remN &lt; $SelectedPeople">label-warning</xsl:when>
																<xsl:otherwise>label-success</xsl:otherwise>
															</xsl:choose>
														</xsl:variable>
														<span class="label">
															<xsl:attribute name="class">
																<xsl:text>label </xsl:text>
																<xsl:value-of select="$badgeClass"/>
															</xsl:attribute>
															<xsl:choose>
																<xsl:when test="$effRemaining&gt;=0">
																	<xsl:text>Remaining: </xsl:text>
																	<xsl:value-of select="$effRemaining"/>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:text>Overbooked by: </xsl:text>
																	<xsl:value-of select="$effRemaining * -1"/>
																</xsl:otherwise>
															</xsl:choose>
															
														</span>
													</xsl:otherwise>
												</xsl:choose>
											</td>

											<!-- Booked -->
											<td>
												<xsl:text>Day </xsl:text>
												<strong>
													<xsl:value-of select="BookedPeopleDay"/>
												</strong>
												<xsl:if test="not($isAllDay)">
													<xsl:text> · Slot </xsl:text>
													<strong>
														<xsl:value-of select="BookedPeopleSlot"/>
													</strong>
												</xsl:if>
											</td>

											<!-- Max -->
											<td>
												<xsl:choose>
													<xsl:when test="not($hasCap)">
														<span class="text-muted">—</span>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="$effMax"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>

											<!-- Action -->
											<td class="text-right">

												<a href="#"
													   class="btn btn-xs btn-primary js-pick-slot"
													   data-slotid="{$slotID}">
													<xsl:if test="$hasCap and $remN &lt; $SelectedPeople">
														<xsl:attribute name="data-warnoverbook">true</xsl:attribute>
													</xsl:if>
													Select</a>
												
											
											</td>
										</tr>
									</xsl:for-each>

								</tbody>
							</table>
						</div>
					</div>
				</xsl:for-each>

			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
