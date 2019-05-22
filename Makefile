# Makefile
# Provide a standard interface for working with the exercism docker container.
# Mike Barker <mike@thebarkers.com>
# May 22nd, 2019

service ?= exercism

.PHONY: all up down shell start stop kill rm
all: up

up:
	mkdir -p $(CURDIR)/.config/exercism
	docker-compose up -d

down:
	docker-compose down

ps:
	docker-compose ps

shell:
	docker-compose exec $(service) bash --login

start:
	docker-compose start

stop:
	docker-compose stop

kill:
	docker-compose kill

rm:
	docker-compose rm
