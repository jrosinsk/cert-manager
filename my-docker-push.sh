#!/bin/bash

# Copyright 2019 The Jetstack cert-manager contributors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit

if [[ -z "${TAG}" ]]; then
  echo "TAG environment variable not set."
else
  echo "Using TAG: ${TAG}" 
  docker tag quay.io/jetstack/cert-manager-controller:canary lhr.ocir.io/odx-sre/jrosinsk/cert-manager-controller:${TAG}
  docker tag quay.io/jetstack/cert-manager-acmesolver:canary lhr.ocir.io/odx-sre/jrosinsk/cert-manager-acmeresolver:${TAG}
  docker push lhr.ocir.io/odx-sre/jrosinsk/cert-manager-controller:${TAG}
  docker push lhr.ocir.io/odx-sre/jrosinsk/cert-manager-acmeresolver:${TAG}
fi
