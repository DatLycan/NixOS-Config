# Disable greeting
function fish_greeting
end

# Alias
alias e 'nvim'
alias cd 'z'
alias .. 'z ..'
alias ... 'z ../..'
alias .... 'z ../../..'

alias ls 'eza --all --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions'

# Abreviations
abbr --add -- cc 'clear'
abbr --add -- rb 'sudo reboot'
abbr --add -- lg 'lazygit'
abbr --add -- ncc 'nix-store --gc'
abbr --add -- nr 'sudo nixos-rebuild switch --flake /etc/nixos --show-trace'

# Enable plugins
thefuck --alias fk | source 
zoxide init fish | source
starship init fish | source
