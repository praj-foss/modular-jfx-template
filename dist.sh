#!/bin/bash

: "${JAVA_HOME:?Please set a valid location or try restarting gradle daemon}"

echo "LINKING A MODULAR JVM"

$JAVA_HOME/bin/jlink --module-path "build/libs:$JAVA_HOME/jmods" \
                     --add-modules sample \
                     --launcher hello=sample/sample.Hello \
                     --output "build/dist" \
                     --strip-debug \
                     --compress 2 \
                     --no-header-files \
                     --no-man-pages

echo "LINKING SUCCESSFUL"
echo "The files can be found inside build/dist/"