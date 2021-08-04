#!/bin/bash

export OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:4317
export OTEL_RESOURCE_ATTRIBUTES=service.name=kjt-testServiceName,service.namespace=kjt-testServiceNamespaceName

./target/quarkus-opentelemetry-quickstart-1.0.0-SNAPSHOT-runner

exit 0

