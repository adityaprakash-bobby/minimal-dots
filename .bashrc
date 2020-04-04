# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias l="ls -a"
alias ll="ls -al"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Set DNS
function chdns {
	
	if [[ -z $1 ]] || [[ -n $2 ]]; then

		echo "Usage: chdns [OPTION]"
		echo "Options:"
		echo -e "\tg|google - Set Google DNS"
		echo -e "\tc|cloudflare - Set Cloudflare DNS"
		echo -e "\to|opendns - Set OpenDNS DNS"
		echo -e "\tn|norton - Set Norton Netconnect DNS"

	elif [[ -n $1 ]]; then

		if [[ "$1" == "g" ]] || [[ "$1" == "google" ]]; then
			nmcli device modify wlo1 ipv4.dns 8.8.8.8
            nmcli device modify wlo1 ipv4.dns 8.8.8.8,8.8.4.4
		elif [[ "$1" == "c" ]] || [[ "$1" == "clouflare" ]]; then
			nmcli device modify wlo1 ipv4.dns 1.1.1.1,1.0.0.1
		elif [[ "$1" == "o" ]] || [[ "$1" == "opendns" ]]; then
                        nmcli device modify wlo1 ipv4.dns 208.67.222.222,208.67.220.220
		elif [[ "$1" == "n" ]] || [[ "$1" == "norton" ]]; then
                        nmcli device modify wlo1 ipv4.dns 199.85.126.10,199.85.127.10
		else
			echo "Error: Choose a valid option"	
		fi

	fi
}

# load completions
if [[ -d $HOME/.config/completions ]]; then
    completion_scripts=$(ls $HOME/.config/completions)
    for i in ${completion_scripts[@]}; do
        . $HOME/.config/completions/$i
    done

fi
