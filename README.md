It is an go based application where end to end CI/CD was implmented.
# Structure of the Work flow of the CI/CD
Developer
   │
   ▼
GitHub (Application Code)
   │
   ▼
Jenkins CI Pipeline
   │
   ├ Build Docker Image
   ├ Push Image to DockerHub
   └ Update Kubernetes Manifest Repo
            │
            ▼
GitHub (K8s Deployment Repo)
            │
            ▼
Argo CD
            │
            ▼
Kubernetes Cluster
            │
            ▼
Application Deployment

# It is an web application where the total end to end pipeline was implmented.

⚙️ Tools & Technologies Used

Jenkins – Continuous Integration automation
Docker – Application containerization
Kubernetes – Container orchestration
Argo CD – GitOps-based continuous delivery
GitHub – Source code management
DockerHub – Container registry
Minikube – Local Kubernetes cluster for testing

# CI/CD work flow
# Code commit
In locally in our system we change out code and then we need to push the code to the github using git
# Jenkins 
After the code is pushed to the github repo, based on jenkins pipeline script code using "GitHub hook trigger for GITScm polling
?" it will detect the changes and start executing the script 
Based on Jenkins script i will first build the docker image , next it will the docker image to the docker hub.
after that it will excute the k8s yml files and start deploying.
# GITHUB Repo(k8s repo)
after deploying , if there any changes in k8s files and gitrepo code the argocd will detect>
# Continuous Delivery
Argo CD monitors the repository and detects changes.
# Automated Deployment
Argo CD synchronizes the Kubernetes cluster with the updated configuration in Git.
# Rolling Update
Kubernetes performs a rolling update to deploy the new application version without downtime.

✨ Key Features
✔ Fully automated CI/CD pipeline
✔ Docker-based containerization
✔ GitOps-based deployment strategy
✔ Automated Kubernetes deployments
✔ Rolling updates with zero downtime
✔ Version-controlled infrastructure
✔ Continuous monitoring of cluster state

🚀 Additional Optimization in the Project
Docker Image Optimization Using Multi-Stage Builds
To improve deployment efficiency and reduce container image size, the Dockerfile was optimized using multi-stage builds in Docker.
The application is first compiled in a builder stage using the Go runtime image, and only the compiled binary is copied into a minimal Alpine runtime image. This removes unnecessary build dependencies from the final image.



