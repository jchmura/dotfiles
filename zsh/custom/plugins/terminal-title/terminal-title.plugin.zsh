precmd () {
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        hostname="${HOST}:"
    else
        hostname=""
    fi

    print -Pn "\e]0;${hostname}%~\a"
}
