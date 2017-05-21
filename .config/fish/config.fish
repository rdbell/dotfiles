set fish_greeting ""

set -x EDITOR vim
set -x BROWSER open

# python2
# alias python=python2

set -x DYLD_FORCE_FLAT_NAMESPACE 1

# Go
set -x GOROOT /usr/local/opt/go/libexec
set -x GOPATH $HOME/git/go-workspace
set -x PATH $PATH $GOPATH/bin
set -x PATH $PATH $GOROOT/bin

# Lango Dev
set -x LANGO_MONGO_HOSTS "localhost"
set -x LANGO_DEVELOPMENT "true"

set -x JAVA_HOME /usr/lib/jvm/default-java
set -x PLAYERGLOBAL_HOME $HOME/playerglobal

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
