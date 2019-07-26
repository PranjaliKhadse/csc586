
#!/bin/bash 


export DEBIAN_FRONTEND='non-interactive'

echo -e "
slapd   slapd/password1 password
slapd   slapd/password2 password
                                                                                                                                
slapd   slapd/internal/generated_adminpw        password
slapd   slapd/ppolicy_schema_needs_update       select  abort installation
slapd   slapd/password_mismatch note
slapd   slapd/domain    string  clemson.cloudlab.us
                                                                                                                                
slapd   slapd/invalid_config    boolean true
slapd   slapd/backend   select  MDB
slapd   slapd/no_configuration  boolean false
slapd   slapd/upgrade_slapcat_failure   error
                                                                                                                                
# Do you want the database to be removed when slapd is purged?
slapd   slapd/purge_database    boolean false
slapd   slapd/dump_database     select  when needed
slapd   slapd/unsafe_selfwrite_acl      note
                                                                                                                                
slapd   slapd/dump_database_destdir     string  /var/backups/slapd-VERSION
" | sudo debconf-set-selections



sudo apt-get update
sudo apt-get install -y slapd ldap-utils
sudo dpkg-reconfigure slapd 
sudo ufw allow ldap

