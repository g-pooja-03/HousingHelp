# MySQL + Flask Boilerplate Project

This repo contains a boilerplate setup for spinning up 2 docker containers: 
1. A MySQL 8 container for obvious reasons
1. A Python Flask container to implement a REST API

## How to setup and start the containers
**Important** - you need Docker Desktop installed

1. Clone this repository.  
1. Create a file named `db_root_password.txt` in the `secrets/` folder and put inside of it the root password for MySQL. 
1. Create a file named `db_password.txt` in the `secrets/` folder and put inside of it the password you want to use for the `webapp` user. 
1. In a terminal or command prompt, navigate to the folder with the `docker-compose.yml` file.  
1. Build the images with `docker compose build`
1. Start the containers with `docker compose up`.  To run in detached mode, run `docker compose up -d`. 

## For setting up a Conda Web-Dev environment:

1. `conda create -n webdev python=3.9`
1. `conda activate webdev`
1. `pip install flask flask-mysql flask-restful cryptography flask-login`

## Project Overview
Our project is intended to represent a housing finder. Our three user personas are landlords, tenants, and students. Landlords can attain new buildings and store that data, as well as update available units. Tenants can choose roommate preferences to be able to be matched with a new roommate. Students can enter in requests like their price range and living preferences in order to be matched with apartments and roommates that they would work with. Our current application represents an initial version of this, supporting this functionality. 

## Routes
Our project currently involves get requests for price, roommate preferences, tenants, tenant and building relationships, buildings, and landlords. Post requests are used for students, buildings, and units. 

## Video walkthrough link




