# Overview: What Task 2 Required

**Original Problem:**  
Data was ephemeral - when pods restarted or the cluster restarted, all MongoDB data and RabbitMQ messages were lost.

**Goal:**  
Make both services have persistent storage and high availability.

---

# 1. MongoDB Changes

## Change 1: StatefulSet Instead of Deployment
- **Original:** MongoDB used a simple Deployment  
- **Changed to:** StatefulSet  

**Why:**  
StatefulSets provide:
- Stable network identities (pods have predictable names like `mongodb-0`, `mongodb-1`, `mongodb-2`)
- Ordered deployment and scaling
- Stable storage that follows the pod

---

## Change 2: Added `volumeClaimTemplates`

```yaml
volumeClaimTemplates:
  - metadata:
      name: mongodb-data
    spec:
      accessModes: ["ReadWriteOnce"]
      resources:
        requests:
          storage: 10Gi
```

## Change 3: INcreased Replicas to 3 
```yaml
replicas: 3
```

**Why**
Provides high availability. If one MongoDB instance fails, the others continue serving. Enables automatic failover.


## Change 4: Headless Service

```yaml 
spec:
  clusterIP: None
  ```


  **Why**
  Headless services provide stable DNS names like mongodb-0.mongodb, mongodb-1.mongodb, etc. This allows each MongoDB pod to be addressed individually, which is essential for replica set communication.

## Change 5: Added Replica Set Configuration 

**Why**
This tells MongoDB to run as part of a replica set named rs0. Without this, each MongoDB instance would run as a standalone database.



## Change 6: Initialize the Replica Set 

```yaml 
rs.initiate({
  _id: "rs0",
  members: [
    {_id: 0, host: "mongodb-0.mongodb:27017"},
    {_id: 1, host: "mongodb-1.mongodb:27017"},
    {_id: 2, host: "mongodb-2.mongodb:27017"}
  ]
})
```


**Why**
This configures the 3 MongoDB instances as a cluster with one PRIMARY and two SECONDARY members. The PRIMARY handles writes, SECONDARY replicas handle reads and take over if PRIMARY fails.



<br>
<br>
<br>

---

# RabbitMQ Changes for Persistent Storage and High Availability

## Change 1: StatefulSet Instead of Deployment

**Original:** RabbitMQ used a simple Deployment  
**Changed to:** StatefulSet  

**Why:** StatefulSets provide stable storage that follows the pod, essential for persistent data.

---

## Change 2: Added volumeClaimTemplates

```yaml
volumeClaimTemplates:
  - metadata:
      name: rabbitmq-data
    spec:
      accessModes: ["ReadWriteOnce"]
      resources:
        requests:
          storage: 10Gi
```

## Change 3: Added Volume mount for Data
```yaml
volumeMounts:
  - name: rabbitmq-data
    mountPath: /var/lib/rabbitmq
```

**Why**
RabbitMQ stores all queues, messages, and cluster state in /var/lib/rabbitmq. Mounting the PVC here ensures all data is written to persistent storage.



## Change 4: Kept ConfigMap Mount

```yaml
volumeMounts:
  - name: rabbitmq-enabled-plugins
    mountPath: /etc/rabbitmq/enabled_plugins
    subPath: enabled_plugins
```

**Why**
The ConfigMap for plugins must remain mounted alongside the persistent volume. This ensures plugins are enabled while data persists separately.

<br>
<br>


# Azure Managed Services 

## Azure Cosmos DB (MongoDB API)

**Purpose:**  
Fully managed MongoDB-compatible database.

**Why it's better:**  
- No replica set management  
- Automatic backups  
- Global distribution  
- 99.999% SLA  

---

## Azure Service Bus

**Purpose:**  
Fully managed enterprise message broker.

**Why it's better:**  
- No infrastructure management  
- Automatic scaling  
- Guaranteed message delivery  
- Built-in disaster recovery
