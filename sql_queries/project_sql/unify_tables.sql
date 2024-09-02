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
        incident_id,
        nibrs_month_id,
        cargo_theft_flag,
        submission_date,
        incident_date,
        report_date_flag,
        incident_hour
        cleared_except_id,
        cleared_except_date,
        data_home,
        orig_format,
        did
FROM
    nibrs_incident_2020

LEFT JOIN agencies_2020
    ON nibrs_incident_2020.agency_id = agencies_2020.agency_id
UNION ALL
SELECT
        nibrs_incident_2021.data_year,
        nibrs_incident_2021.agency_id,
        incident_id,
        nibrs_month_id,
        cargo_theft_flag,
        submission_date,
        incident_date,
        report_date_flag,
        incident_hour
        cleared_except_id,
        cleared_except_date,
        data_home,
        orig_format,
        did
FROM
    nibrs_incident_2021

LEFT JOIN agencies_2021
    ON nibrs_incident_2021.agency_id = agencies_2021.agency_id

LIMIT 100;
