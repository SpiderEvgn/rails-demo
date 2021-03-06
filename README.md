# Rails Demo

Please note the following instructions are for OS X only.

Refer to Docker documentations for other platforms.

## Setting up development docker environment

1. Install docker and the supporting toolchain.

        brew update && brew install docker docker-machine docker-compose

2. Create local DB data foler as docker volume to store development database (you can move the folder to wherever you want, but do remember to use '-v' flag to point the right volume when start container)

        mkdir ../db/rails-demo

3. Pull the DB and web app images and start up the containers

        docker-compose up -d

4. Verify the containers are up and running:

        docker ps

5. Create the database and tables

        docker exec railsdemo_web_1 bash -c "rake db:create && rake db:migrate && rake db:seed"

6. Now the local server is running at:

        http://localhost:3000

7. You can attach to the web console by:

        docker attach railsdemo_web_1

8. You can jump into the web container just like virtual machine, and run command like "rails c"

        docker exec -it railsdemo_web_1 bash