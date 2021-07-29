<!--adds one day to a given date-->
<xsl:template name="addDay">
    <xsl:param name="date" />

    <xsl:variable name="day">
        <xsl:value-of select="substring($date,7,2)" />
    </xsl:variable>
    <xsl:variable name="days">
        <xsl:call-template name="getDaysInMonth">
            <xsl:with-param name="date" select="$date" />
        </xsl:call-template>
    </xsl:variable>
    <xsl:choose>

        <xsl:when test="$day &lt; $days">
            <xsl:variable name="addedDays" select="$date + 1" />
            <xsl:value-of select="$addedDays" />
        </xsl:when>

        <xsl:otherwise>
            <xsl:variable name="addedYearDate">
                <xsl:call-template name="addYear">
                    <xsl:with-param name="date" select="$date" />
                </xsl:call-template>
            </xsl:variable>

            <xsl:choose>
                <xsl:when test="not($addedYearDate = $date)">
                    <xsl:value-of select="$addedYearDate" />
                </xsl:when>

                <xsl:otherwise>
                    <xsl:variable name="addedDays" select="($date +(73 -($day + 2 -30) ))" />
                    <xsl:value-of select="$addedDays" />
                </xsl:otherwise>
            </xsl:choose>

        </xsl:otherwise>
    </xsl:choose>

</xsl:template>