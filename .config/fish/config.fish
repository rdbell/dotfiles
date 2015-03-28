set -x EDITOR vim
set -x BROWSER open

# python2
# alias python=python2

# Add Scripts folder to path
set -x PATH $PATH $HOME/bin

# Add go bin folder to path
set -x PATH $PATH $HOME/git/go/bin

# Go
set -x GOPATH $HOME/git/go-workspace
set -x PATH $PATH $GOPATH/bin

# Adobe Flex
set -x PATH $PATH /Applications/Adobe\ Flash\ Builder\ 4.7/sdks/4.6.0/bin

# Mirra Development
set -x MIRRA_DEVELOPMENT true
set -x PORT 8080

# Docker
set -x DOCKER_HOST tcp://192.168.59.103:2376
set -x DOCKER_CERT_PATH $HOME/.boot2docker/certs/boot2docker-vm
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

function fish_prompt
  set last_status $status

  set_color green 
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt) 
  set_color normal
  printf ': '

end
