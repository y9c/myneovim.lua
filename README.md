# neovim config by pure lua

## How to use?

- install the lastest version of neovim from source

```bash
git clone https://github.com/neovim/neovim.git --depth 1
make CMAKE_BUILD_TYPE=RelWithDebInfo
make install
```

- clone this repo into your nvim config

```bash
mv ~/.config/nvim ~/.config/nvim.bak
git clone https://github.com/yech1990/myneovim.lua.git ~/.config.nvim --depth 1
```

- run command in nvim

```vim
:PackerUpdate
```

```vim
:LspUpdate
```

```vim
:TSUpdate
```

## REFERENCE

- https://github.com/glepnir/nvim
