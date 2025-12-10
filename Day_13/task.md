- Health probes
    -  Liveness 
        - If a container fails its liveness probe repeatedly, the kubelet restarts the container
        - Liveness probes do not wait for readiness probes to succeed
        - If you want to wait before executing a liveness probe, you can either define initialDelaySeconds or use a startup probe

    -  Readiness  
        - Readiness probes determine when a container is ready to accept traffic
        - This is useful when waiting for an application to perform time-consuming initial tasks that depend on its backing services; for example: establishing network connections, loading files, and warming caches. 
        - If the readiness probe returns a failed state, Kubernetes removes the pod from all matching service endpoints.

    -  startup 
        - A startup probe verifies whether the application within a container is started.
        - This can be used to adopt liveness checks on slow starting containers, avoiding them getting killed by the kubelet before they are up and running.
        - If such a probe is configured, it disables liveness and readiness checks until it succeeds.

    - successThreshold: 
    Minimum consecutive successes for the probe to be considered successful after having failed. Defaults to 1. Must be 1 for liveness and startup Probes. Minimum value is 1.

    - failureThreshold: 
    After a probe fails failureThreshold times in a row, Kubernetes considers that the overall check has failed: the container is not ready/healthy/live. Defaults to 3. Minimum value is 1. For the case of a startup or liveness probe, if at least failureThreshold probes have failed, Kubernetes treats the container as unhealthy and triggers a restart for that specific container. The kubelet honors the setting of terminationGracePeriodSeconds for that container. For a failed readiness probe, the kubelet continues running the container that failed checks, and also continues to run more probes; because the check failed, the kubelet sets the Ready condition on the Pod to false.
    
    - terminationGracePeriodSeconds: 
    configure a grace period for the kubelet to wait between triggering a shut down of the failed container, and then forcing the container runtime to stop that container. The default is to inherit the Pod-level value for terminationGracePeriodSeconds (30 seconds if not specified), and the minimum value is 1. See probe-level terminationGracePeriodSeconds for more detail.
