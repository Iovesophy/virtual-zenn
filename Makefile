NAME := virtual-zenn
EDIT := edit

.PHONY: test
test: docker-build docker-run-rm

.PHONY: up
up: docker-build docker-run-v

.PHONY: edit
edit: docker-build-e docker-run-e
	
.PHONY: docker-build
docker-build:
	docker build -t $(NAME) .

.PHONY: docker-build-e
docker-build-e:
	docker build -t $(EDIT) .

.PHONY: docker-run-rm
docker-run-rm:
	docker run --rm $(NAME)

.PHONY: docker-run-v
docker-run-v:
	docker run -p 8001:8000 -v $(shell pwd)/articles/stage:/virtual-zenn/articles -it $(NAME) zsh -c "npx zenn new:article; npx zenn preview &; vim articles"

.PHONY: docker-run-e
docker-run-e:
	docker run -p 8002:8000 -v $(shell pwd)/articles:/note/articles -it $(EDIT) zsh -c "npx zenn preview & ; zsh"
