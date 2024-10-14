#!/bin/bash
set -e

echo "Determining environment based on branch: ${GITHUB_REF}"
if [[ "${GITHUB_REF}" == "refs/heads/main" ]]; then
    echo "ambiente=prd" >> $GITHUB_ENV
    echo "::set-output name=ambiente::prd"
    echo "Selected environment: prd"
elif [[ "${GITHUB_REF}" == "refs/heads/hml" ]]; then
    echo "ambiente=hml" >> $GITHUB_ENV
    echo "::set-output name=ambiente::hml"
    echo "Selected environment: hml"
elif [[ "${GITHUB_REF}" == "refs/heads/dev" ]]; then
    echo "ambiente=dev" >> $GITHUB_ENV
    echo "::set-output name=ambiente::dev"
    echo "Selected environment: dev"
elif [[ "${GITHUB_REF}" == "refs/heads/CHD-13060MelhorarPipelineHML" ]]; then
    echo "ambiente=hml-teste" >> $GITHUB_ENV
    echo "::set-output name=ambiente::hml-teste"
    echo "Selected environment: hml-teste"
else
    echo "ambiente=hml" >> $GITHUB_ENV
    echo "::set-output name=ambiente::hml"
    echo "Selected environment: hml"
fi
