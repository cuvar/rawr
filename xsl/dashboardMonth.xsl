<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" href="../style/dashboard.css" />
        <script src="/js.js"></script>
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
              <div class="exams" style="width:100%; height:200px; overflow:auto;">
                <table cellspacing="0" cellpadding="1" width="200">
                  <tr>
                  <td class="date-btn">
                    <details>
                      <summary>Mathee</summary>
                      <p>12:00 - 14:00 Uhr</p>
                    </details>
                  </td>
                  </tr>
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
                      <summary>Was ist los ? </summary>
                      <p>12:00 - 14:00 Uhr</p>
                    </details>
                  </td>
                  </tr>
                  <tr>
                  <td class="date-btn">
                    <details>
                      <summary>Party</summary>
                      <p>12:00 - 14:00 Uhr</p>
                    </details>
                  </td>
                  </tr>
                  <tr>
                  <td class="date-btn">
                    <details>
                      <summary>AI Labor</summary>
                      <p>12:00 - 14:00 Uhr</p>
                    </details>
                  </td>
                  </tr>
                  <tr>
                  <td class="date-btn">
                    <details>
                      <summary>AI Labor</summary>
                      <p>12:00 - 14:00 Uhr</p>
                    </details>
                  </td>
                  </tr>
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
              <div class="appointments" style="width:100%; height:200px; overflow:auto;">
                <table cellspacing="0" cellpadding="1" width="200">
                  <tr>
                  <td class="date-btn">
                    <details>
                      <summary>Mathee</summary>
                      <p>12:00 - 14:00 Uhr</p>
                    </details>
                  </td>
                  </tr>
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
                      <summary>Was ist los ? </summary>
                      <p>12:00 - 14:00 Uhr</p>
                    </details>
                  </td>
                  </tr>
                  <tr>
                  <td class="date-btn">
                    <details>
                      <summary>Party</summary>
                      <p>12:00 - 14:00 Uhr</p>
                    </details>
                  </td>
                  </tr>
                  <tr>
                  <td class="date-btn">
                    <details>
                      <summary>AI Labor</summary>
                      <p>12:00 - 14:00 Uhr</p>
                    </details>
                  </td>
                  </tr>
                  <tr>
                  <td class="date-btn">
                    <details>
                      <summary>AI Labor</summary>
                      <p>12:00 - 14:00 Uhr</p>
                    </details>
                  </td>
                  </tr>
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
                <img class="homebutton" src="res/home-solid.svg" alt=""/>
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

          <!-- calendar view -->
          <div class="calendar">
            <div class="calendar-top">
              <a href="#">
                <img class="nav-btn" src="res/angle-left-solid.svg" alt=""/>
              </a>
              <a href="#">
                <img class="nav-btn" src="res/angle-right-solid.svg" alt=""/>
              </a>
              <div class="calendar-month">
                <p>Septmeber</p>
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
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                    </tr>
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
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                    </tr>
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
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                    </tr>
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
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                    </tr>
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
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                    </tr>
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
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
                      <td>
                        <div class="calendar-day">
                          <p>1</p>
                        </div>
                        <div class="timetable-content">
                          <div class="timetable">Mathe Montag Lul</div>
                          <div class="timetable">Mathe Montag Lul</div>
                        </div>
                      </td>
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
</xsl:stylesheet>