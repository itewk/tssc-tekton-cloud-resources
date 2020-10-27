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

### tssc-workflow-tekton-pipeline
A Helm chart for Kubernetes to install the TSSC workflow run by Tekton for a
given application service.

#### Configuration
TODO

#### Install & Maintain
TODO

##### Manual
TODO

##### Automatic
TODO

### tssc-workflow-tekton-shared-resources
A Helm chart for Kubernetes to install the shared Tekon resources for a TSSC workflow
run by Tekton for a given application service.

Not intended to be used on its own but rather as a sub chart for a specific workflow/pipeline.

#### Configuration
TODO

#### Install & Maintain
TODO

##### Manual
TODO

##### Automatic
TODO
