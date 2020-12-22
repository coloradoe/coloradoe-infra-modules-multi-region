#!/bin/bash

# Get the region
while getopts r:n flag
do
    case "${flag}" in
        r) region=${OPTARG};;
        n) workspace=${OPTARG};;
    esac
done

REGION=$1
WORKSPACE=$2

# Select the workspace based on the region
terraform workspace select $1

# Set all subsequent folders to a workspace for that region
for d in ./*/ ; do (cd "$d" && terraform workspace select $1); done

# Change the region in the terragrunt file to match the workspace
#sed -i '.bak' 's/'"^[?:us-][?:\w{4}-][\d{1}]"'/'"$REGION"'/g
sed -i '.bak' 's/changeme/'"$REGION"'/g' terragrunt.hcl

# Clean up
rm terragrunt.hcl.bak

# Show new region
echo "New Region: $1"

