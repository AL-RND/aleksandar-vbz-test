CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `vbzdat`.`task7_view` AS
select
    `fsi`.`linie` AS `linie`,
    `fsi`.`richtung` AS `richtung`,
    `fsi`.`fahrzeug` AS `fahrzeug`,
    `fsi`.`kurs` AS `kurs`,
    `fsi`.`seq_von` AS `seq_von`,
    `fsi`.`halt_id_von` AS `halt_id_von`,
    `fsi`.`halt_id_nach` AS `halt_id_nach`,
    `fsi`.`halt_punkt_id_von` AS `halt_punkt_id_von`,
    `fsi`.`halt_punkt_id_nach` AS `halt_punkt_id_nach`,
    `fsi`.`fahrt_id` AS `fahrt_id`,
    `fsi`.`fahrweg_id` AS `fahrweg_id`,
    `fsi`.`fw_no` AS `fw_no`,
    `fsi`.`fw_typ` AS `fw_typ`,
    `fsi`.`fw_kurz` AS `fw_kurz`,
    `fsi`.`fw_lang` AS `fw_lang`,
    `fsi`.`betriebs_datum` AS `betriebs_datum`,
    `fsi`.`datumzeit_soll_an_von` AS `datumzeit_soll_an_von`,
    `fsi`.`datumzeit_ist_an_von` AS `datumzeit_ist_an_von`,
    `fsi`.`datumzeit_soll_ab_von` AS `datumzeit_soll_ab_von`,
    `fsi`.`datumzeit_ist_ab_von` AS `datumzeit_ist_ab_von`,
    `fsi`.`datum__nach` AS `datum__nach`,
    timediff(`fsi`.`datumzeit_soll_an_von`,
    `fsi`.`datumzeit_ist_an_von`) AS `timediff_an`,
    timestampdiff(SECOND,
    `fsi`.`datumzeit_soll_an_von`,
    `fsi`.`datumzeit_ist_an_von`) AS `timediff_an_seconds`,
    timediff(`fsi`.`datumzeit_soll_ab_von`,
    `fsi`.`datumzeit_ist_ab_von`) AS `timediff_ab`,
    timestampdiff(SECOND,
    `fsi`.`datumzeit_soll_ab_von`,
    `fsi`.`datumzeit_ist_ab_von`) AS `timediff_ab_seconds`,
    timestampdiff(SECOND,
    `fsi`.`datumzeit_soll_an_von`,
    `fsi`.`datumzeit_soll_ab_von`) AS `halt_soll_time_seconds`,
    timestampdiff(SECOND,
    `fsi`.`datumzeit_ist_an_von`,
    `fsi`.`datumzeit_ist_ab_von`) AS `halt_ist_time_seconds`
from
    `vbzdat`.`fahrzeiten_soll_ist` `fsi`
limit 40000