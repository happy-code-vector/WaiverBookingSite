<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>

	<xsl:template match="/">
		
			<!-- Outer container -->
		<!-- Swiper CSS -->
		<link rel="stylesheet" href="/sitebooking/vendor/swiper/swiper-bundle.min.css" />

		<!-- Swiper JS -->
		<script src="/sitebooking/vendor/swiper/swiper-bundle.min.js">
			<xsl:text> </xsl:text>
		</script>


		<section class="position-relative">
			<div class="swiper position-absolute top-0 start-0 w-100 h-100 swiper-fade swiper-initialized swiper-horizontal swiper-watch-progress swiper-backface-hidden"
		 data-swiper=""
		 data-bs-theme="dark">
				<xsl:attribute name="data-swiper">
					<xsl:text>{&quot;effect&quot;:&quot;fade&quot;, &quot;loop&quot;:true, &quot;speed&quot;:400, &quot;pagination&quot;:{&quot;el&quot;:&quot;.swiper-pagination&quot;, &quot;clickable&quot;:true}, &quot;autoplay&quot;:{&quot;delay&quot;:5500, &quot;disableOnInteraction&quot;:false}}</xsl:text>
				</xsl:attribute>

				<!-- Slides wrapper -->
				<div class="swiper-wrapper" id="swiper-wrapper-slider" aria-live="off" style="transition-duration: 400ms;">
					<xsl:for-each select="Slider/Slides/SliderSlide[Hidden='false']">
						<div class="swiper-slide" role="group" data-swiper-slide-index="{OrderNum}">
							<div class="position-absolute d-flex align-items-center w-100 h-100 z-2">
								<div class="container mt-lg-n4">
									<div class="row">
										<div class="col-12 col-sm-10 col-md-7 col-lg-6">

										
											<!-- Heading -->
											<h2 class="display-4 pb-2 pb-md-3 pb-lg-4">
												<xsl:value-of select="Settings/Title"/>
											</h2>
											<!-- Optional subtitle -->
											<xsl:if test="string-length(Settings/RichTextMain) &gt; 0">
												<p class="fs-sm text-white mb-lg-4">
													<xsl:value-of select="Settings/RichTextMain" disable-output-escaping="yes"/>
												</p>
											</xsl:if>


											<!-- Optional Button -->
											<xsl:if test="string-length(Settings/ButtonText) &gt; 0 and string-length(Settings/ButtonUrl) &gt; 0">
												<a class="btn btn-lg btn-outline-light rounded-pill">
													<xsl:attribute name="href">
														<xsl:value-of select="Settings/ButtonUrl"/>
													</xsl:attribute>
													<xsl:value-of select="Settings/ButtonText"/>
												</a>
											</xsl:if>

										</div>
									</div>
								</div>
							</div>

							<!-- Background Image -->
							<img class="position-absolute top-0 start-0 w-100 h-100 object-fit-cover rtl-flip" alt="Image">
								<xsl:attribute name="src">
									<xsl:value-of select="Settings/BackgroundImageUrl"/>
								</xsl:attribute>
							</img>
						</div>
					</xsl:for-each>
				</div>

				<!-- Swiper pagination -->
				<div class="swiper-pagination pb-sm-2"></div>
				<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
			</div>

			<!-- Responsive height helpers -->
			<div class="d-md-none" style="height: 380px"></div>
			<div class="d-none d-md-block d-lg-none" style="height: 420px"></div>
			<div class="d-none d-lg-block d-xl-none" style="height: 500px"></div>
			<div class="d-none d-xl-block d-xxl-none" style="height: 560px"></div>
			<div class="d-none d-xxl-block" style="height: 624px"></div>
		</section>
	</xsl:template>
</xsl:stylesheet>
