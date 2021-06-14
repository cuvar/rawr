<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" href="../style/index.css" />
      </head>

      <body>
        <!-- left side -->
        <div class="container-main">
          <div class="title-container">
            <p class="title">Rawr</p>
            <img src="Pictures/logo.png" id="logo"></img>
          </div>

          <div class="content-container">
            <xsl:foreach select="university/year/course">
              <p>
                <xsl:value-of select="name" />
              </p>
            </xsl:foreach>
          </div>
        </div>
        
        <!-- right side -->
        <div class="container-right">
          <div class="login-container">
            <p>Login</p>
          </div>
          <div class="motto-container" >
            <p>Motto</p>
          </div>
        </div>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
