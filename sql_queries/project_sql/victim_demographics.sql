/*

In this project, we would like to study trends in
frequency of particular crimes over time and in different
regions of NY. Eventually, we would also like to analyze 
what correlations we see in certain socioeconomic factors 
across different NY and the amount of crime per capita. 
In order to do so, we must combine disparate tables
so that they can be more organized and the data more
accessible. Here we gather victim demographics.

*/

SELECT
        nibrs_incident_2020.incident_id,
        nibrs_incident_2020.data_year,
        nibrs_month_2020.month_num,
        nibrs_victim_2020.age_num AS victim_age,
        nibrs_victim_2020.sex_code AS victim_gender,
        ref_race_2020.race_desc AS victim_race_name,
        nibrs_ethnicity_2020.ethnicity_name AS victim_ethnicity,
        nibrs_offense_type_2020.offense_name,
        CONCAT(agencies_2020.county_name,', ',agencies_2020.state_abbr) AS geographic_location

FROM
    nibrs_incident_2020

LEFT JOIN agencies_2020
    ON nibrs_incident_2020.agency_id = agencies_2020.agency_id
LEFT JOIN nibrs_month_2020
    ON nibrs_incident_2020.nibrs_month_id = nibrs_month_2020.nibrs_month_id
LEFT JOIN nibrs_victim_2020
    ON nibrs_incident_2020.incident_id = nibrs_victim_2020.incident_id
LEFT JOIN nibrs_victim_type_2020
    ON nibrs_victim_2020.victim_type_id = nibrs_victim_type_2020.victim_type_id
LEFT JOIN ref_race_2020
    ON nibrs_victim_2020.race_id = ref_race_2020.race_id
LEFT JOIN nibrs_ethnicity_2020
    ON nibrs_victim_2020.ethnicity_id = nibrs_ethnicity_2020.ethnicity_id
LEFT JOIN nibrs_offense_2020
    ON nibrs_victim_2020.incident_id = nibrs_offense_2020.incident_id
LEFT JOIN nibrs_offense_type_2020
    ON nibrs_offense_2020.offense_type_id = nibrs_offense_type_2020.offense_type_id

WHERE
    nibrs_victim_type_2020.victim_type_name = 'Individual'
    
UNION ALL
SELECT
        nibrs_incident_2021.incident_id,
        nibrs_incident_2021.data_year,
        nibrs_month_2021.month_num,
        CAST(nibrs_victim_2021.age_num AS SMALLINT) AS victim_age,
        nibrs_victim_2021.sex_code AS victim_gender,
        ref_race_2021.race_desc AS victim_race_name,
        nibrs_ethnicity_2021.ethnicity_name AS victim_ethnicity,
        nibrs_offense_type_2021.offense_name,
        CONCAT(agencies_2021.county_name,', ',agencies_2021.state_abbr) AS geographic_location



FROM
    nibrs_incident_2021

LEFT JOIN agencies_2021
    ON nibrs_incident_2021.agency_id = agencies_2021.agency_id
LEFT JOIN nibrs_month_2021
    ON nibrs_incident_2021.nibrs_month_id = nibrs_month_2021.nibrs_month_id
LEFT JOIN nibrs_victim_2021
    ON nibrs_incident_2021.incident_id = nibrs_victim_2021.incident_id
LEFT JOIN nibrs_victim_type_2021
    ON nibrs_victim_2021.victim_type_id = nibrs_victim_type_2021.victim_type_id
LEFT JOIN ref_race_2021
    ON nibrs_victim_2021.race_id = ref_race_2021.race_id
LEFT JOIN nibrs_ethnicity_2021
    ON nibrs_victim_2021.ethnicity_id = nibrs_ethnicity_2021.ethnicity_id
LEFT JOIN nibrs_offense_2021
    ON nibrs_victim_2021.incident_id = nibrs_offense_2021.incident_id
LEFT JOIN nibrs_offense_type_2021
    ON nibrs_offense_2021.offense_code = nibrs_offense_type_2021.offense_code

WHERE
    nibrs_victim_type_2021.victim_type_name = 'Individual'
    
