# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
	PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

alias gitlc="git ls-files | xargs -n1 git blame --line-porcelain | sed -n 's/^author //p' | sort -f | uniq -ic | sort -nr"
alias sudo="sudo "

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi
unset rc

export EDITOR="/usr/bin/nvim"

source "$HOME/.asdf/asdf.sh"
source "$HOME/.asdf/completions/asdf.bash"

# fzf
if [ -d /usr/share/fzf ]; then
	for rc in /usr/share/fzf/*.bash; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi
unset rc
