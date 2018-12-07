<?php
$CONFIG = array(

'default_language' => 'de',
'force_language' => 'de',
'has_internet_connection' => false,
'appstoreenabled' => false,
'allow_user_to_change_display_name' => true,
# 1 hour cookie
'remember_login_cookie_lifetime' => 60*60*1,
'session_keepalive' => true,
# User must use tokens instead of password for clients
'token_auth_enforced' => true,
# Available values:
# auto
# default setting. keeps files and folders in the trash bin for 30 days and automatically deletes anytime after that if space is needed (note: files may not be deleted if space is not needed).
# D, auto
# keeps files and folders in the trash bin for D+ days, delete anytime if space needed (note: files may not be deleted if space is not needed)
# auto, D
# delete all files in the trash bin that are older than D days automatically, delete other files anytime if space needed
# D1, D2
# keep files and folders in the trash bin for at least D1 days and delete when exceeds D2 days
# disabled
# trash bin auto clean disabled, files and folders will be kept forever

'trashbin_retention_obligation' => 'auto',
# Available values:
# auto
# default setting. Automatically expire versions according to expire rules. Please refer to Controlling file versions and aging for more information.
# D, auto
# keep versions at least for D days, apply expire rules to all versions that are older than D days
# auto, D
# delete all versions that are older than D days automatically, delete other versions according to expire rules
# D1, D2
# keep versions for at least D1 days and delete when exceeds D2 days
# disabled
# versions auto clean disabled, versions will be kept forever
# Defaults to auto

'versions_retention_obligation' => 'auto',
 array (
   0 =>
   array (
     'path' => OC::$SERVERROOT.'/apps',
     'url' => '/apps',
     'writable' => false,
   ),
   1 =>
   array (
     'path' => OC::$SERVERROOT.'/custom_apps',
     'url' => '/apps_custom',
     'writable' => true,
   ),
 ),
);
