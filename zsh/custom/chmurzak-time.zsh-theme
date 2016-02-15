# fino-time.zsh-theme

# Use with a dark background and 256-color terminal!
# Meant for people with RVM and git. Tested only on OS X 10.7.

# You can set your computer name in the ~/.box-name file if you want.

# Borrowing shamelessly from these oh-my-zsh themes:
#   bira
#   robbyrussell
#
# Also borrowing from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

function virtualenv_prompt_info {
    [[ -n $VIRTUAL_ENV ]] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char_info {
    git branch >/dev/null 2>/dev/null && echo '⠠⠵' && return
    echo '○'
}

# function box_name {
#     [ -f ~/.box-name ] && cat ~/.box-name || echo ${SHORT_HOST:-$HOST}
# }

function box_name {
	box=$([ -f ~/.box-name ] && cat ~/.box-name || echo ${SHORT_HOST:-$HOST})
	if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
	   echo " %{$FG[245]%}at%{$reset_color%} %{$FG[033]%}$box%{$reset_color%}"
    fi
}



local current_dir='${PWD/#$HOME/~}'
local git_info='$(git_prompt_info)'
local virtualenv_info='$(virtualenv_prompt_info)'
local prompt_char='$(prompt_char_info)'


PROMPT="╭─%{$FG[040]%}%n%{$reset_color%}$(box_name) %{$FG[245]%}in%{$reset_color%} %{$terminfo[bold]$FG[226]%}${current_dir}%{$reset_color%}${git_info} %*
╰─${virtualenv_info}${prompt_char} "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[245]%}on%{$reset_color%} %{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%}✘✘✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}✔"
