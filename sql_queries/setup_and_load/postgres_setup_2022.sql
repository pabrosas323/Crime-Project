-- This file is used to setup the database tables and load the NIBRS
-- code lookup tables. It only needs to be run once before you load
-- any data tables using postgres_load.sql

SET statement_timeout = 0;
SET lock_timeout = 0;
-- SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';

CREATE TABLE agencies_2022 (
    yearly_agency_id integer,
    agency_id integer,
    data_year integer,
    ori character varying(25),
    legacy_ori character varying(25),
    covered_by_legacy_ori character varying(25),
    direct_contributor_flag character varying(1),
    dormant_flag character varying(1),
    dormant_year integer,
    reporting_type character varying(1),
    ucr_agency_name character varying(100),
    ncic_agency_name character varying(100),
    pub_agency_name character varying(100),
    pub_agency_unit character varying(100),
    agency_status character varying(1),
    state_id integer,
    state_name character varying(100),
    state_abbr character varying(2),
    state_postal_abbr character varying(2),
    division_code integer,
    division_name character varying(100),
    region_code integer,
    region_name character varying(100),
    region_desc character varying(100),
    agency_type_name character varying(100),
    population integer,
    submitting_agency_id integer,
    sai character varying(25),
    submitting_agency_name character varying(200),
    suburban_area_flag character varying(1),
    population_group_id integer,
    population_group_code character varying(2),
    population_group_desc character varying(100),
    parent_pop_group_code integer,
    parent_pop_group_desc character varying(100),
    mip_flag character varying(1),
    pop_sort_order integer,
    summary_rape_def character varying(1),
    pe_reported_flag character varying(1),
    male_officer integer,
    male_civilian integer,
    male_total integer,
    female_officer integer,
    female_civilian integer,
    female_total integer,
    officer_rate decimal,
    employee_rate decimal,
    nibrs_cert_date date,
    nibrs_start_date date,
    nibrs_leoka_start_date date,
    nibrs_ct_start_date date,
    nibrs_multi_bias_start_date date,
    nibrs_off_eth_start_date date,
    covered_flag character varying(1),
    county_name character varying(100),
    msa_name character varying(100),
    publishable_flag character varying(1),
    participated character varying(1),
    nibrs_participated character varying(1)
);

CREATE TABLE nibrs_activity_type_2022 (
activity_type_id smallint NOT NULL,
activity_type_code character(2),
activity_type_name character varying(100)
);

CREATE TABLE nibrs_age_2022 (
age_id smallint NOT NULL,
age_code character(2),
age_name character varying(100)
);

CREATE TABLE nibrs_arrest_type_2022 (
arrest_type_id smallint NOT NULL,
arrest_type_code character(1),
arrest_type_name character varying(100)
);

CREATE TABLE nibrs_assignment_type_2022 (
assignment_type_id smallint NOT NULL,
assignment_type_code character(1),
assignment_type_name character varying(100)
);

CREATE TABLE nibrs_bias_list_2022 (
bias_id smallint NOT NULL,
bias_code character(2),
bias_name character varying(100),
bias_desc character varying(100)
);

CREATE TABLE nibrs_location_type_2022 (
    location_id bigint NOT NULL,
    location_code character(2),
    location_name character varying(100)
);

CREATE TABLE nibrs_offense_type_2022 (
    offense_code character varying(5) NOT NULL,
    offense_name character varying(100),
    crime_against character varying(100),
    ct_flag character(1),
    hc_flag character(1),
    hc_code character varying(5),
    offense_category_name character varying(100),
    offense_group character(5)
);

CREATE TABLE nibrs_prop_desc_type_2022 (
    prop_desc_id smallint NOT NULL,
    prop_desc_name character varying(100),
    prop_desc_code character(2)
);

CREATE TABLE nibrs_victim_type_2022 (
    victim_type_id smallint NOT NULL,
    victim_type_code character(1),
    victim_type_name character varying(100)
);

CREATE TABLE nibrs_circumstances_2022 (
    circumstances_id smallint NOT NULL,
    circumstances_type character(1),
    circumstances_code smallint,
    circumstances_name character varying(100)
);

CREATE TABLE nibrs_cleared_except_2022 (
    cleared_except_id smallint NOT NULL,
    cleared_except_code character(1),
    cleared_except_name character varying(100),
    cleared_except_desc character varying(300)

);

CREATE TABLE nibrs_criminal_act_2022 (
    data_year int,
    criminal_act_id smallint NOT NULL,
    offense_id bigint NOT NULL
);

CREATE TABLE nibrs_criminal_act_type_2022 (
    criminal_act_id smallint NOT NULL,
    criminal_act_code character(1),
    criminal_act_name character varying(100),
    criminal_act_desc character varying(300)

);

CREATE TABLE nibrs_drug_measure_type_2022 (
    drug_measure_type_id smallint NOT NULL,
    drug_measure_code character(2),
    drug_measure_name character varying(100)
);

CREATE TABLE nibrs_ethnicity_2022 (
    ethnicity_id smallint NOT NULL,
    ethnicity_code character(1),
    ethnicity_name character varying(100)
);

CREATE TABLE nibrs_injury_2022 (
injury_id smallint NOT NULL,
injury_code character(1),
injury_name character varying(100)
);

CREATE TABLE nibrs_justifiable_force_2022 (
justifiable_force_id smallint NOT NULL,
justifiable_force_code character(1),
justifiable_force_name character varying(100)
);

CREATE TABLE nibrs_prop_loss_type_2022 (
prop_loss_id smallint NOT NULL,
prop_loss_name character varying(100),
prop_loss_desc character varying(250)
);

CREATE TABLE nibrs_relationship_2022 (
relationship_id smallint NOT NULL,
relationship_code character(2),
relationship_name character varying(100)
);

CREATE TABLE nibrs_suspected_drug_type_2022 (
suspected_drug_type_id smallint NOT NULL,
suspected_drug_code character(1),
suspected_drug_name character varying(100)
);

CREATE TABLE nibrs_using_list_2022 (
suspect_using_id smallint NOT NULL,
suspect_using_code character(1),
suspect_using_name character varying(100)
);


CREATE TABLE nibrs_weapon_type_2022 (
weapon_id smallint NOT NULL,
weapon_code character varying(3),
weapon_name character varying(100),
shr_flag character(1)
);

CREATE TABLE ref_race_2022 (
race_id smallint NOT NULL,
race_code character varying(2) NOT NULL,
race_desc character varying(100) NOT NULL,
sort_order smallint,
start_year smallint,
end_year smallint,
notes character varying(1000)
);

CREATE TABLE ref_state_2022 (
state_id smallint NOT NULL,
division_id smallint NOT NULL,
state_name character varying(100),
state_code character varying(2),
state_abbr character varying(2),
state_postal_abbr character varying(2),
state_fips_code character varying(2),
state_pub_freq_months smallint,
change_user character varying(100)
);

--
-- Main NIBRS tables
--

CREATE TABLE nibrs_arrestee_2022 (
data_year int,
arrestee_id bigint NOT NULL,
incident_id bigint NOT NULL,
arrestee_seq_num bigint,
arrest_date timestamp without time zone,
arrest_type_id smallint,
multiple_indicator character(1),
offense_code character varying(5) NOT NULL,
age_id smallint NOT NULL,
age_num smallint,
sex_code character(1),
race_id smallint NOT NULL,
ethnicity_id smallint,
resident_code character(1),
under_18_disposition_code character(1),
clearance_ind character(1),
age_range_low_num smallint,
age_range_high_num smallint
);

CREATE TABLE nibrs_arrestee_weapon_2022 (
data_year int,
arrestee_id bigint NOT NULL,
nibrs_arrestee_weapon_id bigint,
weapon_id smallint NOT NULL
);

CREATE TABLE nibrs_bias_motivation_2022 (
data_year int,
bias_id smallint NOT NULL,
offense_id bigint NOT NULL
);

CREATE TABLE nibrs_month_2022 (
data_year int,
nibrs_month_id bigint NOT NULL,
agency_id bigint NOT NULL,
month_num smallint NOT NULL,
inc_data_year int,
reported_status character varying(10),
report_date timestamp without time zone,
update_flag character(1) DEFAULT 'NULL'::bpchar,
orig_format character(1) DEFAULT 'NULL'::bpchar NOT NULL,
data_home character varying(10),
ddocname character varying(50),
did bigint,
month_pub_status int
);

COMMENT ON COLUMN nibrs_month_2022.orig_format IS 'This is the format the report was in when it was first submitted to the system.  F for Flat File, W for Web Form, U for IEPDXML Upload, S for IEPDXML Service, B for BPEL, N for null or unavailable, and M for Multiple. When summarizing NIBRS data into the _month tables, a single months data could come from multiple sources.  If so the entry will be M';

CREATE TABLE nibrs_incident_2022 (
	data_year int,
    agency_id bigint NOT NULL,
    incident_id bigint NOT NULL,
    nibrs_month_id bigint NOT NULL,
    cargo_theft_flag character(1),
    submission_date timestamp without time zone,
    incident_date timestamp without time zone,
    report_date_flag character(1),
    incident_hour smallint,
    cleared_except_id smallint NOT NULL,
    cleared_except_date timestamp without time zone,
    incident_status character varying(100), --smallint,
    data_home character(1),
    orig_format character(1),
    did bigint
);

COMMENT ON COLUMN nibrs_incident_2022.orig_format IS 'This is the format the report was in when it was first submitted to the system.  F for Flat File, W for Web Form, U for IEPDXML Upload, S for IEPDXML Service, B for BPEL, N for null or unavailable.';


CREATE TABLE nibrs_offender_2022 (
data_year int,
offender_id bigint NOT NULL,
incident_id bigint NOT NULL,
offender_seq_num smallint,
age_id smallint,
age_num character(3),
sex_code character(1),
race_id smallint,
ethnicity_id smallint,
age_range_low_num smallint,
age_range_high_num smallint
);

CREATE TABLE nibrs_offense_2022 (
data_year int,
offense_id bigint NOT NULL,
incident_id bigint NOT NULL,
offense_code character varying(5) NOT NULL,
attempt_complete_flag character(1),
location_id bigint NOT NULL,
num_premises_entered smallint,
method_entry_code character(1)
);

CREATE TABLE nibrs_property_2022 (
	data_year int,
    property_id bigint NOT NULL,
    incident_id bigint NOT NULL,
    prop_loss_id smallint NOT NULL,
    stolen_count smallint,
    recovered_count smallint
);

CREATE TABLE nibrs_property_desc_2022 (
    data_year int,
    property_id bigint NOT NULL,
    prop_desc_id smallint NOT NULL,
    property_value bigint,
    date_recovered timestamp without time zone,
    nibrs_prop_desc_id bigint
);

CREATE TABLE nibrs_suspect_using_2022 (
    data_year int,
    suspect_using_id smallint NOT NULL,
    offense_id bigint NOT NULL
);

CREATE TABLE nibrs_suspected_drug_2022 (
    data_year int,
    suspected_drug_type_id smallint NOT NULL,
    property_id bigint NOT NULL,
    est_drug_qty double precision,
    drug_measure_type_id smallint,
    nibrs_suspected_drug_id bigint NOT NULL
);

CREATE TABLE nibrs_victim_2022 (
    data_year int,
    victim_id bigint NOT NULL,
    incident_id bigint NOT NULL,
    victim_seq_num smallint,
    victim_type_id smallint NOT NULL,
    assignment_type_id smallint,
    activity_type_id smallint,
    outside_agency_id bigint,
    age_id smallint,
    age_num character varying(2),
    sex_code character(1),
    race_id smallint,
    ethnicity_id smallint,
    resident_status_code character(1),
    age_range_low_num smallint,
    age_range_high_num smallint
);

CREATE TABLE nibrs_victim_circumstances_2022 (
    data_year int,
    victim_id bigint NOT NULL,
    circumstances_id smallint NOT NULL,
    justifiable_force_id smallint
);

CREATE TABLE nibrs_victim_injury_2022 (
    data_year int,
    victim_id bigint NOT NULL,
    injury_id smallint NOT NULL
);

CREATE TABLE nibrs_victim_offender_rel_2022 (
    data_year int,
    victim_id bigint NOT NULL,
    offender_id bigint NOT NULL,
    relationship_id smallint NOT NULL,
    nibrs_victim_offender_id bigint
);

CREATE TABLE nibrs_victim_offense_2022 (
    data_year int,
    victim_id bigint NOT NULL,
    offense_id bigint NOT NULL
);

CREATE TABLE nibrs_weapon_2022 (
    data_year int,
    weapon_id smallint NOT NULL,
    offense_id bigint NOT NULL,
    nibrs_weapon_id bigint
);

--Create PKs and FKs
--PKS

  ALTER TABLE ONLY PUBLIC.NIBRS_SUSPECTED_DRUG_2022 ADD CONSTRAINT NIBRS_SUSPECTED_DRUG_PK_2022 PRIMARY KEY (NIBRS_SUSPECTED_DRUG_ID);;

  ALTER TABLE ONLY PUBLIC.NIBRS_RELATIONSHIP_2022 ADD CONSTRAINT NIBRS_RELATIONSHIP_PK_2022 PRIMARY KEY (RELATIONSHIP_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_DRUG_MEASURE_TYPE_2022 ADD CONSTRAINT NIBRS_DRUG_MEASURE_TYPE_PK_2022 PRIMARY KEY (DRUG_MEASURE_TYPE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_USING_LIST_2022 ADD CONSTRAINT NIBRS_SUSPECTED_USING_PK_2022 PRIMARY KEY (SUSPECT_USING_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_PROP_LOSS_TYPE_2022 ADD CONSTRAINT NIBRS_PROP_LOSS_TYPE_PK_2022 PRIMARY KEY (PROP_LOSS_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_ETHNICITY_2022 ADD CONSTRAINT NIBRS_ETH_PK_2022 PRIMARY KEY (ETHNICITY_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_PROPERTY_2022 ADD CONSTRAINT NIBRS_PROPERTY_PK_2022 PRIMARY KEY (PROPERTY_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_CRIMINAL_ACT_2022 ADD CONSTRAINT NIBRS_CRIMINAL_ACT_PK_2022 PRIMARY KEY (CRIMINAL_ACT_ID, OFFENSE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_OFFENSE_TYPE_2022 ADD CONSTRAINT NIBRS_OFFENSE_TYPE_PK_2022 PRIMARY KEY (offense_code);

  ALTER TABLE ONLY PUBLIC.NIBRS_CRIMINAL_ACT_TYPE_2022 ADD CONSTRAINT NIBRS_CRIMINAL_ACT_TYPE_PK_2022 PRIMARY KEY (CRIMINAL_ACT_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_PROPERTY_DESC_2022 ADD CONSTRAINT NIBRS_PROPERTY_DESC_PK_2022 PRIMARY KEY (property_id, prop_desc_id);

  ALTER TABLE ONLY PUBLIC.NIBRS_INCIDENT_2022 ADD CONSTRAINT NIBRS_INCIDENT_PK_2022 PRIMARY KEY (INCIDENT_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_BIAS_MOTIVATION_2022 ADD CONSTRAINT NIBRS_BIAS_MOTIVATION_PK_2022 PRIMARY KEY (BIAS_ID, OFFENSE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_SUSPECT_USING_2022 ADD CONSTRAINT NIBRS_SUSPECT_USING_PK_2022 PRIMARY KEY (SUSPECT_USING_ID, OFFENSE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_VICTIM_TYPE_2022 ADD CONSTRAINT NIBRS_VICTIM_TYPE_PK_2022 PRIMARY KEY (VICTIM_TYPE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_INJURY_2022 ADD CONSTRAINT NIBRS_INJURY_PK_2022 PRIMARY KEY (INJURY_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_OFFENDER_2022 ADD CONSTRAINT NIBRS_OFFENDER_PK_2022 PRIMARY KEY (OFFENDER_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_CIRCUMSTANCES_2022 ADD CONSTRAINT NIBRS_CIRCUMSTANCES_PK_2022 PRIMARY KEY (CIRCUMSTANCES_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_ACTIVITY_TYPE_2022 ADD CONSTRAINT NIBRS_ACTIVITY_TYPE_PK_2022 PRIMARY KEY (ACTIVITY_TYPE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_ARRESTEE_2022 ADD CONSTRAINT NIBRS_ARRESTEE_PK_2022 PRIMARY KEY (ARRESTEE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_WEAPON_TYPE_2022 ADD CONSTRAINT NIBRS_WEAPON_TYPE_PK_2022 PRIMARY KEY (WEAPON_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_BIAS_LIST_2022 ADD CONSTRAINT NIBRS_BIAS_LIST_PK_2022 PRIMARY KEY (BIAS_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_ARREST_TYPE_2022 ADD CONSTRAINT NIBRS_ARREST_TYPE_PK_2022 PRIMARY KEY (ARREST_TYPE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_VICTIM_INJURY_2022 ADD CONSTRAINT NIBRS_VICTIM_INJURY_PK_2022 PRIMARY KEY (VICTIM_ID, INJURY_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_OFFENSE_2022 ADD CONSTRAINT NIBRS_OFFENSE_PK_2022 PRIMARY KEY (OFFENSE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_VICTIM_OFFENDER_REL_2022 ADD CONSTRAINT NIBRS_VICTIM_OFFENDER_REL_PK_2022 PRIMARY KEY (victim_id, offender_id);

  ALTER TABLE ONLY PUBLIC.NIBRS_CLEARED_EXCEPT_2022 ADD CONSTRAINT NIBRS_CLEARED_EXCEPT_PK_2022 PRIMARY KEY (CLEARED_EXCEPT_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_VICTIM_2022 ADD CONSTRAINT NIBRS_VICTIM_PK_2022 PRIMARY KEY (VICTIM_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_MONTH_2022 ADD CONSTRAINT NIBRS_MONTH_PK_2022 PRIMARY KEY (did);

  ALTER TABLE ONLY PUBLIC.NIBRS_AGE_2022 ADD CONSTRAINT NIBRS_AGE_PK_2022 PRIMARY KEY (AGE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_PROP_DESC_TYPE_2022 ADD CONSTRAINT NIBRS_PROP_DESC_TYPE_PK_2022 PRIMARY KEY (PROP_DESC_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_VICTIM_CIRCUMSTANCES_2022 ADD CONSTRAINT NIBRS_VICTIM_CIRCUMSTANCES_PK_2022 PRIMARY KEY (VICTIM_ID, CIRCUMSTANCES_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_ARRESTEE_WEAPON_2022 ADD CONSTRAINT NIBRS_ARRESTEE_WEAPON_PK_2022 PRIMARY KEY (arrestee_id, weapon_id);

  ALTER TABLE ONLY PUBLIC.NIBRS_SUSPECTED_DRUG_TYPE_2022 ADD CONSTRAINT NIBRS_SUSPECTED_DRUG_TYPE_PK_2022 PRIMARY KEY (SUSPECTED_DRUG_TYPE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_VICTIM_OFFENSE_2022 ADD CONSTRAINT NIBRS_VICTIM_OFFENSE_PK_2022 PRIMARY KEY (VICTIM_ID, OFFENSE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_LOCATION_TYPE_2022 ADD CONSTRAINT NIBRS_LOCATION_TYPE_PK_2022 PRIMARY KEY (LOCATION_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_ASSIGNMENT_TYPE_2022 ADD CONSTRAINT NIBRS_ASSIGN_TYPE_PK_2022 PRIMARY KEY (ASSIGNMENT_TYPE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_WEAPON_2022 ADD CONSTRAINT NIBRS_WEAPON_PK_2022 PRIMARY KEY (weapon_id, offense_id);

  ALTER TABLE ONLY PUBLIC.REF_RACE_2022 ADD CONSTRAINT REF_RACE_PK_2022 PRIMARY KEY (RACE_ID);

  ALTER TABLE ONLY PUBLIC.REF_STATE_2022 ADD CONSTRAINT REF_STATE_PK_2022 PRIMARY KEY (STATE_ID);

  ALTER TABLE ONLY PUBLIC.AGENCIES_2022 ADD CONSTRAINT AGENCIES_PK_2022 PRIMARY KEY (agency_id);

  ALTER TABLE ONLY PUBLIC.NIBRS_JUSTIFIABLE_FORCE_2022 ADD CONSTRAINT NIBRS_JUSTIFIABLE_FORCE_PK_2022 PRIMARY KEY (JUSTIFIABLE_FORCE_ID);

  -- FKs

  ALTER TABLE ONLY PUBLIC.NIBRS_ARRESTEE_WEAPON_2022 ADD CONSTRAINT NIBRS_ARREST_WEAP_ARREST_FK_2022 FOREIGN KEY (ARRESTEE_ID)
	  REFERENCES PUBLIC.NIBRS_ARRESTEE_2022 (ARRESTEE_ID) ON DELETE CASCADE;

  ALTER TABLE ONLY PUBLIC.NIBRS_ARRESTEE_WEAPON_2022 ADD CONSTRAINT NIBRS_ARREST_WEAP_TYPE_FK_2022 FOREIGN KEY (WEAPON_ID)
	  REFERENCES PUBLIC.NIBRS_WEAPON_TYPE_2022 (WEAPON_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_PROPERTY_DESC_2022 ADD CONSTRAINT NIBRS_PROP_DESC_PROP_FK_2022 FOREIGN KEY (PROPERTY_ID)
	  REFERENCES PUBLIC.NIBRS_PROPERTY_2022 (PROPERTY_ID) ON DELETE CASCADE;

  ALTER TABLE ONLY PUBLIC.NIBRS_PROPERTY_DESC_2022 ADD CONSTRAINT NIBRS_PROP_DESC_TYPE_FK_2022 FOREIGN KEY (PROP_DESC_ID)
	  REFERENCES PUBLIC.NIBRS_PROP_DESC_TYPE_2022 (PROP_DESC_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_ARRESTEE_2022 ADD CONSTRAINT NIBRS_ARRESTEE_AGE_F_2022 FOREIGN KEY (AGE_ID)
	  REFERENCES PUBLIC.NIBRS_AGE_2022 (AGE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_ARRESTEE_2022 ADD CONSTRAINT NIBRS_ARRESTEE_ARREST_TYPE_FK_2022 FOREIGN KEY (ARREST_TYPE_ID)
	  REFERENCES PUBLIC.NIBRS_ARREST_TYPE_2022 (ARREST_TYPE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_ARRESTEE_2022 ADD CONSTRAINT NIBRS_ARRESTEE_ETHNICITY_FK_2022 FOREIGN KEY (ETHNICITY_ID)
	  REFERENCES PUBLIC.NIBRS_ETHNICITY_2022 (ETHNICITY_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_ARRESTEE_2022 ADD CONSTRAINT NIBRS_ARRESTEE_INC_FK_2022 FOREIGN KEY (INCIDENT_ID)
	  REFERENCES PUBLIC.NIBRS_INCIDENT_2022 (INCIDENT_ID) ON DELETE CASCADE;

  ALTER TABLE ONLY PUBLIC.NIBRS_ARRESTEE_2022 ADD CONSTRAINT NIBRS_ARRESTEE_RACE_FK_2022 FOREIGN KEY (RACE_ID)
	  REFERENCES PUBLIC.REF_RACE_2022 (RACE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_ARRESTEE_2022 ADD CONSTRAINT NIBRS_ARRESTEE_OFFENSE_TYPE_FK_2022 FOREIGN KEY (offense_code)
	  REFERENCES PUBLIC.NIBRS_OFFENSE_TYPE_2022 (offense_code);

  ALTER TABLE ONLY PUBLIC.NIBRS_SUSPECTED_DRUG_2022 ADD CONSTRAINT NIBRS_SUSP_DRUG_MEAS_TYPE_FK_2022 FOREIGN KEY (DRUG_MEASURE_TYPE_ID)
	  REFERENCES PUBLIC.NIBRS_DRUG_MEASURE_TYPE_2022 (DRUG_MEASURE_TYPE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_SUSPECTED_DRUG_2022 ADD CONSTRAINT NIBRS_SUSP_DRUG_PROP_FK_2022 FOREIGN KEY (PROPERTY_ID)
	  REFERENCES PUBLIC.NIBRS_PROPERTY_2022 (PROPERTY_ID) ON DELETE CASCADE;

  ALTER TABLE ONLY PUBLIC.NIBRS_SUSPECTED_DRUG_2022 ADD CONSTRAINT NIBRS_SUSP_DRUG_TYPE_FK_2022 FOREIGN KEY (SUSPECTED_DRUG_TYPE_ID)
	  REFERENCES PUBLIC.NIBRS_SUSPECTED_DRUG_TYPE_2022 (SUSPECTED_DRUG_TYPE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_PROPERTY_2022 ADD CONSTRAINT NIBRS_PROPERTY_INC_FK_2022 FOREIGN KEY (INCIDENT_ID)
	  REFERENCES PUBLIC.NIBRS_INCIDENT_2022 (INCIDENT_ID) ON DELETE CASCADE;

  ALTER TABLE ONLY PUBLIC.NIBRS_PROPERTY_2022 ADD CONSTRAINT NIBRS_PROPERTY_LOSS_TYPE_FK_2022 FOREIGN KEY (PROP_LOSS_ID)
	  REFERENCES PUBLIC.NIBRS_PROP_LOSS_TYPE_2022 (PROP_LOSS_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_CRIMINAL_ACT_2022 ADD CONSTRAINT NIBRS_CRIMINAL_ACT_OFFENSE_FK_2022 FOREIGN KEY (OFFENSE_ID)
	  REFERENCES PUBLIC.NIBRS_OFFENSE_2022 (OFFENSE_ID) ON DELETE CASCADE;

  ALTER TABLE ONLY PUBLIC.NIBRS_CRIMINAL_ACT_2022 ADD CONSTRAINT NIBRS_CRIMINAL_ACT_TYPE_FK_2022 FOREIGN KEY (CRIMINAL_ACT_ID)
	  REFERENCES PUBLIC.NIBRS_CRIMINAL_ACT_TYPE_2022 (CRIMINAL_ACT_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_OFFENDER_2022 ADD CONSTRAINT NIBRS_OFFENDER_AGE_FK_2022 FOREIGN KEY (AGE_ID)
	  REFERENCES PUBLIC.NIBRS_AGE_2022 (AGE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_OFFENDER_2022 ADD CONSTRAINT NIBRS_OFFENDER_ETHNICITY_FK_2022 FOREIGN KEY (ETHNICITY_ID)
	  REFERENCES PUBLIC.NIBRS_ETHNICITY_2022 (ETHNICITY_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_OFFENDER_2022 ADD CONSTRAINT NIBRS_OFFENDER_NIBRS_INCI_FK1_2022 FOREIGN KEY (INCIDENT_ID)
	  REFERENCES PUBLIC.NIBRS_INCIDENT_2022 (INCIDENT_ID) ON DELETE CASCADE;

  ALTER TABLE ONLY PUBLIC.NIBRS_OFFENDER_2022 ADD CONSTRAINT NIBRS_OFFENDER_RACE_FK_2022 FOREIGN KEY (RACE_ID)
	  REFERENCES PUBLIC.REF_RACE_2022 (RACE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_VICTIM_INJURY_2022 ADD CONSTRAINT NIBRS_VIC_INJURY_NIBRS_INJ_FK_2022 FOREIGN KEY (INJURY_ID)
	  REFERENCES PUBLIC.NIBRS_INJURY_2022 (INJURY_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_VICTIM_INJURY_2022 ADD CONSTRAINT NIBRS_VIC_INJURY_NIBRS_VIC_FK_2022 FOREIGN KEY (VICTIM_ID)
	  REFERENCES PUBLIC.NIBRS_VICTIM_2022 (VICTIM_ID) ON DELETE CASCADE;

  ALTER TABLE ONLY PUBLIC.NIBRS_WEAPON_2022 ADD CONSTRAINT NIBRS_WEAP_WEAP_TYPE_FK_2022 FOREIGN KEY (WEAPON_ID)
	  REFERENCES PUBLIC.NIBRS_WEAPON_TYPE_2022 (WEAPON_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_WEAPON_2022 ADD CONSTRAINT NIBRS_WEAP_OFF_FK_2022 FOREIGN KEY (OFFENSE_ID)
	  REFERENCES PUBLIC.NIBRS_OFFENSE_2022 (OFFENSE_ID) ON DELETE CASCADE;

  ALTER TABLE ONLY PUBLIC.NIBRS_VICTIM_CIRCUMSTANCES_2022 ADD CONSTRAINT NIBRS_VIC_CIRC_NIBRS_VIC_FK_2022 FOREIGN KEY (VICTIM_ID)
	  REFERENCES PUBLIC.NIBRS_VICTIM_2022 (VICTIM_ID) ON DELETE CASCADE;

  ALTER TABLE ONLY PUBLIC.NIBRS_VICTIM_CIRCUMSTANCES_2022 ADD CONSTRAINT NIBRS_VICTIM_CIRC_JUST_HOM_FK_2022 FOREIGN KEY (JUSTIFIABLE_FORCE_ID)
	  REFERENCES PUBLIC.NIBRS_JUSTIFIABLE_FORCE_2022 (JUSTIFIABLE_FORCE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_VICTIM_CIRCUMSTANCE_2022 ADD CONSTRAINT NIBRS_VIC_CIRC_NIBRS_CIRC_FK_2022 FOREIGN KEY (CIRCUMSTANCES_ID)
	  REFERENCES PUBLIC.NIBRS_CIRCUMSTANCES_2022 (CIRCUMSTANCES_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_SUSPECT_USING_2022 ADD CONSTRAINT NIBRS_SUSPECT_USING_OFF_FK_2022 FOREIGN KEY (OFFENSE_ID)
	  REFERENCES PUBLIC.NIBRS_OFFENSE_2022 (OFFENSE_ID) ON DELETE CASCADE;

  ALTER TABLE ONLY PUBLIC.NIBRS_SUSPECT_USING_2022 ADD CONSTRAINT NIBRS_SUSPECT_USING_LIST_FK_2022 FOREIGN KEY (SUSPECT_USING_ID)
	  REFERENCES PUBLIC.NIBRS_USING_LIST_2022 (SUSPECT_USING_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_OFFENSE_2022 ADD CONSTRAINT NIBRS_OFFENSE_INC_FK1_2022 FOREIGN KEY (INCIDENT_ID)
	  REFERENCES PUBLIC.NIBRS_INCIDENT_2022 (INCIDENT_ID) ON DELETE CASCADE;

  ALTER TABLE ONLY PUBLIC.NIBRS_OFFENSE_2022 ADD CONSTRAINT NIBRS_OFFENSE_LOC_TYPE_FK_2022 FOREIGN KEY (LOCATION_ID)
	  REFERENCES PUBLIC.NIBRS_LOCATION_TYPE_2022 (LOCATION_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_OFFENSE_2022 ADD CONSTRAINT NIBRS_OFFENSE_OFF_TYPE_FK_2022 FOREIGN KEY (offense_code)
	  REFERENCES PUBLIC.NIBRS_OFFENSE_TYPE_2022 (offense_code);

  ALTER TABLE ONLY PUBLIC.NIBRS_VICTIM_OFFENDER_REL_2022 ADD CONSTRAINT NIBRS_VICTIM_OFF_REL_VIC_FK_2022 FOREIGN KEY (VICTIM_ID)
	  REFERENCES PUBLIC.NIBRS_VICTIM_2022 (VICTIM_ID) ON DELETE CASCADE;

  ALTER TABLE ONLY PUBLIC.NIBRS_VICTIM_OFFENDER_REL_2022 ADD CONSTRAINT NIBRS_VICTIM_OFF_REL_OFF_FK_2022 FOREIGN KEY (OFFENDER_ID)
	  REFERENCES PUBLIC.NIBRS_OFFENDER_2022 (OFFENDER_ID) ON DELETE CASCADE;

  ALTER TABLE ONLY PUBLIC.NIBRS_VICTIM_OFFENDER_REL_2022 ADD CONSTRAINT NIBRS_VICTIM_OFF_REL_REL_FK_2022 FOREIGN KEY (RELATIONSHIP_ID)
	  REFERENCES PUBLIC.NIBRS_RELATIONSHIP_2022 (RELATIONSHIP_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_VICTIM_2022 ADD CONSTRAINT NIBRS_VICTIMS_VIC_TYPE_FK_2022 FOREIGN KEY (VICTIM_TYPE_ID)
	  REFERENCES PUBLIC.NIBRS_VICTIM_TYPE_2022 (VICTIM_TYPE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_VICTIM_2022 ADD CONSTRAINT NIBRS_VICTIM_ACT_TYPE_FK_2022 FOREIGN KEY (ACTIVITY_TYPE_ID)
	  REFERENCES PUBLIC.NIBRS_ACTIVITY_TYPE_2022 (ACTIVITY_TYPE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_VICTIM_2022 ADD CONSTRAINT NIBRS_VICTIM_AGE_FK_2022 FOREIGN KEY (AGE_ID)
	  REFERENCES PUBLIC.NIBRS_AGE_2022 (AGE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_VICTIM_2022 ADD CONSTRAINT NIBRS_VICTIM_ASSIGN_TYPE_FK_2022 FOREIGN KEY (ASSIGNMENT_TYPE_ID)
	  REFERENCES PUBLIC.NIBRS_ASSIGNMENT_TYPE_2022 (ASSIGNMENT_TYPE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_VICTIM_2022 ADD CONSTRAINT NIBRS_VICTIM_ETHNICITY_FK_2022 FOREIGN KEY (ETHNICITY_ID)
	  REFERENCES PUBLIC.NIBRS_ETHNICITY_2022 (ETHNICITY_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_VICTIM_2022 ADD CONSTRAINT NIBRS_VICTIM_RACE_FK_2022 FOREIGN KEY (RACE_ID)
	  REFERENCES PUBLIC.REF_RACE_2022 (RACE_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_VICTIM_2022 ADD CONSTRAINT NIBRS_VICTIM_INC_FK_2022 FOREIGN KEY (INCIDENT_ID)
	  REFERENCES PUBLIC.NIBRS_INCIDENT_2022 (INCIDENT_ID) ON DELETE CASCADE;

  ALTER TABLE ONLY PUBLIC.NIBRS_MONTH_2022 ADD CONSTRAINT NIBRS_MONTH_AGENCY_FK_2022 FOREIGN KEY (AGENCY_ID)
	  REFERENCES PUBLIC.AGENCIES_2022 (AGENCY_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_INCIDENT_2022 ADD CONSTRAINT NIBRS_INCIDENT_AGENCY_FK_2022 FOREIGN KEY (AGENCY_ID)
	  REFERENCES PUBLIC.AGENCIES_2022 (AGENCY_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_INCIDENT_2022 ADD CONSTRAINT NIBRS_INCIDENT_CLEAR_EX_FK_2022 FOREIGN KEY (CLEARED_EXCEPT_ID)
	  REFERENCES PUBLIC.NIBRS_CLEARED_EXCEPT_2022 (CLEARED_EXCEPT_ID);

  ALTER TABLE ONLY PUBLIC.NIBRS_INCIDENT_2022 ADD CONSTRAINT NIBRS_INCIDENT_MONTH_FK_2022 FOREIGN KEY (did)
	  REFERENCES PUBLIC.NIBRS_MONTH_2022 (did) ON DELETE CASCADE;

  ALTER TABLE ONLY PUBLIC.NIBRS_VICTIM_OFFENSE_2022 ADD CONSTRAINT NIBRS_VIC_OFF_NIBRS_VIC_FK_2022 FOREIGN KEY (VICTIM_ID)
	  REFERENCES PUBLIC.NIBRS_VICTIM_2022 (VICTIM_ID) ON DELETE CASCADE;

  ALTER TABLE ONLY PUBLIC.NIBRS_VICTIM_OFFENSE_2022 ADD CONSTRAINT NIBRS_VIC_OFF_NIBRS_OFF_FK_2022 FOREIGN KEY (OFFENSE_ID)
	  REFERENCES PUBLIC.NIBRS_OFFENSE_2022 (OFFENSE_ID) ON DELETE CASCADE;

  ALTER TABLE ONLY PUBLIC.NIBRS_BIAS_MOTIVATION_2022 ADD CONSTRAINT NIBRS_BIAS_MOT_OFFENSE_FK_2022 FOREIGN KEY (OFFENSE_ID)
	  REFERENCES PUBLIC.NIBRS_OFFENSE_2022 (OFFENSE_ID) ON DELETE CASCADE;

  ALTER TABLE ONLY PUBLIC.NIBRS_BIAS_MOTIVATION_2022 ADD CONSTRAINT NIBRS_BIAS_MOT_LIST_FK_2022 FOREIGN KEY (BIAS_ID)
	  REFERENCES PUBLIC.NIBRS_BIAS_LIST_2022 (BIAS_ID);
