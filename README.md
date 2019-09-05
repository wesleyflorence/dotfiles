# Dotfiles
Dotfiles are managed in this repo.

## Vim
In the .vimrc simply include the line: `so ~/dotfiles/config.vim` in order to source these settings for vim.

### Plugins:

- Download [vim-plug](https://github.com/junegunn/vim-plug) to get your plugins:
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

- Open vim and run `:PlugInstall` to update your plugins

- To add [YouCompleteMe](https://github.com/Valloric/YouCompleteMe#linux-64-bit) Support you need to ensure you have cmake and python3
```
sudo apt install build-essential cmake python3-dev
```

- Lastly you need to compile YCM by:
```
cd ~/.vim/plugged/YouCompleteMe
python3 install.py --clang-completer
```

Refer to [the YCM docs](https://github.com/Valloric/YouCompleteMe#linux-64-bit) for specific questions.

## ZSH
Install ZSH using
```
$ brew install zsh zsh-completions
```

  1. Launch Zsh:

     ```
     $ zsh
     ```

  2. Clone the repository:

     ```
     $ git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
     ```

  3. Create a new Zsh configuration by copying the Zsh configuration files
     provided:

     ```sh
     setopt EXTENDED_GLOB
     for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
       ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
     done
     ```

  4. Set Zsh as your default shell:

     ```
     $ chsh -s /bin/zsh
     ```

  5. Open a new Zsh terminal window or tab.

### Pretzo
Install and set up [Pretzo](https://github.com/sorin-ionescu/prezto) to manage plug-ins.
Use the [Pure](https://github.com/sindresorhus/pure) prompt.
In the `~/.zpreztorc` set the theme to pure:
```
zstyle ':prezto:module:prompt' theme 'pure'
```
