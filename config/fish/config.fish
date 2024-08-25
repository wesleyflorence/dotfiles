if status is-interactive
  # Commands to run in interactive sessions can go here
  alias vim 'nvim'
  abbr ls 'eza'
  abbr ll 'eza -al'
  abbr vim 'nvim'
  abbr jrn "nvim ~/vault/jrn/(date '+%Y.%m.%d').md"
  abbr jrn-full "cat ~/vault/jrn/*.md | nvim -c 'set filetype=json'"
  alias prt 'git rev-parse --show-toplevel'

  # Git
  abbr gg 'git status'

  #FZF
  function ff
    if test -d $argv
      cd $argv
    else
      nvim $argv
    end
  end

  function fp
    cd (fd -H --no-ignore-vcs -t d '.git$' ~/code | sed 's/.\{6\}$//' | fzf --height 40% --reverse)
  end

  # Ansible abbreviations
  abbr -a apl 'ansible-playbook ~/dotfiles/ansible/playbooks/main.yml'
end

# Editor
set -x VISUAL "nvim"

#Vscode
function vcode
  open -a "Visual Studio Code.app" $argv
end

#Idea
function iidea
  open -a "Intellij IDEA CE.app" $argv
end

# Ansible
set -x ANSIBLE_CONFIG ~/dotfiles/ansible/ansible.cfg

# Asdf
source /opt/homebrew/opt/asdf/libexec/asdf.fish
. ~/.asdf/plugins/java/set-java-home.fish

# Path
set -x PATH /opt/homebrew/bin ~/.emacs.d/bin/ ~/go/bin/ ~/bin/ $PATH

# Env Vars
source ~/.config/fish/env.fish
