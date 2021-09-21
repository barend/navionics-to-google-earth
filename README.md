Converts Navionics traces into KML for Google Earth.

## Usage

1. install [xmlstarlet][xmlstar] (brew install xmlstarlet)
2. export Navionics traces in GPX format
3. run `xml tr navionics2earth.xslt gpx/trace.gpx > kml/trace.kml`

[xmlstar]: https://xmlstar.sourceforge.io/

## Documentation

- [developers.google.com/kml/documentation/kmlreference](https://developers.google.com/kml/documentation/kmlreference)
