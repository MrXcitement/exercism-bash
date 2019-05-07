username ?= mrbarker
imagename ?= exercism-bash
tag ?= 0.1.0

all: run

docker-run:
	mkdir -p $(HOME)/.config/exercism
	docker run \
		-dit \
		-v $(HOME)/.config/exercism:/root/.config/exercism \
		-v $(CURDIR):/workspace \
		--name $(imagename) \
		$(username)/$(imagename):$(tag)

docker-exec:
	docker exec -it $(imagename) bash --login

docker-stop:
	docker stop $(imagename)

docker-kill:
	docker kill $(imagename)

docker-rm:
	docker rm $(imagename)
