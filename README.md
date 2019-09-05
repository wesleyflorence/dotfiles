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
