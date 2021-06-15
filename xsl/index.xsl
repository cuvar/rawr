<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type = "text/xsl" href="xsl/index.xsl"?>
<xsl:stylesheet version="1.0"
  xmlns:ext="http://exslt.org/common"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <!-- Preprocessing -->
    <xsl:variable name="staffRtf">
      <xsl:apply-templates select="staff/employee"/>
    </xsl:variable>
    <!-- Convert RTF (result-tree-fragment) to node-set -->
    <xsl:variable name="staff" select="ext:node-set($staffRtf)"/>

    <!-- Display -->
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
          <xsl:for-each select="$staff1/employee">
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
              <td>
                <xsl:value-of select="joinedDate" />
              </td>
              <td>
                <xsl:value-of select="joinedTime" />
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="staff/employee">
    <employee>
      <xsl:for-each select="*">
        <xsl:choose>
          <xsl:when test="name() = 'joined'">
            <joinedDate>
              <xsl:value-of select="substring(.,1,8)"/>
            </joinedDate>
            <joinedTime>
              <xsl:value-of select="substring(.,10,6)"/>
            </joinedTime>
          </xsl:when>
          <xsl:otherwise>
            <xsl:copy-of select="."/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </employee>
  </xsl:template>
</xsl:stylesheet>
