#!/bin/bash

if [[ ! -e /usr/local/bin/composer ]]; then
	curl -sS https://getcomposer.org/installer | php
	mv composer.phar /usr/local/bin/composer
	print_success "Composer installed to /usr/local/bin/composer"
fi