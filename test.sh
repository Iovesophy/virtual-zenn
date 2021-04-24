#!/bin/bash

yes | docker system prune -a
make | echo skip
make book | echo skip
make edit | echo skip
make edit-book | echo skip
make create
make create-book
make upload
make upload-book
make reset

rm -f -r articles/*
rm -f -r books/*
mkdir articles/stage
mkdir books/stage
touch articles/.keep
touch books/.keep
touch articles/stage/.keep
touch books/stage/.keep
