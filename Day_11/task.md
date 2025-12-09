- Requests and Limit 

   - The most common resources to specify are CPU and memory (RAM)
     - limit 
     - request

     - cpu and memory limits are applied by the kubelet (and container runtime), and are ultimately enforced by the kernel
     - On Linux nodes, the Linux kernel enforces limits with cgroups. The behavior of cpu and memory limit enforcement is slightly different.
     - cpu limits are enforced by CPU throttling
     - memory limits are enforced by the kernel with out of memory (OOM) kills.


   
