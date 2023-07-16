# ===== WINFETCH CONFIGURATION =====

# $image = "~/winfetch.png"
# $noimage = $true

# Display image using ASCII characters
# $ascii = $true

# Set the version of Windows to derive the logo from.
# $logo = "Windows 10"

# Specify width for image/logo
# $imgwidth = 24

# Specify minimum alpha value for image pixels to be visible
# $alphathreshold = 50

# Custom ASCII Art
# This should be an array of strings, with positive
# height and width equal to $imgwidth defined above.
# $CustomAscii = @(
#     "⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣦⠀ ⠀"
#     "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣶⣶⣾⣷⣶⣆⠸⣿⣿⡟⠀ ⠀"
#     "⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣷⡈⠻⠿⠟⠻⠿⢿⣷⣤⣤⣄⠀⠀ ⠀"
#     "⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣦⠀ ⠀"
#     "⠀⠀⠀⢀⣤⣤⡘⢿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⡇ ⠀"
#     "⠀⠀⠀⣿⣿⣿⡇⢸⣿⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⣉⣉⡁ ⠀"
#     "⠀⠀⠀⠈⠛⠛⢡⣾⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⡇ ⠀"
#     "⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⠟⠀ ⠀"
#     "⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⡿⢁⣴⣶⣦⣴⣶⣾⡿⠛⠛⠋⠀⠀ ⠀"
#     "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠿⠿⢿⡿⠿⠏⢰⣿⣿⣧⠀⠀ ⠀"
#     "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⠟⠀⠀ ⠀"
# )

# Make the logo blink
# $blink = $true

# Add a custom info line
# function info_custom_time {
#     return @{
#         title = "Time"
#         content = (Get-Date)
#     }
# }

# Configure which disks are shown
$ShowDisks = @("C:", "D:", "T:", "V:")
# $ShowDisks = @("*")

# Configure which package managers are shown
$ShowPkgs = @("winget", "scoop", "pip")

# Use the following option to specify custom package managers
$CustomPkgs = @("cargo", "pip")
# Create a function with that name as suffix, and which returns the number
# of packages
# function info_pkg_cargo {
#      return (cargo install --list | Where-Object {$_ -like "*:" }).Length
# }
function info_pkg_pip {
     return (pip freeze).Length
}

# Configure how to show info for levels
# 'text' is for 'text' only
# 'bar' is for 'bar' only
# 'textbar' is for 'text' then 'bar'
# 'bartext' is for 'bar' then 'text'
$cpustyle = 'text'
$memorystyle = 'text'
$diskstyle = 'text'
$batterystyle = 'text'

# title, dashes, os, computer, kernel, motherboard, custom_time, uptime,
# ps_pkgs, pkgs, pwsh, resolution, terminal, theme, cpu, gpu, cpu_usage, 
# memory, disk, battery, locale, weather, local_ip, public_ip, blank, colorbar

@(
    "title"
    "dashes"
    "os"
    "computer"
    "uptime"
    "dashes"
    "pkgs"
    "pwsh"
    "resolution"
    "terminal"
    "dashes"
    "cpu"
    "gpu"
    "memory"
    "dashes"
    "disk"
    "blank"
    "colorbar"
)
