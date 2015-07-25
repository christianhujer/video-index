<?xml version="1.0"?>
<xsl:transform
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
>

    <xsl:output
        method="xml"
    />

    <xsl:template match="videos">
        <html>
            <head>
                <title>Videos</title>
                <style type="text/css">
html {
    font-family: Sans-Serif;
}
h1, h2, h3 {
    clear: both;
    text-align: center;
}
div {
    width: 384px;
    height: 216px;
    float: left;
    text-align: center;
    margin: 2em;
    background-size: 384px 216px;
}
div h4 a {
    background-color: rgba(0, 0, 0, 0.5);
    border-radius: 1ex;
    padding: 1ex;
    color: white;
}
                </style>
            </head>
            <body>
                <h1>Videos</h1>
                <xsl:apply-templates />
            </body>
        </html>
    </xsl:template>

    <xsl:template match="video">
        <xsl:choose>
            <xsl:when test="preceding-sibling::video[1]/@series = @series"/>
            <xsl:when test="@series = ''" />
            <xsl:otherwise>
                <h2><xsl:value-of select="@series"/></h2>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="preceding-sibling::video[1]/@subseries = @subseries"/>
            <xsl:when test="@subseries = ''" />
            <xsl:otherwise>
                <h3><xsl:value-of select="@subseries"/></h3>
            </xsl:otherwise>
        </xsl:choose>
        <div style="background-image: url(.thumbnails/{@href}.jpg)" href="{@href}" onclick="javascript:window.location.href='{@href}'">
            <h4><a href="{@href}"><xsl:value-of select="@title"/></a></h4>
        </div>
    </xsl:template>

</xsl:transform>
