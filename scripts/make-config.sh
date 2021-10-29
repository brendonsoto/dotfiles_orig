#!/bin/zsh

current_hour=$(date +%H)
starting_day_hour=9
end_day_hour=18 # 12 + 6 for 24 hour clock
alacritty_dir="$0:a:h/../alacritty"
files_to_concat=("$alacritty_dir/base.yml")

echo "Configuring alacritty..."

# Add colorscheme for time of day
# NOTE: How can I make this a higher order function?
if ([ $current_hour -ge $starting_day_hour ]) && ([ $current_hour -le $end_day_hour ]); then
  echo "...adding alacritty light colorscheme"
  files_to_concat+=("$alacritty_dir/gruvbox-light.yml")
else
  echo "...adding alacritty dark colorscheme"
  files_to_concat+=("$alacritty_dir/gruvbox-dark.yml")
fi

# Add any OS-specific configs + keybindings
if [[ `uname` == "Darwin" ]]; then
  echo "...adding macOS alacritty config"
  files_to_concat+=("$alacritty_dir/macos.yml")
else
  echo "...adding linux alacritty config"
  files_to_concat+=("$alacritty_dir/linux.yml")
fi

# Delete alacritty file if exists
if [[ -f "~/.alacritty.yml" ]]; then
  echo "...deleting existing ~/.alacritty.yml"
  rm ~/.alacritty.yml
fi

echo "...writing alacritty file"
for f in $files_to_concat; do (cat "${f}"; echo) >> ~/.alacritty.yml; done
echo "Finished creating ~/.alacritty.yml !"

# Toggle macOS dark mode
if [[ `uname` == "Darwin" ]]; then
  echo "Toggling dark mode..."
  if ([ $current_hour -gt $starting_day_hour ]) && ([ $current_hour -lt $end_day_hour ]); then
    echo "...setting dark mode: OFF"
    osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = false"
  else
    echo "...setting dark mode: ON"
    osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = true"
  fi
fi

echo "All done!"
