#!/opt/homebrew/bin/fish

set -l DOTFILES ~/dotfiles
set -l STATE_FILE $DOTFILES/themes/current

# Read current theme, default to dark
set -l current "dark"
test -f $STATE_FILE && set current (cat $STATE_FILE)

# Toggle
set -l new_theme (test "$current" = "dark" && echo "light" || echo "dark")
echo $new_theme > $STATE_FILE

# 1. Fish: source new theme colors
source ~/.config/fish/themes/github-$new_theme.fish

# 2. Tmux: update symlink and reload
ln -sf $DOTFILES/config/tmux/themes/github-$new_theme.conf ~/.config/tmux/current-theme.conf
test -n "$TMUX" && tmux source-file ~/.config/tmux/tmux.conf

# 3. Ghostty: update config file directly in dotfiles (not the symlink)
set -l ghostty_theme (test "$new_theme" = "light" && echo "GitHub Light Default" || echo "GitHub Dark")
sed -i '' "s/^theme = .*/theme = $ghostty_theme/" $DOTFILES/config/ghostty/config

# Ghostty auto-reloads when config changes, no command needed

echo "Theme: $new_theme"
