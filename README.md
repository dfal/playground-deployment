# playground-deployment

```
az login
```
```
az account list
```
```
az account set --subscription ${id}
```

```
terraform init
```
```
terraform apply
```

```
az aks get-credentials --resource-group playground --name dev-playground
```
```
kubectl apply -f ../k8s/ingress.yaml
```
```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```
```
kubectl -n argocd create secret generic github-token --from-literal=token=<YOUR_GITHUB_PERSON_ACCESS_TOKEN>
```
```
kubectl create secret generic openweathermap-api-key --from-literal=api_key=<OPENWEATHERMAP_API_KEY>
```
```
kubectl apply -f .\pr-envs\application-set.yaml
```

