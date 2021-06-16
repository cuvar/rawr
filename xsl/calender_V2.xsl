<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="request_test"/>
    <xsl:variable name="test" select="'Mo'"/>
    <xsl:variable name="timeframestart" select="20210531"/>
    <xsl:variable name="timeframeend" select="20210606"/>
   

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
                <xsl:call-template name="klausuren"/>
            </tr>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="Loop">
    <xsl:param name="index" select="$timeframestart" />
    <xsl:param name="maxValue" select="$timeframeend" />
    <td>
    <!--Calls Daynaming method-->
    <xsl:call-template name="getDay">
      <xsl:with-param name="date" select="$index" />
    </xsl:call-template>
    <table>
    <xsl:for-each select="calendar/event">
      <!--Splits dates in to date and time-->  
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
        <xsl:call-template name="getDaysInMonth">
            <xsl:with-param name="date" select="$index" />
            <xsl:with-param name="total" select="$maxValue" />
        </xsl:call-template>
    </xsl:if>
  </xsl:template>

<xsl:template name="addDay">
  <xsl:param name="date"/>
  <xsl:param name="days"/>
  <xsl:param name="total"/>

  <xsl:variable name="day">
          <xsl:value-of select="substring($date,7,2)"/>
  </xsl:variable>

  <xsl:choose>
      <xsl:when test="$day = $days">
        <xsl:call-template name="Loop">
          <xsl:with-param name="index" select="$date +(73 -($day + 2 -30) )" />
          <xsl:with-param name="total" select="$total" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="Loop">
          <xsl:with-param name="index" select="$date + 1" />
          <xsl:with-param name="total" select="$total" />
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="getDaysInMonth">
  <xsl:param name="date"/>
  <xsl:param name="total"/>
  <xsl:variable name="month">
    <xsl:value-of select="substring($date,5,2)"/>
  </xsl:variable>
  <xsl:variable name="year">
          <xsl:value-of select="substring($date,3,2)"/>
  </xsl:variable>

  <xsl:choose>
      <xsl:when test="$month = 1">
        <xsl:call-template name="addDay">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="days" select="31" />
          <xsl:with-param name="total" select="$total" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$month = 2">
        <xsl:choose>
        <xsl:when test="$year mod 4 = 0">
        <xsl:call-template name="addDay">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="days" select="29" />
          <xsl:with-param name="total" select="$total" />
        </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
        <xsl:call-template name="addDay">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="days" select="28" />
          <xsl:with-param name="total" select="$total" />
        </xsl:call-template>
      </xsl:otherwise>
      </xsl:choose>
      </xsl:when>
      <xsl:when test="$month = 3 " >
        <xsl:call-template name="addDay">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="days" select="31" />
          <xsl:with-param name="total" select="$total" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$month = 4 " >
        <xsl:call-template name="addDay">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="days" select="30" />
          <xsl:with-param name="total" select="$total" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$month = 5" >
        <xsl:call-template name="addDay">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="days" select="31" />
          <xsl:with-param name="total" select="$total" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$month = 6 ">
        <xsl:call-template name="addDay">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="days" select="30" />
          <xsl:with-param name="total" select="$total" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$month = 7 ">
        <xsl:call-template name="addDay">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="days" select="31" />
          <xsl:with-param name="total" select="$total" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$month = 8 ">
        <xsl:call-template name="addDay">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="days" select="31" />
          <xsl:with-param name="total" select="$total" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$month = 9 ">
        <xsl:call-template name="addDay">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="days" select="30" />
          <xsl:with-param name="total" select="$total" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$month = 10">
        <xsl:call-template name="addDay">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="days" select="31" />
          <xsl:with-param name="total" select="$total" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$month = 11">
        <xsl:call-template name="addDay">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="days" select="30" />
          <xsl:with-param name="total" select="$total" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="addDay">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="days" select="31" />
          <xsl:with-param name="total" select="$total" />
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
</xsl:template>






















  <xsl:template name="getDay">
  <xsl:param name="date"/>
  <xsl:variable name="month">
    <xsl:value-of select="substring($date,5,2)"/>
  </xsl:variable>

  <xsl:choose>
      <xsl:when test="$month = 1">
        <xsl:call-template name="getDaycode">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="monthcode" select="1" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$month = 10">
        <xsl:call-template name="getDaycode">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="monthcode" select="1" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$month = 2 " >
        <xsl:call-template name="getDaycode">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="monthcode" select="4" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$month = 3 " >
        <xsl:call-template name="getDaycode">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="monthcode" select="4" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$month = 11" >
        <xsl:call-template name="getDaycode">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="monthcode" select="4" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$month = 4 ">
        <xsl:call-template name="getDaycode">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="monthcode" select="0" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$month = 7 ">
        <xsl:call-template name="getDaycode">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="monthcode" select="0" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$month = 5 ">
        <xsl:call-template name="getDaycode">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="monthcode" select="2" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$month = 6 ">
        <xsl:call-template name="getDaycode">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="monthcode" select="5" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$month = 8">
        <xsl:call-template name="getDaycode">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="monthcode" select="3" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="getDaycode">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="monthcode" select="0" />
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="getDaycode">
    <xsl:param name="date"/>
    <xsl:param name="monthcode"/>

    <xsl:variable name="day">
          <xsl:value-of select="substring($date,7,2)"/>
    </xsl:variable>
    <xsl:variable name="month">
          <xsl:value-of select="substring($date,5,2)"/>
    </xsl:variable>
    <xsl:variable name="year">
          <xsl:value-of select="substring($date,3,2)"/>
    </xsl:variable>

    <xsl:variable name="dayname" select="($day+$monthcode+6+$year+round($year div 4))mod 7"/>
    <td>
    <xsl:choose>
      <xsl:when test="$dayname = 0">
        <dt>Sa</dt>
      </xsl:when>
      <xsl:when test="$dayname = 1">
        So
      </xsl:when>
      <xsl:when test="$dayname = 2">
        <dt>Mo</dt>
        <dt><xsl:value-of select="$date"/></dt>
      </xsl:when>
      <xsl:when test="$dayname = 3">
        Di
      </xsl:when>
      <xsl:when test="$dayname = 4">
        Mi
      </xsl:when>
      <xsl:when test="$dayname = 5">
        Do
      </xsl:when>
      <xsl:when test="$dayname = 6">
        Fr
      </xsl:when>
      <xsl:otherwise>
        Errr
        <xsl:value-of select="$date"/>
      </xsl:otherwise>
      </xsl:choose>
    </td>
  </xsl:template>

  <xsl:template name="klausuren">
    <xsl:for-each select="calendar/event">
    <xsl:if test="categories = 'Prüfung'">
      <tr>
        <td>
        <xsl:value-of select="summary" />
        </td>
      </tr>  
    </xsl:if>
    </xsl:for-each>

  </xsl:template>
</xsl:stylesheet>