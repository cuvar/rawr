<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" href="../style/dashboard.css" />
      </head>

      <body>

        <div class="container-right">
          <div class="klausur">
            <div class="klausuren_top">
              <p class="label_text">Klausuren</p>
            </div>
          </div>
          <div class="termine" >
            <div class="termine_top">
              <p class="label_text">Termine</p>
            </div>
          </div>
        </div>
        <div class="container-main">
          <div class="banner">
            <img class="homebutton" src="Pictures/home-solid.svg" alt=""/>
            <div class="class">
              <p>TINF20B2</p>
            </div> 
            <div class="dropdown">
              <button class="dropbtn">Wochenansicht</button>
              <div class="dropdown-content">
                <a href="#">Wochenansicht</a>
                <a href="#">Monatsansicht</a>
              </div>
            </div> 
          </div>
          <div class="calendar">
            <div class="calendar_top">
              <a href="#"></a><img style="width: 30px" src="Pictures/angle-left-solid.svg" alt=""/>
              <a href="#"></a> <img style="width: 30px" src="Pictures/angle-right-solid.svg" alt=""/>
            </div>
            <div class="calendar_main">
              <table>
                <tr class="lol">
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
                    Mathe
                  </td>        
                  <td>
                    Mathe
                  </td>        
                  <td>
                    LUL
                  </td>        
                  <td>
                    Mathe
                  </td>        
                  <td>
                    Mathe
                  </td>        
                  <td>
                    Mathe
                  </td>        
                  <td>
                    Mathe
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
