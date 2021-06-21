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
                  <td class="date-btn td-main">
                    <details>
                      <summary>Mathee</summary>
                      <p>12:00 - 14:00 Uhr</p>
                    </details>
                  </td>
                  </tr>
                  <tr>
                  <td class="date-btn td-main">
                    <details>
                      <summary>Mathe</summary>
                      <p>12:00 - 14:00 Uhr</p>
                    </details>
                  </td>
                  </tr>
                  <tr>
                  <td class="date-btn td-main">
                    <details>
                      <summary>Was ist los ? </summary>
                      <p>12:00 - 14:00 Uhr</p>
                    </details>
                  </td>
                  </tr>
                  <tr>
                  <td class="date-btn td-main">
                    <details>
                      <summary>Party</summary>
                      <p>12:00 - 14:00 Uhr</p>
                    </details>
                  </td>
                  </tr>
                  <tr>
                  <td class="date-btn td-main">
                    <details>
                      <summary>AI Labor</summary>
                      <p>12:00 - 14:00 Uhr</p>
                    </details>
                  </td>
                  </tr>
                  <tr>
                  <td class="date-btn td-main">
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
                  <td class="date-btn td-main">
                    <details>
                      <summary>Mathee</summary>
                      <p>12:00 - 14:00 Uhr</p>
                    </details>
                  </td>
                  </tr>
                  <tr>
                  <td class="date-btn td-main">
                    <details>
                      <summary>Mathe</summary>
                      <p>12:00 - 14:00 Uhr</p>
                    </details>
                  </td>
                  </tr>
                  <tr>
                  <td class="date-btn td-main">
                    <details>
                      <summary>Was ist los ? </summary>
                      <p>12:00 - 14:00 Uhr</p>
                    </details>
                  </td>
                  </tr>
                  <tr>
                  <td class="date-btn td-main">
                    <details>
                      <summary>Party</summary>
                      <p>12:00 - 14:00 Uhr</p>
                    </details>
                  </td>
                  </tr>
                  <tr>
                  <td class="date-btn td-main">
                    <details>
                      <summary>AI Labor</summary>
                      <p>12:00 - 14:00 Uhr</p>
                    </details>
                  </td>
                  </tr>
                  <tr>
                  <td class="date-btn td-main">
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

          <!-- calender view -->
          <div class="calendar">
            <div class="calender-top">
              <a href="#">
                <img class="nav-btn" src="res/angle-left-solid.svg" alt=""/>
              </a>
              <a href="#">
                <img class="nav-btn" src="res/angle-right-solid.svg" alt=""/>
              </a>
              <div class="calender-month">
                <p>Septmeber</p>
              </div>
            </div>
            <table cellspacing="0" cellpadding="0" width="325">
              <tr>
                <td>
                   <table cellspacing="0" cellpadding="1" width="300">
                     <tr>
                        <th class="td-main">Montag</th>
                        <th class="td-main">Dienstag</th>
                        <th class="td-main">Mittwoch</th>
                        <th class="td-main">Donnerstag</th>
                        <th class="td-main">Freitag</th>
                        <th class="td-main">Samstag</th>
                        <th class="td-main">Sonntag</th>
                     </tr>
                   </table>
                </td>
              </tr>
              <tr>
                <td>
                   <div style="width:100%; height: 500; overflow:auto; margin-top:-10px;">
                     <table cellspacing="0" cellpadding="1">
                       <tr>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Me Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                      </tr>
                       <tr>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Me Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                      </tr>
                       <tr>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Me Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                      </tr>
                       <tr>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Me Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                      </tr>
                       <tr>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Me Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                      </tr>
                       <tr>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Me Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                        <td class="td-main">
                          <div class="calender-day">
                            <p>1</p>
                          </div>
                          <div class="timetable-content">
                            <div class="timetable">Mathe Montag Lul</div>
                            <div class="timetable">Mathe Montag Lul</div>
                          </div>
                        </td>
                      </tr>
                     </table>  
                   </div>
                </td>
              </tr>
            </table>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>