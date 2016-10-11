#!/bin/bash

FLAG="#t"

if [ "$1" == "0" ] ; then FLAG="#f" ; fi

find . -maxdepth 1 -name '*.scrbl' | 
    while read S ; do
        perl -pi.bak -e 's/bystro-dump-LaTeX ../bystro-dump-LaTeX '$FLAG'/g' "$S"
    done
