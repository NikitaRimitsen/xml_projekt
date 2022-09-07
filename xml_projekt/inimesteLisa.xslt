<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" encoding="utf-8" indent="yes"/>

    <xsl:template match="/">
      Esimene inimene:
      <xsl:value-of select="/inimesed/inimene[1]/eesnimi"/>
      <br/>
      Viimane inimene:
      <xsl:value-of select="/inimesed/inimene[last()]/eesnimi"/>
      <br/>
      Esitäht:
      <xsl:value-of select="substring(/inimesed/inimene[last()]/eesnimi,1,1)"/>
      <br/>
      Oma initsialid:
      <xsl:value-of select="concat(
                    substring(/inimesed/inimene[1]/eesnimi,1,1),'. ',
                    substring(/inimesed/inimene[1]/perenimi,1,1),'.')"/>
      <br/>
      Oma ees ja perenimi pikkus on:
      <xsl:value-of select="
                    string-length(/inimesed/inimene[1]/eesnimi)+
                    string-length(/inimesed/inimene[1]/perenimi)"/>
      <br/>
      Mitu inimest on xml failis?
      <xsl:value-of select="count(/inimesed/inimene)"/>
      <br/>
      Mitu inimest on sündinud 2004 aastal?
      <xsl:value-of select="count(/inimesed/inimene[synd=2004])"/>
      <br/>
      Mitu inimest on sündinud pärast 2002?
      <xsl:value-of select="count(/inimesed/inimene[synd &gt; 2003])"/>
      <br/>
      Kordused - näitame kõik perekonnanimed ja sünniaastad
      <ul>
        <xsl:for-each select="/inimesed/inimene">
          <li>
            <xsl:value-of select="concat(
                          perenimi, ', ', synd)"/>
          </li>
        </xsl:for-each>     
      </ul>
      <br/>
      1. Näidata kõik nimed mis algavad A tähega
      <ul>
        <xsl:for-each select="/inimesed/inimene[substring(eesnimi,1,1)='A']">
            <xsl:value-of select="eesnimi"/>, 
        </xsl:for-each>
      </ul>
      2. Näita kõik viimased perenimi tähed
      <ul>
        <xsl:for-each select="/inimesed/inimene">
          <xsl:value-of select="substring(perenimi,string-length(perenimi),1)"/>,
        </xsl:for-each>
      </ul>
      
      
      <br/>
      3. Inimesed, kes on sündinud pärast 2002. aastat, kuvavad nime esitähte ja sünniaastat
      <ul>
      <xsl:for-each select="/inimesed/inimene[synd &gt; 2002]">
        <li>
        <xsl:value-of select="concat(
                          substring(eesnimi,1,1), ' - ', synd)"/>
        </li>
      </xsl:for-each>
    </ul>
      
      
    </xsl:template>
</xsl:stylesheet>
