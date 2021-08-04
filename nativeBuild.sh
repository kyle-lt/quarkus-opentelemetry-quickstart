#!/bin/bash

# The native build needs to be able to find GraalVM and native-image
export GRAALVM_HOME=~/.sdkman/candidates/java/21.1.0.r16-grl

# Add to the path, just in case
export PATH=${GRAALVM_HOME}/bin:$PATH

# Run native package - the output will reside in the target directory
# Note, the result is compatible with the system on which it was built
# So, if you build on Darwin, don't toss it into a container and expect it to work!
# Instead, build in a Docker container, docs are out there...and see the java-nativeimage project
mvn package -Pnative

exit 0
