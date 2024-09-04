/*

In this project, we would like to study trends in
frequency of particular crimes over time and in different
regions of NY. Eventually, we would also like to analyze 
what correlations we see in certain socioeconomic factors 
across different NY and the amount of crime per capita. 
In order to do so, we must combine disparate tables
so that they can be more organized and the data more
accessible. 

*/
SELECT
        nibrs_incident_2020.data_year,
        nibrs_incident_2020.agency_id,
        nibrs_incident_2020.incident_id,
        nibrs_incident_2020.nibrs_month_id,
        nibrs_month_2020.month_num,
        nibrs_offender_2020.age_num,
        nibrs_offender_2020.sex_code,
        ref_race_2020.race_code


FROM
    nibrs_incident_2020

LEFT JOIN agencies_2020
    ON nibrs_incident_2020.agency_id = agencies_2020.agency_id
LEFT JOIN nibrs_month_2020
    ON nibrs_incident_2020.nibrs_month_id = nibrs_month_2020.nibrs_month_id
LEFT JOIN nibrs_offender_2020
    ON nibrs_incident_2020.incident_id = nibrs_offender_2020.incident_id
LEFT JOIN ref_race_2020
    ON nibrs_offender_2020.race_id = ref_race_2020.race_id
    

UNION ALL
SELECT
        nibrs_incident_2021.data_year,
        nibrs_incident_2021.agency_id,
        incident_id,
        nibrs_incident_2021.nibrs_month_id,
        nibrs_month_2021.month_num

FROM
    nibrs_incident_2021

LEFT JOIN agencies_2021
    ON nibrs_incident_2021.agency_id = agencies_2021.agency_id
LEFT JOIN nibrs_month_2021
    ON nibrs_incident_2021.nibrs_month_id = nibrs_month_2021.nibrs_month_id

LIMIT 1000;
