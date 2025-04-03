#!/bin/bash

usage="$(basename "$0") [dir] [-h]  -- convert readme doc to doc.txt in specified dir

where:
    [dir] where to put the doc.txt
    -h  show this help text"

if [ -d $1 ]; then
    cp ./README.md $1/doc.txt
else
    echo $usage
    exit 1
fi
