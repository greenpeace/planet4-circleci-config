# Greenpeace Planet 4 CircleCi configurator

 [![CircleCI](https://circleci.com/gh/greenpeace/planet4-base-fork/tree/develop.svg?style=shield)](https://circleci.com/gh/greenpeace/planet4-base-fork/tree/develop)

This project provides a script with which a developer can update multiple configuration files for planet4-nro projects
The planet4-nro circleCI configuration files consist of 3 parts: 
- A header 
- A set of environment variables
- A set of workflows and jobs

The header, workflows and jobs should be all the same for all planet4-nro 
The only thing that should be different should be the set of environment variables.

In special cases where we need to have a different configuration to a specific NRO, this script cannot be used for it.


## Prerequisites

- You need to be able to run git commands from your command line
- The repositories you want to update, must have a file called artifacts.yml in their .circleci directory 
(for an example, check https://github.com/greenpeace/planet4-koyansync/blob/develop/.circleci/artifacts.yml )

## Instructions

- Clone this repository `git clone https://github.com/greenpeace/planet4-circleci-config`
- cd in the directory of this repository `cd planet4-circleci-config`
- Edit the file create_configs.sh and check that all the sites you want to update are listed in the array named all_sites
- Edit the header.yml for any needed changes above the variables
- Edit the config-jw-template.yml for any changes you need bellow the variables
- Run the script `./create_configs.sh`

