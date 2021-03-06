# Virtual-zenn

[![CI to Docker Hub](https://github.com/Iovesophy/virtual-zenn/actions/workflows/scheduled_workflows.yml/badge.svg?branch=master)](https://github.com/Iovesophy/virtual-zenn/actions/workflows/scheduled_workflows.yml)

This is an initial setup script that can automatically link zenn.dev and github and write articles,books with just make.

#### keywords
+ Zenn.dev
+ Github
+ Docker
+ Makefile
+ Node.js
+ npm
+ vim

- Attention notice
If the configured zenn.dev already exists , this script change the configuration your environment.

## Dependency
Tested only zsh on macOS , so if you want to use script for Windows . Please regulation yourself .

## Usage

+ Install Docker (https://docs.docker.com/docker-for-mac/install/)
+ Clone this repository
+ Open terminal.app
+ Setting this repository your git environment

#### For example
```
$ cd virtual-zenn
$ git remote add <your env> <your env>
$ git config user.name "your name" 
$ git config user.email "your email"
```

And please read this content below

#### Zenn Contents
[π Github connect guide](https://zenn.dev/zenn/articles/connect-to-github)
[π How to use](https://zenn.dev/zenn/articles/zenn-cli-guide)
[π Markdown guide](https://zenn.dev/zenn/articles/markdown-guide)

+ Input this command below

```
$ make
```

β»This is quick start mode: case1 

+ auto create new article and auto start vim
+ done,start your zenn life

If you need update virtual-zenn β

```
$ make update
```

### make option list

+ case1 
  + create new article and auto start vim
```
$ make
```

+ case2 
  + create new book and auto start vim
```
$ make book
```

+ case3 
  + create new article
```
$ make create
```

+ case4 
  + create new book
```
$ make create-book
```

+ case5 
  + edit mode
```
$ make edit
$ make edit-book
```

+ case6
  + upload
```
$ make upload
$ make upload-book
```

+ case7
  + update virtual-zenn
```
$ make update
```

+ case8
  + check contents title
```
$ make ls
```

β» You can custom, so try any setting yourself.


## License
Copyright (c) 2021 Kazuya yuda.
This software is released under the MIT License, see LICENSE.
https://opensource.org/licenses/mit-license.php

## Authors
kazuya yuda.

## References
+ Zennγζ―γγζθ‘γ¨γ΅γΌγγΉζ§ζ https://zenn.dev/catnose99/articles/zenn-dev-stack
+ GitHubγͺγγΈγγͺγ§Zennγ?γ³γ³γγ³γγη?‘ηγγ https://zenn.dev/zenn/articles/connect-to-github
+ git-prompt.sh  https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh  
+ Docker-docks-ja γ³γγ³γγ©γ€γ³θ£ε? https://docs.docker.jp/compose/completion.html  
+ GRUNT Getting started https://gruntjs.com/getting-started  
+ grunt-zshlint https://www.npmjs.com/package/grunt-zshlint  
