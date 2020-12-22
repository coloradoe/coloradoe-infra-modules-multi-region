#!/bin/bash

echo "region > $1"

REGION=$1

while getopts r flag
do
    case "${flag}" in
        u) REGION=${OPTARG};;
    esac
done

terraform workspace select $1

#sed -i '.bak' 's/'"^[?:us-][?:\w{4}-][\d{1}]"'/'"$REGION"'/g
sed -i '.bak' 's/changeme/'"$REGION"'/g' terragrunt.hcl

rm terragrunt.hcl.bak
echo "New Region: $1"

