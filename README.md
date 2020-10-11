# Traclancer - Tracking App Based on Rails API

## Introduction

This is a time tracking application API built with Rails. The app associated with this API is built for freelancers where they can track the time spent on work. The App is also a freelancing platform where clients or individuals connect with skilled freelancers to conduct business.

Specification summary:

- RESTful api.
- Api versioning.
- Booking app .
- Patterns and good practices.
- Users management.
- Secret/token api key.
- Rspec testing.
- Setup scripts.
- Postgres database.
- Json serialization.

## Quick start

- Install ruby version 2.3.0 and set it with your ruby environment manager
  ([more info here](https://www.ruby-lang.org/en/documentation/installation/)).

- Install Postgres and start the PostgreSQL server in the foreground
  ([more info here](https://wiki.postgresql.org/wiki/Detailed_installation_guides)).

- Clone the repository and get inside it:

```
git clone https://github.com/adaorachi/traclancer_api.git

cd traclancer_api
```

- Create a postgres role to let rails manage the db:

```
rails db:create
```

- Setup the gems and databases:

```
bundle install
```

```

rails db:migrate
```

- Run tests:

```
rspec
```

- Populate Database with data:

```
rails db:seed
```

- That's it, lastly start the server!

```
rails s
```

Locally the system resouces can be accessed at the local base url

```
http://localhost:3000
```

## Documentation

### Authentication

Authentication is performed using JSON Web Tokens. JSON Web Tokens are an open, industry standard [RFC 7519](https://tools.ietf.org/html/rfc7519) method for representing claims securely between two parties. When the user successfully logs in using their credentials, a JSON Web Token will be returned, which should be kept by clients in
local storage (no cookies):

**Note** Since there is no session information and every call to the REST API requires authentication. Whenever the user wants to access a protected route or resource, the user agent should send the JWT in the Authorization header using the Bearer schema:

`Authorization: Bearer <token>`

The following routes are available for authorization:

- `POST /api/v1/login`
- `GET /api/v1/logout`
- `POST /api/v1/registrations`


## Technology Used

- Rails api
- Postgres
- Active model serializers
- bcrypt
- jwt

### API Endpoints

| API Endpoint                      | Functionality                           |
| ----------------------------------| --------------------------------------- |
| POST api/v1/registrations         | Register a new user                     |
| POST api/v1/login                 | Login in a user                         |
| GET api/v1/logged_in/             | Verify a user and gets user info        |
| GET api/v1/logout                 | Logout a user                           |
| GET api/v1/project_categories     | Fetch project categories and unclaimed projects count   |
| GET api/v1/project_categories/:slug  | Fetch individual project category and associations   |
| GET api/v1/projects/:id              | Fetch individual project and all associations        |
| POST api/v1/projects                 | Client creates a project                             |
| PUT api/v1/projects                  | Updates project claimed status                       |
| GET api/v1/claimed_projects          | Fetch claimed projects of freelancer and associations|
| GET api/v1/claimed_projects/:id      | Fetch individual claimed project                     |
| POST api/v1/claimed_projects         | Freelancer claims a project                          |
| PUT api/v1/claimed_projects/:id      | Updates claimed project                              |
| GET api/v1/claimed_project_stats/:id | Fetch claimed project stats                          |
| POST api/v1/claimed_project_stats/   | Create claimed project stat and start time           |
| PUT api/v1/claimed_project_stats/:id | Update claimed project stats and stops time          |



## Live Version

This is the link to the live preview in Heroku. Consist of the base URL - 
[Traclancer Tracking App](https://enigmatic-retreat-81755.herokuapp.com)<br>

<!-- CONTACT -->

## Authors

MaryAnn Chukwuka

- [Github profile](https://github.com/adaorachi)
