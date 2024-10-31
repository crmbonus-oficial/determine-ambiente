#!/bin/bash
set -e

echo "Determining environment based on branch: ${GITHUB_REF}"
if [[ "${GITHUB_REF}" == "refs/heads/main" ]]; then
    echo "ambiente=prd" >> $GITHUB_ENV
    echo "ambiente=prd" >> $GITHUB_OUTPUT
    echo "Selected environment: prd"
elif [[ "${GITHUB_REF}" == "refs/heads/hml" ]]; then
    echo "ambiente=hml" >> $GITHUB_ENV
    echo "ambiente=hml" >> $GITHUB_OUTPUT
    echo "Selected environment: hml"
elif [[ "${GITHUB_REF}" == "refs/heads/dev" ]]; then
    echo "ambiente=dev" >> $GITHUB_ENV
    echo "ambiente=dev" >> $GITHUB_OUTPUT
    echo "Selected environment: dev"
else
    echo "ambiente=hml" >> $GITHUB_ENV
    echo "ambiente=hml" >> $GITHUB_OUTPUT
    echo "Selected environment: hml"
fi
