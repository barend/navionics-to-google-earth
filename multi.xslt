<?xml version="1.0" encoding="utf-8" ?>
<!--
    Converts GPX data exported by the Navionics iOS app into KML format importable into Google Earth.

    Borrows from https://gist.github.com/wmanth/5413400 (downloaded 2021-09-21)


    Copyright 2021 Barend Garvelink

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
-->
<xsl:stylesheet
        version="1.0"
        xmlns="http://www.opengis.net/kml/2.2"
        xmlns:m="https://github.com/barend/navionics-to-google-earth/multi"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xmlns:gpx="http://www.topografix.com/GPX/1/1"
        xmlns:gx="http://www.google.com/kml/ext/2.2"
        xsi:schemaLocation="http://www.opengis.net/kml/2.2       http://schemas.opengis.net/kml/2.2.0/ogckml22.xsd
                            http://www.topografix.com/GPX/1/1    https://www.topografix.com/GPX/1/1/gpx.xsd
                            http://www.google.com/kml/ext/2.2    https://developers.google.com/kml/schema/kml22gx.xsd
                            https://github.com/barend/navionics-to-google-earth/multi multi.xsd">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />

    <xsl:include href="navionics2earth.xslt"/>

    <xsl:template match="/">
        <xsl:comment>combine</xsl:comment>
        <xsl:apply-templates/>
    </xsl:template>


    <xsl:template match="m:files">
        <xsl:comment>m:files</xsl:comment>
        <kml xmlns="http://www.opengis.net/kml/2.2">
            <Document>
                <xsl:call-template name="styleMap"/>
                <xsl:for-each select="*">
                    <xsl:comment><xsl:value-of select="@name"/></xsl:comment>
                    <xsl:apply-templates select="document(@name)/gpx:gpx/gpx:trk"/>
                </xsl:for-each>
            </Document>
        </kml>
    </xsl:template>
</xsl:stylesheet>
