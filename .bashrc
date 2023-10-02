function myv(){
    systemctl suspend | i3lock
}

function pd(){
    pwd | xclip -sel c
}
alias ocr="cd ~/Documents/OCR_sudocul/"
alias src="source ~/.bashrc"
alias tp="cd ~/Documents/s3_prog"
alias brc="vim ~/.bashrc"
alias la="ls -a"

alias vrc="vim ~/.vimrc"
alias rright="xrandr --output eDP-1 --rotate right"
alias rnorm="xrandr --output eDP-1 --rotate normal"

alias exrright="xrandr --output DP-1 --rotate right"
alias exrnorm="xrandr --output DP-1 --rotate normal"

alias vrc="nvim ~/.vimrc"

alias nvrc="nvim ~/.config/nvim/init.vim"
alias math="cd ~/Desktop/math & nix-shell -p xsel"

alias conf="sudo vim /etc/nixos/configuration.nix"


alias e="exit"
