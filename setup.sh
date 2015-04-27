#!/bin/bash
set -u
[ -z "$BROOKLYN_HOME" ] && { echo "Need to set BROOKLYN_HOME"; exit 1; }





echo "Copy additional entities to ${BROOKLYN_HOME}/lib/dropins"
wget -q -O ${BROOKLYN_HOME}/lib/dropins/brooklyn-modaclouds-0.1.0-SNAPSHOT.jar "http://oss.sonatype.org/service/local/artifact/maven/redirect?r=snapshots&g=eu.seaclouds-project&a=brooklyn-modaclouds&v=LATEST" --content-disposition
echo "Copied!"

if [ "$0" = "./setup.sh" ]; then
    PATTERN="s#\(privateKeyFile:\).*\$#\1 ${PWD}/seaclouds_id_rsa#"
    sed -i -e "$PATTERN" ./seaclouds.yaml
    "Updated private key path in seaclouds.yaml"
fi
