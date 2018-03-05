#!/bin/bash

destination_dir=~/git/martinjrobins.github.io
destination_repo=git@github.com:martinjrobins/martinjrobins.github.io.git

if [ -d "$destination_dir" ]; then
    echo "building to ${destination_dir}"
    jekyll build --destination ${destination_dir}
    cd ${destination_dir}
    cp -R .git ~/tmp/
    rm -rf .git
    git init
    git add .
    git commit -m "Initial commit"
    git remote add origin ${destination_repo} 
    git push -u --force origin master
fi
