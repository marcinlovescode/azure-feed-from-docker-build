# Accessing Azure Artifacts NPM feed from the docker build

This simple project shows how access Azure Artifacts NPM feed from the docker build both locally and using Azure Pipelines.

## How to add NPM_TOKEN environment variable
   * For unix based systems: Add a new line at the end of your ```.bashrc``` or ```.zshrc``` file ```export NPM_TOKEN=<YOUR_BASE64_ENCODED_TOKEN>```
   * For Windows systems: execute command in a console ```setx NPM_TOKEN "<YOUR_BASE64_ENCODED_TOKEN>"```
  
## How to build and run locally
* Update ```.npmrc``` file to use your private repository
* Type ```npm i``` to create ```package-lock.json``` file
* Build: type ```docker build --build-arg NPM_TOKEN=$NPM_TOKEN -t marcinlovescode/azure-feed-from-docker-build:latest .```
* Run: type ```docker run -p 8080:80 marcinlovescode/azure-feed-from-docker-build:latest ```
* Navigate to http://localhost:8080/

## How to build and push to ACR using Azure Pipelines
* Update build.yaml to use your secrets
* Use build.yaml as pipeline definition

## Resources:
* [https://docs.npmjs.com/using-private-packages-in-a-ci-cd-workflow](https://docs.npmjs.com/using-private-packages-in-a-ci-cd-workflow)
* [https://docs.microsoft.com/en-us/azure/devops/pipelines/build/variables?view=azure-devops&tabs=yaml#systemaccesstoken](https://docs.microsoft.com/en-us/azure/devops/pipelines/build/variables?view=azure-devops&tabs=yaml#systemaccesstoken)
* [https://github.com/Microsoft/azure-pipelines-tasks](https://github.com/Microsoft/azure-pipelines-tasks)
* Blog post: TODO