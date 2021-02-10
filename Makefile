nvim ?= nvim
XDG_CACHE_HOME ?= $(HOME)/.cache

default: install

install: create-dirs
	$(nvim) -V1 -es -i NONE -N --noplugin -u init.lua -c "try | call dein#update() | call dein#recache_runtimepath() | finally | echomsg '' | qall! | endtry"

create-dirs:
	@mkdir -vp "$(XDG_CACHE_HOME)/vim/"{backup,session,swap,tags,undo}

upgrade: install
	go get golang.org/x/tools/gopls@latest
	npm upgrade -g bash-language-server typescript typescript-language-server
