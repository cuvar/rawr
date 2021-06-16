<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


    <xsl:variable name="timeframestart" select="20210510"/>
    <xsl:variable name="timeframeend" select="20210516"/>
   

  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" href="../style/index.css" />
      </head>

      <body>
        <h1>Project RAWR</h1>
        <table>
            <tr>
                <xsl:call-template name="Loop"/>
            </tr>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="Loop">
    <xsl:param name="index" select="$timeframestart" />
    <xsl:param name="maxValue" select="$timeframeend" />
    <td>
    <td>
      <xsl:value-of select="$index"/>
    </td>
    <table>
    <xsl:for-each select="calendar/event">  
        <xsl:variable name="start" select="dtstart"/>
        <xsl:variable name="end" select="dtend"/>
        <xsl:variable name="startdate">
            <xsl:value-of select="substring($start,1,8)"/>
        </xsl:variable>
        <xsl:variable name="starttime">
          <xsl:value-of select="substring($start,10,4)"/>
        </xsl:variable> 

      <xsl:variable name="endtime">
          <xsl:value-of select="substring($end,10,4)"/>
      </xsl:variable>
        
        <xsl:if test="$startdate = $index">
        <tr>
            <xsl:choose>
            <xsl:when test="categories = 'Prüfung'">
              <tr>
                <th style="background-color:#FB3640;" >
                  <xsl:value-of select="summary" />
                </th>
              </tr>
              <tr style="background-color:#FB3640;">
                  <xsl:value-of select="$startdate" />
              </tr>
              <tr style="background-color:#FB3640;">
                <xsl:value-of select="$starttime" />
                -
                <xsl:value-of select="$endtime" />
              </tr>
            </xsl:when>
            <xsl:otherwise>
              <tr>
                <th>
                  <xsl:value-of select="summary" />
                </th>
              </tr>
              <tr>
                  <xsl:value-of select="$startdate" />
              </tr>
              <tr>
                <xsl:value-of select="$starttime" />
                -
                <xsl:value-of select="$endtime" />
              </tr>
            </xsl:otherwise>
            </xsl:choose>
          </tr>
        </xsl:if>
    </xsl:for-each>
    </table>
    </td>

    <xsl:if test="$index &lt; $maxValue">
        <xsl:call-template name="Loop">
            <xsl:with-param name="index" select="$index + 1" />
            <xsl:with-param name="total" select="$maxValue" />
        </xsl:call-template>
    </xsl:if>

  </xsl:template>
</xsl:stylesheet>