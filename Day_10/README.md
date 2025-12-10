- Node Affinity 
   - Affinity and Anti affinity 
- The affinity feature consists of two types of affinity:
  - Node affinity functions like the nodeSelector field but is more expressive and allows you to specify soft rules.
  - Inter-pod affinity/anti-affinity allows you to constrain Pods against labels on other Pods.
- Node affinity
 - Node affinity is conceptually similar to nodeSelector, allowing you to constrain which nodes your Pod can be scheduled on based on node labels. 
 
- There are two types of node affinity:

   - requiredDuringSchedulingIgnoredDuringExecution: The scheduler can't schedule the Pod unless the rule is met. This functions like nodeSelector, but with a more expressive syntax.
   - preferredDuringSchedulingIgnoredDuringExecution: The scheduler tries to find a node that meets the rule. If a matching node is not available, the scheduler still schedules the Pod.
