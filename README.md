# Oracle Free + ORDS + APEX Install
[Oracle Free database container](https://container-registry.oracle.com/ords/ocr/ba/database/free) with [ORDS container](https://container-registry.oracle.com/ords/ocr/ba/database/ords) and APEX installation bundlded into a compose file.

## Purpose

The Goal of this project is to create a functioning APEX environment as easily as possible with official images.

It takes advantage of as much of the built in functionality of the images as possible without including any custom logic.

The only custom logic is a small script to download the current latest APEX release and place it where the images can load it. Downloading APEX (and the initial download of the actual images) is the only part that requires internet access. Once those are on your system, this project can be run without internet access. This is because the APEX images will be served locally from the APEX download rather than the APEX CDN.

## Usage

Copy `.env.example` to `.env` and update the values as desired for your setup. The example files has sensible defaults for a development space that will allow you to run immediately and start developing.

If you have questions about the variables in the `.env` file, please refer to the documentation for the images. The variables are controlled/maintained by those images.

### Setup SSL/HTTPS

You can setup SSL and HTTPS by loading your certificates into the `container-data/ords/ssl` folder. You must have a `cert.crt` file and a `key.key` file.

If you have questions about how to create your own certificates, please see this [letsencrypt article](https://letsencrypt.org/docs/certificates-for-localhost/#making-and-trusting-your-own-certificates). I personally recommend using [mkcert](https://github.com/FiloSottile/mkcert) as it recommends as it scales well across multiple projects.

## Useful information

You can connect to the database from either container.

Database container:
```sh
# connect to CDB as SYS
sqlplus / as sysdba

# connect to PDB as SYS
sqlplus sys/"${ORACLE_PWD}"@"${ORACLE_PDB}" as sysdba
```

ORDS container:
```sh
# connect to CDB as SYS
sql sys/"${ORACLE_PWD}"@"${DBHOST}":"${DBPORT}" as sysdba

# connect to PDB as SYS
sql sys/"${ORACLE_PWD}"@"${DBHOST}":"${DBPORT}"/"${DBSERVICENAME}" as sysdba
```

## To-do Items

- [x] Check parity of `.env.example` and `.env`
- [ ] Add healthcheck for ORDS container: ORDS healthcheck
- [ ] Add healthcheck for ORDS container: APEX healtcheck
- [x] Test full runs
- [ ] Refactor/remove `scripts/reset.sh` once in git repo. Just be podman volume management? Leave this to be manually manged by users? Not sure...
- [ ] Remove `container-scripts/ords/startup/050-reset-apex-admin-password.sh` once image fixes bug where admin user doesn't get created on APEX install