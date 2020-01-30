#!/bin/sh

set -e -x

configmapname="$1"
method="$2" # read/write
keyname="$3"
value="$4" # this is the result file if this is read

export KUBECONFIG=/tmp/kubeconfig
if [ "${method}" = "read" ]; then
  kubectl get configmap/"${configmapname}" -o json > /tmp/tmpresult.json
  res=$(jq ".data .${keyname}" /tmp/tmpresult.json)
  echo "${keyname}=${res}" > "${value}"
  cat "${value}"
else
  if kubectl get configmap/"${configmapname}" -o json > /tmp/tmpconfigmap.json; then
    jq --arg a "$value" ".data .${keyname}="'$a' /tmp/tmpconfigmap.json > /tmp/configmap.json
    kubectl apply -f /tmp/configmap.json
  else
    # create configmap if not already exist
    kubectl create configmap "${configmapname}" --from-literal "${keyname}"="${value}"
  fi
fi
