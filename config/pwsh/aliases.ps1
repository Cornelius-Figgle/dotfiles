New-Alias -Name ahk -Value autohotkey

Function glances-alias-fn { (glances --percpu --disable-irix --separator --programs @args) }
# New-Alias -Name glances -Value glances-alias-fn  # disabled bc pwsh is bloody slow

Function svpush {
    (git add .)
    if ($?) {
        (git commit -m $args[0])
        if ($?) {
            (git push)
        }
    }
}
