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
    <xsl:apply-templates select="calendar/event" />
  </xsl:variable>
  <!-- Convert RTF (result-tree-fragment) to node-set -->
  <xsl:variable name="precalendar" select="ext:node-set($calendarRtf)" />

  <xsl:variable name="secondCalendarRtf">
    <xsl:call-template name="secondPreProcessing" />
  </xsl:variable>

  <xsl:variable name="calendar" select="ext:node-set($secondCalendarRtf)" />



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
                  <a href="index.php?mode=month">Monatsansicht</a>
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
                  <a href="index.php?mode=month">
                    <img class="nav-btn" src="res/angle-left-solid.svg" alt="Previous Week"/>
                  </a>
                  <a href="index.php?mode=month">
                    <img class="nav-btn" src="res/angle-right-solid.svg" alt="Next Week"/>
                  </a>
                </div>

                <div class="calendar-month">
                  <p> 
                    <xsl:call-template name="getMonthName">
                        <xsl:with-param name="date" select="$timeframestart"/>
                    </xsl:call-template>
                  </p>
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
                    :
                    <xsl:value-of select="starttime/min"/>
                    -
                    <xsl:value-of select="endtime/hour"/>
                    :
                    <xsl:value-of select="endtime/min"/>
                  </p>
                </div>
              </xsl:when>
              <xsl:when test="categories = 'Sonstiger Termin'">
                <div class="timetable" style="background-color: grey;  {concat('height:',$duration ,'em;')}">
                  <xsl:value-of select="summary" />
                  <p>
                    <xsl:value-of select="starttime/hour"/>
                    :
                    <xsl:value-of select="starttime/min"/>
                    -
                    <xsl:value-of select="endtime/hour"/>
                    :
                    <xsl:value-of select="endtime/min"/>
                  </p>
                </div>
              </xsl:when>
              <xsl:otherwise>
                <div class="timetable" style=" {concat('height:',$duration ,'em;')}">
                  <xsl:value-of select="summary" />
                  <p>
                    <xsl:value-of select="starttime/hour"/>
                    : 
                    <xsl:value-of select="starttime/min"/>
                    -
                    <xsl:value-of select="endtime/hour"/>
                    :
                    <xsl:value-of select="endtime/min"/>
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

  <!--creats a String with the name of the Day -->
  <xsl:template name="getMonthName">
    <xsl:param name="date"/>
    <xsl:variable name="month">
      <xsl:value-of select="substring($date,5,2)"/>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$month = 1">Januar</xsl:when>
      <xsl:when test="$month = 2 " >Februar</xsl:when>
      <xsl:when test="$month = 3 " >März</xsl:when>
      <xsl:when test="$month = 4 ">April</xsl:when>
      <xsl:when test="$month = 5 ">Mai</xsl:when>
      <xsl:when test="$month = 6 ">Juni</xsl:when>
      <xsl:when test="$month = 7 ">Juli</xsl:when>
      <xsl:when test="$month = 8">August</xsl:when>
      <xsl:when test="$month = 9">September</xsl:when>
      <xsl:when test="$month = 10">Oktober</xsl:when>  
      <xsl:when test="$month = 11" >November</xsl:when>
      <xsl:when test="$month = 12" >Dezember</xsl:when>
      <xsl:otherwise>Error: Month doesn't exist</xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!--adds one day to a given date-->
  <xsl:template name="addDay">
    <xsl:param name="date" />

    <xsl:variable name="day">
      <xsl:value-of select="substring($date,7,2)" />
    </xsl:variable>
    <xsl:variable name="days">
      <xsl:call-template name="getDaysInMonth">
        <xsl:with-param name="date" select="$date" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:choose>

      <xsl:when test="$day &lt; $days">
        <xsl:variable name="addedDays" select="$date + 1" />
        <xsl:value-of select="$addedDays" />
      </xsl:when>

      <xsl:otherwise>
        <xsl:variable name="addedYearDate">
          <xsl:call-template name="addYear">
            <xsl:with-param name="date" select="$date" />
            <xsl:with-param name="number" select="1" />
          </xsl:call-template>
        </xsl:variable>

        <xsl:choose>
          <xsl:when test="$addedYearDate = $date">
            <xsl:variable name="addedDays" select="($date +(73 -($day + 2 -30) ))"/>
            <xsl:value-of select="$addedDays" />
          </xsl:when>

          <xsl:otherwise>
            <xsl:value-of select="$addedYearDate" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>

    <!--adds a week to a given date-->
  <xsl:template name="addWeek">
    <xsl:param name="date" />

    <xsl:variable name="day">
      <xsl:value-of select="substring($date,7,2)" />
    </xsl:variable>
    <xsl:variable name="days">
      <xsl:call-template name="getDaysInMonth">
        <xsl:with-param name="date" select="$date" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:choose>

      <xsl:when test="($day +7) &lt;= $days">

        <xsl:variable name="addedDays" select="$date + 7" />
        <xsl:value-of select="$addedDays" />
      </xsl:when>
      <xsl:otherwise>

        <xsl:variable name="addedYearDate">
          <xsl:call-template name="addYear">
            <xsl:with-param name="date" select="$date" />
            <xsl:with-param name="number" select="7" />
          </xsl:call-template>
        </xsl:variable>

        <xsl:choose>
          <xsl:when test="$addedYearDate = $date">
            <xsl:variable name="addedDays" select="($date +(76 +(31 - $days) ))" />
            <xsl:value-of select="$addedDays" />
          </xsl:when>

          <xsl:otherwise>
            <xsl:value-of select="$addedYearDate" />
          </xsl:otherwise>
        </xsl:choose>

      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!--adds a week to a given date-->
  <xsl:template name="subtractWeek">
    <xsl:param name="date" />

    <xsl:variable name="day">
      <xsl:value-of select="substring($date,7,2)" />
    </xsl:variable>
    <xsl:variable name="days">
      <xsl:call-template name="getDaysInMonth">
        <xsl:with-param name="date" select="$date - 100" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:choose>

      <xsl:when test="($day -7) &gt;= 1">
        <xsl:variable name="addedDays" select="$date - 7" />
        <xsl:value-of select="$addedDays" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="subtractedYearDate">
          <xsl:call-template name="subtractYear">
            <xsl:with-param name="date" select="$date" />
            <xsl:with-param name="number" select="7" />
          </xsl:call-template>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="$subtractedYearDate = $date">
            <xsl:variable name="addedDays" select="($date -(76 +(31 - $days) ))" />
            <xsl:value-of select="$addedDays" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$subtractedYearDate" />
          </xsl:otherwise>
        </xsl:choose>

        
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- add year at the end of the year -->
  <xsl:template name="addYear">
    <xsl:param name="date" />
    <xsl:param name="number"/>

    <xsl:variable name="day">
      <xsl:value-of select="substring($date,7,2)" />
    </xsl:variable>

    <xsl:variable name="days">
      <xsl:call-template name="getDaysInMonth">
        <xsl:with-param name="date" select="$date" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="year">
      <xsl:value-of select="substring($date,1,4)" />
    </xsl:variable>

    <xsl:variable name="month">
      <xsl:value-of select="substring($date,5,2)" />
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="($month = 12) and ($days &lt;= ($day + $number))">
        <xsl:variable name="addedYear" select="$date + 8869 + $number" />
        <xsl:value-of select="$addedYear" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$date" />
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>

  <xsl:template name="subtractYear">
    <xsl:param name="date" />
    <xsl:param name="number"/>

    <xsl:variable name="day">
      <xsl:value-of select="substring($date,7,2)" />
    </xsl:variable>

    <xsl:variable name="days">
      <xsl:call-template name="getDaysInMonth">
        <xsl:with-param name="date" select="$date" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="year">
      <xsl:value-of select="substring($date,1,4)" />
    </xsl:variable>

    <xsl:variable name="month">
      <xsl:value-of select="substring($date,5,2)" />
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="($month = 1) and ($day -$number) &lt; 1">
        <xsl:variable name="subYear" select="$date - (8869 + $number)" />
        <xsl:value-of select="$subYear" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$date" />
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
                <xsl:value-of select="starttime/hour"/>:<xsl:value-of select="starttime/min"/>
                -                
                <xsl:value-of select="endtime/hour"/>:<xsl:value-of select="endtime/min"/>
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

  <!--changes Time to adaped to Timezone and addes dutation to each event-->
  <xsl:template name="secondPreProcessing">
      <xsl:for-each select="$precalendar/event">
        <xsl:variable name="year" select="startdate/year"/>
        <!--calculating on the day off daylightsaving starts and ends startin at year 2000-->
        <xsl:variable name="summerttimestart" select="(31 - ((($year - 1995) + (($year - 2000) div 4)) mod 7) + ($year * 10000) + 300)"/>
        <xsl:variable name="summerttimeend" select="(31 - ((($year - 1998) + (($year - 2000) div 4)) mod 7) + ($year * 10000)+ 1000)"/>
        <xsl:variable name="startdate" select="startdate/total"/>
        <xsl:variable name="enddate" select="enddate/total"/>
      <event>
        <xsl:for-each select="*">
          <xsl:choose>
            <xsl:when test="name() = 'starttime'">
              <xsl:choose>
                <xsl:when test=" $startdate &gt;= $summerttimestart and $startdate &lt; $summerttimeend">
                  <starttime>
                    <total>
                      <xsl:value-of select="total + 200" />
                    </total>
                    <hour>
                      <xsl:value-of select="hour + 2" />
                    </hour>
                    <min>
                      <xsl:value-of select="min" />
                    </min>
                  </starttime>
                </xsl:when>
                <xsl:otherwise>
                  <starttime>
                    <total>
                      <xsl:value-of select="total + 100" />
                    </total>
                    <hour>
                      <xsl:value-of select="hour + 1" />
                    </hour>
                    <min>
                      <xsl:value-of select="min" />
                    </min>
                  </starttime>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:when test="name() = 'endtime'">
              <xsl:choose>
                <xsl:when test=" $enddate &gt;= $summerttimestart and $enddate &lt; $summerttimeend">
                  <endtime>
                    <total>
                      <xsl:value-of select="total + 200" />
                    </total>
                    <hour>
                      <xsl:value-of select="hour + 2" />
                    </hour>
                    <min>
                      <xsl:value-of select="min" />
                    </min>
                  </endtime>
                </xsl:when>
                <xsl:otherwise>
                  <endtime>
                    <total>
                      <xsl:value-of select="total + 100" />
                    </total>
                    <hour>
                      <xsl:value-of select="hour + 1" />
                    </hour>
                    <min>
                      <xsl:value-of select="min" />
                    </min>
                  </endtime>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
              <xsl:copy-of select="." />
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
        <duration>
        <xsl:value-of select="(endtime/total - starttime/total)div 15" />
        </duration>
      </event>
      </xsl:for-each>
    
  </xsl:template>

</xsl:stylesheet>