<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" href="../style/index.css" />
      </head>

      <body>

        <div class="container-right">
          <div class="klausur">
            <p>Klausuren</p>
          </div>
          <div class="termine" >
            <p>Termine</p>
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
            <!-- <p class="calendar_p">September</p> -->
          </div>
        </div>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
