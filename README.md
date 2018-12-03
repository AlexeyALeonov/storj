# storj
Storj v3

# Prerequisites 
Docker, see https://docs.docker.com/get-started/

# Start the network with docker-compose
    git clone https://github.com/AlexeyALeonov/storj.git
    cd storj
    docker-compose up -d --scale storagenode=100

## Using the test network with docker-compose
### With uplink
    docker-compose run uplink mb sj://test-bucket
    docker-compose run uplink cp Video/StorjIntro.mp4 sj://test-bucket/StorjIntro.mp4
    docker-compose run uplink cp sj://test-bucket/StorjIntro.mp4 StorjIntro.mp4

### With aws
    docker-compose up -d gateway
    docker-compose run aws s3 --endpoint-url http://gateway:7777 mb s3://new-bucket
    docker-compose run aws s3 --endpoint-url http://gateway:7777 cp Video/StorjIntro.mp4 s3://new-bucket/StorjIntro.mp4
    docker-compose run aws s3 --endpoint-url http://gateway:7777 cp s3://new-bucket/StorjIntro.mp4 StorjIntro.mp4
  
## Remove the test network
    docker-compose down

# Deploy to the Docker swarm
    docker swarm init
    docker stack deploy -c docker-compose.yml v3

## Using the test network with swarm
### With uplink
    docker service update --entrypoint sh -t v3_uplink
    docker service scale v3_uplink=1
    docker ps --filter="name=v3_uplink"

take an ID of the container and use it to execute commands

    docker exec -it <ID> sh
    /storj# uplink mb sj://test-bucket
    /storj# uplink cp Video/StorjIntro.mp4 sj://test-bucket/StorjIntro.mp4
    /storj# uplink cp sj://test-bucket/StorjIntro.mp4 StorjIntro.mp4
    /storj# exit

### With aws s3
    docker service scale v3_gateway=1
    docker service update --entrypoint sh -t v3_aws
    docker service scale v3_aws=1
    docker ps --filter="name=v3_aws"
  
take an ID of the container and use it to execute commands

    docker exec -it <ID> sh
    /aws# aws s3 --endpoint-url http://gateway:7777 mb s3://new-bucket
    /aws# aws s3 --endpoint-url http://gateway:7777 cp Video/StorjIntro.mp4 s3://new-bucket/StorjIntro.mp4
    /aws# aws s3 --endpoint-url http://gateway:7777 cp s3://new-bucket/StorjIntro.mp4 StorjIntro.mp4
    /aws# exit

## Remove the test network
    docker stack rm v3
