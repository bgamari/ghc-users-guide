#!/bin/bash -e

if [ -z "$GHC_TREE" ]; then
        echo "Error: GHC_TREE isn't set"
        exit 1
fi

#make -C$GHC_TREE -j4 docs/users_guide_RST_SOURCES

rm -Rf content/*
mkdir -p content
cp $GHC_TREE/docs/users_guide/*.{rst,py} content
cp $GHC_TREE/docs/users_guide/ghc_config.py .
cp -R $GHC_TREE/docs/users_guide/images .

# Use default readthedocs theme
#cp -R $GHC_TREE/docs/users_guide/ghc-theme content
echo "html_theme = 'sphinx_rtd_theme'" >> content/conf.py

git add content ghc_config.py images
git commit -m "update" -a
