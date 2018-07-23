# Oradian Assignment

In order to run the project, please follow the instructions below.
The project should be run on a Linux machine.

### Prerequisites

Linux <br>
Chrome (versions higher than 66)

## Ruby and Cucumber Setup
In order to install everything that we need to run cucumber projects please, follow the instructions on the link [Ruby Setup](https://github.com/rvm/ubuntu_rvm)

Once you have done all the procedures from the link above you should download the repository
and run the following commands:

```
gem install bundler

```
```
cd TestAutomationAssigment 

```
```
bundle install 

```

## Cucumber Scenarios

In order to run the scenarios on the project you could use the commands below:

```
cucumber --tags @dashboard

```
If you run the command above you will run the test automation scenarios about dasboard feature


```
cucumber --tags @combined_sheet

```
If you run the command above you will run the test automation scenarios about combined sheet feature