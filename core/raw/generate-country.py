#!/usr/bin/env python

import pandas as pd
from pandas import DataFrame

def country_iso_3166() -> DataFrame:
  file = 'country-iso-3166.csv'
  df = pd.read_csv(file)
  df = df.drop(columns=['country-code','iso_3166-2','region-code','sub-region-code','intermediate-region-code', 'intermediate-region'], axis=1)
  print(f"Read {df.shape[0]} rows, {df.shape[1]} columns from {file}")
  return df

def country_capitals() -> DataFrame:
  file = 'country-capitals.csv'
  df = pd.read_csv(file)
  df = df.drop(columns=['CountryName', 'ContinentName'], axis=1)
  df = df.rename(columns={"CapitalName": "capital", 'CapitalLatitude': "latitude", "CapitalLongitude" : "longitude", "CountryCode" : "alpha-2"})
  df.head()
  print(f"Read {df.shape[0]} rows, {df.shape[1]} columns from {file}")
  return df

def main() -> None:
  country1 = country_iso_3166()
  country2 = country_capitals()

  country = country1.merge(country2)
  file = '../country.tsv'
  print(f"Writing {country.shape[0]} rows, {country.shape[1]} columns to {file}")

  country.to_csv(file, sep='\t', index=False)


if __name__ == "__main__":
  main()
