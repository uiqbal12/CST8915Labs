# CST8915 Lab 3: Algonquin Pet Store on Azure VM

**Student Name**: Usama Iqbal 
**Student ID**: 040777763
**Course**: CST8915 Full-stack Cloud-native Development
**Semester**: Winter 2026

---

## Demo Video

🎥 [Watch Demo Video] https://www.youtube.com/watch?v=q_y-Wm5epAc

---

## Technical Explanations

### What challenges did you encounter when configuring environment variables in the GitHub Actions workflow?
Setting up envrironment variables was pretty straight forward. I just had to remember to give the correct credentials in the case of Rabbit MQ login and the correct IP address. The issue that I did encounter while working with the order service was that it had some needed changes in the package.json file under test, build and run section. It was a trial and error and multiple attempts later I was finally able to build and deploy successfully. 
### How does deploying microservices on Azure Web App Service differ from running them locally?
Deploying them on Azure Web app in my experience was far easier, we just connected it to the relevant github repository. It self generated a yaml file and it builds and deploys the application automatically. All of this can be observed on the git hub repo under the github actions tab. Deploying it as Azure web App services meant that the urls for every service would be different and it needed to be changed in the environment variables tab. Locally we just used localhost. What was neat was CI/CD is taken care of by Azure. As soon as any code changes were made and pushed to the repo, a new git hub action would be initiated and the application is built and deployed once again. 
### Why is it important to use environment variables for configurations in a cloud environment?
First of all for proper functioning of the app. If we for instance don't expose the port that order service will hit the store front on, the application will just not function. It can also enhance security of the application passwords and secrets will not be stored in source code and can be configured in the environmet variables instead. Differentiating different environments is also facilitated, if a company has DEV1, DEV2, and PROD all the different environments could have specific variables to reduce environment specific bugs and reducing code changes needed. 


### Order Service URL 
https://order-service-aga4g6a0g5bjaxew.westus3-01.azurewebsites.net
### Product Service URL 
https://product-service-h8gsc5gyeaa9aqaq.westus3-01.azurewebsites.net
### Store Front URL 
https://witty-beach-05abd520f.6.azurestaticapps.net