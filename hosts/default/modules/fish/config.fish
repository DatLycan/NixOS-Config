# Disable greeting
function fish_greeting
end

# Alias
alias cd 'z'
alias .. 'z ..'
alias ... 'z ../..'
alias .... 'z ../../..'

alias ls 'eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions'

# Abreviations
abbr --add -- ncc 'nix-store --gc'
abbr --add -- nr 'sudo nixos-rebuild switch --flake /etc/nixos'

# Enable plugins
thefuck --alias fk | source 
zoxide init fish | source
starship init fish | source
