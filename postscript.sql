COMMENT ON SCHEMA
    awa_stromversorgungssicherheit
IS
    'Erfassungsmodell der Netzgebiete (Stromversorgungssicherheit)'
;
CREATE ROLE awa_stromversorgungssicherheit_read
;
CREATE ROLE awa_stromversorgungssicherheit_write
;
GRANT USAGE ON SCHEMA awa_stromversorgungssicherheit TO awa_stromversorgungssicherheit_write, awa_stromversorgungssicherheit_read
;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA awa_stromversorgungssicherheit TO awa_stromversorgungssicherheit_write
;
GRANT SELECT ON ALL TABLES IN SCHEMA awa_stromversorgungssicherheit TO awa_stromversorgungssicherheit_read, gretl
;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA awa_stromversorgungssicherheit TO awa_stromversorgungssicherheit_write, gretl
;
GRANT awa_stromversorgungssicherheit_read TO bjsvw
;
GRANT awa_stromversorgungssicherheit_write TO bjsvw, gdi_write
;
