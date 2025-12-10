-  Scheduler is resposible for allocating pod on the nodes 
- scheduler itself is running as pod 
- static pods are managed by kublet
- All the yamls of the static pods will be available in /etc/kubernetes/manifests

- static pods 
    - etcd , schedule , api server , control manager are all static pods.

- we can schedule the pods on Manually on specific nodes by declaring in yaml config 
    
    Example:

    spec:
  containers:
  - image: nginx
    name: nginx
  nodeName: cka-cluster3-worker

- Labels and Selectors
    Will help in selecting the pods with respect to labels


   