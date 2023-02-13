FROM bitnami/wordpress

## Change user to perform privileged actions
USER 0

## Install vim, curl
RUN install_packages vim curl

## Install 'datadog'
RUN curl -LO https://github.com/DataDog/dd-trace-php/releases/latest/download/datadog-setup.php
RUN php datadog-setup.php --php-bin=all --enable-appsec --enable-profiling
RUN rm datadog-setup.php


## Revert to the original non-root user
USER 1001
