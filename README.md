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

## Combine multiple GPX files into a single KML

To combine multiple Navionics traces into a single project, use a manifest file. I went a bit overboard with the XML here, so a schema is included. My XML is a bit rusty a decade after the Great WS:* Backlash, so the namespace stuff works a bit awkwardly in a way I don't entirely understand.

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<m:files xmlns:m="https://github.com/barend/navionics-to-google-earth/multi"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="https://github.com/barend/navionics-to-google-earth/multi multi.xsd">
    <file name="gpx/2021-09-05.gpx"/>
    <file name="gpx/2021-09-06.gpx"/>
    <file name="gpx/2021-09-07.gpx"/>
</m:files>
```

To generate the KML project:

```bash
xml tr multi.xslt manifest.xml > kml/multi.kml
```

## Documentation

- [developers.google.com/kml/documentation/kmlreference](https://developers.google.com/kml/documentation/kmlreference)
