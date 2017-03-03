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

**[Sidekiq](http://sidekiq.org/)**: for background jobs.

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

 We start Redis Server

    redis-server

We start Sidekiq

    bundle exec sidekiq   

===

##Deployment

###Setup and running

> You need to install Docker in you machine.

1. Clone the github repo

    git clone git@github.com:shapeable/prototype-web.git


2. Copy `config/database.yml.example` and `config/application.yml.example`. Fill with the required data

3. You need create a `production.yml` with this content

```
version: '2'

volumes:
  db_data: {}
  gems: {}
  redis: {}

services:
  db:
    image: postgres
    volumes:
      - db_data:/var/lib/postgresql/data
  redis:
    image: redis:3.2-alpine
    volumes:
      - redis:/var/lib/redis/data
  web: &web
    image: shapeable/prototype:production
    build:
      context: .
      dockerfile: Dockerfile
    command: rails s -p 3000 -b '0.0.0.0'
    depends_on:
      - db
    volumes:
      - .:/app
      - gems:/usr/local/bundle
    environment:
      - RAILS_ENV=production
  sidekiq:
    <<: *web
    command: bundle exec sidekiq
    depends_on:
      - redis
      - db
```
4. if you need to override some ports and other docker configuration, copy the docker compose override cp docker-compose.override.yml.example docker-compose.override.yml
5. Run `docker-compose -f production.yml -f docker-compose.override.yml run web rake db:setup`
6. Run `docker-compose -f production.yml -f docker-compose.override.yml up -d`

Now your current app is listening port 3000. You can install Nginx to proxy the user request.

This is an example of Nginx configuration with SSL support

```
upstream california_upstream {
  server 0.0.0.0:3000;
}

server {
  listen 80;
  server_name  your_domain;

  return 301 https://$host$request_uri;
}

server {
  listen 443 ssl;
  server_name your_domain;

  location / {
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For
    $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_cache_bypass $http_upgrade;
    proxy_pass http://california_upstream;
  }

  ssl_certificate /path_to_fullchain.pem;
  ssl_certificate_key /path_to_privkey.pem;

}
```

===
 
##Questions or problems?
​
We keep the proyect conversation in our issue page in GitHub [issues](https://github.com/shapeable/prototype-web/issues). If you have any other questions, you can contact us <alan@shapeable.net>.


##License
​
Licensed under the MIT License. Read the document [LICENSE](https://opensource.org/licenses/MIT) for more information
​
Created by [Shapeable](http://www.shapeable.net), 2017.
