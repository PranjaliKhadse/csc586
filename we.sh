#!/bin/bash

sudo apt update

export DEBIAN_FRONTEND=noninteractive

echo -e " 
slapd   slapd/internal/generated_adminpw        password test
slapd   slapd/internal/adminpw  password test
slapd   slapd/password1 password test
slapd   slapd/dump_database_destdir     string  /var/backups/slapd-VERSION
                                                                                                                                
slapd   slapd/backend   select  MDB
# Do you want the database to be removed when slapd is purged?
slapd   shared/organization     string  clemson.cloudlab.us
slapd   slapd/move_old_database boolean true
                                                                                                                                
slapd   slapd/invalid_config    boolean true
slapd   slapd/domain    string  clemson.cloudlab.us
slapd   slapd/ppolicy_schema_needs_update       select  abort installation
# Potentially unsafe slapd access control configuration
                                                                                                                                
slapd   slapd/unsafe_selfwrite_acl      note
slapd   slapd/no_configuration  boolean false
slapd   slapd/dump_database     select  when needed
" | sudo debconf-set-selections


sudo apt-get install -y slapd ldap-utils
sudo dpkg-reconfigure slapd
sudo ufw allow ldap
ldapadd -x -D cn=admin,dc=clemson,dc=cloudlab,dc=us -w test -f basedn.ldif

#echo   -n  PASS=$(slappasswd -s rammy) | awk '{print PASS}'
P=$(slappasswd -s rammy)
#cat /local/repository/users.ldif

#echo -e "userPassword: $P" >> /local/repository/users.ldif
#cat /local/repository/users.ldif
chmod 777 /local/repository/users.ldif
cat <<'EOF' > /local/repository/users.ldif
dn: uid=student,ou=People,dc=clemson,dc=cloudlab,dc=us
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: student
sn: Ram
givenName: Golden
cn: student
displayName: student
uidNumber: 10000
gidNumber: 5000
userPassword: $P
gecos: Golden Ram
loginShell: /bin/dash
homeDirectory: /home/student
EOF

# Be safe again 
chmod 744 /local/repository/users.ldif
ldapadd -x -D cn=admin,dc=clemson,dc=cloudlab,dc=us -W -f users.ldif
ldapsearch -x -LLL -b dc=clemson,dc=cloudlab,dc=us 'uid=student' cn gidNumber
sudo apt update
sudo apt install -y libnss-ldap libpam-ldap ldap-utils
