SELECT DISTINCT 
	fsi.linie,
	fsi.fahrt_id,
	fsi.datum_von,
	fsi.halt_kurz_von1,
	fsi.datumzeit_soll_ab_von,
	DATE_FORMAT(fsi.datumzeit_soll_ab_von, '%H:%I') zeit_ab
FROM 
	vbzdat.fahrzeiten_soll_ist fsi 
where fsi.linie ='2';