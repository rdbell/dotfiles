set fish_greeting ""

set -x EDITOR vim
set -x BROWSER open

# python2
# alias python=python2

set -x DYLD_FORCE_FLAT_NAMESPACE 1

# Add Scripts folder to path
set -x PATH $PATH $HOME/bin

# Add go bin folder to path
set -x PATH $PATH $HOME/git/go/bin

# Go
set -x GOPATH $HOME/git/go-workspace
set -x PATH $PATH $GOPATH/bin

# Adobe Flex
set -x PATH $PATH /Applications/Adobe\ Flash\ Builder\ 4.7/sdks/4.6.0/bin # OS X
set -x PATH $PATH $HOME/Library/flex_sdk_4.6/bin # OS X
set -x PATH $PATH $HOME/flex/bin # Ubuntu

set -x JAVA_HOME /usr/lib/jvm/default-java
set -x PLAYERGLOBAL_HOME $HOME/playerglobal

# Docker
set -x DOCKER_HOST tcp://192.168.59.103:2376
set -x DOCKER_MACHINE_NAME default
set -x DOCKER_CERT_PATH $HOME/.docker/machine/machines/default
set -x DOCKER_TLS_VERIFY 1

# Gnome keyring ssh
# set -x SSH_AUTH_SOCK (begin; ss -xl | grep -o '/run/user/1000/keyring.*/ssh'; end)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

set user (whoami)

ssh-agent

function fish_prompt
  set last_status $status

  set_color normal 
  printf '%s  ' $user

  set_color green 
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt) 
  set_color normal
  printf ': '

end

env -i HOME=$HOME dash -l -c 'export -p' | sed -e "/PATH/s/'//g;/PATH/s/:/ /g;s/=/ /;s/^export/set -x/" | source"'"
