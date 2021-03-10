--CALL FILE_TABLE('/Users/stefan/sources/awa_stromversorgungssicherheit/data/netz7.shp', 'netz7');
--CALL FILE_TABLE('/Users/stefan/sources/awa_stromversorgungssicherheit/data/netz5.shp', 'netz5');
--CALL FILE_TABLE('/Users/stefan/sources/awa_stromversorgungssicherheit/data/netz3.shp', 'netz3');


SELECT DISTINCT 
	BETREIBER 
FROM 
	NETZ7
WHERE
	ARCHIVE = 0
AND 
	BETREIBER != '' 
	
UNION ALL

SELECT DISTINCT 
	BETREIBER 
FROM 
	NETZ5
WHERE
	ARCHIVE = 0
AND 
	BETREIBER != '' 

UNION ALL

SELECT DISTINCT 
	BETREIBER 
FROM 
	NETZ3
WHERE
	ARCHIVE = 0
AND 
	BETREIBER != '' 
;
