FROM cpuguy83/debian:jessie
RUN apt-get update -qq && apt-get install -y slapd -qq

VOLUME /var/lib/ldap

EXPOSE 389 636

ENTRYPOINT ["/usr/sbin/slapd" ,"-u", "openldap", "-g", "openldap", "-d", "0", "-F", "/etc/ldap/slapd.d"]
CMD ["-h", "ldap:/// ldapi:/// ldaps:///"]
