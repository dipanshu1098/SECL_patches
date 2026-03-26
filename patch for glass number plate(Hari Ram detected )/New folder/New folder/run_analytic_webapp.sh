#!/bin/sh
echo "starting webapp executable"
cd /opt/i2v-analytic-server/Client/
LD_LIBRARY_PATH=/usr/local/lib/:/opt/i2v-analytic-server/Client ./WebApp
