whenever sqlerror exit failure

@/tmp/sqlplus-variables.sql

alter session set container=&ORACLE_PDB;

create tablespace &APEX_TABLESPACE_NAME datafile '&APEX_TABLESPACE_FILE_NAME' size 300m autoextend on;
