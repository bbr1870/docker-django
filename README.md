# Build a custom Django image

## Build image

In order to build a minimal image you have to switch to the project directory and run the command.

	docker image build .

If you would like to use a name instead of a hashtag you can pass the argument -t <tagname>.

## Create a container

Once the image is built a container can be started by using the run command. Several options can be used as described below.

	docker run --name <container_name> -v <host_directory>:/code --network <network_name> --ip <ip_address> -e "PROJECT_NAME=<projectname>" --user $(id -u):$(id -g) <image_tag>

The name parameter gives the container a name that can be used as reference rather than by a random hash tag. A directory on the host machine can be mapped to the container which will then contain the Django project code.
The next option is the v parameter. It is possible to connect the container to a specific network and ip address using the network and ip parameter. It is also possible to overwrite the Django project name by setting the environment variable PROJECT_NAME.
The last option is the possibility to create an additional user within the container. In this case we use the current user of the host machine so we can edit files in the mapped host directory.

## Start a container

The container can be restarted with the below command (again the current host machine user is used).

	docker start --user $(id -u):$(id -g) <container_name>

## Use of databases

Out of the box the image uses SQLite as database management system. The library Psycopg2 is included to enable the external use of the PostgreSQL database management system.