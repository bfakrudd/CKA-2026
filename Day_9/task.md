- Taints and tolerations
   -   Taint will be on configured on the node - key vailue pair 
   -   Toleration will be configured on the pod - key value pair 
   -   Effects:  noschedule , PreferNoschedule  noExecute 
        - noschedule - works on the newer pods 
        - preNoschedule - No Wrannty 
        - noExecute - Workd on newer and existing pods 

- purpose:
    - To run specific work loads 

- Taints and toleration prevent scheduling unwanted pods on Tained node - Restriction 

- Labeling the nodes 
- nodeSelector - pods take the descision on which node it has to be scheduled.


 