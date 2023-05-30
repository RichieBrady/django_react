## DRF + React + Docker

This repository is a template for creating a web application with a Django REST Framework backend, React frontend, deployed using Docker and
Docker Compose. It provides a development and production environment, each with its own Docker configuration.

### Overview

The project consists of the following components:

- **Backend:** A Django application that serves as the API backend, providing endpoints for data retrieval and manipulation. It is
  containerized
  using Docker and deployed with Docker Compose.
- **Frontend:** A React application that serves as the user interface, interacting with the backend API to fetch and display data. It is
  containerized using Docker and deployed with Docker Compose.
- **Database:** The project uses PostgreSQL as the database to store and manage data. The database is also containerized and included
  in the Docker Compose configuration.

The project has separate configurations for development and production environments:

- **Development Environment:** In the development environment, the frontend runs on the Vite development server. It allows hot-reloading and
  provides a convenient development experience. The backend and frontend are deployed as separate containers, and the frontend communicates
  directly with the backend API.
- **Production Environment:** In the production environment, the frontend is built using the Vite build tool and served by Nginx. Nginx acts
  as
  a reverse proxy, routing requests to the appropriate backend API endpoints. This setup allows for better performance and caching of static
  assets.

### Prerequisites

Before you begin, ensure that you have the following software installed on your machine:

- Docker
- Docker Compose
- Python 3.x
- Node.js
- Vite

### Configuration

**Note:** See backend/example_env/README.md for instructions on setting up .env files for the django api

You can customize the project configuration by modifying the corresponding configuration files:

- **Development Environment:**
    - **docker-compose.dev.yml:** Contains the Docker Compose configuration for the development environment.
    - **backend/Dockerfiles/Dockerfile.dev:** Dockerfile for building the Django backend container in the development environment.
    - **frontend/Dockerfiles/Dockerfile.dev:** Dockerfile for building the React frontend container in the development environment.


- **Production Environment:**
    - **docker-compose.prod.yml:** Contains the Docker Compose configuration for the production environment.
    - **backend/Dockerfiles/Dockerfile.prod:** Dockerfile for building the Django backend container in the production environment.
    - **frontend/Dockerfiles/Dockerfile.prod:** Dockerfile for building the React frontend container in the production environment.


- **Backend Configuration:**
    - **backend/django_api/settings.py:** Django settings file where you can configure database settings, CORS headers, authentication, and other
      backend-specific configurations.
    - **backend/requirements/requirements.txt:** Base Python dependencies for the backend. You can add or remove packages as per your
      project requirements.
    - **backend/requirements/dev_requirements.txt:** Development Python dependencies for the backend. You can add or remove packages as per
      your project requirements.
    - **backend/requirements/prod_requirements.txt:** Production Python dependencies for the backend. You can add or remove packages as per
      your project requirements.
    - **backend/env/dev.env:** Environment variables specific to the backend development configuration. You can configure variables such as
      API endpoints, authentication settings, or other frontend-specific variables.
    - **backend/env/prod.env:** Environment variables specific to the backend production configuration. You can configure variables such as
      API endpoints, authentication settings, or other frontend-specific variables.


- **Frontend Configuration:**
    - **frontend/package.json:** Contains the dependencies and scripts for the React frontend. You can add or remove frontend packages,
      update versions, or modify build scripts.
    - **frontend/vite.config.js:** Configure your vite build here.
    - **frontend/env/dev.env:** Environment variables specific to the frontend development configuration. You can configure variables such
      as API endpoints, authentication
      settings, or other frontend-specific variables.
    - **frontend/env/prod.env:** Environment variables specific to the frontend production configuration. You can configure variables such
      as API endpoints, authentication settings, or other frontend-specific variables.


- **Nginx Configuration:**
    - **nginx/nginx.conf:** Nginx configuration file for the production environment. You can modify this file to customize Nginx settings,
      such as server ports, SSL configuration, or caching rules.


Make sure to rebuild the Docker containers after modifying any configuration files to apply the changes.

### Usage 


#### Development Environment
Install dev dependencies for the django backend. You will need these installed while developing your backend.


From project root:
```shell
pip install -r ./backend/requirements/dev_requirements.txt
```

Build the services defined in docker-compose.dev.yml:
```shell
docker-compose -f docker-compose.dev.yml build
```

Start the built services:
```shell
docker-compose -f docker-compose.dev.yml up
```

Check the django backend container is running correctly by opening a browser and go to
```shell
0.0.0.0:8000
```
You should see a web page with message:

**The install worked successfully! Congratulations!**

To check the frontend container is running correctly check the output in the terminal you ran the up command from.
You should see output from the dev_frontend container that looks like this.
```shell
dev_frontend_1  |   VITE v4.3.7  ready in 231 ms
dev_frontend_1  | 
dev_frontend_1  |   ➜  Local:   http://localhost:5173/
dev_frontend_1  |   ➜  Network: http://172.26.0.3:5173/
```
The correct address is the Network address which may be different for you. If the container is running correctly 
you should see a webpage with the React and Vite logos and button that increments an integer on click.

If everything is running correctly you will be able to make changes to the backend or frontend that will hot reload
making development smooth.


#### Production Environment
