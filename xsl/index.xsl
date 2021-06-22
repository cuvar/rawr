<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type = "text/xsl" href="xsl/index.xsl"?>
<xsl:stylesheet version="1.0"
  xmlns:ext="http://exslt.org/common"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" href="../style/index.css" />
      </head>

      <body>
        <xsl:variable name="Value">
            <xsl:call-template name="Test">
              <xsl:with-param name="var">
              11
              </xsl:with-param>
          </xsl:call-template>
        </xsl:variable>

        <h1>Project RAWR</h1>
        <table>
          <tr class="tr-title">
          <h2> 
            <xsl:value-of select="$Value" />
          </h2>
          
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="Test">
    <xsl:param name="var"/>
    <xsl:choose>
    <xsl:when test="$var > 10">
    10
    </xsl:when>
    <xsl:otherwise>
    0
    </xsl:otherwise>
    </xsl:choose>

      
  </xsl:template>

  
  
</xsl:stylesheet>
