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

alias vrc="vi ~/.vimrc"

alias nvrc="vi ~/.config/nvim/init.vim"
alias math="cd ~/Desktop/math & nix-shell -p xsel"

alias conf="sudo vim /etc/nixos/configuration.nix"
alias mc="make clean"

alias e="exit"
alias al="cd /home/tayron/Documents/Algo_TP/s3-2027-prefix-trees"
