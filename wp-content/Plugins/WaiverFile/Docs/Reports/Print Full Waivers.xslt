<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:set="http://exslt.org/sets" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt set">
    
    <xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:param name="last">false</xsl:param>
    
    <xsl:template match="/">


      <style type="text/css">
        p.breakhere {page-break-before: always}
      </style>


      <xsl:variable name="EmailConfirmed">
        <xsl:if test="Email=ValuesXml/data/field[@label='Confirm Email Address']/value">true</xsl:if>
      </xsl:variable>
      <xsl:variable name="EmailVerified">
        <xsl:if test="EmailVerification/VerifyStatus='Verified'">true</xsl:if>
      </xsl:variable>

      
      
      <xsl:for-each select="set:distinct(//WaiverEvent/WaiverEventID)">
        <xsl:variable name="evtid">
          <xsl:value-of select="."/>
        </xsl:variable>


        <h4>
          <xsl:value-of select="//WaiverEvent[WaiverEventID=$evtid]/TimeLabel"/>
          <xsl:if test="//WaiverEvent[WaiverEventID=$evtid]/Name!=''">
            <xsl:text> - </xsl:text>
          </xsl:if>
          <xsl:value-of select="//WaiverEvent[WaiverEventID=$evtid]/Name"/>
        </h4>


        <xsl:for-each select="//Waiver[WaiverEventID=$evtid]">

          <xsl:if test="position()!=1">
            <p class="breakhere">
              <xsl:text> </xsl:text>
            </p>
          </xsl:if>


          <!--
      <div class="headerbox">
      todo: display waiver site info here
      </div>-->

          <div class="row">
            <div class="col-xs-12">
              <h3>
                <xsl:value-of select="WaiverForm/Name"/>
              </h3>
              <xsl:if test="WaiverEvent/Name!=''">
                <h4>
                  <xsl:value-of select="WaiverEvent/Name"/>
                  <xsl:text> | </xsl:text>
                  <xsl:value-of select="WaiverEvent/TimeLabel"/>
                </h4>
              </xsl:if>
            </div>
            </div>
            <div class="row">
             
               <xsl:if test="Address!='' or City!='' or State!='' or Zip!=''">
                 <div class="col-xs-12 col-sm-4">
                 <address>
                <strong>Address </strong><br/>
                 <xsl:value-of select="Address"/><br/>

                   <xsl:if test="Address2!=''">
                   
                         
                         <xsl:value-of select="Address2"/>
                     <br/>
                   </xsl:if>

                   <xsl:value-of select="City"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="State"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="Zip"/>
              </address>
               
                 </div>
               </xsl:if>


              
              
              
               <div class="col-xs-12 col-sm-4">
                 <strong>Phone </strong>
                 <xsl:value-of select="Phone"/><br/>
                 <xsl:if test="Email!=''">
                 <strong>Email </strong>
                   <a href="mailto:{Email}">
                     <xsl:value-of select="Email"></xsl:value-of>
                   </a>
                   <xsl:if  test="$EmailVerified='true' or $EmailConfirmed='true'">
                     <xsl:text> (</xsl:text>
                     <xsl:if test="$EmailConfirmed='true'">
                       <xsl:text>confirmed</xsl:text>
                       <xsl:if test="$EmailVerified='true'">
                         <xsl:text>, </xsl:text>
                       </xsl:if>
                     </xsl:if>
                     <xsl:if test="$EmailVerified='true'">
                       <xsl:text>verified</xsl:text>
                     </xsl:if>
                     <xsl:text>)</xsl:text>
                   </xsl:if><br/>
                   <strong>Mailing List Opt-In</strong>
                   <xsl:choose>
                     <xsl:when test="OptIn='true'">Yes</xsl:when>
                     <xsl:otherwise>No</xsl:otherwise>
                   </xsl:choose>
                   <br/>


                   
                 </xsl:if>
                 
                 
                 <!-- extra fields -->
                 <xsl:for-each select="FieldsXml/data/fields">
                   <xsl:variable name="pos">
                     <xsl:value-of select="position()"/>
                   </xsl:variable>
                   <xsl:variable name="currlbl">
                     <xsl:value-of select="label"/>
                   </xsl:variable>
                   <div class="row">
                     <div class="form-group">
                       <div class="col-xs-12 col-sm-3">
                         <label>
                           <xsl:value-of select="label"/>
                         </label>
                       </div>
                       <div class="col-xs-12 col-sm-9">
                         <xsl:value-of select="../../../ValuesXml/data/field[label=$currlbl]/value"/>
                       </div>
                     </div>
                   </div>

                 
                   <xsl:if test="field_options/description!=''">
                     <div class="row">
                       <div class="col-xs-12">
                         <p class="help-block">
                           <xsl:value-of select="field_options/description"/>
                         </p>
                       </div>
                     </div>

                   </xsl:if>


                 </xsl:for-each>
                 
               </div>
               <div class="col-xs-12 col-sm-4">
                 
                 <h4>Participants:</h4>
                 <ul>
                   <xsl:for-each select="Particpants/WaiverParticipant">
                     <li>
                       <xsl:value-of select="ParticipantNameFirst"/>
                       <xsl:if test="ParticipantNameFirst!=''">
                         <xsl:text> </xsl:text>
                       </xsl:if>
                       <xsl:value-of select="ParticipantName"/>
                     </li>
                   </xsl:for-each>
                 </ul>
                 <xsl:if test="DOB!='' and DOB!='1/1/1753'">
                   <p>
                     <label>Date of Birth </label>
                     <xsl:value-of select="DOB"/>
                   </p>
                 </xsl:if>
                 
               </div>
            </div>                

            <div class="row">
              <div class="col-xs-12">
                <p><strong>Agreement:</strong><br/>
                  <xsl:value-of select="WaiverText/AgreementText" disable-output-escaping="yes"/>
                </p>
                <p>
                  <label>Signed By: </label>
                  <xsl:value-of select="SignedNameFirst"/>
                  <xsl:if test="SignedNameFirst!=''">
                    <xsl:text> </xsl:text>
                  </xsl:if>
                  <xsl:value-of select="SignedName"/>
                  <xsl:text> - </xsl:text>
                  <xsl:value-of select="dt:format-date(DateSigned,'MMMM d, yyyy h:mm a')"/>
                 
                </p>
              </div>
              </div>  
      
<hr/>

        </xsl:for-each>



      </xsl:for-each>
       
      
    </xsl:template>
</xsl:stylesheet>
