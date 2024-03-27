#!/bin/bash

echo -e "How many cores should be utilized?"
echo -e "If x exceeds available cores of host, the maximum no. of cores will be used."
read -p " Choose between 1-x: " chosen_cores
echo "You entered: $chosen_cores"

echo -e "How much CPU usage per core?"
read -p "Enter int between 1-100%: " chosen_percentage
echo "You entered: $chosen_percentage"

# Update the YAML file with the chosen values
sed -i "s/value: \"2\"/value: \"$chosen_cores\"/" cpu_sts.yaml
sed -i "s/value: \"15\"/value: \"$chosen_percentage\"/" cpu_sts.yaml

# Run the yaml
kubectl apply -f cpu_sts.yaml
