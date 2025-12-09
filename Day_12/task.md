- Autoscaling 
   - Horizontal scaling 
            - When you scale a workload, you can either increase or decrease the number of replicas managed by the workload
   - vertical scaling 
            - Adjust the resources available to the replicas in-place.
   - Scaling workloads horizontally

        -  In Kubernetes, you can automatically scale a workload horizontally using a HorizontalPodAutoscaler (HPA).

        - It is implemented as a Kubernetes API resource and a controller and periodically adjusts the number of replicas in a workload to match observed resource utilization such as CPU or memory usage.
    - Scaling workloads vertically 
       -  You can automatically scale a workload vertically using a VerticalPodAutoscaler (VPA). Unlike the HPA, the VPA doesn't come with Kubernetes by default, but is a separate project that can be found on GitHub.

        -  Once installed, it allows you to create CustomResourceDefinitions (CRDs) for your workloads which define how and when to scale the resources of the managed replicas.

- Note:
    You will need to have the Metrics Server installed to your cluster for the VPA to work.

     Walk through exmaple https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/
