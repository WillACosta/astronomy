#!/bin/bash
set -e

if [ -n "$1" ]
then
    if [ "$1" = true ]
    then
        flutter pub run build_runner watch -d
    fi
fi
 flutter pub run build_runner build -d
