# CST8915 Lab 1: Algonquin Pet Store on Azure VM

**Student Name**: Usama Iqbal
**Student ID**: 040777763
**Course**: CST8915 Full-stack Cloud-native Development
**Semester**: Winter 2026

---

## Demo Video

🎥 [Watch Demo Video](https://www.youtube.com/watch?v=pAvv_M8WtQk)

---

## Technical Explanations

### Order Service (Node.js)

This Service is comprised of a node.js and Express Api application that accepts orders and then sends them to a RabbitMQ message queue. It receives the order as a POST request listening on the port 3000. The flow of how this happens is as follows: 

Client sends the post request with the order data in json format to port 3000/orders endpoint
Server validates the order and extracts it, after that it publishes the order to RabbitMQ
Server responds with order received confirmation 
Order sits in queue until processed by another service

### Product Service (Rust)

This is a hardcoded REST api written in Rust. When a request is made on the endpoint localhost:3030/products
it returns e products as JSON. CORS is allowed on this application. The three products are the same products returned everytime are namely Dog food with its respective id and price, Catfood and Bird seeds. This is the application which we had to edit to allow the products to be fetched, it was still looking for it on the localhost even though we were now hosting the application on our vm. We needed to go in and change the localhost to our new public ip of the vm which allowed the request to be processed successfully. 

### Store Front (Vue.js)

This is essentially the front end of the application. It renders what we see when we launch the application serving static content like the images and background as well as the Form fields. It applies the styling to the elements shown on the page. 


---

## Challenges and Learnings (Optional)

No significant challenges in following this lab. The documentation provided was very detailed. The only change I made was to upgrade the vm slightly as the bare bones one was taking literally hours for simple steps. Once it was upgraded to a slightly more powerful machine. The walkthrough worked just fine. 

## Acknowledgments

Fun activity to follow through. Documentation was helpful. 