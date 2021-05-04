NAME := virtual-zenn

.PHONY: main
main: docker-build docker-run-vim

.PHONY: book
book: docker-build docker-run-vim-book

.PHONY: create
create: docker-build docker-run-create

.PHONY: edit
edit: docker-build docker-run-edit

.PHONY: ls
ls: docker-build docker-run-check

.PHONY: reset
reset: docker-run-rm

.PHONY: update
update:
	git pull origin master

.PHONY: upload
upload:
	mv $(shell pwd)/articles/stage/* $(shell pwd)/articles/ ; git add $(shell pwd)/articles/ ; git commit -m "VIRTUALZENN: auto upload articles" ; git push origin HEAD

.PHONY: docker-build
docker-build:
	docker build -t $(NAME) .

.PHONY: docker-run-rm
docker-run-rm:
	docker run --rm $(NAME)

.PHONY: docker-run-create
docker-run-create:
	docker run -v $(shell pwd)/articles/stage:/virtual-zenn/articles -it $(NAME) zsh -c "npx zenn new:article"

.PHONY: docker-run-check
docker-run-check:
	docker run -v $(shell pwd)/articles:/virtual-zenn/articles -it $(NAME) zsh -c "npx zenn list:articles"
	docker run -v $(shell pwd)/articles/stage:/virtual-zenn/articles -it $(NAME) zsh -c "npx zenn list:articles"
	docker run -v $(shell pwd)/articles:/virtual-zenn/articles -it $(NAME) zsh -c "npx zenn list:books"
	docker run -v $(shell pwd)/articles/stage:/virtual-zenn/articles -it $(NAME) zsh -c "npx zenn list:books"


.PHONY: create-book
create-book: docker-build docker-run-create-book

.PHONY: edit-book
edit-book: docker-build docker-run-edit-book

.PHONY: docker-run-create-book
docker-run-create-book:
	docker run -v $(shell pwd)/books/stage:/virtual-zenn/books -it $(NAME) zsh -c "npx zenn new:book"

.PHONY: upload-book
upload-book:
	mv $(shell pwd)/books/stage/* $(shell pwd)/books/ ; git add $(shell pwd)/books/ ; git commit -m "VIRTUALZENN: auto upload books" ; git push origin HEAD

.PHONY: docker-run-vim
docker-run-vim:
	open http://localhost:8001 ; docker run -p 8001:8000 -v $(shell pwd)/articles/stage:/virtual-zenn/articles -it $(NAME) zsh -c "npx zenn new:article ; npx zenn preview & ; vim articles"

.PHONY: docker-run-edit
docker-run-edit:
	open http://localhost:8002 ; docker run -p 8002:8000 -v $(shell pwd)/articles/stage:/virtual-zenn/articles -it $(NAME) zsh -c "npx zenn preview & ; vim articles"

.PHONY: docker-run-vim-book
docker-run-vim-book:
	open http://localhost:8003 ; docker run -p 8003:8000 -v $(shell pwd)/books/stage:/virtual-zenn/books -it $(NAME) zsh -c "npx zenn new:book ; npx zenn preview & ; vim books"

.PHONY: docker-run-edit-book
docker-run-edit-book:
	open http://localhost:8004 ; docker run -p 8004:8000 -v $(shell pwd)/books/stage:/virtual-zenn/books -it $(NAME) zsh -c "npx zenn preview & ; vim books"

