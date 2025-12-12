- Managing TLS in Kubernetes 
  - https://kubernetes.io/docs/setup/best-practices/certificates/
  - https://kubernetes.io/docs/tasks/administer-cluster/certificates/
  - https://kubernetes.io/docs/tasks/tls/managing-tls-in-a-cluster/

- Requesting a certificate
  The following section demonstrates how to create a TLS certificate for a Kubernetes service accessed through DNS.

  - Create a certificate signing request
        cfssl genkey server.json |cfssljson -bare server

  - Create a CertificateSigningRequest object to send to the Kubernetes API
        kubectl apply -f csr.yaml

  - Get the CertificateSigningRequest approved
        kubectl certificate approve my-svc.my-namespace
  
- Sign the CertificateSigningRequest
   - Create a Certificate Authority
       cfssl gencert -initca ca.json |cfssljson -bare ca

   - Issue a certificate
         cat server-signing-config.json 
{
    "signing": {
        "default": {
            "usages": [
                "digital signature",
                "key encipherment",
                "server auth"
            ],
            "expiry": "876000h",
            "ca_constraint": {
                "is_ca": false
            }
        }
    }
}
     command:
            kubectl get csr my-svc.my-namespace -o jsonpath='{.spec.request}' | \
            base64 --decode | \
            cfssl sign -ca ca.pem -ca-key ca-key.pem -config server-signing-config.json - | \
            cfssljson -bare ca-signed-server
- Upload the signed certificate
       command: 
              kubectl get csr my-svc.my-namespace -o json | \
              jq '.status.certificate = "'$(base64 -i ca-signed-server.pem | tr -d '\n')'"' | \
              kubectl replace --raw /apis/certificates.k8s.io/v1/certificatesigningrequests/my-svc.my-namespace/status -f -
- Download the certificate and use it
         command:
               kubectl get csr my-svc.my-namespace -o jsonpath='{.status.certificate}' \
               | base64 --decode > server.crt
               kubectl create secret tls server --cert server.crt --key server-key.pem
               kubectl create configmap example-serving-ca --from-file ca.crt=ca.pem