if status is-interactive
    # Commands to run in interactive sessions can go here
    # zoxide init fish | source
    # atuin init fish --disable-up-arrow | source
    if type -q zoxide
        zoxide init fish | source
    end
    if type -q atuin
        atuin init fish --disable-up-arrow | source
    end
end
