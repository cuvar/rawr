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
          </div>
          <div class="calendar">
            <!-- <table width="100%" border="5" height="80%">
              <tr>
                <td>Row 1</td>
                <td>Row 1</td>
                <td>Row 1</td>
                <td>Row 1</td>
                <td>Row 1</td>
                <td>Row 1</td>
                <td>Row 1</td>
              </tr>
            </table>               -->
          </div>
        </div>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
