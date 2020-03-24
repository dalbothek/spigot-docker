#!/bin/bash

set -euo pipefail

exec java -"Xms$MIN_MEMORY" -"Xmx$MAX_MEMORY" $JAVA_OPTS -jar "$SPIGOT_JAR" nogui
