<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type = "text/xsl" href="xsl/index.xsl"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" href="../style/index.css" />
      </head>

      <body>
        <h1>Project RAWR</h1>
        <table>
          <tr class="tr-title">
            <th>Name</th>
            <th>Group</th>
            <th>Company</th>
            <th>Joined</th>
            <th>Join-Date</th>
            <th>Join-Time</th>
          </tr>
          <xsl:for-each select="staff/employee">
            <tr>
              <td>
                <xsl:value-of select="name" />
              </td>
              <td>
                <xsl:value-of select="group" />
              </td>
              <td>
                <xsl:value-of select="company" />
              </td>
              <td>
                <xsl:value-of select="joined" />
              </td>
              <xsl:call-template name="FormatTimestamp">
                <xsl:with-param name="Timestamp" select="joined"/>
              </xsl:call-template>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template name="FormatTimestamp">
    <xsl:param name="Timestamp" />
    <td>
      <xsl:value-of select="substring($Timestamp,1,8)"/>
    </td>
    <td>
      <xsl:value-of select="substring($Timestamp,10,6)"/>
    </td>
  </xsl:template>
</xsl:stylesheet>
