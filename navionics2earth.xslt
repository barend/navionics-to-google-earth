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
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xmlns:gpx="http://www.topografix.com/GPX/1/1"
        xmlns:gx="http://www.google.com/kml/ext/2.2"
        xsi:schemaLocation="http://www.opengis.net/kml/2.2       http://schemas.opengis.net/kml/2.2.0/ogckml22.xsd
                            http://www.topografix.com/GPX/1/1    https://www.topografix.com/GPX/1/1/gpx.xsd
                            http://www.google.com/kml/ext/2.2    https://developers.google.com/kml/schema/kml22gx.xsd">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <kml xmlns="http://www.opengis.net/kml/2.2">
            <xsl:apply-templates select="gpx:gpx"/>
        </kml>
    </xsl:template>

    <xsl:template match="gpx:gpx">
        <Document>
            <Style id="route">
                <LineStyle>
                    <color>a02020ff</color>
                    <width>4</width>
                </LineStyle>
            </Style>
            <xsl:apply-templates select="gpx:trk"/>
        </Document>
    </xsl:template>

    <xsl:template match="gpx:trk">
        <Placemark>
            <name><xsl:value-of select="gpx:name"/></name>
            <xsl:apply-templates select="gpx:desc"/>
            <styleUrl>#route</styleUrl>
            <xsl:apply-templates select="gpx:trkseg"/>
        </Placemark>
    </xsl:template>

    <xsl:template match="gpx:desc">
        <description><xsl:value-of select="."/></description>
    </xsl:template>

    <xsl:template match="gpx:trkseg">
        <xsl:for-each select="gpx:extensions">
            <TimeSpan>
                <begin><xsl:value-of select="*[local-name()='navionics_start_time']"/></begin>
                <end><xsl:value-of select="*[local-name()='navionics_end_time']"/></end>
            </TimeSpan>
        </xsl:for-each>
        <gx:Track>
            <xsl:for-each select="gpx:trkpt">
                <when><xsl:value-of select="gpx:time"/></when>
            </xsl:for-each>
            <xsl:for-each select="gpx:trkpt">
                <gx:coord><xsl:value-of select="@lon"/><xsl:text xml:space="preserve"> </xsl:text><xsl:value-of select="@lat"/> 0</gx:coord>
            </xsl:for-each>
        </gx:Track>
    </xsl:template>


</xsl:stylesheet>
