# CST8915 Lab 7: Algonquin Pet Store on Azure VM

**Student Name**: Usama Iqbal
**Student ID**: 040777763
**Course**: CST8915 Full-stack Cloud-native Development
**Semester**: Winter 2026



## Potential Issues
The potential issues contained in the current configuration of the rabbit mq is hard coded credentials. They should instead be stored in a separate rabbit-mq-secret.yaml file as follows 

```yaml


apiVersion: v1
kind: Secret
metadata:
  name: rabbitmq-secret
type: Opaque
stringData:
  RABBITMQ_DEFAULT_USER: myuser
  RABBITMQ_DEFAULT_PASS: mypassword
  ```



  Rabbit MQ is a stateful application. Even though some internal components can be stateless for performance  optimazation, the broker as a whole maintains critical state data that must persists across restarts making this a stateful application. 

  Without persistent storage, this state exists only in memory and is lost when the pod terminates. 

  The implications can include data loss on pod restart or deletion, node failures and sluster scaling causing data loss. 


  ## Operational issues in the current configuration 

  Reconfiguration required after every restart: Users must be recreated, queues redeclared, and bindings re-established

  Message loss during deployments: Rolling updates or pod evictions cause queued messages to vanish

  No disaster recovery: Complete inability to recover from failures without external backups


  ## Pod deletion issues 

  Immmediate termination, the pod receives a siterm signal 

  Data loss: all data in rabbitmq /var/lib/rabitq is destroyed ubnless it is persistent volume attached with application 

  Service interruption on AMPQ 5672 and management on 15672 

  ## Pod restart issues 

  The application starts with a clean state not knowing any previous existing queues messages or custom users, no persistence in the application 

  Initial credentials applied: Only the default credentials from your environment variables exist

  Applications must reconnect: Consumers and producers need to re-establish connections

  Queue redeclaration required: Applications must redeclare queues and exchanges before sending/receiving messages


  ## Potential solutions 

  Add persistent storage to the applications or use a managedRabbitMQ service such as Azure marketplace RabbitMQ


  ## Does using Azure Service Bus solve the issues identified

  Yes, azure service bus completely solves the persistence and operations issues but with some trade offs as well. The trade offs include slightly higher latency than a local rabbit mq deployment. Another is now there will be pricing based on operations, not just compute resources. And Vendor lock is another drawback of using Azure Sevice Bus. 

---

## Demo Video

🎥 [Watch Demo Video] https://youtu.be/KqxScWgBgGQ

---
