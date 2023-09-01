# Itmo Web Lab 2

**Realization of key features of requirements provided by the 2nd lab from Itmo Web course: https://se.ifmo.ru/courses/web**

Simple web application using servlets and JSP

## Getting Started

These instructions will give you a copy of the project up and running on
your local machine for development and testing purposes. See deployment
for notes on deploying the project on a live system.

### Prerequisites

Requirements for the software and other tools to build, test and push 
- installed and running Wildfly prewiev server by version 29 Final
- installed Maven

### Installing

With prerequisities fullfilled it's sufficient to copy github repository with **git copy**

## Deployment

To deploy the project one have to use Maven commands:  **mvn install**. It's important to note: Maven will install required libraries all by itself.

This command shall translate the project into .war file which may be deployed via Wildfly Preview (one can simply copy file into deployments folder)

## Acknowledgments

  - My grattitude upon Itmo Faculty of Software Engineering and Computer Systems for their course
