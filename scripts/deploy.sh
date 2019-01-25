#!/usr/bin/env bash

mvn clean package

echo 'Copy files...'

scp target/sweater-1.0-SNAPSHOT.jar -i ~/.ssh/id_rsa barkalov@185.51.247.151:


echo 'Restart server...'

ssh -i ~/.ssh/id_rsa barkalov@185.51.247.151 << EOF

pgrep java | xargs kill -9
echo 'Starting...'
nohup java -jar sweater-1.0-SNAPSHOT.jar > log.txt &

EOF

echo 'Bye'