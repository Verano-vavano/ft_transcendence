# TRANSCENDENCE

all: build
clean: down volume_rm
fclean: clean purge
re: clean all
fre: fclean all
.PHONY=all clean fclean re fre up build down volume_rm rm purge stop

up:
	docker-compose -f srcs/docker-compose.yml up

build:
	docker-compose -f srcs/docker-compose.yml up --build

stop:
	docker stop $$(docker ps -qa)

down:
	docker-compose -f srcs/docker-compose.yml down

rm: volume_rm
	docker container rm -f $$(docker ps -qa)
	docker network rm $$(docker network ls -q) 2>/dev/null

volume_rm:
	docker volume rm $$(docker volume ls -q)

prune:
	docker system prune -af
