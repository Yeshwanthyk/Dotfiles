# export VIRTUALENV_USE_DISTRIBUTE=1
source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=$HOME/.virtualenvs
alias cl="clear;ls"
alias psx="ps -auxw"
alias ll='ls -FLlb' 
alias ls='ls -a'
alias df='df -h'
alias lynx='/Applications/Lynxlet.app/Contents/Resources/lynx/bin/lynx'
alias crtags='ctags -RV'
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
   [ -r "$file" ] && source "$file"
done
unset file

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
