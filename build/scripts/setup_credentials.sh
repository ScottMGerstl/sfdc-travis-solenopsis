#!/bin/bash

SOL_SANDBOXNAME="Test"
SOL_PROPFILE="$HOME/solenopsis.properties"
SOL_HOMEDIR="$HOME/.solenopsis"
SOL_CREDDIR="$SOL_HOMEDIR/credentials"
SOL_CREDFILE="$SOL_CREDDIR/$SOL_SANDBOXNAME.properties"

SRC_DIR="$TRAVIS_BUILD_DIR/src"

cat >$SOL_PROPFILE <<EOF
solenopsis.ENVIRONMENTS=local $SOL_SANDBOXNAME
solenopsis.env.HOME=$SOL_HOMEDIR
solenopsis.env.MASTER=local
solenopsis.env.DEPENDENT=$SOL_SANDBOXNAME
solenopsis.env.local.HOME=$SRC_DIR

sf.version = 37.0

sf.antFile=$TRAVIS_BUILD_DIR/build/ant/ant-salesforce-v41.jar
EOF

mkdir -p $SOL_CREDDIR

cat >$SOL_CREDFILE <<EOF
username = $SFDC_USERNAME
password = $SFDC_PASSWORD
token = $SFDC_TOKEN
url = $SFDC_URL
EOF