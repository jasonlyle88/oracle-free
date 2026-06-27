#!/usr/bin/env bash
set -euo pipefail

http_port=8080
https_port=8443
url_schema=''
url_domain='localhost'
url_port=''
url_path='ords/r/apex/workspace-sign-in/'
cookie_file='/tmp/cookies-apex.txt'
curl_args=()

# Fail the curl command if the HTTP response code is not successful
curl_args+=("-f")

# Silent mode, don't show progress meter or error messages
curl_args+=("-s")

# Follow redirects if the server responds with a redirect
curl_args+=("-L")

if [[ -f "${cookie_file}" ]]; then
    rm -f "${cookie_file}"
fi
curl_args+=("--cookie-jar" "${cookie_file}")

if [[ -f '/etc/ords/config/ssl/cert.crt' && -f '/etc/ords/config/ssl/key.key' ]]; then
    url_schema='https'
    url_port="${https_port}"

    curl_args+=("--cacert" "/etc/ords/config/ssl/cert.crt")
else
    url_schema='http'
    url_port="${http_port}"
fi

url="${url_schema}://${url_domain}:${url_port}/${url_path}"

curl_args+=("${url}")

if ! curl "${curl_args[@]}" 1>/dev/null 2>&1; then
    printf -- 'Health check failed for %s' "${url}"
    exit 1
fi
