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

&nbsp;

<p align="center">
  <img
    src="https://raw.githubusercontent.com/catppuccin/catppuccin/dev/assets/footers/gray0_ctp_on_line.svg?sanitize=true"
  />
</p>
<p align="center">
  Copyright &copy; 2020-present
  <a href="https://github.com/glepnir" target="_blank">Chang Y</a>
</p>
<p align="center">
  <a href="https://github.com/glepnir/zephyr-nvim/blob/master/LICENSE"
    ><img
      src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=d9e0ee&colorA=282a36&colorB=c678dd"
  /></a>
</p>
