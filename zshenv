#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

#
# Temporary Files
#

if [[ -d "$TMPDIR" ]]; then
  export TMPPREFIX="${TMPDIR%/}/zsh"
  if [[ ! -d "$TMPPREFIX" ]]; then
    mkdir -p "$TMPPREFIX"
  fi
fi

#
# Python
#

# Set the default project directory for virtualenvwrapper.
export PROJECT_HOME="$HOME/projects"

# Set the default virtualenvwrapper options.
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'

#
# Notes
#

# Set the default note directory.
export NOTEDIR=~/documents/notes

#
# Passwords
#

# Set the default password directory.
export PASSDIR=~/pw

#
# Ledger Encryption
#

# Set the directory of the EncFS filesystem.
export LEDGERCRYPT=~/.ledger-crypt

# Set the mount point of the EncFS filesystem.
export LEDGERMOUNT=~/ledger

# Set the file which contains the GnuPG encrypted passphrase.
export LEDGERPASS=~/.ledger.gpg