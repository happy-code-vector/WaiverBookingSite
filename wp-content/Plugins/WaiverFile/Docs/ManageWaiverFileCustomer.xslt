<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:asp="remove" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:output method="html" omit-xml-declaration="yes"/>


  <xsl:template match="/">
   
    
    <!--
    <xsl:copy-of select="/"/>
    -->


    <!--
    <xsl:for-each select="/ArrayOfAnyType/anyType[@xsi:type='Customer']">
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">
            <xsl:value-of select="FirstName"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="MiddleName"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="LastName"/>
            <span class="addbuttons">
              <a href="?sc=EDITCUSTOMER&amp;id={Customer_ID}&amp;c=1" class="ico_i">Standard Customer Screen</a>
            </span>
          </h3>
        </div>
        <div class="box-body">


            <div class="row">
              

            <div class="col-sm-6">
              <p>
                <label>Company: </label>
                <xsl:text> </xsl:text>
                <xsl:value-of select="Company"/>
              </p>
              <p>
                <label>Email: </label>
                <xsl:text> </xsl:text>
                <a href="mailto:{Email}">
                  <xsl:value-of select="Email"/>
                </a>
              </p>
              
            </div>
            <div class="col-sm-6">
              <xsl:for-each select="/ArrayOfAnyType/anyType[@xsi:type='CustomerData']">

                <xsl:if test="AffiliateID!='00000000-0000-0000-0000-000000000000'">
                  <p>
                    <strong>Affiliate:</strong>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="Affiliate/Customer/FirstName"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="Affiliate/Customer/LastName"/>
                  </p>
                </xsl:if>

                <xsl:if test="CRMStatusID!='00000000-0000-0000-0000-000000000000'">
                  <p>
                    <strong>CRM Status:</strong>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="Status/Name"/>
                  </p>
                </xsl:if>



                <xsl:if test="SourceID!='00000000-0000-0000-0000-000000000000'">
                  <p>
                    <strong>Source:</strong>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="Source/Name"/>
                  </p>
                </xsl:if>



              </xsl:for-each>

            </div>
          </div>


        </div>

      
          

        
        </div>
      

      


    </xsl:for-each>

-->

    <xsl:if test="/ArrayOfAnyType/anyType[@xsi:type='ArrayOfCCProfile']/CCProfile">

      <style type="text/css">

        .wpc_ccprof{ position:relative; padding: 5px; margin: 5px 0; border:1px solid #8695a5; min-width: 250px; display:inline-block; margin-right:10px; }
        .wpc_ccprof_type{ text-transform:capitalize; font-size: 150%;}
        .wpc_ccprof_status{ background-color: #d7dfe7;
        border: 2px solid #aab6c2;
        font-size: 110%;
        font-weight: bold;
        padding: 5px;
        position: absolute;
        right: 5px;
        text-align: right;
        text-transform: uppercase; }
        .wpc_ccprof_num{ padding-left:10px;  }
      </style>
      <div class="widget">
        <h3>
          Customer Credit Cards <span class="addbuttons">
            <a href="?sc=WPC_ADD_CCPROFILE&amp;c=1" class="ico_add">Add</a>
          </span>
        </h3>
        <div class="widgetcontent">
          
    <xsl:for-each select="/ArrayOfAnyType/anyType[@xsi:type='ArrayOfCCProfile']/CCProfile">
      
      

        
              <xsl:sort select="IsPrimary" order="descending" />

              <div class="wpc_ccprof">
                <span class="wpc_ccprof_type">
                  <xsl:value-of select="CardType"/>
                </span>
                <span class="wpc_ccprof_num">
                  <xsl:text>xxxx-xxxx-xxxx-</xsl:text>
                  <xsl:value-of select="Last4"/>
                </span>
                <span class="wpc_ccprof_status">
                  <xsl:value-of select="Status"/>
                </span>
                <br/>
                <br/>
                Expires
                <xsl:value-of select="CardExpirationMonth"/>
                <xsl:text>/</xsl:text>
                <xsl:value-of select="CardExpirationYear"/>

                <xsl:if test="IsPrimary='true'">
                  <br/>
                  <strong class="text-success">
                      <i class="fa fa-check-circle">
                        <xsl:text> </xsl:text>
                      </i>
                    <xsl:text> </xsl:text>
                    <xsl:text>Primary Card</xsl:text>
                  </strong>
                </xsl:if>
                <xsl:if test="IsPrimary!='true'">
                  <br/>
                  <asp:LinkButton CommandArgument="{CCProfileID}" CssClass="" CommandName="MAKEPRIMARY" runat="server" Text="Make Primary" ></asp:LinkButton>
                </xsl:if>

                <hr/>
                <a href="/wp-admin/default.aspx?sc=WPC_CCPROF_CHARGE&amp;c=1&amp;id={CCProfileID}" class="">Process a Payment</a>
                <xsl:text> | </xsl:text>
                <asp:LinkButton CommandArgument="{CCProfileID}" CssClass="" CommandName="DELETE" runat="server" Text="Delete" ></asp:LinkButton>
              </div>


    </xsl:for-each>

        </div>
      </div>
      
  </xsl:if>
      

  </xsl:template>
</xsl:stylesheet>
