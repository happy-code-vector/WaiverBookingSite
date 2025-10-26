<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgram-v1" version="1.0" xmlns:asp="remove" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:output method="html" omit-xml-declaration="yes"/>



  <xsl:template match="/">

   
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">
          Emails with Customer
        </h3>
      </div>
      <!-- /.box-header -->
      <div class="box-body no-padding">
      
        <!-- list the messages here-->
        <xsl:for-each select="/DataSet/diffgr:diffgram/NewDataSet/Table">

          <xsl:choose>
            <!-- HIDE CERTAIN SUBJECTS, WE DON'T NEED TO SEE THESE-->
            <xsl:when test="Subject='New WaiverFile SignUp!'"></xsl:when>
            <xsl:when test="Subject='New WaiverFile Signup (validation failed)'"></xsl:when>
            <xsl:when test="Subject='Merchant Email Receipt'"></xsl:when>
           <!-- <xsl:when test="Subject=''"></xsl:when>
            <xsl:when test="Subject=''"></xsl:when>
            <xsl:when test="Subject=''"></xsl:when>
            <xsl:when test="Subject=''"></xsl:when>
            -->
            
            
            
            
            <xsl:otherwise>
              <div class="box box-solid box-collapsed collapsed-box" style="margin-bottom:1px;">
                <div class="box-header with-border">
                  <h3 class="box-title">
                    <div class="mailbox-read-info" style="padding:0;border:0 none;">

                      <xsl:choose>
                        <xsl:when test="Folder=0">
                          <!-- inbox -->
                          <div class="row">
                            <div class="col-xs-1 text-center">
                              <!-- inbox -->
                              <i class="fa fa-inbox">
                                <xsl:text> </xsl:text>
                              </i>
                              <small>Inbox</small>
                            </div>
                            <div class="col-xs-11">
                              <h3>
                                <xsl:value-of  select="Subject"/>
                              </h3>
                              <h5>
                                From: <xsl:value-of select="From"/>
                                <span class="mailbox-read-time pull-right">
                                  <xsl:value-of select="dt:format-date(Received,'MMMM d, yyyy h:mm a')"/>
                                </span>
                              </h5>
                            </div>
                          </div>
                        </xsl:when>
                        <xsl:otherwise>
                          <!-- sent -->
                          <div class="row">
                            <div class="col-xs-1 text-center">
                              <!-- sent -->
                              <i class="fa fa-envelope-o">
                                <xsl:text> </xsl:text>
                              </i>
                              <small>Sent</small>
                            </div>
                            <div class="col-xs-11">
                              <h3>
                                <xsl:value-of  select="Subject"/>
                                <small>(<a href="/wp-admin/default.aspx?id={ID}&amp;sc=WPC_VIEW_MAILMESSAGE">View</a>)
                              </small>
                              </h3>
                              <h5>
                                From: <xsl:value-of select="From"/>
                                <span class="mailbox-read-time pull-right">
                                  <xsl:value-of select="dt:format-date(Received,'MMMM d, yyyy h:mm a')"/>
                                </span>
                              </h5>
                            </div>

                          </div>
                        </xsl:otherwise>
                      </xsl:choose>










                    </div>
                  </h3>

                  <div class="box-tools">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse">
                      <i class="fa fa-plus"></i>
                    </button>
                  </div>
                </div>
                <div class="box-body" style="display:none;">

                  <small>
                    <strong>To: </strong>
                    <xsl:value-of select="To"/>
                    <br/>
                    <xsl:if test="Cc!=''">
                      <strong>CC: </strong>
                      <xsl:value-of select="Cc"/>
                      <br/>
                    </xsl:if>
                    <xsl:if test="Bcc!=''">
                      <strong>BCC: </strong>
                      <xsl:value-of select="Bcc"/>
                      <br/>
                    </xsl:if>
                  </small>
                  <xsl:call-template name="replace">
                    <xsl:with-param name="string" select="BodyPreview"/>
                  </xsl:call-template>

                  <!--<xsl:value-of select="BodyPreview"/>-->

                </div>
                <!-- /.box-body -->
              </div>


            </xsl:otherwise>
          </xsl:choose>


        </xsl:for-each>
       
      </div>
      <!-- /.box-body -->
      
    </div>


  </xsl:template>

  <xsl:template name="replace">
    <xsl:param name="string"/>
    <xsl:choose>
      <xsl:when test="contains($string,'&#10;')">
        <xsl:value-of select="substring-before($string,'&#10;')"/>
        <br/>
        <xsl:call-template name="replace">
          <xsl:with-param name="string" select="substring-after($string,'&#10;')"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$string"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>