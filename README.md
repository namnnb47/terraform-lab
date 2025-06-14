connect to eks
aws eks update-kubeconfig --region us-east-1 --name terraform-lab-eks-cluster

chạy helm cho react app hello world
kubectl create ns dev
helm install react-hello-world ./helm/base-app
helm upgrade --install react-hello-world ./helm/base-app -f ./helm/values-fe.yaml -dev


chạy dòng này đê restart deployment 
kubectl rollout restart deploy react-hello-world -n dev




monitoring prometheus/grafana

kubectl create namespace monitoring

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install monitoring-stack prometheus-community/kube-prometheus-stack \
  -n monitoring --create-namespace -f ./helm/monitoring-values.yaml


forward để dùng ui
kubectl port-forward svc/monitoring-stack-grafana -n monitoring 3000:80

