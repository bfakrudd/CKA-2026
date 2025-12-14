- Kubernetes Authentication and Authorization
-  Learned about the kubeconfig 
   https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/
   https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/
   - A file that is used to configure access to clusters is called a kubeconfig file.
        path $HOME/.kube/config 
   - Use kubeconfig files to organize information about clusters, users, namespaces, and authentication mechanisms. The kubectl command-line tool uses kubeconfig files to find the information it needs to choose a cluster and communicate with the API server of a cluster.

-  Learned about kube-api-server
    Since it is Kind cluster , To login to control plane we need docker exec 

    docker ps -a |grep cluster3

    docker exec -it cka-cluster3-control-plane bash 
    root@cka-cluster3-control-plane:/#

    root@cka-cluster3-control-plane:/etc/kubernetes/manifests# pwd
/etc/kubernetes/manifests
root@cka-cluster3-control-plane:/etc/kubernetes/manifests# ls -l 
total 16
-rw------- 1 root root 2620 Dec 12 18:20 etcd.yaml
-rw------- 1 root root 3968 Dec 12 18:20 kube-apiserver.yaml
-rw------- 1 root root 3501 Dec 12 18:20 kube-controller-manager.yaml
-rw------- 1 root root 1726 Dec 12 18:20 kube-scheduler.yaml

root@cka-cluster3-control-plane:/etc/kubernetes/manifests# cat kube-apiserver.yaml |grep autho
    - --authorization-mode=Node,RBAC

- All certificates has been place in control plane 

root@cka-cluster3-control-plane:/etc/kubernetes/pki# ls -lrth 
total 60K
-rw------- 1 root root 1.7K Oct 13 15:45 ca.key
-rw-r--r-- 1 root root 1.1K Oct 13 15:45 ca.crt
-rw------- 1 root root 1.7K Oct 13 15:45 apiserver-kubelet-client.key
-rw-r--r-- 1 root root 1.2K Oct 13 15:45 apiserver-kubelet-client.crt
-rw------- 1 root root 1.7K Oct 13 15:45 front-proxy-ca.key
-rw-r--r-- 1 root root 1.1K Oct 13 15:45 front-proxy-ca.crt
-rw------- 1 root root 1.7K Oct 13 15:45 front-proxy-client.key
-rw-r--r-- 1 root root 1.1K Oct 13 15:45 front-proxy-client.crt
drwxr-xr-x 2 root root 4.0K Oct 13 15:45 etcd
-rw------- 1 root root 1.7K Oct 13 15:45 apiserver-etcd-client.key
-rw-r--r-- 1 root root 1.1K Oct 13 15:45 apiserver-etcd-client.crt
-rw------- 1 root root  451 Oct 13 15:45 sa.pub
-rw------- 1 root root 1.7K Oct 13 15:45 sa.key
-rw------- 1 root root 1.7K Dec 12 18:20 apiserver.key
-rw-r--r-- 1 root root 1.4K Dec 12 18:20 apiserver.crt





    