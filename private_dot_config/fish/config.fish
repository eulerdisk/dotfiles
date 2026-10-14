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

set -U fish_user_paths ~/.local/bin $fish_user_paths

set -U fish_user_paths /home/linuxbrew/.linuxbrew/bin $fish_user_paths

set -U fish_user_paths /home/linuxbrew/.linuxbrew/opt/rustup/bin $fish_user_paths

set -U fish_user_paths ~/.cargo/bin $fish_user_paths

# cargo and rust
# rustup completions fish > ~/.config/fish/completions/rustup.fish
# set -gx fish_complete_path ~/.config/fish/completions

if test -x /home/linuxbrew/.linuxbrew/bin/brew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

# echo $fish_user_paths
