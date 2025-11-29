
set -e

PLUGINS_FILE="$1"

jenkins-plugin-cli --plugin-file $PLUGINS_FILE
