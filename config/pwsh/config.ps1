# ====================
# Aliases
# ====================

New-Alias -Name ahk -Value autohotkey

# Function mpd { mpd --no-daemon c:\users\max\.config\mpd\mpd.conf }

Function touch { echo '' > $args[0] }

Function glances-alias-fn { glances --disable-irix --separator --programs @args }
# New-Alias -Name glances -Value glances-alias-fn  # disabled bc pwsh is bloody slow

Function wezsshu { wezterm ssh max@192.168.0.$args }
Function wezsshr { wezterm ssh root@192.168.0.$args }

Function jqbat { jq . $args[0] | bat }

# ====================
# Functions
# ====================

Function svpush {
	(git add .)
	if ($?) {
		(git commit -m @args)
		if ($?) {
			(git push)
		}
	}
}

Function cddir {
	param ([string]$directory)

	mkdir $directory
	cd $directory
}

Function qh {
	echo "$($(whoami).split('\')[1]) @ $(hostname) on $((Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias {{ net_adapter }}).IPAddress)"
}

Function dot {
	.\bin\dotter deploy --force --verbose
}

Function prompt {
	"[$([char]27)[93m$($(whoami).split('\')[1])$([char]27)[0m@$([char]27)[95m$(hostname)$([char]27)[0m:$([char]27)[94m$($(Split-Path -leaf -path $( get-item $PWD )).Replace($env:username, '~'))$([char]27)[92m$(if ($(git branch --show-current 2>$null)) {' #'+$(git branch --show-current 2>$null)})$([char]27)[0m] $([char]27)[91m$ $([char]27)[0m"
}

# ====================
# Variables
# ====================

$ProgressPreference='SilentlyContinue'

$env:WSL_UTF8=1

$env:PATH += ";C:\Users\max\AppData\Roaming\Python\Python312\Scripts;C:\Users\max\.local\bin"
	
# ====================
# Autostart
# ====================

iex (& { (zoxide init --cmd cd powershell | Out-String) })
