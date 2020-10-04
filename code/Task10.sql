CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `vbzdat`.`task10_view` AS
select
    `h`.`GPS_Latitude` AS `lat`,
    `h`.`GPS_Longitude` AS `lng`,
    `h2`.`halt_lang` AS `name`,
    '#ff0000' AS `color`,
    `a`.`delay` AS `note`
from
    (((`vbzdat`.`haltepunkt` `h`
join `vbzdat`.`haltestelle` `h2` on
    ((`h`.`halt_id` = `h2`.`halt_id`)))
join `vbzdat`.fahrzeiten_soll_ist fsi on
    (( h.haltepunkt_id = `a`.`haltepunkt_id`)))
join `vbzdat`.`linie` `l` on
    ((`a`.`fahrweg_id` = `l`.`fahrweg_id`)))
order by
    `a`.`delay`
limit 20;