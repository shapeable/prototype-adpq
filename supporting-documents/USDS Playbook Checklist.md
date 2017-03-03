# USDS Playbook Checklist for ADPQ Alert System Prototype

The standards set forth in the [U.S. Digital Services Playbook](https://playbook.cio.gov/) were used as a reference for the development of the prototype.

## Play 1
### Understand what people need

From the beginning, we included user interviews and feedback in creating our prototype. Early on, we interviewed government administrators and California residents for their valuable feedback. The interviews made to both types of users provided insights to their expectations of an alert system. These are mentioned in the following list. The online form and interviews can be found [here.](https://github.com/shapeable/prototype-web/tree/master/supporting-documents/user-testing)

Residents
* Platforms commonly used to search for emergency alerts.
* What do they expect of an emergency alert system.
* What is the most effective way of being notified (SMS, push notification, email).

Government administrators
* The challenges encountered notifying people in an emergency situation.
* What elements do alerts should contain.
* Valuable analytics from data retrieved.

Emergency notification platforms were researched and all feedback was used to make iterations that resulted in a list of [user stories](https://github.com/shapeable/prototype-web/blob/master/supporting-documents/Userstories.pdf) and a [customer journey] (https://github.com/shapeable/prototype-web/blob/master/supporting-documents/CustomerJourney.pdf). 
Subequently, [mock-ups](https://github.com/shapeable/prototype-web/blob/master/supporting-documents/design/Prototype%20mock%20ups%20V2.pdf) were developed to get quick validation and user feedback. 

A [clickable prototype](https://invis.io/6VAJF25EK) was developed using InVision to make sure the user journey worked as planned. We tested this prototype with real users. A Minimum Viable Product was then built and tested with several residents to make it very user-friendly.

The alerts to the notification system demo were selected based on the most common emergencies in California and the interests demonstrated in the user´s interviews. This alerts consumed from the links given in the [Prototype Resources document](https://github.com/CDTProcurement/adpq/blob/master/RFI%20CDT-ADPQ-0117%20-%20Prototype%20B%20Resources.pdf)

Selected alerts for demo
* Flooding Occurring or Imminent
* Severe Weather
* Enhanced Wildfire Risk
* Tornado Warning
* Excessive Heat Warning
* Tsunami Warning
* Earthquake Warning
* Hurricane Warning
* Severe Thunderstorm Warning
* High Surf Warning


## Play 2
### Address the whole experience, from start to finish

Through our research and [initial interviews] (https://github.com/shapeable/prototype-web/tree/master/supporting-documents/user-testing) with potential users, we learned which features were absolutely necessary for the platform. Due to the lack of the authentication requirement, a sign-in/sign-up was not implemented for residents and government administrators.  In the released prototype user flows there are no requests to create an account.

Using functional mock-ups and [wireframes] (https://github.com/shapeable/prototype-web/blob/master/supporting-documents/design/Prototype%20wireframes.pdf) we reached out to four different government administrators.  An example is Kelly Houston, the Public Information Office with California's Office of Emergency Services (Cal OES).  Mr. Houston was involved in the Oroville Spillway Incident and provided eye-opening feedback. The feedback of people directly involved with emergency situations helped us gain a deeper understanding of challenges and solutions to existing systems.

We interviewed more than 11 California residents to get a sense of what is most important to them as users.  We wanted to get feedback on the most effective notifications. Based on this research, we decided to keep the platform as a web only application that allowed residents to configure how they wanted to receive notifications. 

One of the toughest problems to tackle was to define the assumptions for the analytics dashboard intended for government administrators.  Thanks to our user feedback we were able to distill the most critical metrics and discard the rest.

In the absence of actual government administrator user responsibilities, level of access, and organization for the usage of the platform, we worked with the following assumptions:
+ A government administrator doesn't have to create an account and log in to access all functionality due to the lack of authentication requirement.
+ A government administrator would have access to all alerts.
+ A government administrator can send alerts when needed.


## Play 3
### Make it simple and intuitive

The [U.S. Web Design Standards](https://standards.usa.gov/) was used as a guide to the interfaces design. User feedback rated the platform as appealing and trustworthy.

We focused on creating a very simple and flat design.  Users should be able to find their way easily without training or instructions manual. We focused on creating an intuitive navigation flow that helps residents quickly find alert information and configuration. We also made sure government administrators would quickly be able to pull useful insights of sent alerts.

Additionally, a "customer support" chat is provided to improve user experience.  Social media links, and a brief survey is displayed at the bottom of the page to enable users to provide feedback on which alerts they'd like to see.

We wanted to highlight a straightforward and concise copy on the application to portray that the overall platform theme evoked a sense of critically relevant information.  This gives the feeling that residents could be notified with alerts when the matter the most.  Given that more than 4 million Californians can only speak Spanish, a Spanish version is offered on the top right corner of the page.

We focused on making our application responsive by making it accessible on laptops, tablets, mobile devices, and across many browsers.

## Play 4
### Build the service using agile and iterative practices

We conducted interviews and usability tests with real residents and government administrators to ensure all assumptions were validated. Based on the former we prioritize a list of issues for all features and tests and developed a MVP within days of starting the project.

Below is a list of some of the agile development characteristics of the development:
* Establishment of Slack and Github as main communication platforms
* Set up team asynchronous collaboration in Slack and daily standups.
* Use of SCRUM methodology
* Product Backlog for the current sprints in a Github project 
* Fast iteration in the design and development process.
* Implementation of code reviews

## Play 5
### Structure budgets and contracts to support delivery 

Due to the nature of this prototype, this requirement is not applicable to the project. However, our team has a lot of experience making proposals and contracts for NGOs and Government Agencies.

## Play 6
### Assign one leader and hold that person accountable

Alan Mond, Shapeable's CEO, was selected as the Project Lead and Product Owner. Alan was responsible for defining the role of Civica Digital in the development of the prototype as well as the scope, requirements and quality.
He was also authorized to make decisions about features and technical implementation details. Through the project, Alan defined the priorities and gave feedback in every stage of the prototype and was accountable for its quality.


## Play 7
### Bring in experienced teams

Shapeable brings experience managing projects and deploying production applications specifically for state and local governments.  In his previous role, Alan Mond, led the team that launched MuniRent, an equipment sharing website actively being used in 5 states across the U.S. to improve heavy-duty equipment sharing practices and reduce total cost of ownership.

Civica Digital is a civic tech company. Civica Digital's team is an extremely talented group of multidisciplinary people with experience in business dev, product management, design, UX/UI, front end web development, backend web development, DevOps and technical architecture.


## Play 8
### Choose a modern technology stack

The technologies used are  widespread adoption and support by successful consumer and enterprise technology companies in the private sector. This is a list of the open-source technologies and their use throughout the prototype: 
+ Docker - Production deployment
+ Swagger - Documentation of the API
+ Ruby on rails - Back end development
+ Rspec - Test
+ PostgreSQL - Database
+ Bourbon (for SCSS) - Style sheets

## Play 9
### Deploy in a flexible hosting environment

The staging prototype is deployed on a Heroku server which allows for quick deployments and all hardware updates and maintenance provided by Heroku.  Additionally many services such as continuous monitoring are native add-ons that further simplify implementation and maintenance.

Heroku also offers an Enterprise option which delivers High Availability through redundancy across geographies and infrastructure as well as 30-minute technical support.

The production prototype is deployed on AWS server using Docker container technology. Some of the advantages of using Docker are:
* Simplifying Configuration
* Code pipeline management
* Developer Productivity
* App Isolation
* Server Consolidation
* Debugging Capabilities
* Multi-tenancy
* Rapid Deployment


## Play 10
### Automate testing and deployments

After creating unit tests for each feature or functionality, rspec was used as the automated unit tester.  For example to test SMS (text messages) functionality, a specific unit test was created for that purpose: (Send SMS Messages code)[https://github.com/shapeable/prototype-web/blob/master/web-app/spec/modules/send_sms_messages_spec.rb]

Other Unit tests can be found under: https://github.com/shapeable/prototype-web/tree/master/web-app/spec/modules

The percentage of the code base covered by automated tests was defined using Coveralls. Coveralls breaks down the test coverage on a file by file basis and allows you to see the relevant coverage, covered and missed lines, and the hits per line for each file.
The Coveralls dashboard could be found [here] (https://coveralls.io/github/shapeable/prototype-web?branch=master)

[Rollbar](https://www.rollbar.com) was implemented as the continuous monitoring tool.  Rollbar can be quickly added to any Ruby application as a gem and is also a standard add-on for Heroku deployments.  It has a notification system built in that immediately alerts the team if there are any errors.

Code climate was also integrated for the an automated code review. The overall can be consulted [here](https://codeclimate.com/github/shapeable/prototype-web)



## Play 11
### Manage security and privacy through reusable processes

An SSL Certificate was used for the prototype. This certificate protect sensitive information such as usernames, passwords, etc. It also keeps data secure between servers and builds customer trust.

## Play 12
### Use data to drive decisions

Instead of using assumptions, we validated these assumptions with real data from interviewed users.  Both California residents and government administrators were interviewed to generate enough data to inform decisions.

The key metrics based on government administrators interviews are:
Reach - How many people will receive the message
Quality of information - The alerts contain up to date information
Send notifications for type of event

Google analytics was implemented for the retrieve of useful data.


## Play 13
### Default to open

Since the prototype consumes data provided by open APIs, it is open by default.  However, internally, the application also uses APIs that are exposed to be integrated with other applications.
