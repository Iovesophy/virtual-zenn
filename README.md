# Virtual-zenn

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
$ rm -r -f .git
$ git init
$ git remote add oritin <your env>
$ git config user.name "your name" 
$ git config user.email "your email"
```
And please read this content below

#### Zenn Contents
[📕 Github connect guide](https://zenn.dev/zenn/articles/connect-to-github)
[📘 How to use](https://zenn.dev/zenn/articles/zenn-cli-guide)
[📘 Markdown guide](https://zenn.dev/zenn/articles/markdown-guide)

+ Input this command below

```
$ make
```

※This is quick start mode: case1 

+ auto create new article and auto start vim
+ done,start your zenn life

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

※ You can custom, so try any setting yourself.


## License
Copyright (c) 2021 Kazuya yuda.
This software is released under the MIT License, see LICENSE.
https://opensource.org/licenses/mit-license.php

## Authors
kazuya yuda.

## References
+ Zennを支える技術とサービス構成 https://zenn.dev/catnose99/articles/zenn-dev-stack
+ GitHubリポジトリでZennのコンテンツを管理する https://zenn.dev/zenn/articles/connect-to-github
+ git-prompt.sh  https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh  
+ Docker-docks-ja コマンドライン補完 https://docs.docker.jp/compose/completion.html  
+ GRUNT Getting started https://gruntjs.com/getting-started  
+ grunt-zshlint https://www.npmjs.com/package/grunt-zshlint  
