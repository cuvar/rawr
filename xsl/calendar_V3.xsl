<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type = "text/xsl" href="xsl/calendar_V3.xsl"?>
<xsl:stylesheet version="1.0" 
  xmlns:ext="http://exslt.org/common"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:date="http://exslt.org/dates-and-times"
  xmlns:func="http://exslt.org/functions">

  <xsl:variable name="timeframestart" select="20210510"/>
  <xsl:variable name="timeframeend" select="20210516"/>

  <xsl:variable name="currentDateandTime" select="date:date-time()"/>

  <xsl:variable name="currentYear">
    <xsl:value-of select="substring($currentDateandTime,1,4)"/>
  </xsl:variable>
  <xsl:variable name="currentMonth">
    <xsl:value-of select="substring($currentDateandTime,6,2)"/>
  </xsl:variable>
  <xsl:variable name="currentDay">
    <xsl:value-of select="substring($currentDateandTime,9,2)"/>
  </xsl:variable>
  <xsl:variable name="currentDate" select="$currentYear * 10000 + $currentMonth * 100 + $currentDay"/>
  
  <!-- Preprocessing -->
  <xsl:variable name="calendarRtf">
    <xsl:apply-templates select="calendar/event"/>
  </xsl:variable>
  <!-- Convert RTF (result-tree-fragment) to node-set -->
  <xsl:variable name="calendar" select="ext:node-set($calendarRtf)"/>
  

  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" href="../style/index.css" />
      </head>

      <body>
        <h1>Project RAWR</h1>
        <h1>
          <xsl:value-of select="$currentDate"/>
        </h1>
        <table>
            <tr>
                <xsl:call-template name="Loop"/>
                <xsl:call-template name="Klausuren"/>
                <xsl:call-template name="Termine"/>
            </tr>
        </table>
      </body>
    </html>
  </xsl:template>



  <xsl:template name="Loop">
    <xsl:param name="index" select="$timeframestart" />
    <xsl:param name="maxValue" select="$timeframeend" />
    <td>
    <table>
    <xsl:for-each select="$calendar/event">
    <xsl:sort select="starttime" data-type="number" />

      <xsl:if test="startdate = $index"> 
          <xsl:choose>
            <xsl:when test="categories = 'Prüfung'">
              <tr>
                <th style="background-color:#FB3640;" >
                  <xsl:value-of select="summary" />
                </th>
              </tr>
              <tr style="background-color:#FB3640;">
                  <xsl:value-of select="startdate" />
              </tr>
              <tr style="background-color:#FB3640;">
                <xsl:value-of select="starttime" />
                -
                <xsl:value-of select="endtime" />
              </tr>
            </xsl:when>
            <xsl:otherwise>
              <tr>
                <th>
                  <xsl:value-of select="summary" />
                </th>
              </tr>
              <tr>
                  <xsl:value-of select="startdate" />
              </tr>
              <tr>
                <xsl:value-of select="starttime" />
                -
                <xsl:value-of select="endtime" />
              </tr>
            </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
    </xsl:for-each>
    </table>
    </td>
    <xsl:if test="$index &lt; $maxValue">
        <xsl:call-template name="Loop">
            <xsl:with-param name="index" select="$index + 1" />
            <xsl:with-param name="maxValue" select="$maxValue" />
        </xsl:call-template>
    </xsl:if>

  </xsl:template>

  <xsl:template match="calendar/event">
    <event>
      <xsl:for-each select="*">
        <xsl:choose>
          <xsl:when test="name() = 'start'">
            <startdate>
              <xsl:value-of select="substring(.,1,8)"/>
            </startdate>
            <starttime>
              <xsl:value-of select="substring(.,10,4)"/>
            </starttime>
          </xsl:when>
          <xsl:when test="name() = 'end'">
            <enddate>
              <xsl:value-of select="substring(.,1,8)"/>
            </enddate>
            <endtime>
              <xsl:value-of select="substring(.,10,4)"/>
            </endtime>
          </xsl:when>
          <xsl:otherwise>
            <xsl:copy-of select="."/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </event>
  </xsl:template>

  <!--returns all Events with "Prüfung" as their categorie-->
  <xsl:template name="Klausuren">
    <h3>Klausuren</h3>
    <xsl:for-each select="$calendar/event">
    <xsl:sort select="startdate" data-type="number" />
    <xsl:if test="categories = 'Prüfung' and startdate > $currentDate">
      <tr>
        <td>
        <xsl:value-of select="categories"/>:
        <xsl:value-of select="summary" />
        
        </td>
      </tr>  
    </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="Termine">
    <h3>Termine</h3>
    <xsl:for-each select="$calendar/event">
    <xsl:sort select="startdate" data-type="number" />
    <xsl:if test="categories = 'Sonstiger Termin' and startdate > $currentDate ">
      <tr>
        <td>
        <xsl:value-of select="categories"/>:
        <xsl:value-of select="summary" />
        </td>
      </tr>  
    </xsl:if>
    </xsl:for-each>

  </xsl:template>

</xsl:stylesheet>