set -g fish_color_option blue
fish_vi_key_bindings

abbr -a zkl "zk editlast --notebook-dir=$HOME/Notes/"
abbr -a zkn "zk new --notebook-dir=$HOME/Notes/"

abbr -a cmv "command -v"

abbr -a n    nix
abbr -a nxi  nix
abbr -a nd   "nix develop"
abbr -a nb   "nix build"
abbr -a nr   "nix run"
abbr -a nfl  "nix flake lock"
abbr -a nfuc "nix flake update --commit-lock-file"
abbr -a rsf  "rebuild-switch-flake"
abbr -a rbf  "rebuild-build-flake"

# Random abbreviations that are easier to type on some layouts, because I hop
# around a lot.
abbr -a nv nvim
abbr -a he hx
abbr -a pmu permutations
abbr -a bat "bat --color=always --style=numbers"

# Zellij
abbr -a z "zellij --layout compact"

abbr -a cd-ng "cd ~/triad/ng-triad/projects/jobs-marketplace"
abbr -a cd-jm "cd ~/triad/jobs-marketplace"
abbr -a cd-tn "cd ~/triad/triad-network"
abbr -a cd-la "cd ~/triad/license-assistant"
abbr -a cd-ts "cd ~/triad/scripts"
abbr -a start "~/triad/scripts/servers-launch.sh"

abbr -a ls 'eza -a --icons --git --no-user --no-time --no-filesize -T -L=1'
abbr -a tree 'eza -R -a --icons --git --no-user --no-time --no-filesize -T'
abbr -a ti 'eza --git-ignore --icons --git --no-user --no-time --no-filesize'

abbr -a t  tmux
abbr -a ta "tmux attach; or tmux"
abbr -a tk "tmux kill-session"
abbr -a tl "tmux list-sessions"

abbr -a ",a"  "git add"
abbr -a ",ap" "git add --patch"
abbr -a ",ad" "git add ."
abbr -a ",r"  "git restore"
abbr -a ",rs" "git restore --staged"
abbr -a ",re" "git reset"
abbr -a ",c"  "git commit"
abbr -a ",ca" "git commit --amend"
abbr -a ",d"  "git diff"
abbr -a ",dc"  "git diff --cached"
abbr -a ",m"  "git merge"
abbr -a ",s"  "gk status"
abbr -a ",p"  "git push"
abbr -a ",pa"  "gk ws push"
abbr -a ",pf" "git push --force-with-lease"
abbr -a ",pu" "git pull"
abbr -a ",pua" "gk ws pull"
abbr -a ",f"  "git fetch"
abbr -a ",fu" "git fetch upstream"
abbr -a ",sw" "git switch"
abbr -a ",sc" "git switch -c"
abbr -a ",b"  "git branch"
abbr -a ",l"  "git log"

abbr -a gi  "gh issue"
abbr -a gil "gh issue list"
abbr -a giv "gh issue view"
abbr -a gr  "gh pr"
abbr -a grl "gh pr list"
abbr -a grv "gh pr view"
abbr -a grc "gh pr checkout"
abbr -a gb  "gh browse"

abbr -a "-"    "cd -"
abbr -a ".."   "cd .."
abbr -a "..."  "cd ../.."
abbr -a "...." "cd ../../.."

# pnpm
set -gx PNPM_HOME "/Users/lucaspichette/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Default Yazi (file manager)
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

if status --is-interactive
    y
end


# # Default ranger
# function open
#   if test -d $argv[1]
#     ranger $argv[1]
#   else
#     command open $argv
#   end
# end
#
# if status --is-interactive
#     ranger
# end
#

function vv
    # Assumes all configs exist in directories named ~/.config/nvim-*
    set config (fd --max-depth 1 --glob 'nvim-*' ~/.config | fzf --prompt="Neovim Configs > " --height=50% --layout=reverse --border --exit-0)

    # If fzf exits without selecting a config, don't open Neovim
    if test -z "$config"
        echo "No config selected"
        return
    end

    # Open Neovim with the selected config
    env NVIM_APPNAME=(basename $config) nvim $argv
end


fish_add_path /Users/lucaspichette/.spicetify
