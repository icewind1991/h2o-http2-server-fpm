#! /bin/sh

confd -onetime -backend env

h2o $@
