#!/bin/bash

if [[ -z "${TAG}" ]]; then
  echo "TAG environment variable not set."
else
  echo "Using TAG: ${TAG}" 
  docker tag quay.io/jetstack/cert-manager-controller:canary lhr.ocir.io/odx-sre/jrosinsk/cert-manager-controller:${TAG}
  docker tag quay.io/jetstack/cert-manager-acmesolver:canary lhr.ocir.io/odx-sre/jrosinsk/cert-manager-acmeresolver:${TAG}
  docker push lhr.ocir.io/odx-sre/jrosinsk/cert-manager-controller:${TAG}
  docker push lhr.ocir.io/odx-sre/jrosinsk/cert-manager-acmeresolver:${TAG}
fi
