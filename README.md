# TastyIgniter Docker Starter
This is a simple Docker starter for getting a [Tasty Igniter](https://tastyigniter.com/) installation up and running.

## Getting started

- Copy `.env-example` to `.env` and add choose a name for your database, a user and a secure password.
- Run the development or production steps below.
- Install TastyIgniter by running `docker-compose exec app ./install.sh`
- When prompted for the Database host, enter `mysql`. For credentials, make sure they match your `.env`
- TastyIgniter should now be installed - visit your site url and you should see the Getting started page.
- Run commands within your docker container by using `docker-compose exec app <command>`. Alternatively enter your docker container.

### Development
Run the following in a terminal:
```shell
docker-compose -f docker-compose-dev.yml build app
docker-compose -f docker-compose-dev.yml up -d 
```

### Production
Run the following in a terminal:
```shell
docker-compose build app
docker-compose up -d
```
