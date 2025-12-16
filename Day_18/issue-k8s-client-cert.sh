#!/usr/bin/env bash
set -euo pipefail

# ===== CONFIGURATION =====
USERNAME="mike"
GROUPS="developers,system:authenticated"
CSR_NAME="${USERNAME}-csr"
DAYS=365
OUT_DIR="./${USERNAME}-cert"
K8S_SIGNER="kubernetes.io/kube-apiserver-client"
# =========================

mkdir -p "${OUT_DIR}"

echo "▶ Generating private key"
openssl genrsa -out "${OUT_DIR}/${USERNAME}.key" 2048

echo "▶ Creating OpenSSL CSR config"
cat > "${OUT_DIR}/csr.conf" <<EOF
[ req ]
default_bits       = 2048
prompt             = no
default_md         = sha256
req_extensions     = req_ext
distinguished_name = dn

[ dn ]
CN = ${USERNAME}

[ req_ext ]
subjectAltName = @alt_names

[ alt_names ]
DNS.1 = ${USERNAME}

EOF

echo "▶ Generating certificate signing request"
openssl req -new \
  -key "${OUT_DIR}/${USERNAME}.key" \
  -out "${OUT_DIR}/${USERNAME}.csr" \
  -config "${OUT_DIR}/csr.conf"

CSR_BASE64=$(base64 -w 0 < "${OUT_DIR}/${USERNAME}.csr")

echo "▶ Creating Kubernetes CSR object"
cat > "${OUT_DIR}/k8s-csr.yaml" <<EOF
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: ${CSR_NAME}
spec:
  request: ${CSR_BASE64}
  signerName: ${K8S_SIGNER}
  expirationSeconds: $((DAYS * 24 * 60 * 60))
  usages:
    - client auth
EOF

kubectl delete csr "${CSR_NAME}" --ignore-not-found
kubectl apply -f "${OUT_DIR}/k8s-csr.yaml"

echo "▶ Approving CSR"
kubectl certificate approve "${CSR_NAME}"

echo "▶ Waiting for certificate issuance"
for i in {1..10}; do
  CERT=$(kubectl get csr "${CSR_NAME}" -o jsonpath='{.status.certificate}')
  if [[ -n "$CERT" ]]; then
    break
  fi
  sleep 1
done

if [[ -z "$CERT" ]]; then
  echo "❌ Certificate was not issued"
  exit 1
fi

echo "▶ Saving signed certificate"
echo "${CERT}" | base64 -d > "${OUT_DIR}/${USERNAME}.crt"

echo "✅ Certificate issued successfully"
echo
echo "Files created:"
ls -1 "${OUT_DIR}"
