# Disable greeting
function fish_greeting
end

# Alias
alias e 'nvim'
alias cd 'z'
alias .. 'z ..'
alias ... 'z ../..'
alias .... 'z ../../..'

alias ls 'eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions'
alias cat 'bat'

# Abreviations
abbr --add -- cc 'clear'
abbr --add -- rb 'sudo reboot'
abbr --add -- lg 'lazygit'
abbr --add -- spf 'superfile'
abbr --add -- ncc 'nix-store --gc'
abbr --add -- nr 'sudo nixos-rebuild switch --flake /etc/nixos#(hostname) --show-trace'

# Stream online content
function stream
  if string match -q "magnet:*" $argv || string match -q "*.torrent" $argv
    peerflix --mpv "$argv"
  else
    mpv "$argv"
  end
end

# Enable plugins
thefuck --alias fk | source 
zoxide init fish | source
starship init fish | source


## Enable repeat last command
function bind_bang
  switch (commandline -t)[-1]
    case "!"
      commandline -t -- $history[1]
      commandline -f repaint
    case "*"
      commandline -i !
  end
end

function fish_user_key_bindings
  bind ! bind_bang
end
