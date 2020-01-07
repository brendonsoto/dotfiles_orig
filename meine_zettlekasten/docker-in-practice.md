# Docker in Practice, Second Edition
:book:docker:


## Chapter 1 - Discovering Docker
Docker is a platform to build and ship software.
The pre-docker development pipeline involved moving the following:
- virtual machines
- configuration management software
- package management systems
- packages/dependencies

[Q - Third paragraph] What is meant by Docker allows "different engineers...to effectively speak one language"? How is Docker different than scripting?

^ The figure provided a rough answer. It showed how before docker people would have to configure and build tools like Jenkins, Chef, and Vagrant, but Docker now encapsulates the process.

### 1.1 The what and why of Docker
A docker is a person who puts and removes cargo from ships.
It is a manual process.
A docker was considered more productive if they could find more cost-effective ways to load the cargo.
Tetris!
The explanation of a docker was used as a metaphor for Docker the software.

Some benefits of Docker include:
- Continuous Delivery
- Being forced to document app dependencies
- Having the whole or whatever needed parts of a software stack on your machine
- Separate configuration from the OS
- Remove need for VMs
- Scriptable (since it's on the command line)
- Packaging software
- Modelling networks (since you can spin up many containers)
- Enabling microservices efficiently

[Q - From the section] What is a container? From the docker analogy, a container seems like a uniform way to group packages together and move them from point A to B.

^ A *container* is a running system.
A container is defined by an *image*.
An image is made of several *layers* plus meta data.
A layer is a set of changes to files.

I was thinking of object-oriented programming as a metaphor, with the idea of objects defined by classes, and am glad to see the book uses the same metaphor.
