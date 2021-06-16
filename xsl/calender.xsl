<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

    <xsl:variable name="timeframestart" select="20210202"/>
    <xsl:variable name="timeframeend" select="20210320"/>

  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" href="../style/index.css" />
      </head>

      <body>
        <h1>Project RAWR</h1>
        
        <table>
            <tr>
                <xsl:for-each select="calendar/event">
                    
                <xsl:variable name="start" select="dtstart"/>
                <xsl:variable name="startdate">
                    <xsl:value-of select="substring($start,1,8)"/>
                </xsl:variable>
                
                    <xsl:if test="$startdate > $timeframestart">
                    <xsl:if test="not($startdate > $timeframeend)">
                    <xsl:choose>
                    <xsl:when test="categories = 'Prüfung'">
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
                    </xsl:if>
                    </xsl:for-each>
            </tr>
            <tr>
            <xsl:for-each select="calendar/event">

            <xsl:variable name="start" select="dtstart"/>
                <xsl:variable name="startdate">
                    <xsl:value-of select="substring($start,1,8)"/>
                </xsl:variable>

                <xsl:if test="$startdate > $timeframestart">
                 <xsl:if test="not($startdate > $timeframeend)">
                    <td>
                        <xsl:value-of select="$startdate" />
                    </td>
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
            </tr>
            <tr>
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

                <xsl:if test="$startdate > $timeframestart">
                 <xsl:if test="not($startdate > $timeframeend)">
                    <td>
                        <xsl:value-of select="$starttime" />
                        -
                        <xsl:value-of select="$endtime" />
                        today:
                        
                    </td>
                    </xsl:if>
                </xsl:if>
                </xsl:for-each>
            </tr>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>



<xsl:when test="$month = 2 | $month = 3 | $month = 11" >
        <xsl:call-template name="getDay">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="monthcode" select="4" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$month = 4 | $month = 7">
        <xsl:call-template name="getDay">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="monthcode" select="0" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$month = 5 ">
        <xsl:call-template name="getDay">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="monthcode" select="2" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$month = 6 ">
        <xsl:call-template name="getDay">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="monthcode" select="5" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$month = 8">
        <xsl:call-template name="getDay">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="monthcode" select="3" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="getDay">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="monthcode" select="0" />
        </xsl:call-template>
      </xsl:otherwise>