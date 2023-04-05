#!/bin/bash -e

# Set the TF env vars and invoke ./tfdo validate, plan and apply

export ENV=$1
export APP=$2
export AWS_VAULT_PROFILE=$3


# Set Env dependent variables
if [[ $ENV == "amigo2" ]];
then 
export BACKEND_CONFIG_DYNAMODB_TABLE="cosmin-terraform-state-lock"
export BACKEND_CONFIG_BUCKET="cosmin-terraform-state"
export TF_VAR_state_bucket=$BACKEND_CONFIG_BUCKET
else
echo "ENV: $ENV is not valid"
exit 1
fi
aws-vault exec $AWS_VAULT_PROFILE --no-session -- ./tfdo plan $APP $ENV
while true; do
    read -p "Do you wish to apply the plan to $ENV?" yn
    case $yn in
        [Yy]* ) aws-vault exec $AWS_VAULT_PROFILE --no-session -- ./tfdo apply $APP $ENV; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

# ./tfdo apply rpa dev
# ./tfdo validate rpa dev

