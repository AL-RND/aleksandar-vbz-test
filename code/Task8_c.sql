CREATE TABLE linie (PRIMARY KEY (fahrweg_id)) as SELECT DISTINCT 
fsi.linie,
fsi.richtung, 
fsi.fw_no,
fsi.fw_lang, 
fahrweg_id
FROM
fahrzeiten_soll_ist fsi
where fsi.linie ='2';