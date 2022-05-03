alias c='clear'
alias q='exit'

alias h='history'

alias mv='mv -i'
alias cp='cp -i'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Git related
alias gs='git status -u'
alias ga='git add'
alias gd='git diff'
alias gdc='git diff --cached'
alias gc='git commit'
alias gl='git log --all --decorate --oneline --graph'

# See: https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=/home/juan/.gitdotfiles/ --work-tree=/home/juan'

alias phpunit='vendor/bin/phpunit --testdox --color'
alias exec='sudo docker-compose exec app'

mcat() {
    cat "$1" | less -FX
}

clip() {
    sed -n "${1}p" ${2:-/dev/stdin} | xclip -selection p -f | xclip -selection c
}

# Only Diff:
# outputs only the added or modified (not deleted) lines in the second file
odiff() {
    diff \
        --new-line-format="%L" \
        --old-line-format="" \
        --unchanged-line-format="" \
        $1 $2
}
