- ConfigMaps 
 - A ConfigMap is an API object used to store non-confidential data in key-value pairs. 
 - Pods can consume ConfigMaps as environment variables, command-line arguments, or as configuration files in a volume.
 - A ConfigMap allows you to decouple environment-specific configuration from your container images, so that your applications are easily portable.
- Note:
   - A ConfigMap is not designed to hold large chunks of data. The data stored in a ConfigMap cannot exceed 1 MiB. If you need to store settings that are larger than this limit, you may want to consider mounting a volume or use a separate database or file service.

- ConfigMap object
   - ConfigMap has data and binaryData fields. 
   - These fields accept key-value pairs as their values
   - The data field is designed to contain UTF-8 strings while the binaryData field is designed to contain binary data as base64-encoded strings.
   - Both the data field and the binaryData are optional.

There are four different ways that you can use a ConfigMap to configure a container inside a Pod:

   -  Inside a container command and args
   -  Environment variables for a container
   -  Add a file in read-only volume, for the application to read
   -  Write code to run inside the Pod that uses the Kubernetes API to read a ConfigMap

- Secrets 

- A Secret is an object that contains a small amount of sensitive data such as a password, a token, or a key. 
-  Using a Secret means that you don't need to include confidential data in your application code.
- Secrets are similar to ConfigMaps but are specifically intended to hold confidential data.

Configuring the configmaps 

- https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/
