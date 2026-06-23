whenever sqlerror exit failure;

@/tmp/sqlplus-variables.sql

spool "/apex-install/apex_install.log"

prompt "Installing APEX into &ORACLE_PDB this can take several minutes."

alter session set container=&ORACLE_PDB;

cd /apex

@apxsilentins.sql "APEX" "APEX" "TEMP" "/i/" "&APEX_PUBLIC_USER_PWD" "&APEX_LISTENER_PWD" "&APEX_REST_PUBLIC_USER_PWD" "&APEX_ADMIN_PWD"
spool off

prompt APEX install completed.

spool "/apex-install/.apex_installed"
spool off
