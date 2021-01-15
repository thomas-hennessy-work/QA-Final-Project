# QA-Final-Project

Contents
- [Resources](#resources)
- [Brief](#brief)
  * [Requirements](#requirements)
  * [Our Approach](#our-approach)
- [Architecture](#architecture)
  * [CI Pipeline](#ci-pipeline)
  * [Kuberenets Cluster](#kuberenets-cluster)
- [Project Tracking](#project-tracking)
- [Risk Assessment](#risk-assessment)
- [Testing](#testing)
- [Technologies](#technologies)
  * [Azure](#azure)
  * [Git](#git)
  * [Terraform](#terraform)
  * [Ansible](#ansible)
  * [Kubernetes](#kubernetes)
  * [Jenkins](#jenkins)
  * [Nginx](#nginx)
- [Deployment](#deployment)
- [Issues](#issues)
- [Future Improvements](#future-improvements)
- [Authors](#authors)


### Resources
[GitHub Repo](https://github.com/thomas-hennessy-work/QA-Final-Project)  
[Jira Board](https://iwanmoreton.atlassian.net/jira/software/projects/DFP/boards/3)  
[Risk Assessment](https://docs.google.com/spreadsheets/d/1FPQhilFS21OTPwLfwnTY9IsM0CSvjkmDsKdMlpmwgIE/edit?usp=sharing)

### Brief

#### Requirements
The minimum viable product (MVP) was to plan, design and implement a solution for 
automating the development workflows and deployments of the Pet Clinic (AngularJS) Application
making use of supporting tools, methodologies and technologies that were
covered during our training. We had to take into consideration:
* What tools will work best?
* How can a developer test their new features on an environment before merging their changes to the main branch?
* How can changes on the GitHub repository automatically build and deploy to testing and live environments?
* What are the running costs and monthly estimates? How could they be improved?

#### Our Approach
To fulfil the given requirements we decided to use an agile methodology to allow us to adapt quickly to changes and have a more competitive edge. As a team we ran daily stand-ups to view our implementations and to 
keep track of our progress - we also kept and maintained a project tracking board to clearly show 
the effort that has been expended each day. We always held a Sprint Planning meeting at the beginning of our sprints 
to decide what is going to be brought from the Product Backlog to the Sprint Backlog. Furthermore, at the end of each 
sprint we held a Sprint Review meeting which is where the development team demonstrated what work had been done, 
the Product Owner discussed the Product Backlog as it stood and updated the Product Backlog where necessary and the 
whole group collaborated on what to do next for subsequent sprint. Finally we had a Sprint Retrospective 
where the team had an opportunity to inspect itself with regards to people, relationships, process and tools. 
We also identified what went well and any potential future improvements.

### Architecture

#### CI Pipeline
The image below shows our inital thoughts on the CI Pipeline.
##### Initial CI Pipeline
![initial-pipeline](https://github.com/thomas-hennessy-work/QA-Final-Project/blob/readme/images/CI-Pipeline1.png)  
The next image below represents our final continuous integration pipeline with the associated frameworks and services related to them.
It is a breakdown of the services and tools used to develop and deploy a well-tested, functioning program.
The services we have chosen within the pipeline provide the most efficient method of rapid development to be automated and tested.
##### Final CI Pipeline
![final-pipeline](https://github.com/thomas-hennessy-work/QA-Final-Project/blob/readme/images/CI-pipeline3.png)

#### Kuberenets Cluster
Our Azure Kubernetes Service (AKS) cluster consists of one Master node with 2 worker nodes. As presented in the diagram below. There are 3 replicas of the frontend and backend pods, and one replica each of the MySQL and Nginx pods.
These pods are allocated randomly between the 2 worker nodes. We followed the common model of having one container per pod.  
![cluster](https://github.com/thomas-hennessy-work/QA-Final-Project/blob/readme/images/aks.png)

### Project Tracking
Before starting on the code for the application a Jira board 
was set up and used to track the progress of the project and to demonstrate our team workflow, from planning to testing and finally to completion. We used epics to keep track of each part of the application which we then broke down into sub-tasks and assigned these to our sprints. We set story points to each task to rank how important we thought certain tasks would be. This then helped us plan and prioritise which tasks were most important and how much time we should allocate to them.
Throughout this project we ran 2 sprints. Below is a screenshot of our fisrt sprint, where we could see what needed to be done, what was in progess and what was done on one easily digestible board.
![jira1](https://github.com/thomas-hennessy-work/QA-Final-Project/blob/readme/images/sprint1.PNG)  
You can find the full Jira Board [here](https://iwanmoreton.atlassian.net/jira/software/projects/DFP/boards/3)  
Jira produces charts and reports automatically for the sprints. One of which is the burnup report, this was useful to help maintain our sprint's health by identifying problems such as scope creep or planned path deviation.
Below is our burnup report for our first sprint.
##### Burnup Report
![burnup](https://github.com/thomas-hennessy-work/QA-Final-Project/blob/readme/images/burnup.PNG)

### Risk Assessment
It is always important to carry out a risk assessment for any project as many different potential risks could arise.
Below is a screenshot of our detailed risk assessment. This is where we have outlined potential risks, their 
impacts, who is reponsible for it and mitigation techniques that we may need. We have also made revisits where necessary.
![riskassessment](https://github.com/thomas-hennessy-work/QA-Final-Project/blob/readme/images/risk-assessment.PNG)  
The full document can be found [here](https://docs.google.com/spreadsheets/d/1FPQhilFS21OTPwLfwnTY9IsM0CSvjkmDsKdMlpmwgIE/edit?usp=sharing)

### Testing
Testing files were all written prior to our project. As a team we had to make sure tests for the frontend, backend (unit tests) and e2e (integrated) were ran and passed successfully. We had to install and use new softwares such as J-Unit, Karma and protractor in order to acieve this.

### Technologies

#### Azure
We used Azure as the cloud provider to deploy the application in the production environment using an AKS cluster.

#### Git
We used Git as a version control system with GitHub as the provider (to store, maintain and amend our code). Github has allowed us to checkout different branches of the project and focus on features separately. We would send pull requests to merge a branch into the developement branch once everything was functioning properly. 
The team decided to have at least 2 members approve the request before it had been merged. Below is a screenshot of a merged pull request after being approved by 2 memebers of the team.  
![pull-request](https://github.com/thomas-hennessy-work/QA-Final-Project/blob/readme/images/pull-request.PNG)  
Usually we would delete our branches after they had been merged, but for the purpose of this project we have kept them to show that we were following the Feature-Branch model. Below is a screenshot of some of our branches.  
![branches](https://github.com/thomas-hennessy-work/QA-Final-Project/blob/readme/images/branches.PNG)  

We have also implemented GitHub's webhooks feature so our code can be polled by Jenkins' build triggers (automatic builds).

#### Terraform
We used Terraform as the provisioning tool to setup the AKS cluster with the correct VMs and their resource group. The Branch Model was used to promote best practises and to deploy to multiple environments (live, staging and testing), with the same infrastructure code. To avoid any duplication of code, modules (container for multiple resources that are used together) had been utilised to reference for later reuse.

#### Ansible
Additionally, we used Ansible as our configuration management tool to configure the VM where the e2e tests were run.

#### Kubernetes
We used Kubernetes as the orchestration tool to setup the live and staging environments and to manage multiple containers deployed across multiple nodes. The AKS cluster was used to deploy the application with Kubernetes deployments and services.

#### Jenkins
We used Jenkins as the CI Server. This allowed us to deploy the application very easily by creating a Jenkins Pipeline job using a multi-stage pipeline script.
BlueOcean Jenkins Plugin stuff...
![pipeline-live](https://github.com/thomas-hennessy-work/QA-Final-Project/blob/readme/images/pipeline-live.PNG)
![pipeline-staging](https://github.com/thomas-hennessy-work/QA-Final-Project/blob/readme/images/pipeline-staging.PNG)  
The GitHub webhook feature was particularly useful as whenever we commited a change to the source code 
GitHub informed Jenkins and would automatically start a build.
Our build logs are stored in Jenkins.  
![jenkinslogs](https://github.com/thomas-hennessy-work/QA-Final-Project/blob/readme/images/jenkins.png)

#### Nginx
We used Nginx as a load balancer, which handled all traffic and requests before being sent to the application.
It was also used as a web server to connect to the application on port 80.

### Deployment
Below is a screenshot of the application's home page.  
![homepage](https://github.com/thomas-hennessy-work/QA-Final-Project/blob/readme/images/homepage.PNG)

### Pricing
The aim of the project was to keep an eye on the running/monthly costs. To deploy this application we used 2 VMs in our AKS cluster, each with size B2S . This lead to an estimated running cost of £1370.40 , thus £114.20/month.
In future, if we monitored the traffic on this website, we would have a better idea on how to make our costing more efficient.
One approach could be that we set up a virtual machine scale set with a monitor autoscaling setting, to automatically scale up/down VMs when there is more/less traffic. This will help to save more cost because you only pay for what you use.

### Issues

### Future Improvements
We successfully automated the deployment of the Pet Clinic application using a range of tools, methodologies and technologies we've learnt during our trainning. However there are a number of improvements I would like to implement
* Add versioning of Docker images
* Integrate project tracking with VCS to automatically keep track the project

### Authors
Iwan Moreton  
Kiran Kalsi  
Ryan Purchase  
Thomas Hennessy
