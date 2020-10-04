CREATE TABLE ankunftszeiten

SELECT 
	fsi.halt_punkt_id_nach AS haltepunkt_id,
	fsi.fahrweg_id,
	fsi.fahrt_id,
	fsi.datumzeit_ist_an_nach AS datumzeit_ist_an,
	fsi.datumzeit_soll_an_nach AS datumzeit_soll_an,
	fsi.datumzeit_soll_ab_nach AS datumzeit_soll_ab,
	TIMESTAMPDIFF (second, datumzeit_soll_an_nach, datumzeit_ist_an_nach) as delay

FROM 
	vbzdat.fahrzeiten_soll_ist fsi

WHERE
	fsi.linie = 2

UNION 

SELECT 
	fsi.halt_punkt_id_nach AS haltepunkt_id,
	fsi.fahrweg_id,
	fsi.fahrt_id,
	fsi.datumzeit_ist_an_von AS datumzeit_ist_an,
	fsi.datumzeit_soll_an_von AS datumzeit_soll_an,
	fsi.datumzeit_soll_ab_von AS datumzeit_soll_ab,
	TIMESTAMPDIFF (SECOND, datumzeit_soll_an_nach, datumzeit_ist_an_nach) as delay
FROM 
	vbzdat.fahrzeiten_soll_ist fsi

WHERE 
	fsi.seq_von = 1
	AND fsi.linie = 2;

	
ALTER TABLE ankunftszeiten ADD id INT PRIMARY KEY AUTO_INCREMENT FIRST;


