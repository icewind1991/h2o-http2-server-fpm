#! /bin/sh

sed -i s/'$PORT'/"$FPM_PORT"/g /etc/h2o/h2o.conf
sed -i s/'$HOST'/"$FPM_HOST"/g /etc/h2o/h2o.conf

h2o $@
