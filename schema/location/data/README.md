
# OPTIONALLY ENCLOSED BY '"'
```
SELECT * FROM continent INTO OUTFILE '/var/lib/mysql-files/continent.tsv' FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n';
SELECT * FROM country INTO OUTFILE '/var/lib/mysql-files/country.tsv' FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n';
SELECT * FROM country_state INTO OUTFILE '/var/lib/mysql-files/country_state.tsv' FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n';
SELECT * FROM country_subdivision INTO OUTFILE '/var/lib/mysql-files/country_subdivision.tsv' FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n';
SELECT * FROM osm_place INTO OUTFILE '/var/lib/mysql-files/osm_place.tsv' FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n';
```
