#!/bin/bash

set -eo pipefail

if [[ -z "$VIRTUAL_ENV" ]]
then
    case "$OSTYPE" in
        darwin*) source .venv/bin/activate ;;
        linux*) source .venv/bin/activate ;;
        msys*) source .venv/Scripts/activate ;;
        cygwin*) source .venv/Scripts/activate ;;
        *) echo "UNKNOWN OS: $OSTYPE" && exit 1 ;;
    esac
fi

python main.py
