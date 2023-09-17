# ====================
# Aliases
# ====================

New-Alias -Name ahk -Value autohotkey

Function glances-alias-fn { (glances --percpu --disable-irix --separator --programs @args) }
# New-Alias -Name glances -Value glances-alias-fn  # disabled bc pwsh is bloody slow

if (wsl -v) {
	Remove-Alias -Name ls
	Function ls {
		wsl ls $args[0]  # use wsl for alias
	}
}

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
	echo "$env:USERNAME @ $env:COMPUTERNAME on $((Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias WiFi).IPAddress)"
}

Function prompt {
	"$($( get-item $PWD ).FullName.Replace($HOME, '~')) $ "
}

# ====================
# Variables
# ====================

$ProgressPreference='SilentlyContinue'

$env:WSL_UTF8=1
