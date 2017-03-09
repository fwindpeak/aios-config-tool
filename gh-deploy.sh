#!/bin/bash

DATE=`date "+%Y%m%d-%H%M%S"`
cd gh-pages
git checkout -B gh-pages
rm -rf *
cp -r ../dist/* .
git add .
git commit -m "deploy $DATE"
git push -f origin gh-pages:gh-pages
