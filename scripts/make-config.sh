#!/bin/zsh

current_hour=$(date +%H)
starting_day_hour=9
end_day_hour=18 # 12 + 6 for 24 hour clock
dotfiles_dir="$0:a:h/.."
alacritty_dir="$dotfiles_dir/alacritty"
alacritty_config_files=("$alacritty_dir/base.yml")
tmux_dir="$dotfiles_dir/tmux"
tmux_config_files=("$tmux_dir/base.tmux")

echo "Configuring alacritty and tmux..."

# Add colorscheme for time of day
# NOTE: How can I make this a higher order function?
if ([ $current_hour -ge $starting_day_hour ]) && ([ $current_hour -lt $end_day_hour ]); then
  echo "...adding light colorscheme"
  alacritty_config_files+=("$alacritty_dir/alacritty_tokyonight_day.yml")
  tmux_config_files+=("$tmux_dir/tmux_tokyonight_day.tmux")
else
  echo "...adding dark colorscheme"
  alacritty_config_files+=("$alacritty_dir/alacritty_tokyonight_storm.yml")
  tmux_config_files+=("$tmux_dir/tmux_tokyonight_storm.tmux")
fi

# Add any OS-specific configs + keybindings
if [[ `uname` == "Darwin" ]]; then
  echo "...adding macOS alacritty config"
  alacritty_config_files+=("$alacritty_dir/macos.yml")
else
  echo "...adding linux alacritty config"
  alacritty_config_files+=("$alacritty_dir/linux.yml")
fi

# Delete config files if exists
if [[ -a ~/.alacritty.yml ]]; then
  echo "...deleting existing ~/.alacritty.yml"
  rm ~/.alacritty.yml
fi
if [[ -a ~/.tmux.conf ]]; then
  echo "...deleting existing ~/.tmux.conf"
  rm ~/.tmux.conf
fi

echo "...writing alacritty file"
for f in $alacritty_config_files; do (cat "${f}"; echo) >> ~/.alacritty.yml; done
echo "Finished creating ~/.alacritty.yml !"

echo "...writing tmux file"
for f in $tmux_config_files; do (cat "${f}"; echo) >> ~/.tmux.conf; done
echo "Finished creating ~/.tmux.conf !"

# Reload tmux settings
tmux source-file ~/.tmux.conf

# Toggle macOS dark mode
if [[ `uname` == "Darwin" ]]; then
  echo "Toggling dark mode..."
  if ([ $current_hour -ge $starting_day_hour ]) && ([ $current_hour -lt $end_day_hour ]); then
    echo "...setting dark mode: OFF"
    osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = false"
  else
    echo "...setting dark mode: ON"
    osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = true"
  fi
fi

echo "All done!"
