k3d cluster create -i latest
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl apply -f cmp-helmfile.yaml -n argocd

kubectl -n argocd patch deployments/argocd-repo-server --patch-file argocd-repo-server-patch.yaml

kubectl apply -f application.yaml