# Write to the configmap
`docker run -v /tmp/kubeconfig:/tmp/kubeconfig kubernetes-docker-local.artifactory.eng.vmware.com/configmapsyncer:v0.0.1 configmapname write examplekey examplevalue`

# Get value from configmap
`docker run -v /tmp/kubeconfig:/tmp/kubeconfig -v /tmp/result:/tmp/result kubernetes-docker-local.artifactory.eng.vmware.com/configmapsyncer:v0.0.1 configmapname read examplekey /tmp/result`  
the result will present at /tmp/result
