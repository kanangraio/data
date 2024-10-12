# MySQL Database Notes

- While it preferable to use `CREATE SCHEMA` for MySQL over `CREATE DATABASE` the later is used for maximum cross compatibility
- Only MySQL supports the column COMMENTS syntax and is therefore not used, e.g. `COMMENT 'ISO2';
- While MySQL enables a `KEY` syntax within a `CREATE TABLE` these are performed as separate `CREATE INDEX` commands for maximum cross compatibility
- While MySQL support Foreign Key Constraints, many choose not to define them. They are defined in these examples for maximum compatibility.
- While it is more efficient to use `INT UNSIGNED` in MySQL for a primary key, for improved compatibility only `INT` is used.
