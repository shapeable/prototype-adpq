#!/bin/bash -l

ssh user@domain <<EOF
  cd 'path_to_project'
  git pull origin master
  DOCKER_LOGIN=`aws ecr get-login --region us-east-1`
  ${DOCKER_LOGIN}
  docker-compose down
  rm -f tmp/pids/server.pid
  docker-compose run web rake db:migrate RAILS_ENV=production
  docker-compose -f docker-compose.yml -f production.yml up -d
  exit
EOF
