# Public Data Sources

This repository contains public data sources that can be used with Kanangra I/O schemas.

## core
- Link
- Category
- Country
- CountryState
- Position
- Location

## meta
- Entity
- EntityAttribute
- EntityRelationship

## product
- Product

# Data Formats
The following different data formats are used for various sources of data

- csv
- tsv
- geojson

# Tools

## TSV to JSON online converter
https://onlinetsvtools.com/convert-tsv-to-json

## Viewing TSV files cleanly

  $ FILE=link.tsv
  $ column -t -s $'\t'  ${FILE}
