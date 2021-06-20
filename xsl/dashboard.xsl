<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
                <tr>
                  <td class="date-btn">
                    <details>
                      <summary>Mathe</summary>
                      <p>12:00 - 15:00 Uhr</p>
                    </details>
                  </td>
                </tr>
                <tr>
                  <td class="date-btn">
                    <details>
                      <summary>Info</summary>
                      <p>12:00 - 15:00 Uhr</p>
                    </details>
                  </td>
                </tr>
                <tr>
                  <td class="date-btn">
                    <details>
                      <summary>Theo</summary>
                      <p>12:00 - 15:00 Uhr</p>
                    </details>
                  </td>
                </tr>
                <tr>
                  <td class="date-btn"> 
                    <details>
                      <summary>Digitalt.</summary>
                      <p>12:00 - 15:00 Uhr</p>
                    </details>
                  </td>
                </tr>
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
                <tr>
                  <td class="date-btn">
                    <details>
                      <summary>Mathe</summary>
                      <p>12:00 - 14:00 Uhr</p>
                    </details>
                  </td>
                </tr>
                <tr>
                  <td class="date-btn">
                    <details>
                      <summary>AI-Labor</summary>
                      <p>Lol</p>
                    </details>
                  </td>
                </tr>
                <tr>
                  <td class="date-btn">
                    <details>
                      <summary>Party</summary>
                      <p>Fette Fete</p>
                    </details>
                  </td>
                </tr>
              </table>
            </div>
          </div>
        </div>

        <!-- main content on left side -->
        <div class="container-main">
        <!-- banner -->
          <div class="banner">
            <div class="banner-left">
              <img class="homebutton" src="res/home-solid.svg" alt=""/>
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
              <img class="nav-btn" src="res/angle-left-solid.svg" alt=""/>
              <a href="#"></a>
              <img class="nav-btn" src="res/angle-right-solid.svg" alt=""/>
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
                  <td>
                    <div class="calendar_day"><p>1</p></div>
                    <div class="timetable_content">
                        <div class="timetable">Mathe Montag Lul</div>
                        <div class="timetable">Mathe Montag Lul</div>
                    </div>
                  </td>        
                  <td>
                    <div class="calendar_day"><p>1</p></div>
                    <div class="timetable_content">
                        <div class="timetable">Mathe Montag Lul</div>
                        <div class="timetable">Mathe Montag Lul</div>
                    </div>
                  </td>        
                  <td>
                    <div class="calendar_day"><p>1</p></div>
                    <div class="timetable_content">
                        <div class="timetable">Mathe Montag Lul</div>
                        <div class="timetable">Mathe Montag Lul</div>
                    </div>
                  </td>        
                  <td>
                    <div class="calendar_day"><p>1</p></div>
                    <div class="timetable_content">
                        <div class="timetable">Mathe Montag Lul</div>
                        <div class="timetable">Mathe Montag Lul</div>
                    </div>
                  </td>        
                  <td>
                    <div class="calendar_day"><p>1</p></div>
                    <div class="timetable_content">
                        <div class="timetable">Mathe Montag Lul</div>
                        <div class="timetable">Mathe Montag Lul</div>
                    </div>
                  </td>        
                  <td>
                    <div class="calendar_day"><p>1</p></div>
                    <div class="timetable_content">
                        <div class="timetable">Mathe Montag Lul</div>
                        <div class="timetable">Mathe Montag Lul</div>
                    </div>
                  </td>        
                  <td>
                    <div class="calendar_day"><p>1</p></div>
                    <div class="timetable_content">
                        <div class="timetable">Mathe Montag Lul</div>
                        <div class="timetable">Mathe Montag Lul</div>
                    </div>
                  </td>        
                </tr>
              </table>
            </div>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>