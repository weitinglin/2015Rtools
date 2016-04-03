#!/bin/sh
PHP_FILE=/Users/jasonlin/Documents/R_scripts/Wakey_shell/index.php
OUTPUT_FILE=/Users/jasonlin/Documents/R_scripts/Wakey_shell/wav/

#The Code
php -f ${PHP_FILE} | tail -n1 | xargs wget -P ${OUTPUT_FILE}
