export ZSH="/Users/lachy/.oh-my-zsh"

ZSH_THEME="awesomepanda"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# want your terminal to support 256 color schemes? I do ...
#  export TERM="xterm-256color"
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT

# Zsh has a spelling corrector
setopt CORRECT

export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_SDK_ROOT=~/Library/Android/sdk
export ANDROID_AVD_HOME=~/.android/avd
export JAVA_HOME=$(/usr/libexec/java_home)
export GRADLE_HOME=~/.gradle/bin

export PATH=~/Library/flutter/bin:$PATH

export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOBIN
