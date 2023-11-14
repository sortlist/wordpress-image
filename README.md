# wordpress-image
[![Docker Pulls](https://img.shields.io/docker/pulls/charlessortlist/wordpress-image?style=flat-square)](https://hub.docker.com/repository/docker/charlessortlist/wordpress-image)

Bitnami wordpress image builder with Datadog PHP APM + ASM + Profiling (Beta).

Consider setting `DD_AGENT_HOST` to indicate the DataDog agent on your cluster
and `DD_SERVICE` to assign an appropriate name to the service. Refer to
https://docs.datadoghq.com/tracing/trace_collection/library_config/php/ for
additional information.

To turn off profiling or tracing, you can also use `DD_PROFILING_ENABLED` and
`DD_TRACE_ENABLED`.
