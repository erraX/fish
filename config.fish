[ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish

set -g fish_user_paths "/Users/mni/.rover/bin" $fish_user_paths

export BAT_THEME="Monokai Extended"

if type -q nvim
  export EDITOR=nvim
  export VISUAL=nvim
else 
  export EDITOR=vi
  export VISUAL=vi
end

set --universal nvm_default_version v20.12.2

# alias
if type -q exa
  alias ls exa
  alias ll 'exa -lga --git --icons'
end

if type -q bat
  alias cat bat
end

if type -q nvim
  alias vi nvim
end

if type -q lazygit
  alias lg 'lazygit'
end

alias src 'source ~/.config/fish/config.fish'
alias a ls
alias c clear
alias su 'su -m'
alias df 'df -h'
alias du 'du -h -d 2'
alias tf 'tail -f'

# common directories
alias wk 'cd ~/workspace'
alias home 'cd ~'
alias dl 'cd ~/Downloads'
alias github 'cd ~/github'

# alias git
alias g git
alias gd 'git diff'
alias gc 'git clean'
alias gdc 'git diff --cached'
alias gco 'git checkout'
alias gre 'git reset'
alias greh 'git reset --hard'
alias gres 'git reset --soft'
alias gcm 'git commit -m'
alias gca 'git commit --amend'
alias gp 'git push'
alias gl 'git pull'
alias glr 'git pull --rebase'
alias gri 'git rebase -i'
alias gst 'git status'
alias grmaster 'git fetch && git rebase origin/master'
alias gremaster 'git fetch && git reset --hard origin/master'


alias main 'cd /Users/mni/workspace/booking/main_repo'
alias emfe 'cd /Users/mni/workspace/booking/micro-frontends'
alias internal 'cd /Users/mni/workspace/booking/micro-frontends/mfes/internal-verification-tool'
alias kyp 'cd /Users/mni/workspace/booking/main_repo/projects/kypportal/kypportal-svc'
alias hub 'cd ~/workspace/booking/verification-hub/apps/verification-hub-webapp'
alias wkw 'cd ~/workspace/booking/verification-hub/apps/verification-workspace-webapp'

alias pd prevd
alias nd nextd

# alias cd
alias cd.. 'cd ..'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'

# alias file
alias md 'mkdir -p'
alias yd yt-dlp
set -g async_prompt_functions _pure_prompt_git
# set --universal ayu_variant mirage && ayu_load_theme

# other utils
alias ss 'ssh -A ssh.booking.com'
alias snladm 'ssh -NL 9211:localhost:9211 mni-adm.dev.booking.com'

alias k 'kill -9'

# ide
function __tmux_ide
  tmux split-window -v -p 30
  tmux split-window -h -p 50
end

function __tmux_ide_2
  tmux split-window -v -p 30
  tmux split-window -h -p 66
  tmux split-window -h -p 50
end

function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t -- $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -f backward-delete-char history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end

alias ide __tmux_ide
alias ide2 __tmux_ide_2

fzf_configure_bindings --directory=\cf

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
