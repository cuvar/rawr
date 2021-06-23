<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type = "text/xsl" ?>
<xsl:stylesheet version="1.0"
  xmlns:ext="http://exslt.org/common"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:date="http://exslt.org/dates-and-times">

  <xsl:variable name="timeframestart" select="20210510"/>
  <xsl:variable name="timeframeend" select="20210516"/>
  <xsl:variable name="currentDate" select="20210510"/>
  <xsl:variable name="currentYear">
    <xsl:value-of select="substring($currentDate,1,4)"/>
  </xsl:variable>

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
          <div class="exams">
            <div class="exams-top">
              <p class="side-title">Klausuren</p>
            </div>
            <div class="exams-main">
              <div style="width:100%; height:160px; overflow:auto;">
                <table cellspacing="0" cellpadding="1" width="200">
                  <xsl:call-template name="Klausuren"/>
                </table>
              </div>
            </div>
          </div>



          <!-- termine view -->
          <div class="appointments">
            <div class="appointments-top">
              <p class="side-title">Termine</p>
            </div>
            <div class="appointments-main">
              <div style="width:100%; height: 160px; overflow:auto;">
                <table cellspacing="0" cellpadding="1" width="200">
                  <xsl:call-template name="Termine"/>
                </table>
              </div>
            </div>
          </div>
        </div>

        <!-- main content on left side -->
        <div class="container-main">
          <!-- banner -->
          <div class="banner">
            <div class="banner-left">
              <a href="index.xml">
                <img class="homebutton" src="res/home-solid.svg" alt="Home"/>
              </a>

              <div class="class">
                <p>TINF20B2</p>
              </div>
            </div>
            <div class="banner-right">
              <div class="dropdown">
                <button class="dropbtn">Monatsansicht</button>
                <div class="dropdown-content">
                  <a href="dashboardMonth.xml">Monatsansicht</a>
                  <hr/>
                  <a href="dashboard.xml">Wochenansicht</a>
                </div>
              </div>
            </div>
          </div>

          <!-- calender view -->
          <div class="calendar">
            <div class="calendar-top">
              <div id="banner-left-wrapper">
                <div>
                  <a href="#">
                    <img class="nav-btn" src="res/angle-left-solid.svg" alt="Previous Wee"/>
                  </a>
                  <a href="#">
                    <img class="nav-btn" src="res/angle-right-solid.svg" alt="Next Week"/>
                  </a>
                </div>

                <div class="calendar-month">
                  <p>September</p>
                </div>
              </div>

              <div id="banner-right-wrapper">
                <button class="icon-buttons">
                  <img src="res/download-solid.svg" alt="Download ical"/>
                </button>
                <button class="icon-buttons">
                  <img src="res/plus-solid.svg" alt="Add Note"/>
                </button>
              </div>
            </div>


            <div class="calendar-main">
              <div class="table-head-fixed">
                <table>
                  <thead>
                    <tr id="calendar-header">
                      <th>Montag</th>
                      <th>Dienstag</th>
                      <th>Mittwoch</th>
                      <th>Donnerstag</th>
                      <th>Freitag</th>
                      <th>Samstag</th>
                      <th>Sonntag</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <!-- <xsl:call-template name="Loop"/> -->
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>


      </body>
    </html>
  </xsl:template>


  <!--Loops through a week-->
  <xsl:template name="Loop">
    <xsl:param name="index" select="$timeframestart" />
    <xsl:param name="maxValue" select="$timeframeend" />
    <td>
      <div class="calendar-day">
        <p>
          <!--to Do bessere Lösung finden-->
          <xsl:value-of select="substring($index,7,2)"/>
        </p>
      </div>
      <div class="timetable-content">
        <xsl:for-each select="$calendar/event">
          <xsl:sort select="starttime/total" data-type="number" />

          <xsl:if test="startdate/total = $index">
            <xsl:variable name="duration" select="(endtime/total - starttime/total)div 15"/>
            <xsl:choose>
              <xsl:when test="categories = 'Prüfung'">
                <div class="timetable" style="background-color:#FB3640;  {concat('height:',$duration ,'em;')}">
                  <xsl:value-of select="summary" />
                  <p>
                    <xsl:value-of select="starttime/hour"/>
:                    <xsl:value-of select="starttime/min"/>
 -                    <xsl:value-of select="endtime/hour"/>
:                    <xsl:value-of select="endtime/min"/>
                  </p>
                </div>
              </xsl:when>
              <xsl:when test="categories = 'Sonstiger Termin'">
                <div class="timetable" style="background-color: grey;  {concat('height:',$duration ,'em;')}">
                  <xsl:value-of select="summary" />
                  <p>
                    <xsl:value-of select="starttime/hour"/>
:                    <xsl:value-of select="starttime/min"/>
 -                    <xsl:value-of select="endtime/hour"/>
:                    <xsl:value-of select="endtime/min"/>
                  </p>
                </div>
              </xsl:when>
              <xsl:otherwise>
                <div class="timetable" style=" {concat('height:',$duration ,'em;')}">
                  <xsl:value-of select="summary" />
                  <p>
                    <xsl:value-of select="starttime/hour"/>
:                    <xsl:value-of select="starttime/min"/>
 -                    <xsl:value-of select="endtime/hour"/>
:                    <xsl:value-of select="endtime/min"/>
                  </p>
                </div>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
        </xsl:for-each>
      </div>
    </td>

    <xsl:if test="$index &lt; $maxValue">
      <!--Function call to get the number of added Days-->
      <xsl:variable name="addedDays">
        <xsl:call-template name="addDay">
          <xsl:with-param name="date" select="$index" />
        </xsl:call-template>
      </xsl:variable>
      <!--Loop call to generate the next Day-->
      <xsl:call-template name="Loop">
        <xsl:with-param name="index" select="$addedDays"/>
        <xsl:with-param name="maxValue" select="$maxValue" />
      </xsl:call-template>
    </xsl:if>
  </xsl:template>



  <!--returns how many days a month has-->
  <xsl:template name="getDaysInMonth">
    <xsl:param name="date"/>
    <xsl:variable name="month">
      <xsl:value-of select="substring($date,5,2)"/>
    </xsl:variable>
    <xsl:variable name="year">
      <xsl:value-of select="substring($date,3,2)"/>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="$month = 1">
        31
      </xsl:when>
      <xsl:when test="$month = 2">
        <xsl:choose>
          <xsl:when test="$year mod 4 = 0">
          29
          </xsl:when>
          <xsl:otherwise>
          28
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$month = 3 ">
          31
      </xsl:when>
      <xsl:when test="$month = 4 ">
        30
        
      </xsl:when>
      <xsl:when test="$month = 5">
        31
      </xsl:when>
      <xsl:when test="$month = 6 ">
        30
      </xsl:when>
      <xsl:when test="$month = 7 ">
        31
      </xsl:when>
      <xsl:when test="$month = 8 ">
        31
      </xsl:when>
      <xsl:when test="$month = 9 ">
        30
      </xsl:when>
      <xsl:when test="$month = 10">
        31
      </xsl:when>
      <xsl:when test="$month = 11">
        30
      </xsl:when>
      <xsl:otherwise>
        31
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!--adds one day to a given date-->
  <xsl:template name="addDay">
    <xsl:param name="date"/>

    <xsl:variable name="day">
      <xsl:value-of select="substring($date,7,2)"/>
    </xsl:variable>
    <xsl:variable name="days">
      <xsl:call-template name="getDaysInMonth">
        <xsl:with-param name="date" select="$date" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:choose>

      <xsl:when test = "$day &lt; $days">
        <xsl:variable name="addedDays" select="$date + 1"/>
        <xsl:value-of select="$addedDays"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="addedDays" select="($date +(73 -($day + 2 -30) ))"/>
        <xsl:value-of select="$addedDays"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <!--returns all Events with "Prüfung" as their categorie-->
  <xsl:template name="Klausuren">
    <xsl:for-each select="$calendar/event">
      <xsl:sort select="startdate/total" data-type="number" />
      <xsl:if test="categories = 'Prüfung' and startdate/total > $currentDate">
        <tr>
          <td class="date-btn td-main">
            <details>
              <summary>
                <xsl:value-of select="summary"/>
              </summary>
              <p>
                <xsl:value-of select="starttime/hour"/>
:                <xsl:value-of select="starttime/min"/>
-                <xsl:value-of select="endtime/hour"/>
:                <xsl:value-of select="endtime/min"/>
              </p>
              <p>Raum: <xsl:value-of select="location"/>
              </p>
            </details>
          </td>
        </tr>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <!--returns all Events with "Sonstiger Termin" as their categorie-->
  <xsl:template name="Termine">
    <xsl:for-each select="$calendar/event">
      <xsl:sort select="startdate/total" data-type="number" />
      <xsl:if test="categories = 'Sonstiger Termin' and startdate/total > $currentDate and startdate/year = $currentYear">
        <tr>
          <td class="date-btn td-main">
            <details>
              <summary>
                <xsl:value-of select="summary" />
              </summary>
              <p>
                <xsl:value-of select="startdate/total"/>
              </p>
            </details>
          </td>
        </tr>
      </xsl:if>
    </xsl:for-each>

  </xsl:template>



  <!--returns RTF with splitted Date-->
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

</xsl:stylesheet>