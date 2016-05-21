#!/bin/bash -e

if [ -z "$GHC_TREE" ]; then
        echo "Error: GHC_TREE isn't set"
        exit 1
fi

rm -f content/*
cp $GHC_TREE/docs/users_guide/*.rst content
cp $GHC_TREE/docs/users_guide/*.{rst,py} content
cp $GHC_TREE/docs/users_guide/ghc_config.py .
cp -R $GHC_TREE/docs/users_guide/images .
git add content ghc_config.py images
git commit -m "update" -a
