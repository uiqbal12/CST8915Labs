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

[Your explanation here - 1-2 paragraphs]

### Store Front (Vue.js)

[Your explanation here - 1-2 paragraphs]


---

## Challenges and Learnings (Optional)

[Share any interesting challenges you faced during setup, how you solved them,
and what you learned from this lab experience]

---

## Acknowledgments

[Optional: Credit any resources, documentation, or people who helped you]