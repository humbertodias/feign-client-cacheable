build:
	# https://docs.docker.com/build/building/multi-stage/
	DOCKER_BUILDKIT=0 docker-compose build --parallel
start:
	DOCKER_BUILDKIT=0 docker-compose up -d
stop:
	docker-compose down -v --remove-orphans
restart:	stop	start
rmi:	stop
	docker images --filter "dangling=true" -q | xargs -r docker rmi -f
	docker images --filter=reference="feign-client-cacheable*" -q | xargs -r docker rmi -f
clean:	rmi
	gradle clean