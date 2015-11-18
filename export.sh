#!/bin/bash -e

if [ -z "$GHC_TREE" ]; then
        echo "Error: GHC_TREE isn't set"
        exit 1
fi

rm -f content/*
cp $GHC_TREE/docs/users_guide/*.rst content
cp $GHC_TREE/docs/users_guide/ghc_config.py .
git add content ghc_config.py
git commit -m "update" -a
