<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" href="../style/index.css" />
        <link rel="shortcut icon" type="image/jpg" href="Pictures/favicon.ico"/>
      </head>

      <body>
        <!-- left side -->
        <div class="container-main">
          <div class="title-container">
            <h1 class="title">Rawr</h1>
            <img src="Pictures/logo.png" id="logo" width="150" height="auto"></img>
          </div>

          <div class="content-container">
            <div class="row-container">
              <xsl:for-each select="elements/university/year">
                <div class="row">
                  <xsl:for-each select="course">
                    <button class="course-btn">
                      <xsl:value-of select="name" />
                    </button>
                  </xsl:for-each>
                </div>
              </xsl:for-each>
            </div>
          </div>
        </div>

        <!-- right side -->
        <div class="container-right">
          <!-- login container -->
          <div class="login-container">
            <div class="form-container">
              <div class="form-wrapper">
                <div class="form-row">
                  <div class="form-column">
                    <label>Username</label>
                    <label>Password</label>
                  </div>
                  <div class="form-column">
                    <input id="user-input" type="text" />
                    <input id="password-input" type="password" />
                  </div>
                </div>
                <div class="form-row">
                  <button>Login</button>
                </div>
              </div>
            </div>
          </div>

          <!-- motto container -->
          <div class="motto-container">
            <h2 id="date">
              <xsl:value-of select="elements/day" />
            </h2>
            <p id="motto-text">
              <xsl:value-of select="elements/motto" />
            </p>
          </div>
        </div>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
