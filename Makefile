PROJECT_NAME=rails_docker

up:
	docker-compose up --build

exec:
	docker-compose exec web sh

build:
	docker build -t ${PROJECT_NAME} .

shell:
	docker run -it --rm -v $(shell pwd):/app --entrypoint=sh -p 3000:3000 ${PROJECT_NAME}

server:
	rails s -b 0.0.0.0

run:
	docker run -p 3000:3000 ${PROJECT_NAME}