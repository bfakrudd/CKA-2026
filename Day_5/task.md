- Today we are learning about services
    - NodePort 
    - ClusterIp
    - ExternalName
    - LoadBalancer 

- | Type             | Internal Access | External Access     | Load Balanced         | Use Case               |
| ---------------- | --------------- | ------------------- | --------------------- | ---------------------- |
| **ClusterIP**    | ✅               | ❌                   | ✅                     | Internal communication |
| **NodePort**     | ✅               | ✅ (via NodeIP:Port) | ⚠️ Basic              | Simple external access |
| **LoadBalancer** | ✅               | ✅ (via LB IP)       | ✅                     | Production apps        |
| **ExternalName** | ❌               | ✅ (via DNS)         | ❌                     | External resources     |
| **Headless**     | ✅               | ❌                   | ❌ (direct Pod access) | Stateful apps          |

