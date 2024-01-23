# ====================
# Aliases
# ====================

New-Alias -Name ahk -Value autohotkey

# Function mpd { mpd --no-daemon c:\users\max\.config\mpd\mpd.conf }

Function glances-alias-fn { glances --percpu --disable-irix --separator --programs @args }
# New-Alias -Name glances -Value glances-alias-fn  # disabled bc pwsh is bloody slow

Function nightcrawler2 { ssh max@192.168.0.8 }
Function pve2 { ssh root@192.168.0.19 }
Function mimic5 { ssh -t root@192.168.0.12 tmux attach }
Function irc2 { ssh -t root@192.168.0.21 tmux attach }
Function polaris { ssh -t max@192.168.0.25 tmux attach }
Function homepage { ssh -t root@192.168.0.27 tmux attach }

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
	dotter deploy --force --verbose
}

Function prompt {
	"$($( get-item $PWD ).FullName.Replace($HOME, '~')) $ "
}

# ====================
# Variables
# ====================

$ProgressPreference='SilentlyContinue'

$env:WSL_UTF8=1

# ====================
# Autostart
# ====================

qh
