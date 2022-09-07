<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        1. Kõik nimed süüniaastate järjekorras
        <ul>
          <xsl:for-each select="//inimene">
            <xsl:sort select="synniaasta"/>
            <li>
              <xsl:value-of select="concat(nimi, ', ', synniaasta)"/>
            </li>
          </xsl:for-each>
        </ul>
      --------
      <ul>
      <xsl:for-each select="//inimene">
        <xsl:sort select="@synd"/>
        <li>
          <xsl:value-of select="concat(nimi, ', ', @synd)"/>
        </li>
      </xsl:for-each>
    </ul>
      --------
      <strong>
        2. Näidata lastele tema vanema
      </strong>
      <xsl:for-each select="//inimene">
        <xsl:sort select="synniaasta"/>
        <li>
          <xsl:value-of select ="nimi"/>
          <xsl:if test="../..">
            -lapsevanem
          <xsl:value-of select="../../nimi"/>
          </xsl:if>
        </li>
      </xsl:for-each>
      ---------
      <strong>
        3. Näitame iga vanemale lapsete kogus
      </strong>
      <xsl:for-each select="//inimene[lapsed]">
        <xsl:sort select="lapsed/inimene/synniaasta" order="descending"/>
        <li>
          <xsl:value-of select ="nimi"/>
          , 
          <xsl:value-of select="count(lapsed/inimene)"/>
          <xsl:if test="count(lapsed/inimene)=1">
            -laps
          </xsl:if>
          <xsl:if test="not(count(lapsed/inimene)=1)">
            -last
          </xsl:if>
        </li>
      </xsl:for-each>
      -----------
      <strong>
      4. Vanem: laps1, laps2
    </strong>
    <xsl:for-each select="//inimene[lapsed]">
      <li>
        <xsl:value-of select ="nimi"/>: 
          <xsl:value-of select ="lapsed/inimene"/>
        <xsl:value-of select ="nimi"/>, 
      </li>
    </xsl:for-each>
      <br></br>
      <strong>
        1. Отобразить людей у которых количество символов в имени совпадает(если таких нету, то добавить)
      </strong>
      <xsl:for-each select="//inimene">
        <li>
          <xsl:if test="string-length(nimi)=string-length(/inimene[7]/nimi)">
            <xsl:value-of select="nimi"/>
          </xsl:if>
          
        </li>
      </xsl:for-each>
      <br></br>
      <strong>
        2. Отобразить людей у которых, первая цифра их возраста совпадает(если таких нету, то добавить)
      </strong>
      <xsl:for-each select="//inimene">
        <li>
          <xsl:if test="@synd=1948">
            <xsl:value-of select="nimi"/> 
            <xsl:value-of select="synniaasta"/>
          </xsl:if>

        </li>
      </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
