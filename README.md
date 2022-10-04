# neovim config by pure lua

## How to use?

1. install the lastest version of neovim from source

```bash
git clone https://github.com/neovim/neovim.git --depth 1
make CMAKE_BUILD_TYPE=RelWithDebInfo
make install
```

2. clone this repo into your nvim config

```bash
mv ~/.config/nvim ~/.config/nvim.bak
git clone https://github.com/y9c/myneovim.lua.git ~/.config/nvim --depth 1
```

3. run command in nvim for setup

- install all packages by:

```vim
:PackerUpdate
```

- update tree-sitter parser

```vim
:TSUpdate
```

4. start to use

- Enable Copilot

```vim
:CopilotAuth
```

- Install lsp plugin you want, enter

```vim
<Space> l l
```
