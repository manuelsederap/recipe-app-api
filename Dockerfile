FROM python:3.6-alpine
# MAINTAINER SPEARED SOFTWARE DEVELOPMENT INDUSTRY

# RUN PYTHON BUFFERED 1
ENV PYTHONUNBUFFERED 1

# COPY THE CONTENT OF REQUIREMENTS.txt of App projects into requirements.txt of Docker image.
COPY ./requirements.txt /requirements.txt

# RUN PIP INSTALL REQUIREMENTS.txt inside docker build.
RUN pip install -r /requirements.txt

# CREATE APP FOLDER INSIDE docker image.
RUN mkdir /app

# SWITCH WORKDIR INTO APP folder
WORKDIR /app

# COPY THE CONTENT OF APP FOLDER FROM APP projects into APP folder of DOCKER image.
COPY ./app /app

#
COPY . .

# Adding user that can only run the APP.
RUN adduser -D user

# Switch the user into the new added user.
USER user