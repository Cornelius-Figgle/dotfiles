# ====================
# Aliases
# ====================

New-Alias -Name ahk -Value autohotkey

# Function mpd { mpd --no-daemon c:\users\max\.config\mpd\mpd.conf }

Function glances-alias-fn { glances --disable-irix --separator --programs @args }
# New-Alias -Name glances -Value glances-alias-fn  # disabled bc pwsh is bloody slow

Function poseidon { ssh max@192.168.0.8 }
Function zeus { ssh root@192.168.0.19 }
Function mnemosyne { ssh root@192.168.0.26 }
Function dionysus { ssh max@192.168.0.12 }
Function iris { ssh root@192.168.0.21 }
Function athena { ssh max@192.168.0.25 }
Function hephaestus { ssh max@192.168.0.28 }

# ====================
# Functions
# ====================

Function svpush {
	(git add .)
	if ($?) {
		(git commit -m $args[0])
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
