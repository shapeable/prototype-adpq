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

A research of other emergency notification platforms was done and all feedback was used to make iterations that resulted in a list of [user stories](https://github.com/shapeable/prototype-web/blob/master/supporting-documents/Userstories.pdf) and a [customer journey] (https://github.com/shapeable/prototype-web/blob/master/supporting-documents/CustomerJourney.pdf). 
Subequently, we developed some [mock-ups](https://github.com/shapeable/prototype-web/blob/master/supporting-documents/design/Prototype%20mock%20ups%20V2.pdf) to get quick validation and user feedback. 
With more user feedback we developed a [clickable prototype](https://invis.io/6VAJF25EK) using InVision to make sure the user journey worked as planned. We tested this prototype with real users. From there, we started building a Minimum Viable Product, and tested out our platform on several residents to make sure it was very user-friendly.

The alerts to the notification system demo were selected based on the most common emergencies in California and the interests demonstrated in the users interviews. This alerts consumed from the links given in the [Prototype Resources document](https://github.com/CDTProcurement/adpq/blob/master/RFI%20CDT-ADPQ-0117%20-%20Prototype%20B%20Resources.pdf)

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

Through our research and [initial interviews] (https://github.com/shapeable/prototype-web/tree/master/supporting-documents/user-testing) with potential users we came to understand the features that we should add to the platform. Due to the lack of the authentication requirement, a sign in/sign up was not implemented for residents and government administrator so, in the platform flows there are no requests for the creation of an account.

After the mock ups and [wireframes] (https://github.com/shapeable/prototype-web/blob/master/supporting-documents/design/Prototype%20wireframes.pdf) were created we were able to talk to different government administrator including the Deputy Director of the California Governor's Office of Emergency Services (Cal OES), Kelly Hudson, who helped in the Oroville Spillway Incident. The feedback of people directly linked to emergency situations helped us got a deeper understanding of challenges and solutions to their pain points.

For the definition of the product to develop factors like frequency of use, download barrier, and internet reliability were taken in account. Interviews were done to receive feedback in the notification settings. Due to the aspects mentioned before and the nature of the notifications, we decided to create a webapp that let people choose the alerts they wanted to keep track of and the way they wanted to be notified between SMS and email. This option minimizes internet reliability (SMS) and minimize any friction that would come from having to download a mobile app.

One of the toughest problems to tackle was the definition of the analytics dashboard for the government administrators. With the variables at hand and the government administrators feedback, we manage to create useful statistics for the continuous monitoring of important data.


## Play 3
### Make it simple and intuitive

The [U.S. Web Design Standards](https://standards.usa.gov/) was used as a guide to the interfaces design. User feedback rate the platform as appealing and trustworthy.

We focused on creating a very simple and flat design, so that users would find their way easily without instructions. We focused on creating an intuitive navigation flow that help the user find rapidly the necessary information and allowed government administrators retrieve useful insights of the platform users.
Help is offered in the contact information for any possible doubt as well as the social media links, and a brief survey is displayed to enable users to give their opinion on the alerts they would want to receive.

An important detail we wanted to addressed was making the copy straightforward due to the importance of the platform theme and sense of urgency that emergencies often imply, so that users could be notified when it really matters. Also, a spanish version was created for Californian spanish-speaking users and the integration of all residents.

We focused on making our application accessible by making it usable on laptops, tablets, mobile devices, and across many browsers.

## Play 4
### Build the service using agile and iterative practices

We ra interviews and usability tests with real residents and government administrator so we were sure the platform was how it was needed. Based on the former we prioritize a list of issues for all features and tests and developed a MVP within days of starting the project.

Agile development was used to the creation of the prototype, including:
* Establish Slack and github as the platforms for the project. 
* Set up team asynchronous collaboration in Slack and daily standups.
* Use of SCRUM methodology
* Product Backlog for the current sprints in a Github project 
* Fast iteration in the design and development process.
* Implementation of code reviews

## Play 5
### Structure budgets and contracts to support delivery 

Due to the nature of this prototype, this requirement is not applicable to the project. However, our team has a lot of experience making product proposals and contracts for NGO´s and Government departments to define the deliverables and milestones according to the needs of the clients.

## Play 6
### Assign one leader and hold that person accountable

Alan Mond, Shapeable' Director of Engineering, was selected as the Project Lead and Product Owner. Alan was responsible for defining the role of Civica Digital in the development of the prototype as well as the scope of the project and requirements.
He was also authorized to make decisions about features and technical implementation details. Through the project, Alan defined the priorities and gave feedback in every stage of the prototype.


## Play 7
### Bring in experienced teams

Civica Digital is a civic tech company. We have high level experience building digital tools to enhance citizenship around the world, upgrading the way we relate to each other as citizens towards more open and responsive governments and institutions that deliver better public digital services. We offer consulting services on civic software development, implementing open data tools, data analysis and visualization. We work with governments and international NGOs as allies to develop high-impact mobile and web applications

Our team is an extremely talented group of multidisciplinary people with experience in business dev, product management, design, UX/UI, front end web development, backend web development, DevOps and technical architecture.

## Play 8
### Choose a modern technology stack

Open-source technologies have been utilized in the development. This technologies are  widespread adoption and support by successful consumer and enterprise technology companies in the private sector.

This is a list of the open-source technologies and the use given for the creation of the prototype.
+ Docker - Production deployment
+ Swagger - Documentation of the API
+ Ruby on rails - Back end development
+ Rspec - Test
+ PostgreSQL - Database
+ Bourbon (for SCSS) - Style sheets

## Play 9
### Deploy in a flexible hosting environment

The prototype is deployed on a Heroku server which allows for quick deployments and all hardware updates and maintenance provided by Heroku.  Additionally many services such as continuous monitoring are native add-ons that further simplify implementation and maintenance.

Heroku also offers an Enterprise option which delivers High Availability through redundancy across geographies and infrastructure as well as 30-minute technical support.

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

Key metrics were assessed with government administrators users to ensure the usefulness 


## Play 13
### Default to open

As a team that works implementing open source tools and delivering value through open data 
we understand the importance of developing software that allows for a community of developers from around the world to improve by providing enhancements and bug fixes. We look forward to interact responding any comment about the created project.
