# HELLOWEBUI

This project is a reference implementation of dynamic infrastructure based application.

## Functional Description

The hollowebui application is just web user interface application to how a front page with an static content.

## Technical Overview

### Architecture

The application represents an concrete implementation of web user interface application running in a web service hosted in a web server.

The concrete implementation is based on just static content and a frontend application implemented in Angular.

### Wider Technical Context

The deployment model used by this application is dynamic infrastructure implemented by Ansible engine and tower for configuration management of servers, and cloudformation for provisioning.

### Common Data Model and Contract


### Configuration


### Logging & Monitoring


## Development Pipeline

Development workflow is versioned with the rest of the code with the continuous integration/delivery pipeline definition in the file .gitlab-ci.yml. That way, not only the application code and the infrastructure code is part of the solution package, the development workflow itself is part of that package and managed with the rest of the artefacts.

The core concepts of standard pipelines and specially the .gitlab-ci pipeline is described in the ["introduction to pipelines and jobs"](https://docs.gitlab.com/ee/ci/pipelines.html) online document.

In the concrete case of this application there are defined seven stages:

- build code. It's the stage where each fronted service code is compiled, with the added dependencies declared as part of them.
- test code. The application code is unit and integration tested. Moreover, static analysis security tests are performed in this stage.
- build application. In this stage, application templates are build putting the already compiled service code inside the infrastructure image and templated.
- test application. Infrastructure and service code, all as part of the templated image that is the application is functional and performance tested. Test environments are automatically provided by the pipeline job through [ansible playbook test](https://gitlab.com/IAG-DEV/GLP/hellowebui/blob/master/infrastructure/provision-test.yml) and the cloudformation definition for testing [aws.test.template](https://gitlab.com/IAG-DEV/GLP/hellowebui/blob/master/infrastructure/aws.test.template) for functional testing.
- push templates. All application templates being built and tested are versioned and pushed to production template repositories.
- deploy application. In this stage, the deployment jobs put correct templates to defined host enviroments. In this concrete example, the host is AWS cloud.
- regression test deploy. To enable continous delivery, a final stage with regresstion testing and rollback if test are not satisfy can be defined in the pipeline. In this case, only the regression test that is the previous functional test with production configuration agaisnt production enviroment.

### Testing

As we could see in previous section, there are defined five types of testing:

- unit and integration testing. In test code stage.

- static code analysis. In test code stage

- static analysis security tests. In test code stage.

- functional testing. In test application stage.
 Driven by Selenium in the hellowebui-funcitonal-test project written in java with Selenium Web Drive.

 ```
functional_test_service:
  stage: test application
  image: iaghcp-docker-technical-architecture.jfrog.io/infrastructureascode/maven:3.0.1
  before_script:
    - tower-cli config host $TOWER_CLI_HOST
    - tower-cli config username $TOWER_CLI_USERNAME
    - tower-cli config password $TOWER_CLI_PASSWORD
    - tower-cli config verify_ssl false

    - export AWS_ACCESS_KEY_ID=${AWS_CREDENTIAL_ACCESS_KEY_ID} 
    - export AWS_SECRET_ACCESS_KEY=${AWS_CREDENTIAL_SECRET_ACCESS_KEY}
    - export AWS_DEFAULT_REGION="us-west-1"
  script:
    - tower-cli job launch --job-template site-prov --extra-vars="ec2region=$AWS_DEFAULT_REGION awstemplate=aws.test.template stackname=HelloWebuiTest deploymentenv=staging" --wait

    - mvn clean package -f ./hellowebui-functional-test
    - SUT_IP="$(aws ec2 describe-instances --filters "Name=tag:Role,Values=Core Instance" "Name=tag:aws:cloudformation:stack-name,Values=HelloWebuiTest" "Name=instance-state-name,Values=running" | jq ".Reservations[0].Instances[0].PublicIpAddress" | tr -d \")"
    - TESTER_IP="$(aws ec2 describe-instances --filters "Name=tag:Role,Values=Test Instance" "Name=tag:aws:cloudformation:stack-name,Values=HelloWebuiTest" "Name=instance-state-name,Values=running" | jq ".Reservations[0].Instances[0].PublicIpAddress" | tr -d \")"
    - java -jar ./hellowebui-functional-test/target/hellowebui-functional-test-0.0.1-SNAPSHOT.jar $SUT_IP $TESTER_IP

    - tower-cli job launch --job-template site-deprov --extra-vars="ec2region=$AWS_DEFAULT_REGION stackname=HelloWebuiTest"
```

- performance testing. In test application stage.

- regression testing. In regression test stage.