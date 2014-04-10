#!/bin/bash

# "/usr/sbin/slapd", "-d", "0", "-F", "/etc/ldap/slapd.d"
set -e

if [ -f /tmp/db.ldif ]; then
  slapd -h ldapi:/// -F /etc/ldap/slapd.d
  ldapadd -Y EXTERNAL -H ldapi:/// -f /tmp/db.ldif
  kill $(pidof slapd)
  rm /tmp/db.ldif
fi

exec /usr/sbin/slapd -d 0 -F /etc/ldap/slapd.d "${@}"
