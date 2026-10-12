function fish_hybrid_key_bindings --description \
    "Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end
set -g fish_key_bindings fish_hybrid_key_bindings

status is-login; and begin
    # Login shell initialisation
end

status is-interactive; and begin

    # Abbreviations

    # Aliases

end

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# echo $fish_user_paths
fish_add_path -p ~/.local/bin

# cargo and rust
# rustup completions fish > ~/.config/fish/completions/rustup.fish
# set -gx fish_complete_path ~/.config/fish/completions
fish_add_path -p $(brew --prefix rustup)/bin
fish_add_path -p ~/.cargo/bin
