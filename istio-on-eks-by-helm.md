
# Triển khai Istio trên EKS bằng Helm

## ✅ Yêu cầu
- Đã có một EKS Cluster hoạt động
- Đã cài đặt `kubectl`, `helm`, `aws-cli`
- Đã cấu hình `kubectl` kết nối với EKS cluster
- Namespace ứng dụng là `dev`

---

## 📦 Bước 1: Thêm Helm repo của Istio

```bash
helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update
```

---

## 🗂️ Bước 2: Tạo namespace cho Istio control plane

```bash
kubectl create namespace istio-system
```

---

## 🧱 Bước 3: Cài đặt Istio Base (CRDs)

```bash
helm install istio-base istio/base -n istio-system
```

---

## 🔧 Bước 4: Cài đặt Istiod (control plane)

```bash
helm install istiod istio/istiod -n istio-system \
  --set global.proxy.autoInject=enabled \
  --set global.proxy.logLevel=warning
```

---

## 🌐 Bước 5: Cài đặt Istio Ingress Gateway

```bash
kubectl create namespace istio-ingress
helm install istio-ingress istio/gateway -n istio-ingress \
  --set service.type=LoadBalancer
```

---

## 🚪 Bước 6: Bật sidecar injection cho namespace `dev`

```bash
kubectl label namespace dev istio-injection=enabled
```

⚠️ Nếu Pod đã được deploy trước đó, cần rollout lại hoặc xoá để được inject sidecar `istio-proxy`.

```bash
kubectl rollout restart deployment <your-deployment-name> -n dev
```

---

## 🧪 Bước 7: (Tùy chọn) Deploy ứng dụng demo Bookinfo

```bash
kubectl apply -n dev -f https://raw.githubusercontent.com/istio/istio/release-1.22/samples/bookinfo/platform/kube/bookinfo.yaml
kubectl apply -n dev -f https://raw.githubusercontent.com/istio/istio/release-1.22/samples/bookinfo/networking/bookinfo-gateway.yaml
```

---

## 🌍 Bước 8: Truy cập app qua LoadBalancer

```bash
kubectl get svc -n istio-ingress istio-ingress
```

Mở trình duyệt: `http://<EXTERNAL-IP>/productpage`

---

## 🔍 Bước 9: Kiểm tra Pod có sidecar chưa

```bash
kubectl get pod -n dev -o jsonpath="{.items[*].spec.containers[*].name}"
```

> Kết quả phải chứa cả container app và `istio-proxy`

---

## ❌ Bước 10: Gỡ cài Istio (nếu cần)

```bash
helm uninstall istio-ingress -n istio-ingress
helm uninstall istiod -n istio-system
helm uninstall istio-base -n istio-system
```

---

## ✅ Tổng kết

| Thành phần       | Namespace      | Helm chart name   |
|------------------|----------------|--------------------|
| Istio CRDs       | `istio-system` | `base`             |
| Istio control    | `istio-system` | `istiod`           |
| Ingress Gateway  | `istio-ingress`| `gateway`          |
| App namespace    | `dev`          | Bật sidecar inject |
