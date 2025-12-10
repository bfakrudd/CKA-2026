K8s Architecture

- Kubernetes Architecture Overview

Kubernetes follows a Master–Worker (Control Plane–Node) architecture.
It’s designed to manage, schedule, and run containers (usually Docker or containerd) across a cluster of machines.

🗺️ High-Level View
                   +-----------------------------+
                   |     Control Plane (Master)  |
                   |-----------------------------|
                   |  API Server (kube-apiserver)|
                   |  Scheduler                  |
                   |  Controller Manager          |
                   |  etcd (Key-Value Store)     |
                   +--------------+--------------+
                                  |
                     Communicates via REST/gRPC
                                  |
                   +--------------+--------------+
                   |      Worker Nodes (Minions) |
                   |------------------------------|
                   |  Kubelet                     |
                   |  Kube Proxy                  |
                   |  Container Runtime (e.g. CRI)|
                   |  Pods (containers)           |
                   +------------------------------+

⚙️ 1. Control Plane Components (Master Node)

These components manage and control the cluster.
They make global decisions about scheduling, scaling, and maintaining desired state.

Component	Description
kube-apiserver	Acts as the front-end for Kubernetes. All commands (kubectl, dashboards, controllers) communicate with the cluster through the API server.
etcd	A distributed key-value store that stores all cluster data (configuration, state, secrets, etc.). Think of it as the brain of Kubernetes.
kube-scheduler	Decides which Node should run a newly created Pod based on resource requirements, affinity/anti-affinity, taints/tolerations, etc.
kube-controller-manager	Runs multiple controllers (e.g., Node Controller, ReplicaSet Controller, Endpoint Controller) that continuously monitor the cluster’s desired vs actual state.
cloud-controller-manager (optional)	Integrates Kubernetes with cloud provider APIs (for storage, networking, load balancers, etc.).
🧩 2. Node (Worker) Components

Each worker node runs the application workloads (Pods).
They report to and take instructions from the Control Plane.

Component	Description
kubelet	The agent that runs on each node. It ensures containers described in PodSpecs are running and healthy. Communicates with the API server.
kube-proxy	Maintains network rules on each node. Handles service discovery and load balancing using iptables/IPVS.
Container Runtime	The software responsible for running containers. Examples: containerd, CRI-O, Docker (deprecated as runtime).
🧱 3. Pods

The smallest deployable unit in Kubernetes.

A Pod can contain one or more containers that share the same network namespace and storage volumes.

Managed by higher-level abstractions like Deployments, ReplicaSets, or StatefulSets.

🔄 4. Add-on Components (Optional but Common)
Add-on	Purpose
CoreDNS	Provides DNS-based service discovery within the cluster.
Ingress Controller	Manages HTTP/HTTPS routing from outside the cluster to internal services.
Metrics Server	Collects resource metrics for autoscaling.
Dashboard	Web UI for Kubernetes management.
Network Plugin (CNI)	Enables pod networking between nodes (e.g., Calico, Flannel, Weave).
🌐 5. Control Flow Example

You run:

kubectl apply -f deployment.yaml


The kubectl CLI sends the request to the API Server.

The API Server stores the desired state in etcd.

The Controller Manager detects new Pods that need scheduling.

The Scheduler assigns Pods to suitable Worker Nodes.

The kubelet on each node instructs the Container Runtime to start the containers.

The kube-proxy sets up networking rules for communication.

🧠 Summary Diagram
+------------------------------------------------------------+
|                     CONTROL PLANE                          |
|------------------------------------------------------------|
|  API Server  |  etcd  |  Scheduler  |  Controller Manager  |
+------------------------------------------------------------+
           |                          |
           | REST/gRPC                |
           v                          v
+------------------------------------------------------------+
|                       WORKER NODES                         |
|------------------------------------------------------------|
|  kubelet | kube-proxy | Container Runtime | Pods (Apps)    |
+------------------------------------------------------------+

⚖️ In Short
Plane	Main Components	Role
Control Plane	API Server, etcd, Scheduler, Controller Manager	Cluster management, decisions
Data Plane (Worker Nodes)	kubelet, kube-proxy, container runtime	Runs application workloads