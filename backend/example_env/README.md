## Environment Variables Introduction

The Django settings.py file uses os.environ to extract environment variables from the relevant .env files.

The .env files are referenced and added to a service container by setting the env_file attribute in the relevant docker-compose.yml file
e.g. dev.env is set as the env_file attribute in docker-compose.dev.yml for both the db and backend services.

This allows for a separation of settings between development and production environments while reducing the need to have multiple settings
files.

As .env files usually contain sensitive information, the best practice is to exclude them from VCS. As such the project will fail to build
if the following steps are not followed.

### Set Up

The django backend container will fail to build as it expects an env folder and .env file specific to each environment e.g.
development/production.

In the example_env folder are example .env files which contain the base variables required to set up each environment. As your project grows
you will more than likely add more variables such as API keys, Access Tokens, etc.

This folder contains two files, namely dev.example_env and prod.example_env. These files contain the minimum required env variables to
build and run the project.

dev.example_env

```.dotenv
SECRET_KEY='h4^x#z%tm_qc!@=auc6*&z%zyls^b8-e7h!&p%k33b7_dr9$jq'
DEBUG=True
POSTGRES_DB=dev_db
POSTGRES_USER=dev_username
POSTGRES_PASSWORD=dev_password
``` 

prod.example_env

```.dotenv
SECRET_KEY='vp%!6h(^1+4i+a4n4w4g!4!5%ko+0b8q(*rvq%%x%a8(x#r9u7'
DEBUG=False
POSTGRES_DB=prod_db
POSTGRES_USER=prod_username
POSTGRES_PASSWORD=prod_password
``` 

#### variable descriptions

- SECRET_KEY: The django secret key required for every django project.  
  In settings.py
  ```python
  SECRET_KEY = os.environ.get('SECRET_KEY') 
  ```
- DEBUG: Should always be set False for production.  
  In settings.py
  ```python
  DEBUG = os.environ.get('DEBUG') == 'True'
  ```
- POSTGRES_DB: The name for the default database that is created when the image is first started.
- POSTGRES_USER: Set the default username.
- POSTGRES_PASSWORD: Set the default password.  
  In settings.py
  ```python
  DATABASES = {
      'default': {
          'ENGINE': 'django.db.backends.postgresql',
          'NAME': os.environ.get('POSTGRES_DB'),
          'USER': os.environ.get('POSTGRES_USER'),
          'PASSWORD': os.environ.get('POSTGRES_PASSWORD'),
          'HOST': 'db',  # The hostname of the PostgreSQL container
          'PORT': 5432,  # The port on which PostgreSQL is running
      }
  }
  ```

Below are the steps required to set up your .env files in
order for the project to build successfully, after which you can add new variables as
required and use them throughout your project.

1. Rename example_env folder to env
2. Rename the dev.env_example to dev.env:  
   This file is referenced in docker-compose.dev.yml
3. Rename the prod.env_example to prod.env:  
   This file is referenced in docker-compose.prod.yml
4. Run gen_django_secret_keys.py:  
   Running this file will print two new random keys to the terminal, you should copy and past to each .env file replacing the public keys.
5. Set your db variables
   
