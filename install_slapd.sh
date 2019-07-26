
#!/bin/bash 


export DEBIAN_FRONTEND='non-interactive'

echo -e "
slapd   slapd/root_password password  password pkhadse
slapd   slapd/root_password_again password  password pkhadse
slapd   slapd/internal/adminpw  password pkhadse
slapd   slapd/password1 password pkhadse
                                                                                                                                
slapd   slapd/internal/generated_adminpw        password pkhadse
slapd   slapd/password2 password pkhadse
# Do you want the database to be removed when slapd is purged?
slapd   slapd/purge_database    boolean false
                                                                                                                                
# Potentially unsafe slapd access control configuration
slapd   slapd/unsafe_selfwrite_acl      note
slapd   slapd/invalid_config    boolean true
slapd   slapd/dump_database_destdir     string  /var/backups/slapd-VERSION
                                                                                                                                
slapd   slapd/move_old_database boolean true
slapd   shared/organization     string  clemson.cloudlab.us
slapd   slapd/password_mismatch note
slapd   slapd/ppolicy_schema_needs_update       select  abort installation
                                                                                                                                
slapd   slapd/upgrade_slapcat_failure   error
slapd   slapd/dump_database     select  when needed
" | sudo debconf-set-selections



sudo apt-get update
sudo apt-get install -y slapd ldap-utils
sudo dpkg-reconfigure slapd 
sudo ufw allow ldap

