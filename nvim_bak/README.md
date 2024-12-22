# Lucas Pichette's .nvim

Leverages [AstroNvim](https://github.com/AstroNvim/AstroNvim)

You can see the theme of the config while I do a basic search-and-replace with grug-far.nvim:

https://github.com/user-attachments/assets/7aba5ed2-6aa1-4e76-8f2d-d7a8010c92e2


## Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Clone the repository

```shell
git clone https://github.com/lcpichette/nvim-config.git ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```

## Preview

The LSPs that exist are currently configured for javascript + typescript. Feel free to add whatever LSPs you'd like via `:Mason`.

#### Demonstrating Arrow

Where ; is the local leader.

`;s` to Save a Arrow target
`;` to List Arrow targets

https://github.com/user-attachments/assets/05203e3a-0354-44c4-8e3e-362342ef728c


## Outstanding Differences

1. Arrow
2. tmux-navigator
3. todo-highlighter
4. markview
5. updated colorscheme
6. Typescript support out the rip
7. Precognition -- shows motions (w,W,^,0,E,etc)
8. flash -- Leap alternative (`s<letter><specifier>`).
9. twilight -- Run :Twilight for scope-focused coding.
10. zk -- for note taking. If I get enough requests I'll post my zk config and abbr's which have made me fall in love with zk.
11. Grug-far -- multi-file search and replace
