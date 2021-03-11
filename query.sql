--CALL SHPRead('/Users/stefan/sources/awa_stromversorgungssicherheit/data/netz7.shp', 'netz7');
--CALL SHPRead('/Users/stefan/sources/awa_stromversorgungssicherheit/data/netz5.shp', 'netz5');
--CALL SHPRead('/Users/stefan/sources/awa_stromversorgungssicherheit/data/netz3.shp', 'netz3');

--CALL FILE_TABLE('/Users/stefan/sources/awa_stromversorgungssicherheit/data/netz7.shp', 'netz7');
--CALL FILE_TABLE('/Users/stefan/sources/awa_stromversorgungssicherheit/data/netz5.shp', 'netz5');
--CALL FILE_TABLE('/Users/stefan/sources/awa_stromversorgungssicherheit/data/netz3.shp', 'netz3');


DELETE FROM 
    SUPPLYSCY_RLDREAS_ORGANISATION
;

INSERT INTO 
    SUPPLYSCY_RLDREAS_ORGANISATION 
    (
        ANAME 
    ) 

SELECT DISTINCT 
    BETREIBER 
FROM 
    NETZ7
WHERE
    ARCHIVE = 0
AND 
    TRIM(BETREIBER) != ''
    
UNION 

SELECT DISTINCT 
    BETREIBER 
FROM 
    NETZ5
WHERE
    ARCHIVE = 0
AND 
    TRIM(BETREIBER) != ''

UNION 

SELECT DISTINCT 
    BETREIBER 
FROM 
    NETZ3
WHERE
    ARCHIVE = 0
AND 
    TRIM(BETREIBER) != ''
    
UNION ALL 

SELECT 
    'unbekannt'
;

DELETE FROM 
    SUPPLYSCY_RLDREAS_RULEDAREA_LEVEL7
;

INSERT INTO
    SUPPLYSCY_RLDREAS_RULEDAREA_LEVEL7 
    (
        AGEOMETRY,
        ANAME,
        CANTON,
        LEGALFORCE,
        OPERATOR 
    )
SELECT
    n7.THE_GEOM,
    n7.NAME,
    'SO' AS CANTON,
    'false' AS LEGALFORCE,
    organisation.t_id
FROM 
    ( 
        SELECT 
            THE_GEOM,
            OGC_FID,
            CASE 
                WHEN TRIM(NAME) = '' THEN NULL::text
                ELSE NAME 
            END NAME,
            CASE 
                WHEN TRIM(BETREIBER) = '' THEN 'unbekannt'
                ELSE BETREIBER 
            END AS BETREIBER 
        FROM 
            NETZ7
        WHERE 
            ARCHIVE = 0
    ) AS n7
    LEFT JOIN SUPPLYSCY_RLDREAS_ORGANISATION AS organisation 
    ON ORGANISATION.ANAME = n7.BETREIBER
;