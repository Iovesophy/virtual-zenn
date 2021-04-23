NAME := virtual-zenn

.PHONY: main
main: docker-build docker-run-vim

.PHONY: create
create: docker-build docker-run-create

.PHONY: edit
edit: docker-build docker-run-edit

.PHONY: reset
reset: docker-run-rm

.PHONY: upload
upload:
	mv $(shell pwd)/articles/stage/* $(shell pwd)/articles/ ; git add $(shell pwd)/articles/ ; git commit -m "VIRTUALZENN: auto upload" ; git push origin HEAD

.PHONY: docker-build
docker-build:
	docker build -t $(NAME) .

.PHONY: docker-run-rm
docker-run-rm:
	docker run --rm $(NAME)

.PHONY: docker-run-create
docker-run-create:
	docker run -v $(shell pwd)/articles/stage:/virtual-zenn/articles -it $(NAME) zsh -c "npx zenn new:article"

.PHONY: docker-run-vim
docker-run-vim:
	open http://localhost:8001 ; docker run -p 8001:8000 -v $(shell pwd)/articles/stage:/virtual-zenn/articles -it $(NAME) zsh -c "echo STATUS=create-vimmode >> ~/.zshrc ; npx zenn new:article ; npx zenn preview & ; vim articles"

.PHONY: docker-run-edit
docker-run-edit:
	open http://localhost:8002 ; docker run -p 8002:8000 -v $(shell pwd)/articles/stage:/virtual-zenn/articles -it $(NAME) zsh -c "echo STATUS=edit-vimmode >> ~/.zshrc ; npx zenn preview & ; vim articles"

