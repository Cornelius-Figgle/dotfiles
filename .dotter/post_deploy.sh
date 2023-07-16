# pwsh config management & auto-creation

$CONFIG_DATA = @'
# btw this file should be created automatically if it does not already exist
# and should not be modified

# this file exists bc `mklink` is stupid and does not let me symlink across networked drives
# and pwsh stores its files in `U:\My Documents\PowerShell` (on my setup at least - I have `U:` mapped to a server user folder or smth)
# so we get around this by just copying it into this file

try {
    # copy in main config
    . "$env:userprofile\source\dotfiles\pwsh\config.ps1"
} catch [System.Exception] {
    # if file not found
    try {
        . "T:\dotfiles\pwsh\config.ps1"
    } catch [System.Exception] {
        # if file still not found
        throw
    }
}
'@

$SYS_CFG_PATH = $PROFILE.CurrentUserCurrentHost

Write-Output "making sys config now"
Write-Output $CONFIG_DATA | Out-File -FilePath $SYS_CFG_PATH  # writes the file data to the config
Write-Output "sys config file written"

Write-Output "reloading pwsh profile now"
& $profile