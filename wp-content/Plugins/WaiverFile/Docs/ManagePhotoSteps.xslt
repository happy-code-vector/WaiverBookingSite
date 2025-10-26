<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:asp="remove" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:output method="xml" omit-xml-declaration="yes"/>


  <xsl:template match="/">

    <xsl:if test="count(/ArrayOfPhotoStep/PhotoStep)!=0">
    <div class="pull-right">
      <a href="EditPhotoStep.aspx" class="btn btn-primary">
        <i class="fa fa-plus-circle">
          <xsl:text> </xsl:text>
        </i> Add a Photo Step
      </a>
    </div>
    <div class="clear">
      <xsl:text> </xsl:text>
    </div>
    </xsl:if>

    <xsl:if test="count(/ArrayOfPhotoStep/PhotoStep)=0">
      <div class="WPERR_Information">
        You have no photo steps configured. 
      </div>
      <a href="EditPhotoStep.aspx" class="btn btn-primary">
        <i class="fa fa-plus-circle">
          <xsl:text> </xsl:text>
        </i> Add a Photo Step</a>
    </xsl:if>

    <xsl:if test="count(/ArrayOfPhotoStep/PhotoStep)!=0">

      <table class="table">
        <thead>
          <tr>
            <th>Title</th>
            <th>Camera</th>
            <th>Hi-Res</th>
            <th>Optional</th>
            <th colspan="2">Order</th>
            <th>Edit</th>
            <th>Delete</th>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="/ArrayOfPhotoStep/PhotoStep">
            <tr>
              <td>
                <xsl:value-of select="Title"/>
              </td>
              <td>
                <xsl:value-of select="translate(Camera,'_',' ')"/>
              </td>
              <td>
                
                <xsl:choose>
                  <xsl:when test="IsHighRes='true'">
                    
                      <em class="fa fa-check text-success">
                        <xsl:text> </xsl:text>
                      </em>
                    
                  </xsl:when>
                  <xsl:otherwise>
                    <em class="fa fa-times text-muted">
                      <xsl:text> </xsl:text>
                    </em>
                  </xsl:otherwise>
                </xsl:choose>
               
              </td>
              <td>
                <xsl:choose>
                  <xsl:when test="IsOptional='true'">
                    Optional
                  </xsl:when>
                  <xsl:otherwise>
                    Required
                  </xsl:otherwise>
                </xsl:choose>
              </td>
              <td>
                <xsl:if test="position()!=1">
                <asp:LinkButton runat="server" CssClass="btn btn-default" CommandName="MOVEUP" CommandArgument="{ID}" >
                  <em class="fa fa-arrow-up">
                    <xsl:text> </xsl:text>
                  </em>
                </asp:LinkButton>
                </xsl:if>
              </td>
              <td>
                <xsl:if test="position()!=count(/ArrayOfPhotoStep/PhotoStep)">
                  <asp:LinkButton runat="server" CssClass="btn btn-default" CommandName="MOVEDOWN" CommandArgument="{ID}" >
                    <em class="fa fa-arrow-down">
                      <xsl:text> </xsl:text>
                    </em>
                  </asp:LinkButton>
                </xsl:if>
              </td>
              <td>

                <a href="EditPhotoStep.aspx?id={ID}" class="btn btn-primary">
                  <em class="fa fa-pencil">
                    <xsl:text> </xsl:text>
                  </em>
                </a>
                
              </td>
              <td>
                <asp:LinkButton runat="server" CssClass="btn btn-danger" CommandName="DELETE" CommandArgument="{ID}" >
                  <em class="fa fa-trash">
                    <xsl:text> </xsl:text>
                  </em>
                </asp:LinkButton>
              </td>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
    </xsl:if>
  


  </xsl:template>
</xsl:stylesheet>
