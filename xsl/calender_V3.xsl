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
        <link rel="stylesheet" href="../style/dashboard.css" />
      </head>

      <body>
       <!-- right views -->
        <div class="container-right">
          <!-- klausuren view -->
          <div class="klausur">
            <div class="klausuren_top">
              <p class="label_text">Klausuren</p>
            </div>
            <div class="klausuren_main">
              <table>
                <xsl:call-template name="Klausuren"/>
              </table>
            </div>
          </div>

          <!-- termine view -->
          <div class="termine">
            <div class="termine_top">
              <p class="label_text">Termine</p>
            </div>
            <div class="termine_main">
              <table>
                <xsl:call-template name="Termine"/>
              </table>
            </div>
          </div>
        </div>
        <!-- main content on left side -->
        <div class="container-main">
        <!-- banner -->
          <div class="banner">
            <div class="banner-left">
              <img class="homebutton" src="Pictures/home-solid.svg" alt=""/>
              <div class="class">
                <p>TINF20B2</p>
              </div>
            </div>
            <div class="banner-right">
              <div class="dropdown">
                <button class="dropbtn">Wochenansicht</button>
                <div class="dropdown-content">
                  <a href="dashboard.xml">Wochenansicht</a>
                  <hr/>
                  <a href="dashboardMonth.xml">Monatsansicht</a>
                </div>
              </div>
            </div>
          </div>
           <!-- calender view -->
          <div class="calendar">
            <div class="calendar_top">
              <a href="#"></a>
              <img class="nav-btn" src="Pictures/angle-left-solid.svg" alt=""/>
              <a href="#"></a>
              <img class="nav-btn" src="Pictures/angle-right-solid.svg" alt=""/>
              <div class="calendar_month">
                <p>Septmeber</p>
              </div>
            </div>
            <div class="calendar_main">
              <table style="height:100%">
                <tr>
                  <th>Montag</th>
                  <th>Dienstag</th>
                  <th>Mittwoch</th>
                  <th>Donnerstag</th>
                  <th>Freitag</th>
                  <th>Samstag</th>
                  <th>Sonntag</th>
                </tr>
                <tr>
                <xsl:call-template name="Loop"/>
                </tr>
                </table>
            </div>
          </div>
        </div>
          
                
      </body>
    </html>
  </xsl:template>



  <xsl:template name="Loop">
    <xsl:param name="index" select="$timeframestart" />
    <xsl:param name="maxValue" select="$timeframeend" />
    <td>
      <div class="calendar_day"><p>1</p></div>
      <div class="timetable_content">
    <xsl:for-each select="$calendar/event">
    <xsl:sort select="starttime/total" data-type="number" />

      <xsl:if test="startdate/total = $index"> 
          <xsl:choose>
            <xsl:when test="categories = 'Prüfung'">
              <div class="timetable" style="background-color:#FB3640;">
                <xsl:value-of select="summary" />
              </div>  
            </xsl:when>
            <xsl:when test="categories = 'Sonstiger Termin'">
              <div class="timetable" style="background-color: grey;">
                <xsl:value-of select="summary" />
              </div>  
            </xsl:when>
            <xsl:otherwise>
              <div class="timetable">
                <xsl:value-of select="summary" />
              </div>
            </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
    </xsl:for-each>
    </div>
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
              <total>
                <xsl:value-of select="substring(.,1,8)"/>
              </total>
              <year>
                <xsl:value-of select="substring(.,1,4)"/>
              </year>
              <month>
                <xsl:value-of select="substring(.,5,2)"/>
              </month>
              <day>
                <xsl:value-of select="substring(.,7,2)"/>
              </day>
            </startdate>
            <starttime>
              <total>
              <xsl:value-of select="substring(.,10,4)"/>
              </total>
              <hour>
                <xsl:value-of select="substring(.,10,2)"/>
              </hour>
              <min>
                <xsl:value-of select="substring(.,12,2)"/>
              </min>
            </starttime>
          </xsl:when>
          <xsl:when test="name() = 'end'">
            <enddate>
              <total>
                <xsl:value-of select="substring(.,1,8)"/>
              </total>
              <year>
                <xsl:value-of select="substring(.,1,4)"/>
              </year>
              <month>
                <xsl:value-of select="substring(.,5,2)"/>
              </month>
              <day>
                <xsl:value-of select="substring(.,7,2)"/>
              </day>
            </enddate>

            <endtime>
              <total>
              <xsl:value-of select="substring(.,10,4)"/>
              </total>
              <hour>
                <xsl:value-of select="substring(.,10,2)"/>
              </hour>
              <min>
                <xsl:value-of select="substring(.,12,2)"/>
              </min>
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
    <xsl:for-each select="$calendar/event">
    <xsl:sort select="startdate/total" data-type="number" />
    <xsl:if test="categories = 'Prüfung' and startdate/total > $currentDate">
    <tr>
      <td class="date-btn"> 
        <details>
          <summary><xsl:value-of select="summary"/></summary>
          <p> <xsl:value-of select="starttime/hour"/>:<xsl:value-of select="starttime/min"/> - <xsl:value-of select="endtime/hour"/>:<xsl:value-of select="endtime/min"/></p>
          <p><xsl:value-of select="categories"/> </p>
        </details>
      </td>
    </tr>
    </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="Termine">
    <xsl:for-each select="$calendar/event">
    <xsl:sort select="startdate/total" data-type="number" />
    <xsl:if test="categories = 'Sonstiger Termin' and startdate/total > $currentDate ">
      <tr>
        <td class="date-btn">
          <details>
            <summary><xsl:value-of select="summary" /></summary>
            <p><xsl:value-of select="categories"/> </p>
          </details>
        </td>
      </tr>  
    </xsl:if>
    </xsl:for-each>

  </xsl:template>

</xsl:stylesheet>