# CST8915 Lab 1: Algonquin Pet Store on Azure VM

**Student Name**: [Usama Iqbal]
**Student ID**: [040777763]
**Course**: CST8915 Full-stack Cloud-native Development
**Semester**: Winter 2026 - Lab 2

---

## Demo Video

🎥 [Watch Demo Video]()

---

## Technical Explanations

### Order Service (Node.js)

The github repository for Order Service https://github.com/uiqbal12/order-service-lab2

![](/screenshotslab2/order-service-own-vm.png
)

This order service ran on its own vm along with another service called the store front. They both needed to run on the same vm for the limitation that is present on the student subscription. We can only have 3 public ips present. 

The store front repo was as follows: https://github.com/uiqbal12/store-front-lab2

The order was successfuly placed. The Rabbit mq server was running on vm 1, the prodcut service was running on vm 2, the product service and store-front were running on vm 3. 

![](/screenshotslab2/order-placed-store-front.png)

### Product Service (Rust)

Product service was running on its own vm through its own repo at the following: https://github.com/uiqbal12/product-service-lab2

![](/screenshotslab2/product-service-running-own-vm.png)

The rabbit mq was set up at the very beginning on the very first vm 

![](/screenshotslab2/rabbit-mq-as-backing-servicepng.png)


---

## Challenges and Learnings (Optional)

Many hurdles experienced. Azure portal would glitch out repeatedly not assigning a public ip. Once a public ip was assigned, ssh would not work sometimes. Once a separate repo was set up for each service and it was deployed from its own vm. There would be clashes with the node modules and it would need to be refreshed. Once the node modules or rust modules were refreshed, it was then able to run the application and if the environment variables were configured correctly, it would be able to communicate with the different service running on a different vm. Overall, even though the lab took me close to 6 hours to complete, it was a lot of fun to complete and I learned a lot. 

---

