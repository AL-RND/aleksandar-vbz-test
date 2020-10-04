SELECT DISTINCT 
	h.GPS_Latitude as lat,
	h.GPS_Longitude as lng,
	h2.halt_lang as name,
	'#ff0000' as color,
	CONCAT('Haltepunkt ID:', fsi.halt_id_von, 'Distanz:', SQRT(POW((h.GPS_Latitude - 47.37753),2) + POW((h.GPS_Longitude - 8.54155),2))) AS note,
	SQRT(POW((h.GPS_Latitude - 47.37753),2) + POW((h.GPS_Longitude - 8.54155),2)) AS distanz
	
	
	
	
FROM 	
	vbzdat.fahrzeiten_soll_ist fsi 
INNER JOIN 
	vbzdat.haltepunkt h ON 
	fsi.halt_punkt_id_von = h.halt_punkt_id 
INNER JOIN 
	vbzdat.haltestelle h2 ON
	h.halt_id = h2.halt_id 
	
ORDER BY distanz

LIMIT 4;