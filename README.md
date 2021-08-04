# quarkus-opentelemetry-quickstart

The goal of this project was to be able to utilize OpenTelemetry with as little work as possible, and also be able to configure the SDK with environment variables.  It was accomplished with very little effort.  Read on to see how!

This project was created based on the guide [here](https://quarkus.io/guides/opentelemetry).
> You'll need to be running an OpenTelemetry Collector and some trace backend (I use Jaeger). [Here](https://github.com/kyle-lt/local-monitoring-stack) is my repo that I use to do that, or the Quarkus link has some instructions, too.

Below, there is some documentation for the following topics:
- [How to Build](#how-to-build)
- [How to Run](#how-to-run)
- [How the Goal was Accomplished](#how-the-goal-was-accomplished)

## How to Build

Tested on MacOS following the instructions [here](https://quarkus.io/guides/building-native-image)
- Used SDKMAN for GraalVM

Run the script `nativeBuild.sh`, perhaps tweak it to your environment - no guarantees, though.

> Keep in mind that building on MacOS creates a MacOS-compliant native executable that won't run on Linux.

The result is a native executable in the `target` directory.

It'll be named something like `quarkus-opentelemetry-quickstart-1.0.0-SNAPSHOT-runner`.

## How to Run

Once the executable is built, it can be run with a helper script:

```bash
./runNativeImage.sh
```

Or, you can set the env vars manually, and then run the native executable directly.

```bash
./target/quarkus-opentelemetry-quickstart-1.0.0-SNAPSHOT-runner
```

The Quarkus o/p will appear to std out. 

Then, you can run a request:

```bash
curl localhost:8080/hello
```

Go and check Jaeger (or whatever trace backend) to see the result.

## How the Goal was Accomplished

As the documentation states, you'll need the `quarkus-opentelemetry-exporter-otlp` module, so make sure that's in the `pom.xml` if doing this from scratch.

After that, the only requirement is to properly configure the OpenTelemetry SDK.  That piece was done in the `application.properties` file so that values could be provided by environment variables, and native image-friendly.

Here is the content in `application.properties`:

```bash
# OpenTelemetry Configs - passed in via environment variables

# OTLP Endpoint Address
# For testing: OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:4317
quarkus.opentelemetry.tracer.exporter.otlp.endpoint=${OTEL_EXPORTER_OTLP_ENDPOINT}

# OTLP Resource Attributes
# For testing: OTEL_RESOURCE_ATTRIBUTES=service.name=kjt-testServiceName,service.namespace=kjt-testServiceNamespaceName
quarkus.opentelemetry.tracer.resource-attributes=${OTEL_RESOURCE_ATTRIBUTES}
```

That's it, super easy!


