alac=$HOME/.config/alacritty
file=$alac/theme.json
dark_conf=$alac/themes/gruvbox.toml
light_conf=$alac/themes/gruvbox-light.toml
active_conf=$alac/themes/active.toml

# create file with default theme if missing
if [[ ! -f "$file" ]]; then
  echo '{"theme": "dark"}' > "$file"
  ln -sf $dark_conf $active_conf
fi

# read current theme
current=$(sed -n 's/.*"theme": *"\(.*\)".*/\1/p' "$file")

if [ "$current" = "light" ]; then
  ln -sf $dark_conf $active_conf
  echo '{"theme": "dark"}' > "$file"
else
  ln -sf $light_conf $active_conf
  echo '{"theme": "light"}' > "$file"
fi
# notify neovim but shut up when error
pkill -USR1 nvim 2>/dev/null
