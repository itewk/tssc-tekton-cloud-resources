# TSSC Tekton Cloud Resources
TODO

## Helm Charts

### tssc-tekton-cluster-resources
Helm chart for installing and maintaining the cluster wide resources used by TSSC workflows
implemented by Tekton.

#### Configuration
See [tssc-tekton-cluster-resource/values.yaml](./tssc-tekton-cluster-resources/values.yaml)
for documentation on the configuration options for this helm chart.

#### Install & Maintain

##### Manual
Instructions for a manual install and maintain of this helm chart.

```bash
helm upgrade --install tssc-tekton-cluster-resources ./tssc-tekton-cluster-resources
```

##### Automatic
Instructions to set up ArgoCD to automatically maintain these resources for you.
