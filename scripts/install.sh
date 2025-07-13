#!/bin/bash

set -eo pipefail

install_all() {
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

    export PYTHONIOENCODING=utf-8

    pip install --upgrade pip

    pip install -r requirements.txt

    check_torch="import torch; print(f'✅ PyTorch {torch.__version__} installed')"
    python -c "$check_torch" 2>/dev/null || (echo "❌ PyTorch installation failed" && exit 1)

    check_geometric="import torch_geometric; print(f'✅ PyTorch Geometric {torch_geometric.__version__} installed')"
    python -c "$check_geometric" 2>/dev/null || (echo "❌ PyTorch Geometric installation failed" && exit 1)
}

if [[ -f .venv ]]
then
    install_all
else
    python -m venv .venv

    install_all
fi
