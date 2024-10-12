\! echo "Creating location tables"

\! echo "..continent"
CREATE TABLE continent(
  continent_id  CHAR(2) NOT NULL,
  name          VARCHAR(20) NOT NULL,
  PRIMARY KEY (continent_id)
);

\! echo "..country Based of ISO-3166"
CREATE TABLE country (
  country_id       CHAR(2) NOT NULL,            -- 'ISO2',
  name             VARCHAR(100) NOT NULL,
  continent_id     CHAR(2) NOT NULL,
  iso_official     BOOLEAN NOT NULL DEFAULT 1,
  iso3             CHAR(3) NULL,
  wikipedia_url    VARCHAR(100) NOT NULL,
  capital          VARCHAR(60) NULL,
  region           VARCHAR(20) NULL,
  sub_region       VARCHAR(50) NULL,
  PRIMARY KEY (country_id),
  CONSTRAINT fk_country_continent_id FOREIGN KEY (continent_id) REFERENCES continent(continent_id)
);

CREATE INDEX idx_country_name ON country (name);

\! echo "..country_subdivision (ISO-3166-2)"
CREATE TABLE country_subdivision (
  subdivision_id   CHAR(6) NOT NULL,
  country_id       CHAR(2) NOT NULL,
  name             VARCHAR(100) NOT NULL,
  PRIMARY KEY (subdivision_id),
  CONSTRAINT fk_country_subdivision_country_id FOREIGN KEY (country_id) REFERENCES country(country_id)
);

CREATE INDEX idx_country_id ON country_subdivision (country_id);

\! echo "..country_state"
CREATE TABLE country_state (
  country_id       CHAR(2) NOT NULL,         --  COMMENT 'ISO2'
  state_id         VARCHAR(3) NOT NULL,
  name             VARCHAR(100) NOT NULL,
  capital          VARCHAR(100) NULL,
  PRIMARY KEY(country_id, state_id),
  CONSTRAINT fk_country_state_country_id FOREIGN KEY (country_id) REFERENCES country(country_id)
);

CREATE INDEX idx_country_state_country_id ON country_state (country_id);

\! echo "..osm_place"
CREATE TABLE osm_place(
  place_id   INT NOT NULL,
  name       VARCHAR(500) NOT NULL,
  latitude   DECIMAL(14,10) NOT NULL,
  longitude  DECIMAL(14,10) NOT NULL,
  country_id CHAR(2) NULL,
  osm_type   VARCHAR(10) NOT NULL,
  address    JSON NOT NULL,
  PRIMARY KEY(place_id),
  CONSTRAINT fk_place_country_id FOREIGN KEY (country_id) REFERENCES country(country_id)
);

CREATE INDEX idx_place_country_id ON osm_place (country_id);

-- SHOW TABLES
SELECT table_name FROM information_schema.tables WHERE table_schema=DATABASE();
