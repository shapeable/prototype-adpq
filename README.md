[![Build Status](https://travis-ci.org/shapeable/prototype-web.svg?branch=master)](https://travis-ci.org/shapeable/prototype-web)

# prototype-adpq
Version 1.0 03/03/2017

#### Table of Contents
- PROTOTYPE URL
- OVERVIEW
- INSTALLATION
- DOCUMENTATION
- CONTACT INFO
- COPYRIGHT

## PROTOTYPE URL

# OVERVIEW
The website and mobile app are platforms that notify residents of different regions in California on emergencies happening near them. The platform is focused on two main users: The Government administrator and the californian resident.
Government administrator user features include: a dashboard where the administrator may publish alerts, force alerts when needed, and analyze visually the generated notifications data.
Resident user features include: creating a profile where he/she can choose how to be notified, on the alerts he/she wants to track by filling in a small survey to propose alerts of his/her interest.

The prototype was created by following the playbooks provided as a guide, with the help of tools of user centered design methodology which included regular feedback on the prototype in every stage developed. The prototype was also done following the agile development currently used in our company for all our products. This practices are reflected and detailed within this document.


# INSTALLATION

# TECHNICAL APPROACH

#### A. Assigned a team leader
Alan Mond, Product Owner

#### B. Team Members (and corresponding ADPQ labor categories)
+ Product Manager: Diana D´Herrera
+ Technical Architect: Rafael Cárdenas
+ Interaction Designer/User Researcher: Diana D´Herrera
+ Visual Designer: Sofía Moya
+ Front End Developer: Isabel Anguiano 
+ Back End Developer: Miguel Morán
+ Dev Ops Engineer: Giovanni Cortés
+ Security Engineer: Rafael Cárdenas
+ Agile Coach: Paulina Bustos
+ Quality Assurance: Juan Pablo Escobar

#### C. Understood what people needed.

To properly understand some of the user needs for an alert system, we surveyed 12 California residents and recorded their answers on the following spreadsheet: [Initial Interview Questions.xlsx](https://github.com/shapeable/prototype-web/blob/technical_approach/supporting-documents/Initial%20iterview%20questions.xlsx).  We specifically selected people that were both avid travelers within the state as well as non-travelers that might use alerts to stay informed.

#### D. Used at least three “human-centered design” techniques or tools

#### E. Used GitHub to document code commits

GitHub was used as the main documentation tool.  User Stories were created under the Issues, a Project was generated to keep track of progress and all commits and comments were stored in the same repository.  All design decision history has been documented in the repo.

#### F. Used Swagger to document the RESTful API, and provided a link to the Swagger API

#### G. Complied with Section 508 of the Americans with Disabilities Act and WCAG 2.0

#### H.Created or used a design style guide

A design style guide was created by the designer. It contains the styles, fonts, iconography and typography etc. (Add link)

#### I. Performed usability tests with people

#### J. Used an iterative approach, where feedback informed subsequent work or versions of the prototype

#### K. Created a prototype that works on multiple devices and presents a responsive design

#### L. Used at least five modern and open-source technologies

This is a list of the open-source technologies and the use given for the creation of the prototype.
+ Docker - Production deployment
+ Swagger - Documentation of the API
+ Ruby on rails - Back end development
+ Rspec - Test
+ PostgreSQL - Database
+ Bourbon (for SCSS) - Style sheets


#### M. Deployed the prototype on PaaS

The prototype is deployed on a Heroku server which allows for quick deployments and all hardware updates and maintenance provided by Heroku.  Additionally many services such as continuous monitoring are native add-ons that further simplify implementation and maintenance.

#### N. Developed automated unit tests

After creating unit tests for each feature or functionality, rspec was used as the automated unit tester.  For example to test SMS (text messages) functionality, a specific unit test was created for that purpose: (Send SMS Messages code)[https://github.com/shapeable/prototype-web/blob/master/web-app/spec/modules/send_sms_messages_spec.rb]

Other Unit tests can be found under: (https://github.com/shapeable/prototype-web/tree/master/web-app/spec/modules)[https://github.com/shapeable/prototype-web/tree/master/web-app/spec/modules]

#### O. Setup or used a continuous integration system to automate the running of tests

We used Travis CI (Continuous Integration) server to run automated tests every time code was deployed to our Heroku instance.  Travis CI is linked directly to the GitHub repo so it checks it automatically for any errors before being merged and deployed to production.

#### P. Setup or used configuration management

#### Q. Setup or used continuous monitoring

[Rollbar](https://www.rollbar.com) was implemented as the continuous monitoring tool.  Rollbar can be quickly added to any Ruby application as a gem and is also a standard add-on for Heroku deployments.  It has a notification system built in that immmediately alerts the team if there are any errors.

#### R. Deployed their software in an open source container

#### S. Provided sufficient documentation to install and run their prototype on another machine

#### T. Prototype and underlying platforms used to create and run the prototype are openly licensed and free of charge

#### Examples of U.S. Digital Playbook usage

# CONTACT INFO

# COPYRIGHT

