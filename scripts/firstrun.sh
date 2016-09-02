#!/bin/bash
rm -r /config/*
cd /config
mkdir mybb
cd /tmp
curl https://resources.mybb.com/downloads/mybb_1806.zip -o mybb.zip
unzip mybb.zip "Upload/*"
mv Upload/* /config/mybb
rm -Rf Upload mybb.zip
cd /config/mybb
mv inc/config.default.php inc/config.php 
chmod 666 inc/config.php inc/settings.php
chmod -R 777 inc/languages
chmod 777 cache/ cache/themes/ uploads/ uploads/avatars/ admin/backups/
