- Multicontainer learning 
  - sharing the resources 
- init container 
    - Cannot add or remove init containers once it is created 
- sidecar container 
- CronJobs and jobs 
- Daemonsets : exactly one pod per node

- Difference betweeen replicaset and Daemonset 

ReplicaSet with replicas: 3 does not create 3 replicas on each node. Instead, it creates 3 pods total, and the Kubernetes scheduler decides which nodes to place them on, based on available resources and scheduling rules.

- Use Case:

  - For scaling applications horizontally (e.g., web servers, backend services).

  - Ensures availability and load balancing.

exactly one pod per node (e.g., for node monitoring, log agents, etc.). A DaemonSet ensures one pod per node automatically.

Use Case:

Running system or background services on all nodes, such as:

 - Log collection (e.g., Fluentd)

 - Monitoring agents (e.g., Prometheus Node Exporter)
 - kube-proxy

 - Network services (e.g., CNI plugins - Weave-net, flannel, calico)
