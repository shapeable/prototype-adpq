#California Alerts
===
 ([EN ESPAÑOL](./LEEME.md))
___
​
Made in [Ruby on Rails](http://rubyonrails.org/) with Rails '5.0.1'
​
##Dependencies:
​
**[Sendgrid](https://sendgrid.com/)**: for managing MAIL.

**[Twilio](https://www.twilio.com/)**: for managing SMS.

**[Swagger](http://swagger.io/)**: Framework for APIs.

===

## Database PostgreSQL
<img src="https://cdn.rawgit.com/shapeable/prototype-web/dev/diagrams/relational.png" alt="DP" height="300" width="500"/>

===
​
##Environments:
​
​The following keys are required:
​
###Twilio

    FRIENDLY_NAME: ''
    TWILIO_ACCOUNT_SID: ''
    TWILIO_AUTH_TOKEN: ''
    SENDER_PHONE_NUMBER: ''

###Sengrid

    SENDER_EMAIL: ''
   
   
===

##Instalation:
​
You can access the repository in [GitHub](https://github.com) of [California Alerts](https://github.com/shapeable/prototype-web)

We clone the repository:
    
    git@github.com:shapeable/prototype-web.git
    
Enter the folder: 

	cd web-app
	      
Install and update the gems:
    
    bundle install
    
Create the migrations of the databases:
    
    rake db:setup
​
We start the server:
    
    rails s
    

===
 
##Questions or problems?
​
We keep the proyect conversation in our issue page in GitHub [issues](https://github.com/shapeable/prototype-web/issues). If you have any other questions, you can contact us <equipo@civica.digital>.


##License
​
Licensed under the Apache License, Version 2.0 Read the document [LICENSE](http://www.apache.org/licenses/LICENSE-2.0) for more information
​
Created by [Cívica Digital](http://www.civica.digital), 2017.
