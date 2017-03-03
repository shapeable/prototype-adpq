[![Build Status](https://travis-ci.org/shapeable/prototype-web.svg?branch=master)](https://travis-ci.org/shapeable/prototype-web)
[![Coverage Status](https://coveralls.io/repos/github/shapeable/prototype-web/badge.svg?branch=master)](https://coveralls.io/github/shapeable/prototype-web?branch=master)
[![Code Climate](https://codeclimate.com/github/shapeable/prototype-web/badges/gpa.svg)](https://codeclimate.com/github/shapeable/prototype-web)

# California Alerts
Version 1.0 03/03/2017

#### Table of Contents
- [Demo URL](#demo-url)
- [Description](#description)
- [How to install](#how-to-install)
- [Technical approach](#technical-approach)
- [Contact info](#contact-info)
- [License](#license)

## Demo URL
https://california-alerts.shapeable.net/

## Description
The California Alerts platform is a prototype that notifies California residents about emergencies happening near them. The platform is focused on two main users: the government administrator in charge of issuing alerts and the resident of California.
 The government administrator has access to features such as: a dashboard to visualize alert metrics as well as configure which alerts are made available to users.  California resident features include: setting how they'd like to be alerted and selecting which alerts they'd like to receive.

Using the USDS Digital Playbook as a guide, user centered design methodology and agile development techniques, a functional prototype was developed. These practices are reflected and detailed within this README file.

## How to install
You can access our GitHub repository: [California Alerts](https://github.com/shapeable/prototype-web)

First clone the repository:

    git clone git@github.com:shapeable/prototype-web.git

Enter the root folder for the application:

	cd web-app

Install and update the gems:

    bundle install

Create the migrations of the databases:

    rake db:setup
​
Start rails server:

    rails s

Start Redis Server

    redis-server

Start Sidekiq

    bundle exec sidekiq   

Complete instructions can be found [here](https://github.com/shapeable/prototype-web/blob/master/web-app/README.md)

## Technical approach
Each of the Technical Approach requirements outlined in Attachment B - ADPQ Vendor Pool Submission Requirements are addressed in the following document. We also followed the U.S. Digital Services playbook. The detailed notes of each play can be found [here.](https://github.com/shapeable/prototype-web/blob/master/supporting-documents/USDS%20Playbook%20Checklist.md)

#### A. Assigned a team leader
Alan Mond, Product Owner

#### B. Team Members (and corresponding ADPQ labor categories)
+ Product Manager: Diana D'Herrera
+ Technical Architect: Rafael Cárdenas
+ Interaction Designer/User Researcher: Diana D'Herrera
+ Visual Designer: Sofía Moya
+ Front End Developer: Isabel Anguiano
+ Back End Developer: Miguel Morán
+ Dev Ops Engineer: Giovanni Cortés
+ Security Engineer: Rafael Cárdenas
+ Agile Coach: Paulina Bustos
+ Quality Assurance: Juan Pablo Escobar

#### C. Understood what people needed.

User research and testing was divided into three main methods following the human-centered design approach:

Inspiration phase
+ Research of other platforms that offered similar solutions - [Link](https://github.com/shapeable/prototype-web/blob/master/supporting-documents/Platforms%20research%20-%20Sheet1.pdf)
+ Initial interviews with potential users - [Link to interviews](https://github.com/shapeable/prototype-web/blob/master/supporting-documents/user-testing/Initial%20interviews.pdf).
+ Framing the design challenge - [Link](https://github.com/shapeable/prototype-web/blob/master/supporting-documents/Framing%20your%20design%20challenge.pdf)

Ideation phase
+ Downloading all the insights collected from interviews and online surveys.
+ Team brainstorming sessions.
+ Definition of an initial 'core features' list and a customer journey.

Implementation

+ Creation of Mock-ups - [Link](https://github.com/shapeable/prototype-web/blob/master/supporting-documents/design/Prototype%20mock%20ups.pdf)
+ Initial mock ups reviewed with unassociated staff member to provide additional feedback on application behavior - [Link](https://github.com/shapeable/prototype-web/blob/master/supporting-documents/design/Prototype%20mock%20ups%20V1.pdf)
+ Final mock-ups with the implementation of user feedback - [Link](https://github.com/shapeable/prototype-web/blob/master/supporting-documents/design/Prototype%20mock%20ups%20V2.pdf)
+ The [clickable wireframes](https://invis.io/6VAJF25EK) were tested by potential government and resident users. The design of the tests included 4 main tasks. - [Link to user testing](https://github.com/shapeable/prototype-web/blob/master/supporting-documents/user-testing/TasksforUsertesting.pdf)

+ Changes from former feedback were incorporated to design a [final prototype design](https://github.com/shapeable/prototype-web/blob/master/supporting-documents/design/Prototype%20wireframes.pdf) which was tested again in another focus group for validation. The design of the tests included 4 main tasks. - [Link to user testing](https://github.com/shapeable/prototype-web/tree/master/supporting-documents/user-testing)

In the absence of actual government administrator user responsibilities, access, and organization, we worked with the following assumptions:
+ A government administrator doesn't have to create an account and log in to access all functionality due to the lack of authentication requirement.
+ A government administrator would have access to all alerts.
+ A government administrator can force alerts when needed.

#### D. Used at least three “human-centered design” techniques or tools
Multiple human-centered design techniques were used in the development of the prototype.
These included:
+ Creative approach: Inspiration, Ideation, and Implementation.
+ Creation of wireframes in Invision - [Link to clickable Wireframes](https://invis.io/6VAJF25EK)
+ Creation of "user stories" in Github issues  - [Link to user stories](https://github.com/shapeable/prototype-web/blob/master/supporting-documents/Userstories.pdf)
+ Creating a Product Backlog list of prioritized "user stories" - [Link to product backlog](https://github.com/shapeable/prototype-web/blob/master/supporting-documents/Product%20Backlog.png)
+ Design style guide. The official US digital services playbook was used as a reference https://playbook.cio.gov/  - Link to the guide
+ Usability testing of wireframes - [Link to user testing](https://github.com/shapeable/prototype-web/tree/master/supporting-documents/user-testing)
+ Usability testing of prototypes - [Link to user testing](https://github.com/shapeable/prototype-web/tree/master/supporting-documents/user-testing)

#### E. Used GitHub to document code commits

GitHub was used as the main documentation tool.  User Stories were created under Issues to create a Product Backlog, a Project was generated to keep track of progress and all commits and comments were stored in the same repository.  All design decision history has been documented in the repo. - [Link to the master commits record](https://github.com/shapeable/prototype-web/commits/master) .

#### F. Used Swagger to document the RESTful API, and provided a link to the Swagger API

Swagger was used to document the API in json format and are available in the following link:
https://california-alerts.shapeable.net/api-docs.json

#### G. Complied with Section 508 of the Americans with Disabilities Act and WCAG 2.0

Accessibility Developer tools was used to determine the compliance for the requirements within Section 508. This Chrome extension adds an Accessibility audit, and an Accessibility sidebar pane in the Elements tab, to your Chrome Developer Tools.
The audit results will appear as a list of rules which are violated by the page (if any), with one or more elements on the page shown as a result for each rule. If the inspected element has any properties relevant to accessibility, those properties will be displayed in the sidebar panel.  The Section 508 website was consulted as a reference https://www.section508.gov/

Results of the accesibility audits for the application can be found under the [accessibility_audit](https://github.com/shapeable/prototype-web/blob/master/supporting-documents/accessibility_audit) folder

#### H.Created or used a design style guide

A style guide was created by the UI designer with all the design elements present in the prototype. - [California Alerts Styleguide](https://github.com/shapeable/prototype-web/blob/master/supporting-documents/design/styleguide_california.pdf)

Other design elements and assets can be found [here](https://github.com/shapeable/prototype-web/blob/master/supporting-documents/design/California%20Assets-20170303T031844Z-001.zip)

#### I. Performed usability tests with people

Usability tests were performed at every step of the process.

+ Testing of initial concepts - [Link to interviews](https://github.com/shapeable/prototype-web/blob/master/supporting-documents/user-testing/Initial%20interviews.pdf).
+ Testing of initial [wireframes](https://invis.io/6VAJF25EK) - [Link to user testing](https://github.com/shapeable/prototype-web/tree/master/supporting-documents/user-testing)
+ Testing of final prototype - [Link to user testing tasks](https://github.com/shapeable/prototype-web/tree/master/supporting-documents/user-testing)


#### J. Used an iterative approach, where feedback informed subsequent work or versions of the prototype

Our iterative approach worked as follows:
+ Set up team collaboration in Slack
+ Followed SCRUM methodology
+ Set up of sprints and daily standups
+ Regular team demos for feedback
+ User testing and user feedback
+ Fast iteration in the design process as feedback was given
+ Review by Product Owner

#### K. Created a prototype that works on multiple devices and presents a responsive design

Our solution uses fluid grids that respond to most common desktop screen and devices, allowing flexible images and text resizing.
We provide a clean interface which is compatible with most common web browsers and looks great on mobile devices.

The core of the responsive behavior can be observed in these sections:
+ The grid - (4 tailored layouts)
https://github.com/shapeable/prototype-web/blob/master/web-app/app/assets/stylesheets/base/_grid_settings.scss
+ Fluid columns
https://github.com/shapeable/prototype-web/blob/master/web-app/app/assets/stylesheets/base/_cols.scss

#### L. Used at least five modern and open-source technologies

Many open-source technologies were used to develop the prototype in alignment with recommendations from the U.S. Digital Services Playbook.

This is a list of the open-source technologies and the use given for the creation of the prototype.
+ Docker - Production deployment
+ Ruby on rails - Back end development
+ Rspec - Test
+ PostgreSQL - Database
+ Redis - In-memory database
+ Bourbon (for SCSS) - Style sheets

#### M. Deployed the prototype on PaaS

The staging prototype is deployed on a Heroku server which allows for quick deployments and all hardware updates and maintenance provided by Heroku.  Additionally many services such as continuous monitoring are native add-ons that further simplify implementation and maintenance.

The production prototype is deployed on an Amazon Web Services (AWS) server. The instructions for deployment can be found [here.](https://github.com/shapeable/prototype-web/blob/master/web-app/README.md)

#### N. Developed automated unit tests

After creating unit tests for each feature or functionality, rspec was used as the automated unit tester.  For example to test SMS (text messages) functionality, a specific unit test was created for that purpose: [Send SMS Messages code](https://github.com/shapeable/prototype-web/blob/master/web-app/spec/modules/send_sms_messages_spec.rb)

Other Unit tests can be found under: [https://github.com/shapeable/prototype-web/tree/master/web-app/spec/modules](https://github.com/shapeable/prototype-web/tree/master/web-app/spec/modules)

The percentage of the code base covered by automated tests was defined using Coveralls. Coveralls breaks down the test coverage on a file by file basis and allows one to see the relevant coverage, covered and missed lines, and the hits per line for each file.  A higher percentage means a higher percentage of lines of code written are verified by a unit test. 

The Coveralls dashboard could be found [here](https://coveralls.io/github/shapeable/prototype-web?branch=master)

Code climate was also integrated for an automated code review which grades code quality. See full results [here.](https://codeclimate.com/github/shapeable/prototype-web)

#### O. Setup or used a continuous integration system to automate the running of tests

We used Travis CI (Continuous Integration) server to run automated tests every time code was deployed to our Heroku staging instance.  Travis CI is linked directly to the GitHub repo so it checks it automatically for any errors before being merged and deployed to production. The dashboard can be found [here](https://travis-ci.org/shapeable/prototype-web)

#### P. Setup or used configuration management

We used Ansible as configuration management tool.
Ansible is a radically simple IT automation engine that automates cloud provisioning, configuration management, application deployment, intra-service orchestration, and many other IT needs.

Designed for multi-tier deployments since day one, Ansible models your IT infrastructure by describing how all of your systems inter-relate, rather than just managing one system at a time.

It uses no agents and no additional custom security infrastructure, so it's easy to deploy - and most importantly, it uses a very simple language (YAML, in the form of Ansible Playbooks)

Some of the advantages are

1. Agentless
2. Free and Open Source Software (FOSS)
3. Extensible
4. Integrating into Existing DevOps Workflows
5. Idempotency
6. Network-Wide and Ad Hoc Changes

#### Q. Setup or used continuous monitoring

[Rollbar](https://www.rollbar.com) was implemented as the continuous monitoring tool.  Rollbar can be quickly added to any Ruby application as a gem and is also a standard add-on for Heroku deployments.  It has a notification system built in that immmediately alerts the team if there are any errors.

#### R. Deployed their software in an open source container
The production prototype is deployed on AWS server using Docker container technology. Some of the advantages of using Docker are:
* Simplifying Configuration
* Code pipeline management
* Developer Productivity
* App Isolation
* Server Consolidation
* Debugging Capabilities
* Multi-tenancy
* Rapid Deployment

#### S. Provided sufficient documentation to install and run their prototype on another machine

The README.md file within the [web-app folder](https://github.com/shapeable/prototype-web/tree/master/web-app) contains complete instructions for deploying and running the prototype on any computer using Docker. The instructions can be found [here](https://github.com/shapeable/prototype-web/blob/master/web-app/README.md)

#### T. Prototype and underlying platforms used to create and run the prototype are openly licensed and free of charge

The prototype is licensed under the [MIT License](https://opensource.org/licenses/MIT). This license is permissive and free of charge.

#### U.S. Digital Playbook usage

See file [USDS Playbook Checklist for ADPQ Alert System Prototype](https://github.com/shapeable/prototype-web/blob/master/supporting-documents/USDS%20Playbook%20Checklist.md)

## Contact Info

Shapeable
2120 University Ave
Berkeley, CA 94704
c:  510-662-6152
alan@shapeable.net


## License

The prototype is licensed under the [MIT License](https://opensource.org/licenses/MIT). This license is permissive and free of charge.

Copyright 2017 [Shapeable](https://www.shapeable.net/)
