#AGI TO-DO

##Base Solution
A functional basic system can be achieved following the steps described here. This Base solution has a weight of 80% on the evaluation of the implemented Project.

The recommended implementation strategy involves the following steps:

- [x] Step 1: Building a simple Web Application using a Microservices-based architecture. You can use some open source application (see some examples below) or develop one of your own. 

*   Calculator

- [x] Step 2: Deploying the required foundational resources for the Public Cloud of choice. You will need to have the Account and Project credentials of the Cloud Provider, eventually Virtual Private Cloud (VPC),3 networking resources and the HTTP proxy service that secures outbound communication for the application.

*   terraform  networking gcp

- [x] Step 3: Building the Infrastructure using a generic toolchain for deploying the containerized application and/or necessary cloud services, using a fully automated, Infrastructure as Code (IaC) approach.

*   Teraform infraestructure (GKS cluster/Standalone Server + redis database provided by google)

- [x] Step 4: Deploying the Operations tooling that will allow basic traceability and performance monitoring of the solution. For that, you will need to have configured the application (and other resources) to expose some metrics in order to show their health and status, and then deploy a monitoring server using for example Prometheus, and create a Dashboard (e.g., using Grafana) to display the metrics in real time.

*   helmfile prometheus-grafana setup

##Optional Components or Deployments Methods
The Optional components for the solution either provide additional features or correspond to different deployment methods.The implementation of these optional features has an additional weight of 20% on the evaluation of the implemented Project.

The top evaluation of the Project can be reached by the following options to the solution (chose one):

- [x] Step 3: Docker Compose App; bash script to automagically deploy with ansible