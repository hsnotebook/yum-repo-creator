#!/bin/bash

if [[ $# -lt 1 ]]
then
    echo "Usage $0 <repo_name> <package_name ...>"
    exit 1
fi

if [[ "$1" = "bash" ]]
then
    /bin/bash
    exit 0
fi

repo_name=$1
shift
packages=$@

repos_base_dir=/repos

repo=$repos_base_dir/$repo_name

if [[ ! -d $repo ]]
then
    echo "$repo not exists. create $repo."
    mkdir -p $repo
fi

cd $repo
repotrack $packages
createrepo .
