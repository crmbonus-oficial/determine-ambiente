#!/bin/bash

echo "Determinando environment baseado na branch: ${GITHUB_REF}"
if [[ "${GITHUB_REF}" == "refs/heads/main" ]]; then
  echo "ambiente=prd" >> $GITHUB_ENV
  echo "ambiente=prd" >> $GITHUB_OUTPUT
elif [[ "${GITHUB_REF}" == "refs/heads/hml" ]]; then
  echo "ambiente=hml" >> $GITHUB_ENV
  echo "ambiente=hml" >> $GITHUB_OUTPUT
elif [[ "${GITHUB_REF}" == "refs/heads/dev" ]]; then
  echo "ambiente=dev" >> $GITHUB_ENV
  echo "ambiente=dev" >> $GITHUB_OUTPUT
else
  echo "ambiente=hml" >> $GITHUB_ENV
  echo "ambiente=hml" >> $GITHUB_OUTPUT
fi
