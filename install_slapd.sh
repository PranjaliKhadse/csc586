
#!/bin/bash 


export DEBIAN_FRONTEND='non-interactive'

echo -e "
slapd   slapd/password1 password
slapd   slapd/internal/generated_adminpw        password
                                                                                                                                
slapd   slapd/password2 password
slapd   slapd/domain    string  clemson.cloudlab.us
# Do you want the database to be removed when slapd is purged?
slapd   slapd/purge_database    boolean false
                                                                                                                                
slapd   slapd/dump_database_destdir     string  /var/backups/slapd-VERSION
slapd   slapd/move_old_database boolean true
# Potentially unsafe slapd access control configuration
slapd   slapd/unsafe_selfwrite_acl      note
                                                                                                                                
slapd   slapd/ppolicy_schema_needs_update       select  abort installation
slapd   slapd/dump_database     select  when needed
slapd   slapd/password_mismatch note
slapd   slapd/invalid_config    boolean true
                                                                                                                                
slapd   slapd/upgrade_slapcat_failure   error
" | sudo debconf-set-selections



sudo apt-get update
sudo apt-get install -y slapd ldap-utils
sudo dpkg-reconfigure slapd 
sudo ufw allow ldap

