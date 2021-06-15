<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" href="../style/index.css" />
      </head>

      <body>
        <h1>Project RAWR</h1>
        <xsl:variable name="timeframestart" select="20210101"/>
        <xsl:variable name="timeframeend" select="20210105"/>
        <table>
            <tr>
                <xsl:for-each select="calender/event">
                
                    <xsl:if test="startdate > $timeframestart">
                    <xsl:choose>
                    <xsl:when test="category = 'Prüfung'">
                       <th style="background-color:#FB3640;" >
                            <xsl:value-of select="summary" />
                        </th>
                    </xsl:when>
                    <xsl:otherwise>
                        <th>
                            <xsl:value-of select="summary" />
                        </th>
                    </xsl:otherwise>
                    </xsl:choose>
                    </xsl:if>
                    </xsl:for-each>
            </tr>
            <tr>
            <xsl:for-each select="calender/event">  
                <xsl:if test="startdate > $timeframestart">
                    <td>
                        <xsl:value-of select="starttime" />
                        -
                        <xsl:value-of select="endtime" />
                    </td>
                </xsl:if>
            </xsl:for-each>
            </tr>
            <tr>
            <xsl:for-each select="calender/event">  
                <xsl:if test="startdate > $timeframestart">
                    <td>
                        <xsl:value-of select="attende/name" />
                    </td>
                </xsl:if>
                </xsl:for-each>
            </tr>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>