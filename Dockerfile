FROM bitnami/wordpress

## Change user to perform privileged actions
USER 0

## Install vim, curl
RUN install_packages vim curl strace htop

## Install 'datadog'
RUN curl -LO https://github.com/DataDog/dd-trace-php/releases/latest/download/datadog-setup.php
RUN php datadog-setup.php --php-bin=all --enable-appsec --enable-profiling
RUN rm datadog-setup.php

# Wordpress with a lot of plugins.. More fine-tuning.
RUN sed -i 's/opcache\.memory_consumption = [0-9]\+/opcache.memory_consumption = 400/g' /opt/bitnami/php/etc/php.ini
RUN sed -i 's/opcache\.interned_strings_buffer = [0-9]\+/opcache.interned_strings_buffer = 32/g' /opt/bitnami/php/etc/php.ini
RUN sed -i 's/opcache\.max_accelerated_files = [0-9]\+/opcache.max_accelerated_files = 100000/g' /opt/bitnami/php/etc/php.ini

## Revert to the original non-root user
USER 1001
