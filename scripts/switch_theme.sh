  #!/usr/bin/env bash

  file=$ALACRITTY_THEME
  dark_conf="$ALACRITTY_HOME/themes/gruvbox.toml"
  light_conf="$ALACRITTY_HOME/themes/gruvbox-light.toml"
  active_conf="$ALACRITTY_HOME/themes/active.toml"

  # create file with default theme if missing
  if [[ ! -f "$file" ]]; then
    echo '{"theme": "dark"}' > "$file"
    ln -sf $dark_conf $active_conf
    return
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
