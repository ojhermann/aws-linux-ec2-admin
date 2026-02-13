# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ec2-user/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# ssh agent stuff
if ! pgrep -f "ssh-agent" > /dev/null; then
    eval "$(ssh-agent -s)"
fi
ssh-add ~/.ssh/github

# prompt
PS1="%F{cyan}%d %# %f"

# rprompt
setopt prompt_subst

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b'

function git_color_prompt() {
	if [[ -n "$vcs_info_msg_0_" ]]; then 
		if git status --porcelain | grep -q '^[ MADRCU?]'; then
			echo '%F{red}'
			else
      echo '%F{green}'
    fi
  fi
}

function parse_git_branch() {
	 local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
	 if [[ -n "$branch" ]]; then
	 	echo "[⎇ ${branch}]"
	 fi
}

RPROMPT='$(git_color_prompt)$(parse_git_branch)%f'
