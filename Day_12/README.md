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

- commands 
   kubectl autoscale deployment php-apache --cpu-percent=50 --min=1 --max=10
   kubectl get hpa

- increase the load
  # Run this in a separate terminal
  # so that the load generation continues and you can carry on with the rest of the steps
kubectl run -i --tty load-generator --rm --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://php-apache; done"

# type Ctrl+C to end the watch when you're ready
kubectl get hpa php-apache --watch
