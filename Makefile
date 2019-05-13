username ?= mrbarker
imagename ?= exercism-bash
tag ?= 0.1.1

all: run

run:
	mkdir -p $(CURDIR)/.config/exercism
	docker run \
		-dit \
		-v $(CURDIR)/.config/exercism:/root/.config/exercism \
		-v $(CURDIR):/workspace \
		--name $(imagename) \
		$(username)/$(imagename):$(tag)

shell:
	docker exec -it $(imagename) bash --login

stop:
	docker stop $(imagename)

kill:
	docker kill $(imagename)

rm:
	docker rm $(imagename)
