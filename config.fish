if status is-interactive
    fish_vi_key_bindings
    zoxide init fish --cmd cd | source
    # Commands to run in interactive sessions can go here
end
