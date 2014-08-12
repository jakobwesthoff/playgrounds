#!/bin/sh
vagrant up && \
ssh -X $(vagrant ssh-config | awk '{print " -o "$1"="$2}') localhost -- '/usr/bin/inkscape' --with-gui ; \
vagrant suspend
