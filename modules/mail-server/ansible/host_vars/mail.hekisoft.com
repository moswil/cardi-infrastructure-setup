---
########################################################
# BE SURE TO CHANGE ALL OF THE DEFAULT PASSWORDS!!!!!
########################################################

### MySQL Database
mysql_root_username: root
mysql_root_password: o3lSeXhtR7KMbWE9

################################
# Postal main settings
################################

# Web GUI domain (be sure to configure this DNS name to your primary/main IP **before** deployment)
postal_web_host: mail.hekisoft.com

# This IP address is used for sending email and accessing the Web GUI
postal_primary_ip_for_web_management: 46.101.89.215

# This IP is used for the Click & Open tracking
postal_secondary_ip_for_tracking_urls: 188.166.139.210

################################
# Postal Database configuration
################################
postal_main_db_host: 127.0.0.1
postal_main_db_name: postal
postal_main_db_username: postal
postal_main_db_password: Y2BlbJqOZOpy12YE
postal_rabbitmq_host: 127.0.0.1
postal_rabbitmq_user: postal
postal_rabbitmq_password: x@baoztiPTkZR%je
postal_rabbitmq_vhost: postal

################################
# Postal DNS configuration
# Refer to the documentation for more info https://docs.postalserver.io/install/dns-configuration
################################

postal_dns_mx: "{{ postal_web_host }}"
postal_dns_smtp_server_hostname: "{{ postal_web_host }}"
postal_dns_spf_include: spf.'{{ postal_web_host }}'
postal_dns_return_path: "{{ postal_web_host }}"
postal_dns_route_domain: incoming.'{{ postal_web_host }}'
postal_dns_track_domain: analytics.'{{ postal_web_host }}'

################################
# Postal System SMTP (used for sending system emails)
################################

# NOTE: Set these to whatever you want. We use Mailgun as our "fallback" SMTP incase there are issues with using Postal SMTP itself
postal_smtp_host: smtp.mailgun.org
postal_smtp_port: 587
postal_smtp_username: mymailgunusername@hekisoft.com
postal_smtp_password: yD2CytcD9pHMkPP6RKrwm2Z9ZSn6b
