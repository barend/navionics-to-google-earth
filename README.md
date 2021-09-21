Converts Navionics traces into KML for Google Earth.

## Usage

1. install [xmlstarlet][xmlstar] (brew install xmlstarlet)
2. export Navionics traces in GPX format
3. run `xml tr navionics2earth.xslt gpx/trace.gpx > kml/trace.kml`

[xmlstar]: https://xmlstar.sourceforge.io/

## Descriptions

Navionics doesn't add any `<desc>` elements to the generated GPX files. You may want to add these by hand if you wish: they'll be included in the KML as descriptions. These will show up in Google Earth as an info balloon.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx xmlns="http://www.topografix.com/GPX/1/1" version="1.1" creator="Navionics Boating App">
  <metadata>
    <link href="http://www.navionics.com"/>
  </metadata>
  <trk>
    <name>Name of the Track in Navionics</name>
    <!-- Add the description after the name, use CDATA to include HTML -->
    <desc><![CDATA[<h1>Title</h1><p>Description</p>]]></desc>
  </trk>
</gpx>
```

## Documentation

- [developers.google.com/kml/documentation/kmlreference](https://developers.google.com/kml/documentation/kmlreference)
