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

ORDER BY
	fsi.linie = 2;

