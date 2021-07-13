<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type = "text/xsl" href="xsl/index.xsl"?>
<xsl:stylesheet version="1.0" xmlns:ext="http://exslt.org/common" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:param name="currentDate" select="20210510" />

  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" href="../style/index.css" />
        <link rel="stylesheet" href="../style/general.css" />
        <link rel="shortcut icon" type="image/jpg" href="res/favicon.ico" />
        <script src="./js/app.js"></script>
      </head>

      <body onload="onLoadIndex()">
        <div id="easteregg-container">
          <img src="res/logo.png" id="easteregg"></img>
          <audio id="easteregg-audio">
            <source src="./res/roar.mp3" type="audio/mpeg"></source>
          </audio>
        </div>

        <!-- left side -->
        <div class="container-main">
          <div class="title-container">
            <h1 class="title">Rapla wildy refurbished</h1>
            <img src="res/logo.png" width="150" id="logo" onClick="triggerEasterEgg()"></img>
          </div>

          <div class="content-container">
            <div class="row-container">
              <xsl:for-each select="elements/university/year">
                <div class="row">
                  <xsl:for-each select="course">
                    <a class="course-btn" href="index.php?mode=week{concat('&amp;','class=',name)}">
                      <xsl:value-of select="name" />
                    </a>
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

              <form class="form-wrapper" id="login-container" action="php/login.php" method="post">
                <div class="form-row">
                  <div class="form-column">
                    <label>Username</label>
                    <label>Password</label>
                  </div>
                  <div class="form-column">
                    <input id="user-input" type="text" name="username" />
                    <input id="password-input" type="password" name="password" />
                  </div>
                </div>
                <div class="form-row">
                  <input type="submit" class="submit-btn login-btn" value="Login"></input>
                </div>
              </form>

              <form class="form-wrapper" id="logout-container" action="php/logout.php" method="post">
                <div class="form-row">
                  <input type="submit" class="submit-btn logout-btn" value="Logout"></input>
                </div>
              </form>

            </div>
          </div>

          <!-- motto container -->
          <div class="motto-container">
            <h2 id="date">

              <xsl:value-of select="substring($currentDate,7,2)" />.<xsl:value-of select="substring($currentDate,5,2)" />.<xsl:value-of select="substring($currentDate,1,4)" />
            </h2>
            <xsl:variable name="number" select="$currentDate mod 7" />
            <xsl:for-each select="elements/mottos/motto">
              <p id="motto-text">
                <xsl:if test="index = $number">
                  <xsl:value-of select="text" />
                </xsl:if>
              </p>
            </xsl:for-each>
          </div>
        </div>

      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>