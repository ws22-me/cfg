if status is-interactive
    # Commands to run in interactive sessions can go here
    # zoxide init fish | source
    # atuin init fish --disable-up-arrow | source
    [ -z $(which zoxide) ] || eval "$(zoxide init fish | source)"
    [ -z $(which atuin) ] || eval "$(atuin init fish --disable-up-arrow | source)"
end
