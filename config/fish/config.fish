if status is-interactive
  # Commands to run in interactive sessions can go here
  set fish_greeting "🌊🌊🌊"

  # Editor
  alias vim 'nvim'
  alias vi 'nvim'

  # Git
  alias prt 'git rev-parse --show-toplevel'
  abbr gg "git status"
  abbr gd "git diff"
  abbr gf "git fetch"
  abbr gF "git pull"
  abbr gP "git push"
  abbr ga "git add "
  abbr gc "git commit"

  # Ansible abbreviations
  set -x ANSIBLE_CONFIG ~/dotfiles/ansible/ansible.cfg
  abbr -a apl 'ansible-playbook ~/dotfiles/ansible/playbooks/main.yml'
  abbr dots 'nvim ~/dotfiles'

  # Fzf
  alias ff fzf-find-file
  alias fp fzf-find-project
  alias frg fzf-rg

  # Aider
  alias aider 'aider --config ~/dotfiles/config/aider/.aider.conf.yml'

  # Github Copilot
  abbr ghcs 'gh copilot suggest'
  abbr ghce 'gh copilot explain'

  # ls
  abbr ls 'eza'
  abbr ll 'eza -al'
  abbr llt 'eza -aT'

  # jq
  alias jjq "jq -r -R '. as \$line | try fromjson catch \$line | . '"
  alias jjq-java "jq -r -R '. as \$line | try fromjson catch \$line | . ' | gsed -r 's/\\\\\n/\n/g; s/\\\\\t/\t/g'"

  # journal
  abbr jrn "nvim ~/vault/jrn/\$(date '+%Y.%m.%d').md"
  abbr jrn-full "cat ~/vault/jrn/*.md | nvim -c 'set filetype=json'"
  abbr quarterly "nvim ~/vault/qc/(date +%Y).Q(math floor (math (math (date +%-m) - 1) /3+1 )).md"

  # Gradle
  abbr gwb 'eval (prt)/gradlew build'
  abbr gwr 'eval (prt)/gradlew bootRun'
  abbr gwd 'eval (prt)/gradlew bootRun --debug-jvm'
  abbr jcc 'eval (prt)/gradlew jacocoTestCoverageVerification jacocoTestReport --continue'
  abbr gwbr 'eval (prt)/gradlew build || open (prt)/build/reports/tests/test/index.html'
  abbr gwfr 'eval (prt)/gradlew functionalTest || open (prt)/build/reports/tests/functionalTest/index.html'

  #FZF
  ## Find File (could pipe into fzf similar to fp but this fells more shelly)
  function fzf-find-file
    if test -d $argv
      cd $argv
    else
      nvim $argv
    end
  end

  # Find Project
  function fzf-find-project
    cd (fd -H --no-ignore-vcs -t d '.git$' ~/code | sed 's/.\{6\}$//' | fzf --height 40% --reverse)
  end

  function fzf_add_to_commandline -d 'add stdin to the command line, for fzf functions'
    read -l -z result
    commandline -t "nvim "
    # Do we need to escape this? This was here before, but doesn't work well with
    # multiline strings.
    # commandline -it -- (string escape $result)
    commandline -it -- (echo $result | paste -s -d" " -)
    commandline -f repaint
  end

  function fzf-rg -d 'find text in files'
    set -l rg_command "rg --ignore-case --files-with-matches -uu --iglob='!**/.git/' --follow"
    # Start with all files; i.e. .*
    FZF_DEFAULT_COMMAND="$rg_command '.*'" SHELL=fish fzf \
      -m \
      -e \
      --ansi \
      --disabled \
      --bind "change:reload:$rg_command {q} || true" \
    --preview "rg -i --pretty --context 2 {q} {}" | cut -d":" -f1,2 \
      | fzf_add_to_commandline
  end

  # Search git log with fzf
  function glf --description "Git log fzf"
    set -l log_line_to_hash "echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
    set -l view_commit "$log_line_to_hash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy | less -R'"
    set -l copy_commit_hash "$log_line_to_hash | pbcopy"
    set git_open "$log_line_to_hash | xargs -I % sh -c 'open https://git.jwn.app/\$(git config remote.origin.url | cut -f2 -d: | cut -f 1 -d.)/-/commit/%'"

    git log --color=always --format='%C(auto)%h%d %s %C(green)%C(bold)%cr% C(blue)%an' | \
      fzf --no-sort --reverse --tiebreak=index --no-multi --ansi \
      --preview="$view_commit" \
      --header="ENTER to view, CTRL-Y to copy hash, CTRL-O to open on Gitlab, CTRL-C to exit" \
      --bind "enter:execute:$view_commit" \
      --bind "ctrl-y:execute:$copy_commit_hash" \
      --bind "ctrl-o:execute:$git_open"
  end

  # Python
  function venv  
    set venv_dir "venv"  
    # Check if the virtual environment directory exists  
    if test -d $venv_dir  
      echo "Activating: source $venv_dir/bin/activate.fish"  
      source $venv_dir/bin/activate.fish  
    else  
      echo "Creating a new virtual environment..."  
      python3 -m venv $venv_dir  
      if test $status -eq 0  
        echo "Virtual environment created. Activating..."  
        source $venv_dir/bin/activate.fish  
      else  
        echo "Failed to create virtual environment."  
      end  
    end  
  end  
end

#Epoch
abbr epochnow 'gdate +%s'
function epochdate
  if count $argv > /dev/null
    gdate -d @(echo $argv | cut -c -10)
  else
    read -l epochtimestamp
    gdate -d @(echo $epochtimestamp | cut -c -10)
  end
end 

# Editor
set -x VISUAL "nvim"
set -x EDITOR "nvim"
set -x MANPAGER "nvim -c 'Man!' -o -"
set -x KUBE_EDITOR "nvim"

# ASDF
source /opt/homebrew/opt/asdf/libexec/asdf.fish
. ~/.asdf/plugins/java/set-java-home.fish

# work functions
if whoami | grep -q "fgnp"
    source ~/bin/work.fish
    source ~/bin/ephemera.fish
end

# Env Vars
source ~/.config/fish/env.fish

# Always add homebrew to the path
set -x PATH /opt/homebrew/bin /opt/homebrew/sbin ~/bin ~/.bun/bin ~/.local/bin $PATH
