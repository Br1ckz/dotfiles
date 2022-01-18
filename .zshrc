autoload -Uz compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
#prompt walters

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

# Define the theme
#prompt_mytheme_setup() {
PROMPT="[%n %~] "
RPROMPT=
#}

# Add the theme to promptsys
#prompt_themes+=( mytheme )

# Load the theme
#prompt mytheme

# aliases
if [ -f ~/.config/aliasrc ]; then 
	source ~/.config/aliasrc
fi

# java
export JAVA_HOME='/usr/bin/java'
path+=('$JAVA_HOME')

# path
path+=('~/.scripts')
path+=('~/.local/bin')
export PATH
